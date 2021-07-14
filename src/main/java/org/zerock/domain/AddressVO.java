package org.zerock.domain;

import lombok.Data;

@Data
public class AddressVO {
	
	private Integer postcode;
	private String address;
	private String detailAddress;
	private String extraAddress;
	private double lat;
	private double lag;
}
