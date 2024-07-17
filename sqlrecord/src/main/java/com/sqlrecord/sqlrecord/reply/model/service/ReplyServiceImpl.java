package com.sqlrecord.sqlrecord.reply.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.sqlrecord.sqlrecord.reply.model.dao.ReplyMapper;
import com.sqlrecord.sqlrecord.reply.model.vo.ChReply;
import com.sqlrecord.sqlrecord.reply.model.vo.Reply;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ReplyServiceImpl implements ReplyService {

	private final ReplyMapper replyMapper;	
	
	@Override
	public List<Reply> getReplyList() {
		return replyMapper.getReplyList();
	}

	@Override
	public Reply getReply(int replyNo) {
		return replyMapper.getReply(replyNo);
	}

	@Override
	public int replyCount() {
		return replyMapper.replyCount();
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
	public List<Map<String, Object>> getReplyStarAll() {
		return replyMapper.getReplyStarAll();
	}

	@Override
	public float avgStar() {
		return replyMapper.avgStar();
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

}
