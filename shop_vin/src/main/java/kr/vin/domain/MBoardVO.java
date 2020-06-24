package kr.vin.domain;

import java.util.Date;

import lombok.Data;

@Data
public class MBoardVO {
	private Long bid;
	private Long cate_cd;
	private String title;
	private String content;
	private String tag;
	private Long view_cnt;
	private String reg_id;
	private Date reg_dt;
	private Date edit_dt;

}
