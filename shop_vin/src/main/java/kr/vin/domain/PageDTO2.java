package kr.vin.domain;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class PageDTO2 {
   private int startPage; // 페이징 시작
   private int endPage; // 페이징 끝
   private boolean prev, next;
   private int total2; // 총 게시물수
   private Criteria2 cri2; // 현재페이지와 페이지당 게시물수

   public PageDTO2(Criteria2 cri2, int total2) {
      this.cri2 = cri2;
      this.total2 = total2;

      this.endPage = (int) (Math.ceil(cri2.getPageNum() / 10.0)) * 10;
      // 1페이지라고 가정하면 endPage는 10
      this.startPage = this.endPage - 9;// 1
      int realEnd = (int) (Math.ceil((total2 * 1.0) / cri2.getAmount()));
      // 총게시물이 20개라고 가정하면 realEnd=2
      // 페이지당 보여줄 게시물 수는 10개로 가정.

      if (realEnd < this.endPage) {
         this.endPage = realEnd;
      }
      this.prev = this.startPage > 1;
      this.next = this.endPage < realEnd;
   }

}