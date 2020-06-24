package kr.vin.controller;

import static org.junit.Assert.fail;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.jupiter.api.Test;

import lombok.extern.log4j.Log4j;

@Log4j
public class JDBCTests {
	static {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	/*
	 * - 어노테이션 : 아래 메소드는 테스트 메소드이다. - 스프링 프레임워크와 개발자 사이의 암호가 어노테이션이다.
	 */
	@Test
	public void testConnection() {
		try {
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "shop2", "1234");
			log.info(con);
		} catch (Exception e) {
			fail(e.getMessage());
		}
	}
}
