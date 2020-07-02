package kr.vin.domain;

import org.springframework.web.util.UriComponentsBuilder;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Criteria2 {
   private int pageNum; // 현재 페이지 번호.
   private int amount; // 페이지당 게시물수
   private String keyword; // 검색어
   private String type; // 검색 타입.제목T, 내용C, 작성자W

   public Criteria2() {
      this(1, 9); // 아래쪽 전달값 2개 생성자 호출.
   }

   public Criteria2(int pageNum, int amount) {
      this.pageNum = pageNum;
      this.amount = amount;
   }

   public String[] getTypeArr() {
      return type == null ? new String[] {} : type.split("");
   }

   public String getListLink() {
      UriComponentsBuilder builder = UriComponentsBuilder.fromPath("").queryParam("pageNum", this.pageNum)
            .queryParam("amount", this.getAmount()).queryParam("type", this.getType())
            .queryParam("keyword", this.getKeyword());
      return builder.toUriString();

   }
}