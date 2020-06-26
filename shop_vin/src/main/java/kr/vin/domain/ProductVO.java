package kr.vin.domain;

import lombok.Data;

@Data
public class ProductVO {
   private Long bno;
   private String productCode;
   private String productName;
   private String productPrice;
   private String productDesc;
   private String productImg;
   private String productCount;
   private String productThumbImg;
   private String productKate;
   private String productOri;
   private String productColor;
   private String productSize;
}