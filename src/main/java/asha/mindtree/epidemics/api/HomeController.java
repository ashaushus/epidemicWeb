package asha.mindtree.epidemics.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.net.Inet4Address;
import java.net.UnknownHostException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@RestController
public class HomeController {

    @Autowired
    Environment environment;

    @RequestMapping("/")
    public String hello() throws UnknownHostException{
        String datePattern = "MM/dd/yyyy HH;mm:ss";
        DateTimeFormatter df = DateTimeFormatter.ofPattern(datePattern);
        LocalDateTime now = LocalDateTime.now();

        String hostName = Inet4Address.getLocalHost().getHostName();
        String port = environment.getProperty("local.server.port");

        return "Do you speak whale :" + df.format(now) + " hostname : " + hostName + " port : " + port;
    }

    @PostMapping("/hello")
    public String sayHello(@RequestParam("name") String name, Model model) {
        model.addAttribute("name", name);
        return "hello";
    }
}
