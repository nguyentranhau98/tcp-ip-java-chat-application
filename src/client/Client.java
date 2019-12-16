package client;

import java.io.*;
import java.net.*;
import java.util.Scanner;
import java.util.StringTokenizer;

import user.bo.UserBO;

public class Client {

	final static int ServerPort = 1234;
	static String msg = "";
	public static String username;
	static DataInputStream dis;
	static DataOutputStream dos;

	public Client(String username) {
		this.username = username;
	}

	public static void main(String args[]) throws UnknownHostException, IOException {
		Scanner scn = new Scanner(System.in);
		// getting localhost ip
		InetAddress ip = InetAddress.getByName("localhost");

		// establish the connection
		Socket s = new Socket(ip, ServerPort);

		// obtaining input and out streams
		dis = new DataInputStream(s.getInputStream());
		dos = new DataOutputStream(s.getOutputStream());

		dos.writeUTF(username);
		dos.flush();

		// readMessage thread
		Thread readMessage = new Thread(new Runnable() {
			@Override
			public void run() {
				while (true) {
					try {
						// read the message sent to this client
						String msg = dis.readUTF();
						StringTokenizer st = new StringTokenizer(msg, "#");
						String action = st.nextToken();
						switch (action) {
						case "UPDATE":
							ClientFrame.onlineList.removeAll();
							while(st.hasMoreTokens()) {
								ClientFrame.onlineList.add(st.nextToken());
							}
							break;
						case "SEND":
							ClientFrame.msgList.add("From " + st.nextToken());
							break;
						default:
							break;
						}
					} catch (IOException e) {
						// e.printStackTrace();
					}
				}
			}
		});

		readMessage.start();

	}

	public void send(String msg) {
		try {
			// write on the output stream
			dos.writeUTF(msg);
//			if(msg.equals("LOGOUT#")) {
//				UserBO userBO = new UserBO();
//				userBO.logout(username);
//			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
