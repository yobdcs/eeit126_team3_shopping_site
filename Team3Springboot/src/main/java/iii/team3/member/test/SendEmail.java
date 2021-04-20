package iii.team3.member.test;

import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SendEmail {
	public void sendMail(/*String mail,String title,String contents*/) {
	      // Recipient's email ID needs to be mentioned.
	      String to = "eeit126T3@gmail.com";//change accordingly//mail

	      // Sender's email ID needs to be mentioned
	      String from = "eeit126T3@gmail.com";//change accordingly
	      final String username = "eeit126T3";//change accordingly
	      final String password = "EEit126T3@";//change accordingly

	      // Assuming you are sending email through relay.jangosmtp.net
	      String host = "smtp.gmail.com";

	      Properties props = new Properties();
	      props.put("mail.smtp.auth", "true");
	      props.put("mail.smtp.starttls.enable", "true");
	      props.put("mail.smtp.host", host);
	      props.put("mail.smtp.port", "587");

	      // Get the Session object.
	      Session session = Session.getInstance(props,
	      new javax.mail.Authenticator() {
	         protected PasswordAuthentication getPasswordAuthentication() {
	            return new PasswordAuthentication(username, password);
	         }
	      });

	      try {
	         // Create a default MimeMessage object.
	         Message message = new MimeMessage(session);

	         // Set From: header field of the header.
	         message.setFrom(new InternetAddress(from));

	         // Set To: header field of the header.
	         message.setRecipients(Message.RecipientType.TO,
	         InternetAddress.parse(to));

	         // Set Subject: header field
	         message.setSubject("Testing Subject");//title

	         // Now set the actual message
	         message.setText("Hello, this is sample for to check send "
	            + "email using JavaMailAPI ");//contents

	         // Send message
	         Transport.send(message);

	         System.out.println("Sent message successfully....");

	      } catch (MessagingException e) {
	            throw new RuntimeException(e);
	      }
	   }
	
	public void sendMail(/*String mail,*/String title,String contents) {
		// Recipient's email ID needs to be mentioned.
		String to = "eeit126T3@gmail.com";//change accordingly
		
		// Sender's email ID needs to be mentioned
		String from = "eeit126T3@gmail.com";//change accordingly
		final String username = "eeit126T3";//change accordingly
		final String password = "EEit126T3@";//change accordingly
		
		// Assuming you are sending email through relay.jangosmtp.net
		String host = "smtp.gmail.com";
		
		Properties props = new Properties();
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", "587");
		
		// Get the Session object.
		Session session = Session.getInstance(props,
				new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password);
			}
		});
		
		try {
			// Create a default MimeMessage object.
			Message message = new MimeMessage(session);
			
			// Set From: header field of the header.
			message.setFrom(new InternetAddress(from));
			
			// Set To: header field of the header.
			message.setRecipients(Message.RecipientType.TO,
					InternetAddress.parse(to));
			
			// Set Subject: header field
			message.setSubject(title);
			
			// Now set the actual message
			message.setText(contents);
			
			// Send message
			Transport.send(message);
			
			System.out.println("Sent message successfully....");
			
		} catch (MessagingException e) {
			throw new RuntimeException(e);
		}
	}
	
	public String getCode() {
		String string = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
		
		StringBuffer sb = new StringBuffer();
		for(int i = 0; i < 4; i++) {
			Random random = new Random();
			int index = random.nextInt(string.length());
			char ch = string.charAt(index);
			sb.append(ch);
		}
		return sb.toString();
	}
}
