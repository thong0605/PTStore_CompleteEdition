package com.ptstore.services;

import java.io.File;
import java.util.Date;

import javax.mail.internet.MimeMessage;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("mailService")
public class MailServiceImpl implements MailService {

	@Autowired
	private JavaMailSender javaMailSender;

	@Override
	public void send(String toAddress, String fromAddress, String subject, String content) throws Exception {
		MimeMessage mimeMessage = javaMailSender.createMimeMessage();
		MimeMessageHelper mimeMessageHelper = new MimeMessageHelper(mimeMessage, true);
		mimeMessageHelper.setFrom(fromAddress);
		mimeMessageHelper.setTo(toAddress);
		mimeMessageHelper.setSubject(subject);
		mimeMessageHelper.setText(content);
		mimeMessageHelper.setSentDate(new Date());
		javaMailSender.send(mimeMessage);
	}

	@Override
	public void sendHTML(String toAddress, String fromAddress, String subject, String content) throws Exception {
		MimeMessage mimeMessage = javaMailSender.createMimeMessage();
		MimeMessageHelper mimeMessageHelper = new MimeMessageHelper(mimeMessage, true);
		mimeMessageHelper.setFrom(fromAddress);
		mimeMessageHelper.setTo(toAddress);
		mimeMessageHelper.setSubject(subject);
		mimeMessageHelper.setText(content, true);
		mimeMessageHelper.setSentDate(new Date());
		javaMailSender.send(mimeMessage);
	}

	@Override
	public void sendHTMLAndAttachment(String toAddress, String fromAddress, String subject, String content, File file)
			throws Exception {
		MimeMessage mimeMessage = javaMailSender.createMimeMessage();
		MimeMessageHelper mimeMessageHelper = new MimeMessageHelper(mimeMessage, true);
		mimeMessageHelper.setFrom(fromAddress);
		mimeMessageHelper.setTo(toAddress);
		mimeMessageHelper.setSubject(subject);
		mimeMessageHelper.setText(content, true);
		mimeMessageHelper.setSentDate(new Date());
		mimeMessageHelper.addAttachment(file.getName(), file);
		javaMailSender.send(mimeMessage);
	}

}