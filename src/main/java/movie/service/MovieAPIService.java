package movie.service;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import com.control.CommandProcess;

public class MovieAPIService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		String key = "663dd3d5fc4d087941f129b50658c0d4"; // api key
		
		String result = "";
		
		try {
			
				URL url = new URL(
					"http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieList.json?key="
					+ key 
					+ "&itemPerPage=99" 
					+ "&repNationCd=0105001" 
				);
			
			
//			URL url = new URL(
//					"http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieList.json?key="
//					+ key
//					+ "&itemPerPage=99"
//					+ "&openStartDt=2024"
//					+ "&repNationCd=220310"
//				);
				
			BufferedReader br;
			br = new BufferedReader(new InputStreamReader(url.openStream(), "UTF-8"));
			
			result = br.readLine();
			
			// JSON 데이터 파싱을 위한 JSONParser 객체 생성
            JSONParser jsonParser = new JSONParser();
            
            // JSON 데이터를 파싱하여 JSONObject로 변환
            JSONObject jsonObject = (JSONObject) jsonParser.parse(result);
            
            // JSON 데이터 출력
            System.out.println(jsonObject);
			
            // JSON 데이터에서 "movieListResult" 필드를 추출
            JSONObject movieListResult = (JSONObject) jsonObject.get("movieListResult");
            
            // "movieListResult" 안에 있는 "movieList" 필드를 추출 (영화 목록)
            JSONArray movieList = (JSONArray) movieListResult.get("movieList");
            System.out.println(movieList.size());
            // 영화 목록을 순회하면서 데이터 출력
            for (Object movie : movieList) {
                JSONObject movieData = (JSONObject) movie;
                if(!movieData.get("repGenreNm").toString().equals("성인물(에로)")) {
                	System.out.println("영화명(한글): " + movieData.get("movieNm"));
                    System.out.println("영화명(영문): " + movieData.get("movieNmEn"));
                    System.out.println("제작국가: " + movieData.get("nationAlt"));
                    System.out.println("영화 장르: " + movieData.get("repGenreNm"));
                    System.out.println("개봉일: " + movieData.get("openDt"));
                    System.out.println("영화 타입: " + movieData.get("typeNm"));
                    System.out.println("제작 상태: " + movieData.get("prdtStatNm"));
                	
                }
                System.out.println("--------");
            }
                
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return "none";
	}
	
	public static void main(String[] args) {
		try {
			new MovieAPIService().requestPro(null, null);
		} catch (Throwable e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
