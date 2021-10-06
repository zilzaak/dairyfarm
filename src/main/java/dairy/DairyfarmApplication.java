package dairy;

import java.util.TimeZone;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;

@SpringBootApplication
@EnableScheduling
public class DairyfarmApplication {
	
	public static void main(String[] args) {
		TimeZone.setDefault(TimeZone.getTimeZone("Asia/Dhaka"));
		SpringApplication.run(DairyfarmApplication.class, args);
	}

}
