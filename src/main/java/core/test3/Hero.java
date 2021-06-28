package core.test3;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

@Component
public class Hero {

	private Sword sword;
	
	@Autowired
	@Qualifier("WaterSword") //특정빈을 받겠다고 명시
	public void serSword(Sword sword) {
		this.sword = sword;
	}

	public Sword getSword() {
		
		return sword;
	}
}
