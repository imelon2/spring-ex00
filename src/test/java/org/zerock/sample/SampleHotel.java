package org.zerock.sample;

import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.ToString;

@Component
@ToString
@Getter
public class SampleHotel {
	private Chef chef;
	
	
	// Component가 붙으면 자동으로 bean이 붙음
	public SampleHotel(Chef chef) {
		this.chef = chef;
	}
}
