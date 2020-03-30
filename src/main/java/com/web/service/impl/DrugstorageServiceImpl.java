package com.web.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.dao.DrugstorageMapper;
import com.web.entity.Drugs;
import com.web.entity.Drugstorage;
import com.web.service.DrugStorageService;
import com.web.service.DrugsService;

@Service
public class DrugstorageServiceImpl implements DrugStorageService {

	@Autowired
	private DrugstorageMapper drugstorageMapper;

	@Override
	public List<Drugstorage> getAllDrugStorage() {
	
		return drugstorageMapper.getAll();
	}

}
