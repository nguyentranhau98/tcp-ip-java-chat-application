package client;

import java.awt.Button;
import java.awt.GridLayout;
import java.awt.List;
import java.awt.Panel;
import java.awt.TextField;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.net.InetAddress;
import java.net.Socket;

import javax.swing.JFrame;
import javax.swing.JOptionPane;

import server.ClientHandler;

public class ClientFrame extends JFrame implements ActionListener {
	public static LoginFrame loginFrame;
	public InetAddress addr;
	public static Socket socket;
	public static BufferedReader br;
	public static BufferedWriter bw;
	public static TextField text;
	public Button sendBtn, logoutBtn;
	public static List msgList, onlineList;
	public ClientHandler clientHandler;
	public Client client;

	public ClientFrame(LoginFrame loginFrame) {
		setTitle("Client : " + loginFrame.username);
		this.loginFrame = loginFrame;

		setSize(400, 300);
		setLocation(300, 0);

		Panel wrapper = new Panel();
		wrapper.setLayout(new GridLayout(1, 2));
		msgList = new List();
		wrapper.add(msgList);
		onlineList = new List();
		Panel rightWrapper = new Panel();
		Panel funcWrapper = new Panel();
		Panel btnWrapper = new Panel();
		rightWrapper.setLayout(new GridLayout(2, 1));
		rightWrapper.add(onlineList);
		funcWrapper.setLayout(new GridLayout(2, 1));
		text = new TextField(25);
		funcWrapper.add(text);
		sendBtn = new Button("Send");
		logoutBtn = new Button("Logout");
		btnWrapper.add(sendBtn);
		btnWrapper.add(logoutBtn);
		funcWrapper.add(btnWrapper);
		rightWrapper.add(funcWrapper);
		wrapper.add(rightWrapper);
		add(wrapper);

		setVisible(true);
		loginFrame.setVisible(false);

		sendBtn.addActionListener(this);
		logoutBtn.addActionListener(this);

		this.addWindowListener(new java.awt.event.WindowAdapter() {
			@Override
			public void windowClosing(java.awt.event.WindowEvent windowEvent) {
				if (JOptionPane.showConfirmDialog(null,
						"Are you sure you want to close this window? (This will logout)", "Close Window?",
						JOptionPane.YES_NO_OPTION, JOptionPane.QUESTION_MESSAGE) == JOptionPane.YES_OPTION) {
					client.send("LOGOUT#");
					System.exit(0);
				}
			}
		});

		try {
			client = new Client(loginFrame.username);
			client.main(null);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	@Override
	public void actionPerformed(ActionEvent ae) {
		String str = ae.getActionCommand();
		switch (str) {
		case "Send":
			String[] selectedUser = onlineList.getSelectedItems();
			if (selectedUser.length == 0) {
				ClientFrame.text.setText("Please choose a user(s) from the online users!");
			} else {
				for (String user : selectedUser) {
					String msg = user + "#" + ClientFrame.text.getText();
					client.send(msg);
					ClientFrame.msgList.add("To " + user + " : " + ClientFrame.text.getText());
				}
			}
			ClientFrame.text.setText("");
			break;
		case "Logout":
			client.send("LOGOUT#");
			System.exit(0);
		}
	}
}