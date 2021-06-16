package core.test1;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class App1 {
	public static void main(String[] args) {
		System.out.println("프로그램 실행1");
		
		
		String path = "core/test1/core-text1.xml";
		ApplicationContext context = new ClassPathXmlApplicationContext(path);
		
		Object o = context.getBean("desk");
		System.out.println(o);
		
		Object o2 = context.getBean("leg");
		System.out.println(o2);
		
		Object o3 = context.getBean("chair");
		System.out.println(o3);
	}
}

