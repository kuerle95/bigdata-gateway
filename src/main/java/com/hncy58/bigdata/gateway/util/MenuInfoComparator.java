package com.hncy58.bigdata.gateway.util;

import java.util.Comparator;

import com.hncy58.bigdata.gateway.domain.MenuInfo;

public class MenuInfoComparator implements Comparator<MenuInfo> {

	@Override
	public int compare(MenuInfo m1, MenuInfo m2) {

		int ret = 0;

		if (m1 == null || m2 == null)
			return ret;

		// same parent res
		if (m1.getPid() == m2.getPid()) {
			// 相同parent则按照排名排序
			ret = m1.getRank() - m2.getRank();
			// 如果排名相同则按照资源编码排序
			if (ret == 0) {
				ret = m1.getResName().compareTo(m2.getResName());
			}
		} else {
			// 如果不是同一个父资源，则按照编码进行排序
			ret = m1.getPid() - m2.getPid();
		}

		return ret;
	}

}
