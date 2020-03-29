package kr.or.ddit.vo;

public class BoardFileVO {
	private String file_no;
	private String bo_no;
	private String file_name;
	private String file_save_name;
	private String file_cont_type;
	private String file_size;
	private String file_del;
	private String file_reg_date;
	private String file_down_hit;
	
	
	
	public BoardFileVO(String file_no, String bo_no, String file_name,
			String file_save_name, String file_cont_type, String file_size,
			String file_del, String file_reg_date, String file_down_hit) {
		super();
		this.file_no = file_no;
		this.bo_no = bo_no;
		this.file_name = file_name;
		this.file_save_name = file_save_name;
		this.file_cont_type = file_cont_type;
		this.file_size = file_size;
		this.file_del = file_del;
		this.file_reg_date = file_reg_date;
		this.file_down_hit = file_down_hit;
	}
	public BoardFileVO() {
	}
	public String getFile_no() {
		return file_no;
	}
	public void setFile_no(String file_no) {
		this.file_no = file_no;
	}
	public String getBo_no() {
		return bo_no;
	}
	public void setBo_no(String bo_no) {
		this.bo_no = bo_no;
	}
	public String getFile_name() {
		return file_name;
	}
	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}
	public String getFile_save_name() {
		return file_save_name;
	}
	public void setFile_save_name(String file_save_name) {
		this.file_save_name = file_save_name;
	}
	public String getFile_cont_type() {
		return file_cont_type;
	}
	public void setFile_cont_type(String file_cont_type) {
		this.file_cont_type = file_cont_type;
	}
	public String getFile_size() {
		return file_size;
	}
	public void setFile_size(String file_size) {
		this.file_size = file_size;
	}
	public String getFile_del() {
		return file_del;
	}
	public void setFile_del(String file_del) {
		this.file_del = file_del;
	}
	public String getFile_reg_date() {
		return file_reg_date;
	}
	public void setFile_reg_date(String file_reg_date) {
		this.file_reg_date = file_reg_date;
	}
	public String getFile_down_hit() {
		return file_down_hit;
	}
	public void setFile_down_hit(String file_down_hit) {
		this.file_down_hit = file_down_hit;
	}
	
	
	
	
}
