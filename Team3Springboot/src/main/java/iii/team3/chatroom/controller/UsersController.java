package iii.team3.chatroom.controller;

import iii.team3.chatroom.storage.UserStorage;


import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;



import java.util.Set;

@Controller
@CrossOrigin
@SessionAttributes(names= {"loginBean"})
public class UsersController {
	
	@GetMapping("/gotochat")
	public String gotoChat() {
	
		
		return "chatroom/index";
	}
	
    @GetMapping("/registration/{userName}")
    @ResponseBody
    public ResponseEntity<Void> register(@PathVariable String userName) {
        System.out.println("handling register user request: " + userName);
        
        try {
        	UserStorage.getInstance().clearUser(userName);
            UserStorage.getInstance().setUser(userName);
        } catch (Exception e) {
            return ResponseEntity.badRequest().build();
        }
        return ResponseEntity.ok().build();
    }
    
    @GetMapping("/disconnect/{userName}")
    public void clearConn(@PathVariable String userName) {
    	System.out.println("clear the connect of:"+userName);
    	
    	try {
			UserStorage.getInstance().clearUser(userName);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("error has happened"+e.getMessage());
		}
    }
    
    
    
    @GetMapping("/fetchAllUsers")
    @ResponseBody
    public Set<String> fetchAll() {
        return UserStorage.getInstance().getUsers();
    }
}
