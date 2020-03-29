package kr.or.ddit.vo;

public class AdminVO {
	private String admin_id;
	private String admin_pass;
	private String admin_name;
	private String admin_hp;
	private String admin_mail;
	private String admin_del;
	
	
	public AdminVO() { 	}
	
	public AdminVO(String admin_id, String admin_pass, String admin_name,
			String admin_hp, String admin_mail, String admin_del) {
		super();
		this.admin_id = admin_id;
		this.admin_pass = admin_pass;
		this.admin_name = admin_name;
		this.admin_hp = admin_hp;
		this.admin_mail = admin_mail;
		this.admin_del = admin_del;
	}
	
	public String getAdmin_id() {
		return admin_id;
	}
	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}
	public String getAdmin_pass() {
		return admin_pass;
	}
	public void setAdmin_pass(String admin_pass) {
		this.admin_pass = admin_pass;
	}
	public String getAdmin_name() {
		return admin_name;
	}
	public void setAdmin_name(String admin_name) {
		this.admin_name = admin_name;
	}
	public String getAdmin_hp() {
		return admin_hp;
	}
	public void setAdmin_hp(String admin_hp) {
		this.admin_hp = admin_hp;
	}
	public String getAdmin_mail() {
		return admin_mail;
	}
	public void setAdmin_mail(String admin_mail) {
		this.admin_mail = admin_mail;
	}
	public String getAdmin_del() {
		return admin_del;
	}
	public void setAdmin_del(String admin_del) {
		this.admin_del = admin_del;
	}
	
	
}
