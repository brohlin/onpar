// File Name SendEmail.java
package org.onpar.utils;

import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;
// import javax.activation.*;

public class SendEmail
{
   public static void main(String [] args)
   {
      // Recipient's email ID needs to be mentioned.
      String to = "brohlin@ruandunduma120.org";

      // Sender's email ID needs to be mentioned
      String from = "brohlin@ruandunduma120.org";

      // Assuming you are sending email from localhost
      String host = "mail.ruandunduma120.org";

      // Get system properties
      Properties properties = new Properties();

      // Setup mail server
      properties.put("mail.smtp.host", host);
      properties.put("mail.smtp.port", "2525");
      properties.put("mail.smtp.auth", "true");
      properties.put("mail.smtp.ssl.enable", "true");


      // Get the default Session object.
      // Session session = Session.getDefaultInstance(properties);

      // create some properties and get the default Session
      Session session = Session.getInstance(properties,
    		  								new Authenticator() {
           										public PasswordAuthentication getPasswordAuthentication() {
           											return new PasswordAuthentication("brohlin@ruandunduma120.org", "OverHead13");
           										}
      										});


      try{
         // Create a default MimeMessage object.
         MimeMessage message = new MimeMessage(session);

         // Set From: header field of the header.
         message.setFrom(new InternetAddress(from));

         // Set To: header field of the header.
         message.addRecipient(Message.RecipientType.TO,
                                  new InternetAddress(to));

         // Set Subject: header field
         message.setSubject("This is the Subject Line!");

         // Now set the actual message
         message.setText("This is actual message");
         System.out.println("Before sending....");

         // Send message
         Transport.send(message);
         // Transport tr = session.getTransport("smtps");
         // tr.connect(host, "brohlin@ruandunduma120.org", "OverHead13");
         // tr.sendMessage(message, message.getAllRecipients());

         System.out.println("Sent message successfully....");
      }catch (MessagingException mex) {
         mex.printStackTrace();
      }
   }
}