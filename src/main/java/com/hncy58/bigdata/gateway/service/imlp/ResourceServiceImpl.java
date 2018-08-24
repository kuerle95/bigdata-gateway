package com.hncy58.bigdata.gateway.service.imlp;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.hncy58.bigdata.gateway.domain.ResourceDomain;
import com.hncy58.bigdata.gateway.mapper.ResourceMapper;
import com.hncy58.bigdata.gateway.model.Resource;
import com.hncy58.bigdata.gateway.service.ResourceService;

@Service
public class ResourceServiceImpl implements ResourceService {

	Logger log = LoggerFactory.getLogger(ResourceServiceImpl.class);

	@Autowired
	private ResourceMapper resourceMapper;

	@Override
	public Resource selectByPrimaryKey(int id) {
		return resourceMapper.selectByPrimaryKey(id);
	}

	@Override
	public List<Resource> selectAllByType(List<String> resTypes) {
		return resourceMapper.selectAllByType(resTypes);
	}

	@Override
	public int deleteByPrimaryKey(int id) {
		return resourceMapper.deleteByPrimaryKey(id);
	}

	@Override
	public int insert(Resource resource) {
		return resourceMapper.insert(resource);
	}

	@Override
	public int updateByPrimaryKeySelective(Resource resource) {
		return resourceMapper.updateByPrimaryKey(resource);
	}

	/*
	 * 这个方法中用到了我们开头配置依赖的分页插件pagehelper
	 * 很简单，只需要在service层传入参数，然后将参数传递给一个插件的一个静态方法即可； pageNum 开始页数 pageSize
	 * 每页显示的数据条数
	 */
	@Override
	public List<Resource> selectAll(int pageNum, int pageSize) {
		Page<Resource> page = PageHelper.startPage(pageNum, pageSize, true);
		log.debug("total Resource : {}", page.getTotal());
		log.debug("ret Resources : {}", page.getResult());
		return resourceMapper.selectAll();
	}

	@Override
	public Page<Resource> select(int pageNo, int pageSize, ResourceDomain queryRes) {
		Page<Resource> page = PageHelper.startPage(pageNo, pageSize, true);
		resourceMapper.select(queryRes);
		log.debug("total user : {}", page.getTotal());
		log.debug("ret users : {}", page.getResult());

		Page<Resource> pageRet = new Page<>(pageNo, pageSize);
		pageRet.setTotal(page.getTotal());
		pageRet.addAll(page.getResult());

		return pageRet;
	}

	@Override
	public List<Resource> getResourceByUser(int userId) {
		return resourceMapper.getResourceByUser(userId);
	}

	@Transactional(rollbackFor = { Exception.class })
	@Override
	public int delete(List<String> ids) {
		int num = resourceMapper.delete(ids);
		if (num > 0) {
			resourceMapper.unlinkRole(ids);
		}
		return num;
	}

	@Override
	public List<Resource> selectAll() {
		return resourceMapper.selectAll();
	}

}
