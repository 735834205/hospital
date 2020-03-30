package com.web.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.dao.DrugsMapper;
import com.web.entity.Drugs;
import com.web.entity.DrugsExample;

import com.web.service.DrugsService;

@Service
public class DrugsServiceImpl implements DrugsService {

	@Autowired
	DrugsMapper drugsMapper;

	@Override
	public List<Drugs> getDrugs() {

		return drugsMapper.selectByExample(new DrugsExample());
	}

	@Override
	public List<Drugs> getAll() {

		

		return drugsMapper.getAll();
	}

	@Override
	public Drugs getDrugByid(Integer drugsid) {

		return drugsMapper.getDrugByid(drugsid);
	}

	@Override
	public int updateDrugs(Drugs drugs) {

		return drugsMapper.updateByPrimaryKeySelective(drugs);
	}

	@Override
	public int insertdrugs(Drugs drugs) {

		return drugsMapper.insert(drugs);
	}

	@Override
	public int delsup(Integer drugsid) {

		return drugsMapper.delsup(drugsid);
	}

}
