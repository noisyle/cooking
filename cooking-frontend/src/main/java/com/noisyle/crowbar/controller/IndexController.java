package com.noisyle.crowbar.controller;

import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.Date;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.noisyle.crowbar.constant.SiteConstant;
import com.noisyle.crowbar.core.base.BaseController;
import com.noisyle.crowbar.core.vo.ResponseData;
import com.noisyle.crowbar.core.vo.UserContext;
import com.noisyle.crowbar.model.User;
import com.noisyle.crowbar.service.UserService;
import com.octo.captcha.service.image.ImageCaptchaService;

@Controller
public class IndexController extends BaseController {
	@Autowired
	private UserService userService;
	@Autowired
	private ImageCaptchaService imageCaptchaService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String index() {
		return "cooking/index";
	}
	
	
	//首页
	@RequestMapping(value = "/home.html", method = RequestMethod.GET)
	public String home() {
		return "cooking/home/home";
	}
	
	
	//找大厨
	@RequestMapping(value = "/order.html", method = RequestMethod.GET)
	public String order() {
		return "cooking/order/order";
	}
	
	@RequestMapping(value = "/cooking.html", method = RequestMethod.GET)
	public String cooking() {
		return "cooking/order/cooking";
	}
	
	@RequestMapping(value = "/cookingOrder.html", method = RequestMethod.GET)
	public String cookingOrder() {
		return "cooking/order/cookingOrder";
	}
	
	@RequestMapping(value = "/custom.html", method = RequestMethod.GET)
	public String custom() {
		return "cooking/order/custom";
	}
	
	
	//订派对
	@RequestMapping(value = "/party.html", method = RequestMethod.GET)
	public String party() {
		return "cooking/party/party";
	}
	
	
	@RequestMapping(value = "/about.html", method = RequestMethod.GET)
	public String about() {
		return "cooking/about/about";
	}
	
	@RequestMapping(value = "/login.html", method = RequestMethod.GET)
	public String login() {
		return "cooking/user/login";
	}
	
	@RequestMapping(value = "/register.html", method = RequestMethod.GET)
	public String register() {
		return "cooking/user/register";
	}


	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	@ResponseBody
	public Object login(HttpServletRequest request, @ModelAttribute User user) {
		if(user == null || user.getLoginname() == null || user.getPassword() == null){
			return ResponseData.buildErrorResponse("用户名或密码错误！");
		}
		User dbUser = userService.getUserByLoginName(user.getLoginname());
		if(dbUser != null && dbUser.getPassword().equalsIgnoreCase(user.getPassword())){
			dbUser.setPassword(null);
			dbUser.setPhone(null);
			dbUser.setEmail(null);
			dbUser.setRole(null);
			UserContext context = new UserContext();
			context.setUser(dbUser);
			context.setLoginTime(new Date());
			request.getSession().setAttribute(SiteConstant.SESSION_KEY_USER_CONTEXT, context);
			return ResponseData.buildSuccessResponse(context);
		}else{
			return ResponseData.buildErrorResponse("用户名或密码错误！");
		}
	}
	
	@RequestMapping(value = "/getContext", method = RequestMethod.GET)
	@ResponseBody
	public Object getContext(HttpServletRequest request) {
		UserContext context = (UserContext) request.getSession().getAttribute(SiteConstant.SESSION_KEY_USER_CONTEXT);
		if(context != null){
			return ResponseData.buildSuccessResponse(context);
		}else{
			return ResponseData.buildErrorResponse("未登录！");
		}
	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.POST)
	@ResponseBody
	public Object login(HttpServletRequest request) {
		request.getSession().setAttribute(SiteConstant.SESSION_KEY_USER_CONTEXT, null);
		return ResponseData.buildSuccessResponse(null);
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	@ResponseBody
	public Object register(HttpServletRequest request, 
			@RequestParam String loginname, 
			@RequestParam String password, 
			@RequestParam String password2, 
			@RequestParam String captcha) {
		if(!StringUtils.hasText(loginname) 
				|| !StringUtils.hasText(password) 
				|| !StringUtils.hasText(password2) 
				|| !StringUtils.hasText(captcha)){
			return ResponseData.buildErrorResponse("请正确填写信息！");
		}
		if(!password.trim().equals(password2.trim())){
			return ResponseData.buildErrorResponse("请正确填写信息！");
		}
		if(!imageCaptchaService.validateResponseForID(request.getSession().getId(), captcha.trim())){
			return ResponseData.buildErrorResponse("验证码不正确！");
		}
		User dbUser = userService.getUserByLoginName(loginname);
		if(dbUser!=null){
			return ResponseData.buildErrorResponse("该手机号码已注册过！");
		}
		dbUser = new User();
		dbUser.setLoginname(loginname);
		dbUser.setPassword(password2);
		userService.save(dbUser);
		dbUser.setPassword(null);
		dbUser.setPhone(null);
		dbUser.setEmail(null);
		dbUser.setRole(null);
		UserContext context = new UserContext();
		context.setUser(dbUser);
		context.setLoginTime(new Date());
		request.getSession().setAttribute(SiteConstant.SESSION_KEY_USER_CONTEXT, context);
		return ResponseData.buildSuccessResponse(context);
	}
	
	@RequestMapping(value = "/captcha.png", method = RequestMethod.GET)
	public void captcha(HttpServletRequest request, HttpServletResponse response) {
		try {
			ByteArrayOutputStream jpegOutputStream = new ByteArrayOutputStream();
			String captchaId = request.getSession().getId();
			BufferedImage challenge = imageCaptchaService.getImageChallengeForID(captchaId, request.getLocale());

			response.setHeader("Cache-Control", "no-store");
			response.setHeader("Pragma", "no-cache");
			response.setDateHeader("Expires", 0L);
			response.setContentType("image/png");

			ImageIO.write(challenge, "png", jpegOutputStream);
			byte[] captchaChallengeAsJpeg = jpegOutputStream.toByteArray();

			ServletOutputStream respOs = response.getOutputStream();
			respOs.write(captchaChallengeAsJpeg);
			respOs.flush();
			respOs.close();
		} catch (IOException e) {
			logger.error("generate captcha image error: {}", e.getMessage());
		}
	}
}
