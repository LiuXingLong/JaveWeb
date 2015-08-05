package com.tanzhouedu.mail.serelt;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;

import javax.mail.Address;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SendMailServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public SendMailServlet() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request,response);
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	/* (non-Javadoc)
	 * @see javax.servlet.http.HttpServlet#doPost(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse)
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String userName="1353438279";
		String password="qq123456112526";
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		String mailTo=request.getParameter("mailTo");
		String copyTo=request.getParameter("copyTo");
		String title=request.getParameter("title");
		String content=request.getParameter("content");
		
		String message="�ʼ����ͳɹ�!";
		
		//�ռ���Ϊ��
		if(mailTo==null||"".equals(mailTo)){
			return;
		}
		try{
			String mailToArray[]=mailTo.split(";");
			Address addresses[]=new Address[mailToArray.length];
			
			for(int i=0;i<mailToArray.length;i++){
				Address address=new InternetAddress(mailToArray[i]);
				addresses[i]=address;
			}
			Address copyAddr[]=null;
			if(copyTo!=null&&!"".equals(copyTo)){
				String copyToArray[]=copyTo.split(";");
				copyAddr=new Address[copyToArray.length];  // ʹ�ÿն���ǰ��Ҫ��  new  һ������
				for(int i=0;i<copyToArray.length;i++){
					Address address=new InternetAddress(copyToArray[i]);
					copyAddr[i]=address;
				}
			}
			// �����ʼ����ͷ�����
			Properties prop=new Properties();
			prop.put("mail.transport.protocol", "smtp");
			prop.put("mail.host", "smtp.qq.com");
			prop.put("mail.smtp.auth", "true");
			
			// ���÷����˵������ַ
			Address sendFrom=new InternetAddress("1353438279@qq.com"); 
			
			//����һ���Ự
			Session session=Session.getInstance(prop);
			MimeMessage msg =new MimeMessage(session);
			
			// ���÷�����
			msg.setFrom(sendFrom);
			
			// �����ռ���			
			msg.setRecipients(Message.RecipientType.TO,addresses);
			// ���ó���
			if(copyAddr!=null&&copyAddr.length>0){
				msg.setRecipients(Message.RecipientType.CC,copyAddr);
			}
			
			// ��������
			msg.setSubject(title);
			
			// ��������
			msg.setText(content);
			
			// ����msg
			msg.saveChanges();
			
			// ��ȡ���͹���
			Transport ts=session.getTransport();
			
			//���ӷ�������ķ�����
			ts.connect(userName,password);
			
			//�����ʼ�
			ts.sendMessage(msg, msg.getAllRecipients());
			
			// �ر�����
			ts.close();
			
		}catch(Exception e){
			message="�ʼ�����ʧ�ܣ�";
			// ��¼��־
			e.printStackTrace();
		}
		PrintWriter out =response.getWriter();
		out.print(message);
		out.flush();
		out.close();
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}























