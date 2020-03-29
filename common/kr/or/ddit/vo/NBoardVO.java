package kr.or.ddit.vo;

import java.util.List;

public class NBoardVO {
	private String bo_no;
	private String bo_title;
	private String bo_writer;
	private String bo_nick;
	private String bo_pass;
	private String bo_ip;
	private String bo_bo_cont;
	private String bo_hit;
	private String bo_reg_date;
	private String bo_del;
	private String rnum;
	private List<BoardFileVO> items;
	
	
	
	public List<BoardFileVO> getItems() {
		return items;
	}

	public void setItems(List<BoardFileVO> items) {
		this.items = items;
	}

	public String getRnum() {
		return rnum;
	}

	public void setRnum(String rnum) {
		this.rnum = rnum;
	}

	public NBoardVO() {}
	
	public NBoardVO(String bo_no, String bo_title, String bo_writer,
			String bo_nick, String bo_pass, String bo_ip, String bo_bo_cont,
			String bo_hit, String bo_reg_date, String bo_del, String rnum) {
		super();
		this.bo_no = bo_no;
		this.bo_title = bo_title;
		this.bo_writer = bo_writer;
		this.bo_nick = bo_nick;
		this.bo_pass = bo_pass;
		this.bo_ip = bo_ip;
		this.bo_bo_cont = bo_bo_cont;
		this.bo_hit = bo_hit;
		this.bo_reg_date = bo_reg_date;
		this.bo_del = bo_del;
		this.rnum = rnum;
	}

	public String getBo_no() {
		return bo_no;
	}
	public void setBo_no(String bo_no) {
		this.bo_no = bo_no;
	}
	public String getBo_title() {
		return bo_title;
	}
	public void setBo_title(String bo_title) {
		this.bo_title = bo_title;
	}
	public String getBo_writer() {
		return bo_writer;
	}
	public void setBo_writer(String bo_writer) {
		this.bo_writer = bo_writer;
	}
	public String getBo_nick() {
		return bo_nick;
	}
	public void setBo_nick(String bo_nick) {
		this.bo_nick = bo_nick;
	}
	public String getBo_pass() {
		return bo_pass;
	}
	public void setBo_pass(String bo_pass) {
		this.bo_pass = bo_pass;
	}
	public String getBo_ip() {
		return bo_ip;
	}
	public void setBo_ip(String bo_ip) {
		this.bo_ip = bo_ip;
	}
	public String getBo_bo_cont() {
		return bo_bo_cont;
	}
	public void setBo_bo_cont(String bo_bo_cont) {
		this.bo_bo_cont = bo_bo_cont;
	}
	public String getBo_hit() {
		return bo_hit;
	}
	public void setBo_hit(String bo_hit) {
		this.bo_hit = bo_hit;
	}
	public String getBo_reg_date() {
		return bo_reg_date;
	}
	public void setBo_reg_date(String bo_reg_date) {
		this.bo_reg_date = bo_reg_date;
	}
	public String getBo_del() {
		return bo_del;
	}
	public void setBo_del(String bo_del) {
		this.bo_del = bo_del;
	}
	
	
}
