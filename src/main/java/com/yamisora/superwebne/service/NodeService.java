package com.yamisora.superwebne.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yamisora.superwebne.repository.NodeRepository;
import com.yamisora.superwebne.repository.ParkingRepository;
import com.yamisora.superwebne.repository.AreaNodeRepository;

import com.yamisora.superwebne.model.Node;
import com.yamisora.superwebne.model.Parking;
import com.yamisora.superwebne.model.AreaNode;

import java.util.*;
import java.util.stream.Collectors;

@Service
public class NodeService {
    @Autowired
    private NodeRepository nodeRepository;

    @Autowired
    private AreaNodeRepository areaNodeRepository;

    @Autowired
    private ParkingRepository parkingRepository;

    
}

