package server;

import java.awt.BorderLayout;
import java.awt.Button;
import java.awt.Color;
import java.awt.FlowLayout;
import java.awt.GridLayout;
import java.awt.List;
import java.awt.TextArea;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.IOException;

import javax.swing.JFrame;
import javax.swing.JPanel;

public class ServerFrame extends JFrame implements ActionListener {
	private static final long serialVersionUID = 1L;
	private static final int port = 8085;
	private static int m;
	private static Button room1, room2, room3;
	private Button sendBtn, exitBtn;
	protected static List serverMsg, listUser;
	private Server server;

	public static TextArea text;

	public ServerFrame() {
		setSize(500, 300);
		setTitle("Server Application");

		setBackground(new Color(192, 192, 192));
		setLayout(new GridLayout(3, 1));

		JPanel panels[] = new JPanel[3];
		panels[0] = new JPanel();
		panels[1] = new JPanel();
		panels[2] = new JPanel();

		panels[0].setLayout(new BorderLayout());
		panels[1].setLayout(new FlowLayout(FlowLayout.LEFT));
		panels[2].setLayout(new GridLayout(1, 1));

		sendBtn = new Button("Send");
		exitBtn = new Button("Exit");

		serverMsg = new List();
		listUser = new List();

		serverMsg.add("Server Started");
		text = new TextArea(4, 50);

		panels[0].add(serverMsg);
		panels[2].add(listUser);
		panels[1].add(text);
		panels[1].add(sendBtn);
		panels[1].add(exitBtn);

		add(panels[0]);
		add(panels[1]);
		add(panels[2]);

		sendBtn.addActionListener(this);
		exitBtn.addActionListener(this);
		this.setDefaultCloseOperation(EXIT_ON_CLOSE);
	}

	public static void main(String[] args) throws IOException {
		ServerFrame frame = new ServerFrame();
		frame.setVisible(true);
		Server server = new Server();
		server.main(null);
	}

	public void actionPerformed(ActionEvent ae) {
		String cmd = ae.getActionCommand();
		if(cmd.equals("Exit")) {
			System.exit(0);
		}
		if(cmd.equals("Send")) {
			String[] selectedUser = listUser.getSelectedItems();
			if (selectedUser.length == 0) {
				String msg = "Server : " + text.getText();
				Server.sendToClients(msg);
				ServerFrame.serverMsg.add("To All Clients : " + text.getText()); 
				text.setText("");
			} else {
				for (String user : selectedUser) {
					String msg = "Server : " + text.getText();
					Server.sendToClient(user, msg);
					ServerFrame.serverMsg.add("To " + user + " : " + text.getText()); 
					text.setText("");
				}
			}
		}
	}
}
