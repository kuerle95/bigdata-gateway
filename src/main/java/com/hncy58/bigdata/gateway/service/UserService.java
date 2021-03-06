package com.hncy58.bigdata.gateway.service;

import java.util.List;

import com.github.pagehelper.Page;
import com.hncy58.bigdata.gateway.domain.UserDomain;
import com.hncy58.bigdata.gateway.exception.RestfulJsonException;
import com.hncy58.bigdata.gateway.model.User;

/**
 * 用户服务
 * @author tdz
 * @company hncy58 长银五八
 * @website http://www.hncy58.com
 * @version 1.0
 * @date 2018年8月25日 下午5:12:24
 */
public interface UserService {

	User selectByPrimaryKey(int id);

	List<User> selectAll();

	List<User> selectUserByRole(List<String> roleIds);

	Page<User> selectAll(int pageNo, int pageSize, UserDomain queryUser);

	int delete(List<String> ids);

	int insert(User user);

	int updateByPrimaryKeySelective(User user, List<String> allRoleIds);
	
	int updateByToken(User user);

	User selectByUserCode(String userCode);

	int linkRole(String userId, List<String> roleIds);

	int unLinkRole(String userId, List<String> roleIds) throws RestfulJsonException;

	List<User> selectUserByRes(List<String> resIds);

	int logout(int userId);

	int updatePWDByToken(Integer id, String oldPassword, String newPassword);

	boolean userExists(String userCode);
	
}
