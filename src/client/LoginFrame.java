package client;

import java.awt.Button;
import java.awt.Color;
import java.awt.FlowLayout;
import java.awt.GridLayout;
import java.awt.Label;
import java.awt.TextField;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.ItemEvent;
import java.awt.event.ItemListener;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.net.InetAddress;
import java.net.Socket;

import javax.swing.JFrame;
import javax.swing.JPanel;

import user.bo.UserBO;

public class LoginFrame extends JFrame implements ActionListener, ItemListener {

	final static int ServerPort = 1234;
	private Label lb1, lb2, lb3, lb4;
	private Button Register, Login, Exit;
	private TextField tfUsername, tfPassword;
	public ClientFrame cf;
	public RegisterFrame rf;
	public static String username, password;

	public LoginFrame() {
		setTitle("Login Frame");
		setSize(500, 200);
		this.setLayout(new GridLayout(3, 1));
		setBackground(Color.lightGray);

		JPanel panels[] = new JPanel[3];
		panels[0] = new JPanel();
		panels[1] = new JPanel();
		panels[2] = new JPanel();

		panels[0].setLayout(new FlowLayout(FlowLayout.CENTER));
		panels[1].setLayout(new FlowLayout(FlowLayout.CENTER));
		panels[2].setLayout(new FlowLayout(FlowLayout.CENTER));

		lb2 = new Label("Username");
		tfUsername = new TextField(10);
		panels[1].add(lb2);
		panels[1].add(tfUsername);
		lb3 = new Label("Password");
		tfPassword = new TextField(10);
		tfPassword.setEchoChar('*');
		panels[1].add(lb3);
		panels[1].add(tfPassword);
		lb4 = new Label("Chat Application Login");
		panels[0].add(lb4);
		Register = new Button("Register");
		Login = new Button("Login");
		Exit = new Button("Exit");
		panels[2].add(Register);
		panels[2].add(Login);
		panels[2].add(Exit);

		this.add(panels[0]);
		this.add(panels[1]);
		this.add(panels[2]);
		
		setVisible(true);

		Register.addActionListener(this);
		Login.addActionListener(this);
		Exit.addActionListener(this);
		this.setDefaultCloseOperation(EXIT_ON_CLOSE);
	}

	public void actionPerformed(ActionEvent ae) {
		String str = ae.getActionCommand();
		switch (str) {
		case "Register":
			rf = new RegisterFrame();
			setVisible(false);
			break;
		case "Login":
			username = tfUsername.getText();
			tfUsername.setText("");
			password = tfPassword.getText();
			tfPassword.setText("");

			UserBO userBO = new UserBO();
			if (userBO.login(username, password) > 0) {
				tfUsername.setText("Already Login");
			} else {
				cf = new ClientFrame(this);
			}
			break;
		case "Exit":
			System.exit(0);
			break;
		default:
			break;
		}
	}

	public void itemStateChanged(ItemEvent ie) {

	}

	public static void main(String[] args) {
		LoginFrame login = new LoginFrame();
		login.setVisible(true);
	}
}
