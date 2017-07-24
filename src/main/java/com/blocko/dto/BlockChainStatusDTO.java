package com.blocko.dto;

import java.util.Arrays;
import java.util.Date;

public class BlockChainStatusDTO {
	String blockId;
	String parentId;
	int height;
	Date time;
	String[] txIds;
	public BlockChainStatusDTO(){}
	
	public BlockChainStatusDTO(String blockId, String parentId, int height,
			Date time) {
		super();
		this.blockId = blockId;
		this.parentId = parentId;
		this.height = height;
		this.time = time;
	}

	public BlockChainStatusDTO(String blockId, String parentId, int height,
			Date time, String[] txIds) {
		super();
		this.blockId = blockId;
		this.parentId = parentId;
		this.height = height;
		this.time = time;
		this.txIds = txIds;
	}
	public String getBlockId() {
		return blockId;
	}
	public void setBlockId(String blockId) {
		this.blockId = blockId;
	}
	public String getParentId() {
		return parentId;
	}
	public void setParentId(String parentId) {
		this.parentId = parentId;
	}
	public int getHeight() {
		return height;
	}
	public void setHeight(int height) {
		this.height = height;
	}
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}
	public String[] getTxIds() {
		return txIds;
	}
	public void setTxIds(String[] txIds) {
		this.txIds = txIds;
	}
	
	
}
