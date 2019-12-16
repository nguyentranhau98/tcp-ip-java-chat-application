package server;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.net.Socket;
import java.util.Scanner;
import java.util.StringTokenizer;

import user.bo.UserBO;

public class ClientHandler implements Runnable {
	Scanner scn = new Scanner(System.in);
	public String name;
	final DataInputStream dis;
	final DataOutputStream dos;
	Socket s;
	boolean isloggedin;

	// constructor
	public ClientHandler(Socket s, String name, DataInputStream dis, DataOutputStream dos) {
		this.dis = dis;
		this.dos = dos;
		this.name = name;
		this.s = s;
		this.isloggedin = true;
	}

	@Override
	public void run() {

		String received;
		while (true) {
			try {
				// receive the string
				received = dis.readUTF();

				if (received.equals("LOGOUT#")) {
					UserBO userBO = new UserBO();
					userBO.logout(name);
					ServerFrame.listUser.remove(name);
					Server.ar.remove(this);
					Server.onlineList.remove(name);
					Server.updateClientOnlineList(Server.ar);
					this.isloggedin = false;
					this.s.close();
					break;
				}

				// break the string into message and recipient part
				StringTokenizer st = new StringTokenizer(received, "#");
				String recipient = st.nextToken();
				String MsgToSend = st.nextToken();
				// search for the recipient in the connected devices list.
				// ar is the vector storing client of active users
				for (ClientHandler mc : Server.ar) {
					// if the recipient is found, write on its
					// output stream
					if (mc.name.equals(recipient) && mc.isloggedin == true) {
						mc.dos.writeUTF("SEND#" + this.name + " : " + MsgToSend);
						break;
					}
				}
			} catch (Exception e) {

				//e.printStackTrace();
			}

		}
		try {
			// closing resources
			this.dis.close();
			this.dos.close();

		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
