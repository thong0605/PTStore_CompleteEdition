package com.ptstore.services;

import java.io.File;

public interface MailService {

	public void send(String toAddress, String fromAddress, String subject, String content) throws Exception;

	public void sendHTML(String toAddress, String fromAddress, String subject, String content) throws Exception;

	public void sendHTMLAndAttachment(String toAddress, String fromAddress, String subject, String content, File file)
			throws Exception;
}