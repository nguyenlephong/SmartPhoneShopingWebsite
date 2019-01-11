package admin.model;

public class FileImage {
	String name;
	String url ;
	String type;
	public FileImage(String name, String url, String type) {
		super();
		this.name = name;
		this.url = url;
		this.type = type;
	}
	@Override
	public String toString() {
		return "FileImage [name=" + name + ", url=" + url + ", type=" + type + "]";
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	
}
