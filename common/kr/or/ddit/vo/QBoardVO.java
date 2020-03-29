package kr.or.ddit.vo;

public class QBoardVO {
	private String bo_no;
	private String bo_title;
	private String bo_writer;
	private String bo_nick;
	private String bo_pass;
	private String bo_ip;
	private String bo_cont;
	private String bo_hit;
	private String bo_reg_date;
	private String bo_del;
	private String rnum;
	private String bo_group;
	private String bo_seq;
	private String bo_depth;
	
	public String getBo_group() {
		return bo_group;
	}
	public void setBo_group(String bo_group) {
		this.bo_group = bo_group;
	}
	public String getBo_seq() {
		return bo_seq;
	}
	public void setBo_seq(String bo_seq) {
		this.bo_seq = bo_seq;
	}
	public String getBo_depth() {
		return bo_depth;
	}
	public void setBo_depth(String bo_depth) {
		this.bo_depth = bo_depth;
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
	public String getBo_cont() {
		return bo_cont;
	}
	public void setBo_cont(String bo_cont) {
		this.bo_cont = bo_cont;
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
	public String getRnum() {
		return rnum;
	}
	public void setRnum(String rnum) {
		this.rnum = rnum;
	}
	public QBoardVO() {
	}
	public QBoardVO(String bo_no, String bo_title, String bo_writer,
			String bo_nick, String bo_pass, String bo_ip, String bo_cont,
			String bo_hit, String bo_reg_date, String bo_del, String rnum) {
		super();
		this.bo_no = bo_no;
		this.bo_title = bo_title;
		this.bo_writer = bo_writer;
		this.bo_nick = bo_nick;
		this.bo_pass = bo_pass;
		this.bo_ip = bo_ip;
		this.bo_cont = bo_cont;
		this.bo_hit = bo_hit;
		this.bo_reg_date = bo_reg_date;
		this.bo_del = bo_del;
		this.rnum = rnum;
	}
	
	
	
}
