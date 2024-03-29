package com.web.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.web.entity.Menu;
import com.web.entity.Position;
import com.web.entity.PositionExample;
import com.web.pojo.TreeObj;
import com.web.service.MenuService;
import com.web.service.PositionMenuService;
import com.web.service.PositionService;

@Controller
@RequestMapping("/position")
public class PositionController {

	@Resource
	PositionService positionService;

	@Resource
	MenuService menuService;

	@Resource
	PositionMenuService pms;

	@RequestMapping("/updatePositionById")
	@ResponseBody
	public Integer updatePositionById(Position position) {
		//直接调用service 
		return positionService.updateById(position);
	}
	
	@RequestMapping("/getPositionById")
	@ResponseBody
	public Position getPositionById(Integer poId) {
		
		// 查询当前id的position信息
		return positionService.queryPositionById(poId);
	}

	@RequestMapping("/addPosition")
	@ResponseBody
	public Integer addPosition(Position p) {

		// 这里这里二次封装p(是否删除 )
		p.setIsdelete(0);
		int i = positionService.addPosition(p);

		return i;
	}

	@RequestMapping("/deleteById")
	@ResponseBody
	public int deleteById(Integer postnumber) {

		return positionService.deleteById(postnumber);
	}

	/**
	 * 下拉列表的全查询
	 * 
	 * @return
	 */
	@RequestMapping("/getPosition")
	@ResponseBody
	public List<Position> getPosition() {

		List<Position> list = positionService.getPosition();
		
		return list;
	}

	/**
	 * 查询position表和department表
	 * 
	 * @return
	 */
	@RequestMapping("/queryPositionDept")
	@ResponseBody
	public List<Position> queryPositionDept() {
		
		List<Position> list = positionService.queryPositionDept();

		return list;
	}

	/**
	 * 跳转到分配权限页面
	 * 
	 * @param postNumber
	 * @return
	 */
	@RequestMapping(value = "/sendAuthority")
	@ResponseBody
	public List<TreeObj> sendAuthority(Integer postNumber) {

		// 查询所有的菜单
		List<Menu> allMenu = menuService.queryByParentId(null);

		// 根据岗位id查询权限菜单
		List<Integer> ownerList = pms.selectMenuByPoId(postNumber);

		return merge(allMenu, ownerList);
	}

	/**
	 * 匹配权限
	 * 
	 * @param allMenu
	 * @param ownerList
	 * @return
	 */
	public List<TreeObj> merge(List<Menu> allMenu, List<Integer> ownerList) {
		// 实例化集合对象
		List<TreeObj> list = new ArrayList<TreeObj>();

		if (allMenu != null) {
			for (Menu m : allMenu) {

				TreeObj tree = new TreeObj();
				tree.setId(m.getMenuid());
				tree.setName(m.getMenuname());

				// 设置是否选中
				tree.setChecked(hasAuthority(m.getMenuid(), ownerList));

				// 递归子菜单
				tree.setChildren(merge(m.getChildMenu(), ownerList));

				tree.setOpen(true);// true；展开 false:折叠
				tree.setParentTId(m.getParentid());
				tree.setUrl(m.getMenuurl());

				list.add(tree);// 把对象添加到集合中
			}
		}
		return list;
	}

	/**
	 * 判断是否有权限
	 * 
	 * @return
	 */
	public boolean hasAuthority(Integer menuId, List<Integer> ownerList) {

		if (ownerList != null) {
			for (Integer b : ownerList) {
				if (menuId == b) {
					return true;
				}
			}
		}
		return false;
	}
	
	/**
	 * 保存权限
	 * Integer poId:岗位id
	 * Integer[] menuIds：菜单集合数组
	 * @return
	 */
	@RequestMapping(value="/saveAuthority")
	@ResponseBody
	public int saveAuthority(Integer poId,Integer[] menuIds){
		
		return pms.saveAuthority(poId, menuIds);
	}

}
