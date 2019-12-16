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
import util.DefineUtil;
import util.StringUtil;

public class RegisterFrame extends JFrame implements ActionListener, ItemListener {

	public Label lb1, lb2, lb3, lb4, lb5;
	public Button Register, Login, Exit;
	public TextField tfUsername, tfPassword, tfConfirm;
	public LoginFrame c1;
	public static String username, password, confirm;

	public RegisterFrame() {
		setTitle("Register Frame");
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
		lb4 = new Label("Confirm Password");
		tfConfirm = new TextField(10);
		tfConfirm.setEchoChar('*');
		panels[1].add(lb4);
		panels[1].add(tfConfirm);
		lb5 = new Label("Chat Application Register");
		panels[0].add(lb5);
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
		case "Login":
			c1 = new LoginFrame();
			setVisible(false);
			break;
		case "Register":
			username = tfUsername.getText();
			password = tfPassword.getText();
			confirm = tfConfirm.getText();
			if(!password.equals(confirm)) {
				tfUsername.setText("Confirm Password Unmatched");
			} else {
				tfUsername.setText("");
				tfPassword.setText("");
				tfConfirm.setText("");
				UserBO userBO = new UserBO();
				if (userBO.register(username, password) == DefineUtil.SUCCESS) {
					tfUsername.setText("Successful Registration");
				} else {
					tfUsername.setText("Duplicated Username");
				}
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
