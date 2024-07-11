package com.sqlrecord.sqlrecord.mail;

import java.text.DecimalFormat;
import java.text.Format;
import java.util.Properties;
import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;

public class Mail {

	public static JavaMailSenderImpl sender;
	public static String content;
	public static void main(String[] args) throws MessagingException { //설정 하는데 여기 안에서 해야하는건가..?그렇다네
		
		JavaMailSenderImpl impl = new JavaMailSenderImpl(); // 편지봉투
		// 계정 관련 설정
		impl.setHost("smtp.gmail.com");
		impl.setPort(587); //google
		impl.setUsername("yyyjjjhhh13"); //로그인 아이디 
		impl.setPassword("bjzjthfaisqatwmt");
		
		// 보안 관련 설정
		Properties prop = new Properties();
		
		prop.setProperty("mail.smtp.auth","true");
		prop.setProperty("mail.smtp.starttls.enable","true");
		
		impl.setJavaMailProperties(prop);
		sender = impl;
		// 인증번호 생성
		Random r = new Random();
		int i = r.nextInt(100000);
		Format format = new DecimalFormat("000000");
		String code = format.format(i);
		
		
		// 메일 내용
		String content = "<html>\n" +
			    "<head>\n" +
			    "    <style>\n" +
			    "        body { font-family: Arial, sans-serif; line-height: 1.6; color: #333; }\n" +
			    "        .container { max-width: 600px; margin: 0 auto; padding: 20px; }\n" +
			    "        .header { background-color: #4CAF50; color: white; text-align: center; padding: 10px; }\n" +
			    "        .content { background-color: #f4f4f4; padding: 20px; border-radius: 5px; }\n" +
			    "        .auth-code { font-size: 24px; font-weight: bold; color: #4CAF50; text-align: center; margin: 20px 0; }\n" +
			    "        .footer { text-align: center; margin-top: 20px; font-size: 12px; font-weight: 600; color: #777; }\n" +
			    "        p {font-weight: 600;}"+
			    "    </style>\n" +
			    "</head>\n" +
			    "<body>\n" +
			    "    <div class=\"container\">\n" +
			    "        <div class=\"header\">\n" +
			    "            <h1>이메일 인증</h1>\n" +
			    "        </div>\n" +
			    "        <div class=\"content\">\n" +
			    "            <p>안녕하세요,</p>\n" +
			    "            <p>귀하의 계정 인증을 위한 인증 코드입니다 <br>아래의 인증 코드를 입력해주세요:</p>\n" +
			    "            <div class=\"auth-code\">"+code+"</div>\n" +
			    "            <p>이 인증 코드는 30분 동안 유효합니다<br> 본 메일을 요청하지 않으셨다면, 이 메일을 무시해주세요.</p>\n" +
			    "            <p>감사합니다.</p>\n" +
			    "        </div>\n" +
			    "        <div class=\"footer\">\n" +
			    "            <p>본 메일은 발신 전용이므로 회신하지 마세요. 문의사항은 고객센터를 이용해주세요.</p>\n" +
			    "        </div>\n" +
			    "    </div>\n" +
			    "</body>\n" +
			    "</html>";
		
		MimeMessage messeage = sender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(messeage,false,"UTF-8");
		
		helper.setSubject("정보찾기 이메일 인증 메일 입니다."); //제목
		helper.setText(content,true); // 내용
		helper.setTo("yyyjjjhhh13@gmail.com");
		
		//helper.setTo(""); 네이버로는 html ,css 적용 안되어있는 메일 전송됨
		sender.send(messeage);
		
		
	}
	
}
