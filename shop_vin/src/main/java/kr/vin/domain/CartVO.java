package kr.vin.domain;

import java.util.Date;

import lombok.Data;

@Data
public class CartVO {

   private int cartNum;
   private String userId;
   private int bno;
   private int cartStock;
   private Date addDate;

}