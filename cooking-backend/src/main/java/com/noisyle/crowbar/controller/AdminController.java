package com.noisyle.crowbar.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.mgt.RealmSecurityManager;
import org.apache.shiro.realm.Realm;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.noisyle.crowbar.constant.AdminConstant;
import com.noisyle.crowbar.core.auth.MongoDBUserRealm;
import com.noisyle.crowbar.core.base.BaseController;
import com.noisyle.crowbar.core.datatables.IFormatter;
import com.noisyle.crowbar.core.datatables.PageParam;
import com.noisyle.crowbar.core.exception.GeneralException;
import com.noisyle.crowbar.core.util.CryptoUtils;
import com.noisyle.crowbar.core.vo.ResponseData;
import com.noisyle.crowbar.model.User;
import com.noisyle.crowbar.repository.UserRepository;

@Controller
@RequestMapping("/admin")
public class AdminController extends BaseController {
	@Autowired
	private UserRepository userRepository;

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		return "admin/login";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	@ResponseBody
	public Object login(HttpServletRequest request, @ModelAttribute("user") User user,
			@RequestParam(required = false, defaultValue = "false") boolean rememberMe) {
		try {
			UsernamePasswordToken token = new UsernamePasswordToken(user.getLoginname(), user.getPassword());
			token.setRememberMe(rememberMe);
			SecurityUtils.getSubject().login(token);
			return ResponseData.buildSuccessResponse(user);
		} catch (UnknownAccountException e) {
			throw new GeneralException("login.wrongUsername", user.getLoginname());
		} catch (IncorrectCredentialsException e) {
			throw new GeneralException("login.wrongPassword");
		}
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout() {
		SecurityUtils.getSubject().getSession().removeAttribute(AdminConstant.SESSION_KEY_USER_CONTEXT);
		SecurityUtils.getSubject().logout();
		return "admin/login";
	}

	@RequestMapping(value = "", method = RequestMethod.GET)
	public String main() {
		return "admin/main";
	}

	@RequestMapping(value = "/changePass", method = RequestMethod.GET)
	public String changePass() {
		return "admin/changePass";
	}

	@RequestMapping(value = "/changePass", method = RequestMethod.POST)
	@ResponseBody
	public Object changePass(HttpServletRequest request) {
		String oldPass = request.getParameter("oldPass");
		String pass1 = request.getParameter("pass1");
		String pass2 = request.getParameter("pass2");
		if (oldPass == null || "".equals(oldPass.trim()) || pass1 == null || "".equals(pass1.trim()) || pass2 == null
				|| "".equals(pass2.trim())) {
			throw new GeneralException("修改密码失败，参数不正确");
		}
		User user = userRepository.get(getUserContext().getUser().getId());
		if (user == null) {
			throw new GeneralException("修改密码失败，用户不存在");
		}
		if (!user.getPassword().equalsIgnoreCase(oldPass.trim())) {
			throw new GeneralException("修改密码失败，旧密码不正确");
		}
		if (!pass1.trim().equals(pass2.trim())) {
			throw new GeneralException("修改密码失败，两次新密码必须相同");
		}
		user.setPassword(pass1);
		userRepository.save(user);
		SecurityUtils.getSubject().getSession().removeAttribute(AdminConstant.SESSION_KEY_USER_CONTEXT);
		SecurityUtils.getSubject().logout();
		return ResponseData.buildSuccessResponse(null, "密码修改成功，请重新登陆");
	}

	// 用户管理
	@RequestMapping(value = "/userList", method = RequestMethod.GET)
	public String userList() {
		return "admin/user/list";
	}

	@RequestMapping(value = "/userList", method = RequestMethod.POST)
	@ResponseBody
	public Object querUserList(@RequestBody PageParam pageParam) {
		pageParam.getColumns()[2].setFormatter(new IFormatter() {
			@Override
			public Object format(Object value) {
				return AdminConstant.Role.get((String) value).getText();
			}
		});
		return userRepository.getFormatedPage(pageParam);
	}

	@RequestMapping(value = "/addUser", method = RequestMethod.GET)
	public String addUser(Model model) {
		model.addAttribute("json_role", AdminConstant.Role.getJSONString(0));
		return "admin/user/add";
	}

	@RequestMapping(value = "/viewUser", method = RequestMethod.GET)
	public String viewUser(Model model, @RequestParam Long id) {
		model.addAttribute("user", userRepository.get(id));
		model.addAttribute("json_role", AdminConstant.Role.getJSONString(0));
		return "admin/user/view";
	}

	@RequestMapping(value = "/saveUser", method = RequestMethod.POST)
	@ResponseBody
	public Object saveUser(User user) {
		if (user.getId() == null) {
			user.setPassword(CryptoUtils.md5("123456"));
		} else {
			RealmSecurityManager securityManager = (RealmSecurityManager) SecurityUtils.getSecurityManager();
			for (Realm realm : securityManager.getRealms()) {
				if (realm instanceof MongoDBUserRealm) {
					((MongoDBUserRealm) realm).clearCachedAuthorizationInfo(user);
				}
			}
		}
		userRepository.save(user);
		return ResponseData.buildSuccessResponse(user, "保存成功");
	}

//	@RequestMapping(value = "/uploadAvatar", method = RequestMethod.POST)
//	@ResponseBody
//	public Object uploadAvatar(MultipartFile file) {
//		GridFSFile gridFSFile = userRepository.uploadAvatar(file);
//		return ResponseData.buildSuccessResponse(gridFSFile.getId().toString(), "上传成功");
//	}
//
//	@RequestMapping(value = "/avatar/{id}", method = RequestMethod.GET)
//	public void getAvatar(@PathVariable String id, HttpServletResponse response) {
//		GridFSDBFile file = userRepository.getAvatar(id);
//		if (file != null) {
//			response.setContentType(file.getContentType());
//			response.setContentLength((new Long(file.getLength()).intValue()));
//			try {
//				file.writeTo(response.getOutputStream());
//			} catch (IOException e) {
//				response.setStatus(HttpStatus.INTERNAL_SERVER_ERROR.value());
//			}
//		} else {
//			response.setStatus(HttpStatus.NOT_FOUND.value());
//		}
//	}

	@RequestMapping(value = "/delUser", method = RequestMethod.POST)
	@ResponseBody
	public Object delUser(User user) {
		userRepository.delete(user.getId());
		return ResponseData.buildSuccessResponse(user.getId(), "删除成功");
	}

}
