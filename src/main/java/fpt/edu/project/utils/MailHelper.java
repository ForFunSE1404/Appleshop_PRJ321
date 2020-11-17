package fpt.edu.project.utils;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

@Service
public class MailHelper {
	@Autowired
	private JavaMailSender javaMailSender;

	@Async
	public void send(MimeMessage mimeMessage) {
		javaMailSender.send(mimeMessage);
	}

	@Async
	public void send(SimpleMailMessage simpleMailMessage) {
		javaMailSender.send(simpleMailMessage);
	}

	public MimeMessage createMimeMessage() {
		return javaMailSender.createMimeMessage();
	}
}
