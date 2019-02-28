package org.bigjava.bean;

public class User<T> {

	//用户属性类
	private int id; // id
	private String username; //用户名
	private String password; //密码
	private int age;
    private String gender;//性别
    private String love;//爱好
    private String riqi;//出生日期
    private String neirong;//地址
    private String guanli;//管理
	public User() {
		
	}
	
	public User(int id, String username, String password,String gender,String love,String riqi,String neirong,String guanli) {
		super();
		this.id = id;
		this.username = username;
		this.password = password;
		this.gender=gender;
		this.love=love;
		this.riqi=riqi;
		this.neirong=neirong;
		this.guanli=guanli;
	}	
	// setter & getter����
	public String getGuanli(){
		return guanli;
	}
	public void setGuanli(String guanli){
		this.guanli=guanli;
	}
	public String getRiqi(){
		return riqi;
	}
	public void setRiqi(String riqi){
		this.riqi=riqi;
	}
	public String getLove(){
		return love;
	}
	public void setLove(String love){
		this.love=love;
	}
	public String getGender(){
		return gender;
	}
	public void setGender(String gender){
		this.gender=gender;
	}
	public String getNeirong(){
		return neirong;
	}
	public void setNeirong(String neirong){
		this.neirong=neirong;
	}
	public long getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getAge() {
		return age;
	}

	//public void setAge(int age) {
		
	//	if (age < 18 || age > 80) {
	//		this.age = 18;
	//		return;
	//	}
	//	this.age = age;
	//}

	@Override
	public String toString() {
		return username + "\t" 
			+ password + "\t" 
			+ age;
	}
	
	public static void main(String[] args) {
		
		
		String username1 = "zhangsan"; //上传
		
		String username2 = "zhangsan";
		// jsp -> servlet
		// request.getP....
		User queryUser = new User();
		queryUser.setUsername(username2);
		// dao
		String name = queryUser.getUsername();
		System.out.println(name);
	}
}
