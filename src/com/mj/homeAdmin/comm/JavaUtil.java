package com.mj.homeAdmin.comm;

import java.io.UnsupportedEncodingException;

public class JavaUtil {


	/**
	 * <pre>
	 * 문자형이 null값이거나 공백일시 지정된 값으로 리턴
	 * </pre>
	 *
	 * @param 문자형
	 *            본래값,조건불일치 문자 def
	 * @return String
	 */
	public static String NVL(String str,String def){
		str=str==null?"":str;
		return(str.equals("")?def:str.trim());
	}
	public static String NVL(Object object,String def){
		String str=object==null?"":object.toString();
		return(str.equals("")?def:str.trim());
	}
	public static String NVL(int object,String def){
		return object==0?def:JavaUtil.toString(object);
	}
	public static Object NVL(Object object,Object def){
		return object==null?def:object;
	}
	/**
	 * <pre>
	 * 숫자형이 i가 0 일때 def 값을 리턴함
	 * </pre>
	 *
	 * @param int 본래값 i,int 기본값 def
	 * @return int
	 */
	public static int NVL(String i,int def){
		return(i==null?def:JavaUtil.toInt(i));
	}
	public static int NVL(Object i,int def){
		return(i==null?def:JavaUtil.toInt(i));
	}
	public static int NVL(int i,int def){
		return(i==0?def:i);
	}
	public static long NVL(long i,long def){
		return(i==0?def:i);
	}
	/**
	 * <pre>
	 * 인트형 배열 sNum에 인트형 num 형이 포함되어있는지 확인하여 인덱스값을 리턴함
	 * </pre>
	 *
	 * @param int i
	 * @return int i
	 */
	public static int inArray(Object[] arr1,Object arr2){
		if(arr2==null) return -1;
		for(int i=0;i<arr1.length;i++){
			if(arr1[i].toString().trim().equals(arr2.toString().trim())) return i;
		}
		return -1;
	}
	public static int inArray(int[] arr1,int arr2){
		for(int i=0;i<arr1.length;i++){
			if(arr1[i]==arr2) return i;
		}
		return -1;
	}
	public static int inArray(String[] arr1,String arr2){
		if(arr2==null) return -1;
		for(int i=0;i<arr1.length;i++){
			if(arr1[i].trim().equals(arr2.trim())) return i;
		}
		return -1;
	}
	public static int inArray(Object[] arr1,Object[] arr2){
		for(int i=0;i<arr2.length;i++){
			if(inArray(arr1,arr2[i])!=-1) return i;
		}
		return -1;
	}
	public static int inArray(int[] arr1,int[] arr2){
		for(int i=0;i<arr2.length;i++){
			if(inArray(arr1,arr2[i])!=-1) return i;
		}
		return -1;
	}
	public static int inArray(String[] arr1,String[] arr2){
		for(int i=0;i<arr2.length;i++){
			if(inArray(arr1,arr2[i])!=-1) return i;
		}
		return -1;
	}
	
	/**
	 * <pre>
	 * 인트형을 문자형으로 변화
	 * </pre>
	 *
	 * @param int i
	 * @return String i
	 */
	public static String toString(Object i){
		try{
			return String.valueOf(i);
		}catch(Exception e){
			return "";
		}
	}
	public static String toString(Object i,String def){
		try{
			return String.valueOf(i);
		}catch(Exception e){
			return def;
		}
	}
	/**
	 * <pre>
	 * 문자형을 인트형으로 변화
	 * </pre>
	 *
	 * @param int i
	 * @return String i
	 */
	public static int toInt(String s){
		try{
			s=JavaUtil.NVL(s,"0");
			return Integer.parseInt(s);
		}catch(Exception e){
			return -1;
		}
	}
	public static int toInt(Long s){
		return Integer.parseInt(JavaUtil.toString(Math.round(s)));
	}
	public static int toInt(Double s){
		return Integer.parseInt(JavaUtil.toString(Math.round(s)));
	}
	public static int toInt(Object s){
		s=JavaUtil.NVL(s,"0");
		return toInt(s.toString());
	}
	public static int toInt(Object s,int def){
		s=JavaUtil.NVL(s,def);
		return toInt(s.toString());
	}
	public static String[] toStrArray(Object s){
		String[] arr=null;
		try{
			arr=(String[])s;
		}catch(Exception e){
			arr=new String[0];
		}
		return arr==null?new String[0]:arr;
	}
	public static int[] toIntArray(Object s){
		int[] arr=null;
		try{
			arr=(int[])s;
		}catch(Exception e){
			arr=new int[0];
		}
		return arr==null?new int[0]:arr;
	}
	public static long toLong(String s){
		try{
			s=JavaUtil.NVL(s,"0");
			if(!empty(s)&&isDigit(s)) return Long.parseLong(s);
		}catch(Exception e){
			return 0;
		}
		return 0;
	}
	public static double toDouble(String s){
		try{
			if(!empty(s)) return Double.parseDouble(s);
		}catch(Exception e){
			return 0;
		}
		return 0;
	}
	/**
	 * String 이 유효한지 체크한다.
	 *
	 * @param str
	 *            체크할 문자열
	 * @return <code>true</code> 유효한 문자열; <code>false</code> 유효하지 않은 문자열
	 */
	public static boolean empty(String str){
		if(str==null||str.length()==0) return true;
		return false;
	}
	/**
	 * 넘어온 문자열이 숫자로만 이루어져있는지 체크한다.
	 *
	 * @param s
	 *            체크할 문자열
	 * @return <code>true</code> 숫자로만 구성된 경우; <code>false</code> 숫자이외의 문자가 포함된 경우
	 */
	public static boolean isDigit(String s){
		int i,Length;
		if(s==null) return false;
		Length=s.length();
		for(i=0;i<Length;i++){
			if(s.charAt(i)>'9'||s.charAt(i)<'0') return false;
		}
		return true;
	}
	
	
	public static String checkYYYY(String yyyy,String mm, String mn) {
		
		// 현재 값에서 원하는 달 수만큼 뺀 년 구하기
		
		// mn = 원하는 감소 월 수
		
		String chk = checkMM(mm,mn);
		
		String result = "";
		
		// 마이너스 해서 나온 값이 기존 달 보다 값이 크다면 ex) 현재달 1월 / - 1 = chk 달 12월 일 때
		if(Integer.parseInt(chk) > Integer.parseInt(mm)) {
			
			result = Integer.parseInt(yyyy) -1 + "";
		}else {
			result = yyyy;
		}
		
		return result;
	}
	
	public static String checkMM(String mm, String mn) {
		
		int ch =( Integer.parseInt(mm) - Integer.parseInt(mn));
		
		//	1-2 = -1  11  (12-1)
		//	1-3 = -2  10  (12-2)
	
		String result ="";
		
		if(ch < 0) {
			result = ch + 12 + ""; 
		}else {
			result = ch + "";
		}
		
		return result;
	}
	
	
}
