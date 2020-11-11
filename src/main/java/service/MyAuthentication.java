package service;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

import org.springframework.stereotype.Service;

@Service
public class MyAuthentication extends Authenticator { //아이디 패스워드 인증받기 함수
	  PasswordAuthentication pa;
	  public MyAuthentication(){
	    pa=new PasswordAuthentication("ssywork4@gmail.com","test12@@");        //gmail 아이디 비번 입력필수!
	  }
	  @Override
	  protected PasswordAuthentication getPasswordAuthentication() {
	    return pa;
	  }
	}
