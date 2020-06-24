package kr.vin.domain;

import lombok.Data;

@Data
public class ProductVO {
	   private Long bno;
	   private String productName;
	   private String productPrice; 
	   private String productDesc;
	   private String productImg;
	   private String productCount;
	   private String productThumbImg;
	   private String productKate;
		/* private String productCode; */
	}

