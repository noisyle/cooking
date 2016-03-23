package com.noisyle.crowbar.config;

import java.awt.Color;
import java.awt.Font;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.DependsOn;

import com.octo.captcha.CaptchaFactory;
import com.octo.captcha.component.image.backgroundgenerator.BackgroundGenerator;
import com.octo.captcha.component.image.backgroundgenerator.UniColorBackgroundGenerator;
import com.octo.captcha.component.image.color.ColorGenerator;
import com.octo.captcha.component.image.color.SingleColorGenerator;
import com.octo.captcha.component.image.fontgenerator.FontGenerator;
import com.octo.captcha.component.image.fontgenerator.RandomFontGenerator;
import com.octo.captcha.component.image.textpaster.DecoratedRandomTextPaster;
import com.octo.captcha.component.image.textpaster.TextPaster;
import com.octo.captcha.component.image.textpaster.textdecorator.BaffleTextDecorator;
import com.octo.captcha.component.image.textpaster.textdecorator.TextDecorator;
import com.octo.captcha.component.image.wordtoimage.ComposedWordToImage;
import com.octo.captcha.component.image.wordtoimage.WordToImage;
import com.octo.captcha.component.word.wordgenerator.RandomWordGenerator;
import com.octo.captcha.component.word.wordgenerator.WordGenerator;
import com.octo.captcha.engine.CaptchaEngine;
import com.octo.captcha.engine.GenericCaptchaEngine;
import com.octo.captcha.image.gimpy.GimpyFactory;
import com.octo.captcha.service.multitype.GenericManageableCaptchaService;

@Configuration
public class CaptchaConfig {
	// 可用字符,I、0去掉
	private static final String AVAILABLE_WORD = "0123456789ABCDEFGHJKLMNPQRSTUVWXYZ";
	// 最小字符显示的个数  
	private static final int MIN_WORD_LEN = 4;  
	// 最大字符显示的个数  
	private static final int MAX_WORD_LEN = 4;  
	// 图片高度宽度  
	private static final int IMAGE_WIDTH = 80;  
	private static final int IMAGE_HEIGHT = 32;  
	// 验证码中显示的字体大小  
	private static final int MIN_FONT_SIZE = 20;  
	private static final int MAX_FONT_SIZE = 20;  
	
	@Bean
	public WordGenerator wordGen() {
		WordGenerator wordGen = new RandomWordGenerator(AVAILABLE_WORD);
		return wordGen;
	}
	
	@Bean
	public FontGenerator fontGen() {
		Font[] fontsList = new Font[]{Font.decode("Arial"), Font.decode("Tahoma"), Font.decode("Verdana")};
		FontGenerator fontGen = new RandomFontGenerator(MIN_FONT_SIZE, MAX_FONT_SIZE, fontsList);
		return fontGen;
	}
	
	@Bean
	public BackgroundGenerator backGen() {
		BackgroundGenerator backGen = new UniColorBackgroundGenerator(IMAGE_WIDTH, IMAGE_HEIGHT);
		return backGen;
	}
	
	@Bean
	public ColorGenerator colorGen() {
		ColorGenerator colorGen = new SingleColorGenerator(new Color(128, 62, 38));
		return colorGen;
	}
	
	@Bean
	public TextDecorator baffleDecorator() {
		TextDecorator baffleDecorator = new BaffleTextDecorator(1, new Color(255, 255, 255));
		return baffleDecorator;
	}
	
	@Bean
	@Autowired
	@DependsOn({ "colorGen", "baffleDecorator" })
	public TextPaster decoratedPaster(ColorGenerator colorGen, TextDecorator baffleDecorator) {
		TextPaster decoratedPaster = new DecoratedRandomTextPaster(MIN_WORD_LEN, MAX_WORD_LEN, colorGen, new TextDecorator[]{ baffleDecorator });
		return decoratedPaster;
	}
	
	@Bean
	@Autowired
	@DependsOn({ "fontGen", "backGen", "decoratedPaster" })
	public WordToImage wordToImage(FontGenerator fontGen, BackgroundGenerator backGen, TextPaster decoratedPaster) {
		WordToImage wordToImage = new ComposedWordToImage(fontGen, backGen, decoratedPaster);
		return wordToImage;
	}
	
	@Bean
	@Autowired
	@DependsOn({ "wordGen", "wordToImage" })
	public CaptchaFactory captchaFactory(WordGenerator wordGen, WordToImage wordToImage) {
		CaptchaFactory captchaFactory = new GimpyFactory(wordGen, wordToImage);
		return captchaFactory;
	}

	@Bean
	@Autowired
	@DependsOn({ "captchaFactory" })
	public CaptchaEngine imageEngine(CaptchaFactory captchaFactory) {
		CaptchaEngine imageEngine = new GenericCaptchaEngine(new CaptchaFactory[]{ captchaFactory });
		return imageEngine;
	}
	
	@Bean
	@Autowired
	@DependsOn({ "imageEngine" })
	public GenericManageableCaptchaService captchaService(CaptchaEngine imageEngine) {
		GenericManageableCaptchaService captchaService = new GenericManageableCaptchaService(imageEngine, 180, 100000, 75000);
		return captchaService;
	}

}
