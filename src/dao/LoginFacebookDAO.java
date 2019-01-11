//package dao;
//
//import com.restfb.DefaultFacebookClient;
//import com.restfb.FacebookClient;
//import com.restfb.types.User;
//
//public class LoginFacebookDAO {
//	 public static void main(String[] args) {
//         
//	        // Tạo đối tượng FacebookClient
//	        FacebookClient facebookClient= new DefaultFacebookClient(Constants.MY_ACCESS_TOKEN);
//	         
//	        // User là một class có sẵn của Restfb mô tả các thông tin của User
//	        // Trong tình huống này chúng ta biết trước dữ liệu trả về là User.
//	        User user = facebookClient.fetchObject("me", User.class);
//	         
//	        System.out.println("User="+ user);
//	        System.out.println("UserName= "+ user.getUsername());
//	        System.out.println("Birthday= "+ user.getBirthday());
//	 
//	    }
//}
