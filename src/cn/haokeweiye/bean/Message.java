package cn.haokeweiye.bean;

import java.io.Serializable;

public class Message implements Serializable {

	/*`id` bigint(32) NOT NULL AUTO_INCREMENT COMMENT '联系人编号(主键)',
	  `title` varchar(16) DEFAULT NULL COMMENT '留言板标题',
	  `name` varchar(16) NOT NULL COMMENT '留言者姓名',
	  `telephone` varchar(16) DEFAULT NULL COMMENT '留言者电话',
	  `mail` varchar(16) DEFAULT NULL COMMENT '留言者邮箱',
	  `unit` varchar(16) DEFAULT NULL COMMENT '留言者单位',
	  `site` varchar(16) DEFAULT NULL COMMENT '留言者地址',
	  `content` varchar(16) DEFAULT NULL COMMENT '留言主要内容',
	  `category ` varchar(16) DEFAULT NULL COMMENT '留言附件',
	  */
	private int id;
	private String title;
	private String name;
	private String telephone;
	private String mail;
	private String unit;
	private String site;
	private String content;
	private String category;
	private String accessory;

	public int getid() {
		return id;
	}

	public void setid(int id) {
		this.id = id;
	}

	public String gettitle() {
		return title;
	}

	public void settitle(String title) {
		this.title = title;
	}

	public String getname() {
		return name;
	}

	public void setname(String name) {
		this.name = name;
	}

	public String gettelephone() {
		return telephone;
	}

	public void settelephone(String telephone) {
		this.telephone = telephone;
	}

	public String getmail() {
		return mail;
	}

	public void setmail(String mail) {
		this.mail = mail;
	}

	public String getunit() {
		return unit;
	}

	public void setunit(String unit) {
		this.unit = unit;
	}

	public String getsite() {
		return site;
	}

	public void setsite(String site) {
		this.site = site;
	}

	public String getcontent() {
		return content;
	}

	public void setcontent(String content) {
		this.content = content;
	}

	public String getcategory() {
		return category;
	}

	public void setcategory(String category) {
		this.category = category;
	}

	public String getaccessory() {
		return accessory;
	}

	public void setaccessory(String accessory) {
		this.accessory = accessory;
	}

	@Override
	public String toString() {
		return "Message{" +
				"id=" + id +
				", title='" + title + '\'' +
				", name='" + name + '\'' +
				", telephone='" + telephone + '\'' +
				", mail='" + mail + '\'' +
				", unit='" + unit + '\'' +
				", site='" + site + '\'' +
				", content='" + content + '\'' +
				", category='" + category + '\'' +
				", accessory='" + accessory + '\'' +
				'}';
	}

	@Override
	public boolean equals(Object o) {
		if (this == o) return true;
		if (o == null || getClass() != o.getClass()) return false;

		Message message = (Message) o;

		if (id != message.id) return false;
		if (title != null ? !title.equals(message.title) : message.title != null) return false;
		if (name != null ? !name.equals(message.name) : message.name != null) return false;
		if (telephone != null ? !telephone.equals(message.telephone) : message.telephone != null) return false;
		if (mail != null ? !mail.equals(message.mail) : message.mail != null) return false;
		if (unit != null ? !unit.equals(message.unit) : message.unit != null) return false;
		if (site != null ? !site.equals(message.site) : message.site != null) return false;
		if (content != null ? !content.equals(message.content) : message.content != null) return false;
		if (category != null ? !category.equals(message.category) : message.category != null) return false;
		return accessory != null ? accessory.equals(message.accessory) : message.accessory == null;
	}

	@Override
	public int hashCode() {
		int result = id;
		result = 31 * result + (title != null ? title.hashCode() : 0);
		result = 31 * result + (name != null ? name.hashCode() : 0);
		result = 31 * result + (telephone != null ? telephone.hashCode() : 0);
		result = 31 * result + (mail != null ? mail.hashCode() : 0);
		result = 31 * result + (unit != null ? unit.hashCode() : 0);
		result = 31 * result + (site != null ? site.hashCode() : 0);
		result = 31 * result + (content != null ? content.hashCode() : 0);
		result = 31 * result + (category != null ? category.hashCode() : 0);
		result = 31 * result + (accessory != null ? accessory.hashCode() : 0);
		return result;
	}
}
