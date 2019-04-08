package cn.haokeweiye.utils;

import com.mchange.v2.c3p0.ComboPooledDataSource;

import javax.sql.DataSource;

public class C3p0Utils {

	private static DataSource ds = new ComboPooledDataSource();
	public static DataSource getDataSource() {
		// TODO Auto-generated method stub
		return ds;
	}
}
