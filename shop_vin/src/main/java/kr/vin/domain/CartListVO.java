package kr.vin.domain;

import java.util.Date;

import lombok.Data;

@Data
public class CartListVO {

   private int cartNum;
   private String userId;
   private int bno;
   private int cartStock;
   private Date addDate;

   private int num;
   private String gdsName;
   private int gdsPrice;
   private String gdsThumbImg;
}