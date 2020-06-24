package kr.vin.mapper;

import org.apache.ibatis.annotations.Select;

public interface TimeMapper {
	
	@Select("select sysdate from dual")
	public String getTime();
// 인터페이스는 이종간 기기의 연결을 위한 부분.
// 규격을 제한.
// 인터페이스는 메소드의 몸체는 없다.{}
// 인터페이스를 가져다 쓰는 부분에서 몸체를 구현.
// 스프링 프레임워크는 인터페이스를 임플리먼트 받는 클래스를 생성하고,
// 몸체를 구현하는 번거로운 작업을 대신 자동 처리.
	
	public String getTime2();

	
}
