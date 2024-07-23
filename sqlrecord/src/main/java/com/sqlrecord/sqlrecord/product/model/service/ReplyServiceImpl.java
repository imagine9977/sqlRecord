package com.sqlrecord.sqlrecord.product.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.sqlrecord.sqlrecord.product.model.vo.Product;
import com.sqlrecord.sqlrecord.reply.model.dao.ReplyMapper;
import com.sqlrecord.sqlrecord.reply.model.vo.ChReply;
import com.sqlrecord.sqlrecord.reply.model.vo.Reply;
import com.sqlrecord.sqlrecord.reply.model.vo.ReplyFile;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ReplyServiceImpl implements ReplyService {

	private final ReplyMapper replyMapper;	
	
	@Override
	public List<Reply> getReplyList(int productNo) {
		return replyMapper.getReplyList(productNo);
	}

	@Override
	public Reply getReply(int replyNo) {
		return replyMapper.getReply(replyNo);
	}

	@Override
	public int replyCount(int productNo) {
		return replyMapper.replyCount(productNo);
	}

	@Override
	public int insReply(Reply reply) {
		return replyMapper.insReply(reply);
	}

	@Override
	public int changeReply(Reply reply) {
		return replyMapper.changeReply(reply);
	}

	@Override
	public int delReply(Reply replyNo) {
		return replyMapper.delReply(replyNo);
	}

	@Override
	public List<Map<String, Object>> getReplyStarAll(int productNo) {
		return replyMapper.getReplyStarAll(productNo);
	}

	@Override
	public float avgStar(int productNo) {
		return replyMapper.avgStar(productNo);
	}

	@Override
	public int chInsReply(ChReply chReply) {
		return replyMapper.chInsReply(chReply);
	}

	@Override
	public List<ChReply> getChReplyList() {
		return replyMapper.getChReplyList();
	}

	@Override
	public int changeChReply(ChReply chReply) {
		return replyMapper.changeChReply(chReply);
	}

	@Override
	public int delChReply(ChReply chReplyNo) {
		return replyMapper.delChReply(chReplyNo);
	}

	@Override
	public int chReplyCount() {
		return replyMapper.chReplyCount();
	}

	@Override
	public int insFile(ReplyFile replyFile) {
		return replyMapper.insFile(replyFile);
	}

	@Override
	public List<ReplyFile> getImgList() {
		return replyMapper.getImgList();
	}

	@Override
	public int delFile(Reply replyNo) {
		return replyMapper.delFile(replyNo);
	}


}
