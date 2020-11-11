package fpt.edu.project.controller;

import java.util.UUID;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import fpt.edu.project.model.Account;
import fpt.edu.project.service.AccountServiceImpl;

@Controller
public class ForgotPasswordController {

	@Autowired
	private AccountServiceImpl accountService;

	@RequestMapping("/sendmail")
	public String sendmail() {

		return "user/forgotpassword";
	}

	@RequestMapping(value = "/forgotpassword", method = RequestMethod.POST)
	public String forgot(@RequestParam(name = "email") String email, HttpServletRequest request) {
		Account account = accountService.findAccountEmail(email);
		if (account == null) {
			request.setAttribute("message", "Email is incorrect, please type again");
		} else {
			String token = UUID.randomUUID().toString();
			String hashtoken = new BCryptPasswordEncoder().encode(token);
			account.setToken(hashtoken);
			accountService.save(account);
			request.setAttribute("message", "Check your email to reset password");
			String linkString = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
					+ request.getContextPath() + "/resetpass?username=" + account.getUserId() + "&token=" + hashtoken;
			System.out.print(linkString);
			String htmlString = "  \r\n" + "<!doctype html>\r\n" + "<html>\r\n" + "  <head>\r\n"
					+ "    <meta name=\"viewport\" content=\"width=device-width\">\r\n"
					+ "    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n"
					+ "    <title>Simple Transactional Email</title>\r\n" + "    <style>\r\n"
					+ "    /* -------------------------------------\r\n"
					+ "        INLINED WITH htmlemail.io/inline\r\n"
					+ "    ------------------------------------- */\r\n"
					+ "    /* -------------------------------------\r\n"
					+ "        RESPONSIVE AND MOBILE FRIENDLY STYLES\r\n"
					+ "    ------------------------------------- */\r\n"
					+ "    @media only screen and (max-width: 620px) {\r\n" + "      table[class=body] h1 {\r\n"
					+ "        font-size: 28px !important;\r\n" + "        margin-bottom: 10px !important;\r\n"
					+ "      }\r\n" + "      table[class=body] p,\r\n" + "            table[class=body] ul,\r\n"
					+ "            table[class=body] ol,\r\n" + "            table[class=body] td,\r\n"
					+ "            table[class=body] span,\r\n" + "            table[class=body] a {\r\n"
					+ "        font-size: 16px !important;\r\n" + "      }\r\n"
					+ "      table[class=body] .wrapper,\r\n" + "            table[class=body] .article {\r\n"
					+ "        padding: 10px !important;\r\n" + "      }\r\n" + "      table[class=body] .content {\r\n"
					+ "        padding: 0 !important;\r\n" + "      }\r\n" + "      table[class=body] .container {\r\n"
					+ "        padding: 0 !important;\r\n" + "        width: 100% !important;\r\n" + "      }\r\n"
					+ "      table[class=body] .main {\r\n" + "        border-left-width: 0 !important;\r\n"
					+ "        border-radius: 0 !important;\r\n" + "        border-right-width: 0 !important;\r\n"
					+ "      }\r\n" + "      table[class=body] .btn table {\r\n" + "        width: 100% !important;\r\n"
					+ "      }\r\n" + "      table[class=body] .btn a {\r\n" + "        width: 100% !important;\r\n"
					+ "      }\r\n" + "      table[class=body] .img-responsive {\r\n"
					+ "        height: auto !important;\r\n" + "        max-width: 100% !important;\r\n"
					+ "        width: auto !important;\r\n" + "      }\r\n" + "    }\r\n" + "\r\n"
					+ "    /* -------------------------------------\r\n"
					+ "        PRESERVE THESE STYLES IN THE HEAD\r\n"
					+ "    ------------------------------------- */\r\n" + "    @media all {\r\n"
					+ "      .ExternalClass {\r\n" + "        width: 100%;\r\n" + "      }\r\n"
					+ "      .ExternalClass,\r\n" + "            .ExternalClass p,\r\n"
					+ "            .ExternalClass span,\r\n" + "            .ExternalClass font,\r\n"
					+ "            .ExternalClass td,\r\n" + "            .ExternalClass div {\r\n"
					+ "        line-height: 100%;\r\n" + "      }\r\n" + "      .apple-link a {\r\n"
					+ "        color: inherit !important;\r\n" + "        font-family: inherit !important;\r\n"
					+ "        font-size: inherit !important;\r\n" + "        font-weight: inherit !important;\r\n"
					+ "        line-height: inherit !important;\r\n" + "        text-decoration: none !important;\r\n"
					+ "      }\r\n" + "      #MessageViewBody a {\r\n" + "        color: inherit;\r\n"
					+ "        text-decoration: none;\r\n" + "        font-size: inherit;\r\n"
					+ "        font-family: inherit;\r\n" + "        font-weight: inherit;\r\n"
					+ "        line-height: inherit;\r\n" + "      }\r\n" + "      .btn-primary table td:hover {\r\n"
					+ "        background-color: #34495e !important;\r\n" + "      }\r\n"
					+ "      .btn-primary a:hover {\r\n" + "        background-color: #34495e !important;\r\n"
					+ "        border-color: #34495e !important;\r\n" + "      }\r\n" + "    }\r\n" + "    </style>\r\n"
					+ "  </head>\r\n"
					+ "  <body class=\"\" style=\"background-color: #f6f6f6; font-family: sans-serif; -webkit-font-smoothing: antialiased; font-size: 14px; line-height: 1.4; margin: 0; padding: 0; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%;\">\r\n"
					+ "    <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"body\" style=\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%; background-color: #f6f6f6;\">\r\n"
					+ "      <tr>\r\n"
					+ "        <td style=\"font-family: sans-serif; font-size: 14px; vertical-align: top;\">&nbsp;</td>\r\n"
					+ "        <td class=\"container\" style=\"font-family: sans-serif; font-size: 14px; vertical-align: top; display: block; Margin: 0 auto; max-width: 580px; padding: 10px; width: 580px;\">\r\n"
					+ "          <div class=\"content\" style=\"box-sizing: border-box; display: block; Margin: 0 auto; max-width: 580px; padding: 10px;\">\r\n"
					+ "\r\n" + "            <!-- START CENTERED WHITE CONTAINER -->\r\n"
					+ "            <table class=\"main\" style=\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%; background: #ffffff; border-radius: 3px;\">\r\n"
					+ "\r\n" + "              <!-- START MAIN CONTENT AREA -->\r\n" + "              <tr>\r\n"
					+ "                <td class=\"wrapper\" style=\"font-family: sans-serif; font-size: 14px; vertical-align: top; box-sizing: border-box; padding: 20px;\">\r\n"
					+ "                  <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%;\">\r\n"
					+ "                    <tr>\r\n"
					+ "                      <td style=\"font-family: sans-serif; font-size: 14px; vertical-align: top;\">\r\n"
					+ "                        <p style=\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\">Hi "
					+ account.getFullname() + ",</p>\r\n"
					+ "                        <p style=\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\">This is link to reset your password in AppleShop.com</p>\r\n"
					+ "                        <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"btn btn-primary\" style=\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%; box-sizing: border-box;\">\r\n"
					+ "                          <tbody>\r\n" + "                            <tr>\r\n"
					+ "                              <td align=\"left\" style=\"font-family: sans-serif; font-size: 14px; vertical-align: top; padding-bottom: 15px;\">\r\n"
					+ "                                <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: auto;\">\r\n"
					+ "                                  <tbody>\r\n" + "                                    <tr>\r\n"
					+ "                                      <td style=\"font-family: sans-serif; font-size: 14px; vertical-align: top; background-color: #3498db; border-radius: 5px; text-align: center;\"> <a href=\" "
					+ linkString
					+ " \" target=\"_blank\" style=\"display: inline-block; color: #ffffff; background-color: #3498db; border: solid 1px #3498db; border-radius: 5px; box-sizing: border-box; cursor: pointer; text-decoration: none; font-size: 14px; font-weight: bold; margin: 0; padding: 12px 25px; text-transform: capitalize; border-color: #3498db;\">Reset Your Password</a> </td>\r\n"
					+ "                                    </tr>\r\n" + "                                  </tbody>\r\n"
					+ "                                </table>\r\n" + "                              </td>\r\n"
					+ "                            </tr>\r\n" + "                          </tbody>\r\n"
					+ "                        </table>\r\n"
					+ "                        <p style=\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\">Best regards</p>\r\n"
					+ "                      </td>\r\n" + "                    </tr>\r\n"
					+ "                  </table>\r\n" + "                </td>\r\n" + "              </tr>\r\n"
					+ "\r\n" + "            <!-- END MAIN CONTENT AREA -->\r\n" + "            </table>\r\n" + "\r\n"
					+ "          <!-- END CENTERED WHITE CONTAINER -->\r\n" + "          </div>\r\n"
					+ "        </td>\r\n"
					+ "        <td style=\"font-family: sans-serif; font-size: 14px; vertical-align: top;\">&nbsp;</td>\r\n"
					+ "      </tr>\r\n" + "    </table>\r\n" + "  </body>\r\n" + "</html>";
			try {
//				MimeMessage mimeMessage = javaMailSender.createMimeMessage();
//				MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true);
//				helper.setSubject("Reset Password - AppleShop.com");
//				helper.setTo(account.getEmail());
//				helper.setText(htmlString, true);
//				javaMailSender.send(mimeMessage);
			} catch (Exception e) {

			}
		}

		return "user/forgotpassword";
	}

	@RequestMapping(value = "/resetpass", method = RequestMethod.GET)
	public String ressetpass(@RequestParam(name = "username") String username,
			@RequestParam(name = "token") String token, ModelMap model) {
		Account account = accountService.findById(username).get();
		System.out.print(account.getToken());
		if (token.equals(account.getToken())) {
			model.addAttribute("token", account.getToken());
			model.addAttribute("username", account.getUserId());

			return "user/changepassword";
		}
		return "user/index";

	}

	@RequestMapping(value = "/resetpass", method = RequestMethod.POST)
	public String changepass(@RequestParam(name = "username") String username,
			@RequestParam(name = "pass") String password, @RequestParam(name = "token") String token, ModelMap model) {
		System.out.print(username);
		Account account = accountService.findById(username).get();
		System.out.print(account);
		if (token.equals(account.getToken())) {
			String hashPassword = new BCryptPasswordEncoder().encode(password);
			account.setToken(null);
			account.setPassword(hashPassword);
			accountService.save(account);
		}
		return "user/login";
	}

}
