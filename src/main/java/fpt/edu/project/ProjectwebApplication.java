package fpt.edu.project;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableAsync;

@SpringBootApplication
@EnableAsync
public class ProjectwebApplication {
	public static void main(String[] args) {
		SpringApplication.run(ProjectwebApplication.class, args);
	}

}
