package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import service.ChatMybatisDAO;

@Controller
@ServerEndpoint("/weball")
public class WebSocketServerAll {
	private String name;
	private String content;
	private String workspace;
	
	private static Set<Session> clients = Collections.synchronizedSet(new HashSet<Session>());
	
	@OnMessage
	public void onMessage(String message, Session session) throws IOException {
		System.out.println(message);
		List<String> list = new ArrayList<String>();
		
		String[] msg = message.split(":");
		if(msg.length != 3) {
			System.out.println("입장 혹은 퇴장");
		} else {
			for(int i=0; i<msg.length; i++) {
				list.add(msg[i]);
			}
			
			name = list.get(0);
			content = list.get(1);
			workspace = list.get(2);
			
			ChatMybatisDAO chatDAO = new ChatMybatisDAO();
			chatDAO.insertChat(workspace, name, content);
		}
		
		synchronized (clients) {
			String id = null;
			String movemessage = null;
			if(msg.length != 3) {
				movemessage = message;
			} else {
				movemessage = message.substring(0, message.lastIndexOf(":"));
			}
			for (Session client : clients) {
				// 자기 자신한테는 보내지 않음
				if (!client.equals(session)) {
					if (id == null) {
						client.getBasicRemote().sendText(movemessage);
					}
				}
			}
		}
	}

	@OnOpen
	public void onOpen(Session session) {
		// Add session to the connected sessions set
		clients.add(session);
	}

	@OnClose
	public void onClose(Session session) {
		// Remove session from the connected sessions set
		clients.remove(session);
	}
}