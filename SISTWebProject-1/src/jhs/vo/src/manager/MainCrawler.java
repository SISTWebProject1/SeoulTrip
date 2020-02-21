package jhs.vo.src.manager;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import jhs.vo.src.dao.LocationRawDataDAO;

public class MainCrawler {

	public static void main(String[] args) {
		long start = System.currentTimeMillis();
		int page = 0;
		int loc;
		int rv;
		
		LocationRawDataDAO locdao = new LocationRawDataDAO();

		try {
			Document locListDoc = Jsoup.connect("https://www.tripadvisor.co.kr"
											+ "/Attractions-g294197-Activities-Seoul.html").get();
			String nextLocListDocLink = "";
			while (true) {
				page++;
				Elements locNameList = locListDoc.select("div.listing_title a");
				loc = 1;
				for(Element location : locNameList){
					System.out.println(page+" page "+loc+"th loc\t========================");
					Document locDoc = Jsoup.connect("https://www.tripadvisor.co.kr"
													+location.attr("href")).get();
					//System.out.println(locDoc.html());
					
					// location detail start
					String locName="";
					try {
						locName = locDoc.selectFirst("h1#HEADING").text();
						System.out.println(locName);
					} catch (Exception e) {}
					try {
						String locTags = locDoc.selectFirst("span.is-hidden-mobile div.detail").text();
						if (locTags.contains("더 보기")) {
							locTags = locTags.replace("더 보기", "");
						}
						System.out.println(locTags);
					} catch (Exception e) {}
					try {
						System.out.println(locDoc.selectFirst("div.is-hidden-mobile span.detail").text());
					} catch (Exception e) {}
					try {
						String html = locDoc.html();
						int idx = html.indexOf("\"name\":\"" + locName + "\"");
						html = html.substring(idx);
						idx = html.indexOf("coords");
						html = html.substring(idx);
						idx = html.indexOf("},{");
						html = html.substring(0, idx);
						String[] maps = html.split("\"");
						String map = maps[maps.length - 1];
						maps = map.split(",");
						double locLat = Double.parseDouble(maps[0]);
						double locLng = Double.parseDouble(maps[1]);
						System.out.println(locLat);
						System.out.println(locLng);
					} catch (Exception e) {}
					try {
						String html = locDoc.html();
						String openHour = getDataByStart(html, "영업 시간: ", "</div>", 500);
						System.out.println(openHour.trim());
					} catch (Exception e) {}
					try {
						String html = locDoc.html();
						String phoneNumber = getDataByStart(html, ">+82 ", "<", 100);
						if(phoneNumber.charAt(1)=='-' || phoneNumber.charAt(2)=='-') phoneNumber = "0"+phoneNumber;
						System.out.println(phoneNumber.trim());
					} catch (Exception e) {}
					System.out.println("================================");
					// location detail end
					
					// review start
					// locNo 쿼리 문장 실행해서 세팅해야 함
					String reviewText = locDoc.html();
					reviewText = reviewText.substring(reviewText.indexOf("class=\"location-review-card"),
							reviewText.lastIndexOf("공유"));
					String[] reviewDataList = reviewText.split("공유");
					rv = 1;
					for (int k = 0; k < reviewDataList.length; k++) {
						try {
							// locNo 쿼리 문장 실행해서 세팅해야 함
							System.out.println(page+" page "+loc+"th loc "+rv+"th review\t========================");
							String raw = reviewDataList[k];
							String id_name = getDataByEnd(raw, "/Profile/", "</a>이 리뷰를 작성했습니다.", 50);
							String[] temp = id_name.split("\">");
							String id = temp[0];
							System.out.println(id);
							String userName = temp[1];
							System.out.println(userName);
							String score = getDataByStart(raw, "rating bubble_", "\"", 10);
							System.out.println(Integer.parseInt(score)/10);
							String regdate = getDataByStart(raw, "</a>이 리뷰를 작성했습니다.", "</span>", 50).trim();
							System.out.println(regdate);
							String title = getDataByEnd(raw, "<span>", "</span></span></a>", 500);
							System.out.println(title);
							String content = getDataByEnd(raw, "<span>", "</span></q>", 2000);
							System.out.println(content);
							String expdate = getDataByStart(raw, "체험 날짜:</span>", "</span>", 50).trim();
							System.out.println(expdate);
							System.out.println("================================");
							rv++;
						} catch (Exception e) {
							System.out.println("getData():");
							e.printStackTrace();
							return;
						}
					}
					String nextReviewLink="";
					try {
						nextReviewLink = getDataByEnd(locDoc.html(), "href=\"", "\">다음</a>", 200);
						System.out.println(nextReviewLink);
						locDoc = Jsoup.connect("https://www.tripadvisor.co.kr" + nextReviewLink).get();
					} catch (Exception e) {
						System.out.println("getData():");
						e.printStackTrace();
						return;
					}
					// review end
					loc++;
				}
				// current page end
				
				// next page link
				String locListDocHTML = locListDoc.html();
				try {
					nextLocListDocLink = getDataByEnd(locListDocHTML, "href=", "\" class=\"nav next", 1000);
					nextLocListDocLink = nextLocListDocLink.substring(nextLocListDocLink.lastIndexOf("\"")+1);
				} catch (Exception e) {
					System.out.println("Last page...");
					locListDoc = Jsoup.connect("https://www.tripadvisor.co.kr"
											+ "/Attractions-g294197-Activities-Seoul.html").get();
					continue;
				}
				locListDoc = Jsoup.connect("https://www.tripadvisor.co.kr"+nextLocListDocLink).get();
			}
		} catch (Exception e) {
			System.out.println("main():");
			e.printStackTrace();
		}
		long end = System.currentTimeMillis();
		System.out.println("Crawling end in " + ((end - start) / 1000) + " seconds.)");
	}

	public static String getDataByEnd(String raw, String start, String end, int length) throws Exception {
		raw = raw.substring(raw.lastIndexOf(end) - length, raw.lastIndexOf(end));
		raw = raw.substring(raw.lastIndexOf(start) + start.length());

		return raw;
	}

	public static String getDataByStart(String raw, String start, String end, int length) throws Exception {
		if(raw.indexOf(start)<0) throw new Exception();
		raw = raw.substring(raw.indexOf(start) + start.length(), raw.indexOf(start) + start.length() + length);
		raw = raw.substring(0, raw.indexOf(end));

		return raw;
	}

}
