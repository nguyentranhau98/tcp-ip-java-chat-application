package server;

import java.io.*;
import java.util.*;
import java.net.*;

// Server class 
public class Server {

	// Vector to store active clients
	public static Vector<ClientHandler> ar = new Vector<>();
	public static Vector<String> onlineList = new Vector<>();
	// counter for clients

	public static void main(String[] args) throws IOException {
		// server is listening on port 1234
		ServerSocket msgServerSocket = new ServerSocket(1234);
		// ServerSocket objectServerSocket = new ServerSocket(4321);
		Socket msgSocket;
		// Socket objectSocket;

		// running infinite loop for getting
		// client request
		while (true) {
			// Accept the incoming request
			msgSocket = msgServerSocket.accept();
			// objectSocket = objectServerSocket.accept();
			System.out.println("New client request received : " + msgSocket);

			// obtain input and output streams
			DataInputStream dis = new DataInputStream(msgSocket.getInputStream());
			DataOutputStream dos = new DataOutputStream(msgSocket.getOutputStream());

			System.out.println("Creating a new handler for this client...");
			String username = dis.readUTF();
			System.out.println(username);
			ServerFrame.listUser.add(username);
			onlineList.add(username);

			// Create a new handler object for handling this request.
			ClientHandler mtch = new ClientHandler(msgSocket, username, dis, dos);

			// Create a new Thread with this object.
			Thread t = new Thread(mtch);

			System.out.println("Adding this client to active client list");

			// add this client to active clients list
			ar.add(mtch);
			Server.updateClientOnlineList(ar);
			// start the thread.
			t.start();

		}

	}

	public static void updateClientOnlineList(Vector<ClientHandler> ar) {
		String msg = "UPDATE#";
		for (String username : Server.onlineList) {
			msg += username + "#";
		}
		for (ClientHandler mc : Server.ar) {
			try {
				mc.dos.writeUTF(msg);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	public static void msgSocketHandle(Socket socket) {

	}

	public static void sendToClients(String msg) {
		for (ClientHandler mc : Server.ar) {
			try {
				mc.dos.writeUTF("SEND#" + msg);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	public static void sendToClient(String user, String msg) {
		for (ClientHandler mc : Server.ar) {
			try {
				// if the recipient is found, write on its output stream
				if (mc.name.equals(user) && mc.isloggedin == true) {
					mc.dos.writeUTF("SEND#" + msg);
					break;
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

}
