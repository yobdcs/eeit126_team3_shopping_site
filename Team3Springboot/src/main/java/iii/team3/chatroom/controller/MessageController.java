package iii.team3.chatroom.controller;


import iii.team3.chatroom.model.MessageModel;
import iii.team3.chatroom.service.chatRoomService;
import iii.team3.chatroom.storage.UserStorage;
import iii.team3.member.model.MemberBean;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

@Controller
public class MessageController {

    @Autowired
    private SimpMessagingTemplate simpMessagingTemplate;
    
    @Autowired
	private  chatRoomService chatservice;
	private String chatTime;
	
    @MessageMapping("/chat/{to}")
    @ResponseBody
    public void sendMessage(@DestinationVariable String to, MessageModel message) {
        System.out.println("handling send message: " + message + " to: " + to);
        boolean isExists = UserStorage.getInstance().getUsers().contains(to);
        
        if (isExists) {
        	//將聊天訊息傳回聊天室
        	simpMessagingTemplate.convertAndSend("/topic/messages/" + to, message);
        	
        	//寫入聊天訊息到資料庫
            var date= new Date();
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            chatTime = sdf.format(date);
            chatservice.insertChatMsg(new MessageModel(message.getMessage(),message.getFromLogin(),to,chatTime));
        }
    }
    
    //導向紀錄
    @GetMapping("/gotochathistory")
    public String selectChatHistory(@SessionAttribute(name="loginBean")MemberBean memberBean,Model m) {
    	
    	var mb = chatservice.queryHistory(memberBean.getAccount());
    	m.addAttribute("thisguyHistory", mb);
    	 
    	
    	return "chatroom/chathistory";
    }
    //查詢聊天紀錄
    @GetMapping("/gotochathistory2")
    @ResponseBody
    public List <MessageModel> selectChatHistory2(@SessionAttribute(name="loginBean")MemberBean memberBean,Model m) {
    	
    	System.out.println(memberBean.getAccount());
    	var mb2 = chatservice.queryHistory(memberBean.getAccount());
    	
    	for(var mb3 : mb2)
    		mb3.setImage(memberBean.getMemberPhoto());
    	
    	return mb2;
    }
    
    
}
