package util;

import java.util.Date;
import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.*;

public class EmailUtil {

	public static void sendEmail(String host, String port, String username, String password, String toAddress,
			String subject, String message) throws AddressException, MessagingException {

		Properties props = new Properties();
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", port);
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.ssl.trust", host);
		props.put("mail.smtp.ssl.protocols", "TLSv1.2");
		props.put("mail.debug", "true");

		Authenticator auth = new Authenticator() {
			public PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password);
			}
		};

		Session session = Session.getInstance(props, auth);

		Message msg = new MimeMessage(session);
		msg.setFrom(new InternetAddress(username));
		msg.addRecipient(Message.RecipientType.TO, new InternetAddress(toAddress));
		msg.setSubject(subject);
		msg.setSentDate(new Date());
		msg.setText(message);

		Transport.send(msg);
		System.out.println("Email sent successfully");
	}
}
