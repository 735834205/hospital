package com.web.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.dao.PositionMapper;
import com.web.entity.Patient;
import com.web.entity.PatientExample;
import com.web.entity.Position;
import com.web.entity.PositionExample;
import com.web.service.PositionService;

@Service
public class PositionServiceImpl implements PositionService {

	@Autowired
	PositionMapper positionMapper;

	@Override
	public List<Position> queryPositionDept() {

		List<Position> list = positionMapper.queryPositionDept();

		List<Position> rList = new ArrayList<Position>();

		// 这里提出所有isdelete状态为1的用户，这些用户已经删除了
		for (Position p : list) {
			if (p.getIsdelete() == 0) {
				rList.add(p);
			}
		}

		return rList;

	}

	@Override
	public int deleteById(Integer postnumber) {

		return positionMapper.deleteById(postnumber);
	}

	@Override
	public int addPosition(Position p) {

		return positionMapper.insert(p);
	}

	@Override
	public Position queryPositionById(Integer poId) {

		return positionMapper.selectByPrimaryKey(poId);
	}

	@Override
	public Integer updateById(Position position) {

		int i = positionMapper.updateByPrimaryKeySelective(position);

		return i;
	}

	@Override
	public List<Position> getPosition() {
		
		PositionExample example = new PositionExample();
		
		List<Position> list = positionMapper.selectByExample(example);
		
		ArrayList<Position> arrayList = new ArrayList<>();
		
		for (Position a : list) {
			
			if(a.getIsdelete()==0){
				
				arrayList.add(a);
			}
			
		}
		
		return arrayList;
	}

}
