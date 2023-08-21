package com.ssofun.www.store.controller;

import java.io.File;

import java.util.ArrayList;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.ssofun.dto.*;
import com.ssofun.www.store.service.StoreServiceImpl;

@Controller
@RequestMapping("www/store/*")
public class StoreController {

	@Autowired
	private StoreServiceImpl storeService;

	@RequestMapping("login")
	public String login() {
		return "www/main/loginPage1";
	}

	@RequestMapping("test")
	public String test(@RequestParam(defaultValue = "1") int page, ProductDto producDto, Model model, ProductCategoryTypeDto pctDto) {
		List<ProductCategoryTypeDto> pctlist = storeService.getProductCT(pctDto);
		List<ProductDto> Recount = storeService.getRecount(producDto); // 상품별 리뷰 개수
		List<ProductDto> fullList = storeService.getItemList(producDto); // 전체 상품 목록 가져오기
		
		int itemsPerPage = 8; // 페이지당 아이템 개수
		// 페이지 번호에 따라 상품 목록을 제한하여 새로운 리스트를 생성합니다.
		List<ProductDto> paginatedList = new ArrayList<>();
		int startIdx = (page - 1) * itemsPerPage;
		int endIdx = Math.min(startIdx + itemsPerPage, fullList.size());
		for (int i = startIdx; i < endIdx; i++) {
			paginatedList.add(fullList.get(i));
		}

		int pageCount = (int) Math.ceil((double) fullList.size() / itemsPerPage); // 총 페이지 수 계산
		model.addAttribute("Recount", Recount); // 상품별 리뷰 개수
		model.addAttribute("pctlist", pctlist);
		model.addAttribute("list", paginatedList);
		model.addAttribute("currentPage", page);
		model.addAttribute("pageCount", pageCount);
		
		return "www/main/test";
	}
	
	@RequestMapping("testtest")
	public String testtest(@RequestParam(defaultValue = "1") int page, ProductDto producDto, Model model, ProductCategoryTypeDto pctDto) {
		List<ProductCategoryTypeDto> pctlist = storeService.getProductCT(pctDto);// tb_product_category_type 테이블 값가져오기

		model.addAttribute("pctlist", pctlist); // tb_product_category_type 테이블
		
		return "www/main/testtest";
	}	
	
	// =================

	// 스토어 리스트 최신순 출력 메인페이지
	@RequestMapping("storePage")
	public String storePage(@RequestParam(defaultValue = "1") int page, ProductDto producDto, Model model, ProductCategoryTypeDto pctDto, ProductFavoritCountDto pfDto, HttpSession session) {
		List<ProductCategoryTypeDto> pctlist = storeService.getProductCT(pctDto);
		List<ProductDto> Recount = storeService.getRecount(producDto); // 상품별 리뷰 개수
		List<ProductDto> fullList = storeService.getItemList(producDto); // 전체 상품 목록 가져오기
		List<ProductFavoritCountDto>Likecount = storeService.getLikecount(pfDto); //상품별 좋아요 개수
		for(ProductDto a : fullList) {
			int pid =a.getProduct_id();
			for (ProductFavoritCountDto likeCountItem : Likecount) {
	            likeCountItem.setProduct_id(pid);
	            
	        }
		}
		
		
		
		int itemsPerPage = 8; // 페이지당 아이템 개수	
		// 페이지 번호에 따라 상품 목록을 제한하여 새로운 리스트를 생성합니다.
		List<ProductDto> paginatedList = new ArrayList<>();
		int startIdx = (page - 1) * itemsPerPage;
		int endIdx = Math.min(startIdx + itemsPerPage, fullList.size());
		for (int i = startIdx; i < endIdx; i++) {
			paginatedList.add(fullList.get(i));
		}

		int pageCount = (int) Math.ceil((double) fullList.size() / itemsPerPage); // 총 페이지 수 계산
		model.addAttribute("Recount", Recount); // 상품별 리뷰 개수
		model.addAttribute("Likecount", Likecount); // 상품별 좋아요 개수
		model.addAttribute("pctlist", pctlist);
		model.addAttribute("list", paginatedList);
		model.addAttribute("currentPage", page);
		model.addAttribute("pageCount", pageCount);

		return "www/main/storePage";
	}
	
	// 스토어 리스트 낮은 가격순 출력 메인페이지
	@RequestMapping("storelowPage")
	public String mainlowPage(@RequestParam(defaultValue = "1") int page, ProductDto producDto, Model model, ProductCategoryTypeDto pctDto, ProductFavoritCountDto pfDto, HttpSession session) {
		List<ProductCategoryTypeDto> pctlist = storeService.getProductCT(pctDto);
		List<ProductDto> Recount = storeService.getRecount(producDto); // 상품별 리뷰 개수
		List<ProductDto> fullList = storeService.getItemlowList(producDto); // 전체 상품 목록 가져오기
		List<ProductFavoritCountDto>Likecount = storeService.getLikecount(pfDto); //상품별 좋아요 개수
		for(ProductFavoritCountDto a : Likecount) {
			int av =a.getProduct_id();
			int b = a.getCount();
		}
		
		
		int itemsPerPage = 12; // 페이지당 아이템 개수
		// 페이지 번호에 따라 상품 목록을 제한하여 새로운 리스트를 생성합니다.
		List<ProductDto> paginatedList = new ArrayList<>();
		int startIdx = (page - 1) * itemsPerPage;
		int endIdx = Math.min(startIdx + itemsPerPage, fullList.size());
		for (int i = startIdx; i < endIdx; i++) {
			paginatedList.add(fullList.get(i));
		}

		int pageCount = (int) Math.ceil((double) fullList.size() / itemsPerPage); // 총 페이지 수 계산
		model.addAttribute("Recount", Recount); // 상품별 리뷰 개수
		model.addAttribute("Likecount", Likecount); // 상품별 좋아요 개수
		model.addAttribute("pctlist", pctlist);
		model.addAttribute("list", paginatedList);
		model.addAttribute("currentPage", page);
		model.addAttribute("pageCount", pageCount);

		return "www/main/storelowPage";
	}
		
	// 스토어 리스트 높은 가격순 출력 메인페이지
	@RequestMapping("storehighPage")
	public String mainhighPage(@RequestParam(defaultValue = "1") int page, ProductDto producDto, Model model, ProductCategoryTypeDto pctDto, ProductFavoritCountDto pfDto, HttpSession session) {
		List<ProductCategoryTypeDto> pctlist = storeService.getProductCT(pctDto);
		List<ProductDto> Recount = storeService.getRecount(producDto); // 상품별 리뷰 개수
		List<ProductDto> fullList = storeService.getItemhighList(producDto); // 전체 상품 목록 가져오기
		List<ProductFavoritCountDto>Likecount = storeService.getLikecount(pfDto); //상품별 좋아요 개수
		for(ProductFavoritCountDto a : Likecount) {
			int av =a.getProduct_id();
			int b = a.getCount();
		}
		
		
		int itemsPerPage = 12; // 페이지당 아이템 개수
		// 페이지 번호에 따라 상품 목록을 제한하여 새로운 리스트를 생성합니다.
		List<ProductDto> paginatedList = new ArrayList<>();
		int startIdx = (page - 1) * itemsPerPage;
		int endIdx = Math.min(startIdx + itemsPerPage, fullList.size());
		for (int i = startIdx; i < endIdx; i++) {
			paginatedList.add(fullList.get(i));
		}

		int pageCount = (int) Math.ceil((double) fullList.size() / itemsPerPage); // 총 페이지 수 계산
		model.addAttribute("Recount", Recount); // 상품별 리뷰 개수
		model.addAttribute("Likecount", Likecount); // 상품별 좋아요 개수
		model.addAttribute("pctlist", pctlist);
		model.addAttribute("list", paginatedList);
		model.addAttribute("currentPage", page);
		model.addAttribute("pageCount", pageCount);

		return "www/main/storehighPage";
	}
	
	//카테고리 선택 상품 출력
	@RequestMapping("categories")
	public String testa(@RequestParam(defaultValue = "1") int page, int pct, ProductDto producDto, Model model, ProductCategoryTypeDto pctDto, ProductFavoritCountDto pfDto) {
		List<ProductCategoryTypeDto> pctlist = storeService.getProductCT(pctDto); // 카테고리 출력
		List<ProductDto> Recount = storeService.getRecount(producDto); // 상품별 리뷰 개수
		List<ProductDto> pctypeList = storeService.getProductCTList(pct);
		List<ProductFavoritCountDto>Likecount = storeService.getLikecount(pfDto); //상품별 좋아요 개수
		
		int itemsPerPage = 8; // 페이지당 아이템 개수
		// 페이지 번호에 따라 상품 목록을 제한하여 새로운 리스트를 생성합니다.
		List<ProductDto> paginatedList = new ArrayList<>();
		int startIdx = (page - 1) * itemsPerPage;
		int endIdx = Math.min(startIdx + itemsPerPage, pctypeList.size());
		for (int i = startIdx; i < endIdx; i++) {
			paginatedList.add(pctypeList.get(i));
		}

		int pageCount = (int) Math.ceil((double) pctypeList.size() / itemsPerPage); // 총 페이지 수 계산
		model.addAttribute("Recount", Recount); // 상품별 리뷰 개수
		model.addAttribute("Likecount", Likecount); // 상품별 좋아요 개수
		model.addAttribute("pctlist", pctlist);
		model.addAttribute("list", paginatedList);
		model.addAttribute("currentPage", page);
		model.addAttribute("pageCount", pageCount);
		
		return "www/main/categories";
	}
		

	// 상품상세보기 페이지
	@RequestMapping("productPage")
	public String productPage(int id, Model model, ProductReviewJiDto prjDto, ProductReviewImageDto priDto, ProductDetailImageDto pdiDto) {
		List<ProductDto> list = storeService.getItemListDetail(id);
		prjDto.setProduct_id(id);
		pdiDto.setProduct_id(id);
		List<ProductReviewJiDto> relist = storeService.getProductReview(prjDto); //상품마다 리뷰 출력
		List<ProductDetailImageDto>deimglist = storeService.getDetailImg(pdiDto); // 상품마다 상세이미지 출력
		List<ProductReviewImageDto>reimgList = storeService.getReviewImg(priDto); // 상품마다 리뷰이미지 출력
		
		
		model.addAttribute("deimglist", deimglist);
		model.addAttribute("reimgList", reimgList);
		model.addAttribute("relist", relist);
		model.addAttribute("detail", list);
		return "www/main/productPage";
	}

	@RequestMapping("productProcess")
	public String productProcess(HttpSession session, ProductUserDto std, ProductDto producDto, int id, int amount,
			int count) {
		UserDto sessionUser = (UserDto) session.getAttribute("user");
		System.out.println(id);
		System.out.println(amount);
		System.out.println(count);
		System.out.println(sessionUser);
		if (sessionUser != null) {
			session.setAttribute("sessionUser", sessionUser);
			session.setAttribute("amount", amount);
			session.setAttribute("count", count);
			return "redirect:./productOrderPage?id=" + id;
		} else {
			session.invalidate(); // 세션 무효화
			return "redirect:./loginPage";
		}
	}

	// 주문페이지
	@RequestMapping("productOrderPage")
	public String productOrderPage(int id, Model model, HttpSession session) {
		List<ProductDto> list = storeService.getItemListDetail(id);
		model.addAttribute("detail", list);
		return "www/main/productOrderPage";
	}

	// 주문페이지
	@RequestMapping("productOrderProcess")
	public String productOrderProcess(ProductRecipient recipiDto, ProductOrderItemDto poiDto, ProductOrderDto porDto,ProductDto pDto, HttpSession session) {
		UserDto sessionUser = (UserDto) session.getAttribute("user");
		int id = (int) sessionUser.getUser_id();
		System.out.println(id);
		porDto.setUser_id(id);
		storeService.registRecipient(recipiDto);
		storeService.registProductOrder(porDto);
		storeService.registOrderItem(poiDto);
		return "redirect:./orderCompletePage";
	}

	// 장바구니 페이지
	@RequestMapping("cartPage")
	public String cartPage(Model model, HttpSession session) {
		UserDto sessionUser = (UserDto) session.getAttribute("user");
		int id = (int) sessionUser.getUser_id();
		System.out.println(id);
		List<ProductUserDto> list = storeService.getCartList(id);
		model.addAttribute("list", list);
		return "www/main/cartPage";
	}

	// 장바구니 삭제
	@RequestMapping("deleteCartProcess")
	public String deleteCartProcess(ProductCart cartDto, int user_id, int product_id) {
		storeService.deleteCart(cartDto);
		return "redirect:./cartPage?id=" + user_id;
	}

	@ResponseBody
	@RequestMapping("cartProcess")
	public String cartProcess(ProductCart cartDto, ProductUserDto Std, HttpSession session) {
		UserDto sessionUser = (UserDto) session.getAttribute("user");
		int id = (int) sessionUser.getUser_id();
		System.out.println(id);
		cartDto.setUser_id(id);
		storeService.registCart(cartDto);
		return "1";
	}

	// 장바구니 구매페이지
	@RequestMapping("cartOrderPage")
	public String cartOrderPage(ProductCart cartDto, ProductUserDto Std, HttpSession session, Model model, int amount) {
		session.setAttribute("amount", amount);
		UserDto sessionUser = (UserDto) session.getAttribute("user");
		int id = (int) sessionUser.getUser_id();
		System.out.println(id);
		List<ProductUserDto> list = storeService.getCartList(id);
		model.addAttribute("sessionUser", sessionUser);
		model.addAttribute("list", list);
		return "www/main/cartOrderPage";
	}

	// 장바구니 주문페이지
	@RequestMapping("cartOrderProcess")
	public String cartOrderProcess(HttpServletRequest request, ProductRecipient recipiDto, ProductOrderItemDto poiDto,
		ProductOrderDto porDto, ProductDto pDto, HttpSession session) {
		UserDto sessionUser = (UserDto) session.getAttribute("user");
		int id = (int) sessionUser.getUser_id();
		porDto.setUser_id(id);
		storeService.registRecipient(recipiDto);
		storeService.registProductOrder(porDto);

		String[] productIds = request.getParameterValues("product_id");
		String[] counts = request.getParameterValues("count");

		if (productIds != null && counts != null && productIds.length == counts.length) {
			for (int i = 0; i < productIds.length; i++) {
				int productId = Integer.parseInt(productIds[i]);
				int count = Integer.parseInt(counts[i]);

				// ProductOrderItemDto 객체 생성 및 설정
				ProductOrderItemDto orderItemDto = new ProductOrderItemDto();
				orderItemDto.setProduct_id(productId);
				orderItemDto.setCount(count);

				// 주문 상품 등록
				storeService.registOrderItem(orderItemDto);
				ProductCart cartDto = new ProductCart();
				cartDto.setProduct_id(productId);
				storeService.updateCart(cartDto);
			}
		}
		return "redirect:./orderCompletePage";
	}

	// 주문 완료페이지
	@RequestMapping("orderCompletePage")
	public String orderCompletePage(ProductRecipient reciDto, Model model) {
		ProductRecipient recipient = storeService.getRecipient(reciDto);
		model.addAttribute("recipient", recipient);
		return "www/main/orderCompletePage";
	}

	// 마이페이지 주문목록출력
	@RequestMapping("orderListPage")
	public String orderListPage(@RequestParam(defaultValue = "1") int page, Model model, HttpSession session, ProductReviewDto prDto) {
		int itemsPerPage = 5; // 페이지당 아이템 개수
		UserDto sessionUser = (UserDto) session.getAttribute("user");
		int id = (int) sessionUser.getUser_id();
		prDto.setUser_id(id);
		List<ProductReviewDto> review = storeService.getreview(prDto); // 상품마다 리뷰 비교
		List<ProductOrderItemDto> fullList = storeService.getMypageList(id); // 전체 상품 목록 가져오기
		
		// 페이지 번호에 따라 상품 목록을 제한하여 새로운 리스트를 생성합니다.
		List<ProductOrderItemDto> paginatedList = new ArrayList<>();
		int startIdx = (page - 1) * itemsPerPage;
		int endIdx = Math.min(startIdx + itemsPerPage, fullList.size());
		
		for (int i = startIdx; i < endIdx; i++) {
			paginatedList.add(fullList.get(i));
		}
		
		int pageCount = (int) Math.ceil((double) fullList.size() / itemsPerPage); // 총 페이지 수 계산
		model.addAttribute("sessionUser", sessionUser);
		model.addAttribute("review", review);// 상품마다 리뷰 비교 
		model.addAttribute("list", paginatedList);
		model.addAttribute("currentPage", page);
		model.addAttribute("pageCount", pageCount);
		return "www/main/orderListPage";
	}

	// 주문상세페이지
	@RequestMapping("orderdetailPage")
	public String orderdetailPage(Model model, int id,HttpSession session) {
		UserDto sessionUser = (UserDto) session.getAttribute("user");
		List<ProductOrderItemDto> list = storeService.getOrderDetailList(id);
		model.addAttribute("sessionUser", sessionUser);
		model.addAttribute("list", list);
		return "www/main/orderdetailPage";
	}
	
	//리뷰관리페이지
	@RequestMapping("productReviewPage")
	public String productReviewPage(Model model, int id,HttpSession session) {
		UserDto sessionUser = (UserDto) session.getAttribute("user");
		ProductOrderItemDto rev = storeService.getReview(id);
		model.addAttribute("sessionUser", sessionUser);
		model.addAttribute("rev", rev);
		return "www/main/productReviewPage";
	}
	
	//리뷰작성처리
	@RequestMapping("productReviewProcess")
	public String productReviewProcess(Model model,HttpSession session, ProductReviewDto reDto, ProductReviewImageDto param,MultipartFile[] imageFiles) {
		storeService.reupdate(reDto);
		UserDto sessionUser = (UserDto) session.getAttribute("user");
		int id = (int) sessionUser.getUser_id();
		reDto.setUser_id(id);	
		
		int totalFiles = imageFiles.length; // 등록된 이미지 파일의 총 개수

		List<ProductReviewImageDto> reimglist = new ArrayList<>();

		if (totalFiles > 0) {
			for (int i = 0; i < totalFiles; i++) {
				MultipartFile multipartFile = imageFiles[i];

				if (multipartFile.isEmpty()) {
					continue;
				}

				System.out.println("파일명: " + multipartFile.getOriginalFilename());

				String rootFolder = "C:/ssofunReImgFiles/";

				String saveFileName = multipartFile.getOriginalFilename();

				try {
					multipartFile.transferTo(new File(rootFolder + saveFileName));
				} catch (Exception e) {
					e.printStackTrace();
				}
				
				ProductReviewImageDto reimg = new ProductReviewImageDto();
				reimg.setUrl(saveFileName);
				reimg.setOrder_list(i);
				reimglist.add(reimg);
			}
		}
		storeService.regitstReview(reDto);
		storeService.registReimg(param, reimglist);
		return "redirect:./orderListPage";
	}
	
	//문의하기
	@RequestMapping("productQnaPage")
	public String productQnaPage(Model model, int id, HttpSession session) {
		UserDto sessionUser = (UserDto) session.getAttribute("user");
		ProductOrderItemDto rev = storeService.getReview(id);

		model.addAttribute("sessionUser", sessionUser);
		model.addAttribute("rev", rev);
		return "www/main/productQnaPage";
	}
	
	//문의하기 작성 처리
	@RequestMapping("productQnaProcess")
	public String productQnaProcess(Model model, HttpSession session, MultipartFile[] imageFiles, QnaDto qDto,int poiID) {
		UserDto sessionUser = (UserDto) session.getAttribute("user");
		int id = (int) sessionUser.getUser_id();

		qDto.setUser_id(id);
		storeService.registQna(qDto);
		return "redirect:./orderListPage";
	}
	//문의내역확인
	@RequestMapping("readQnaPage")
	public String readQnaPage( Model model, HttpSession session,  QnaDto qDto) {

		UserDto sessionUser = (UserDto) session.getAttribute("user");
		int id = (int) sessionUser.getUser_id();
	
		qDto.setUser_id(id);
		List<QnaDto>qnalist = storeService.getQnalist(qDto); //QA내역 출력
		
		model.addAttribute("sessionUser", sessionUser);
		model.addAttribute("qnalist", qnalist);// QA내역 출력
		return "www/main/readQnaPage";
	}
	
	// 마이페이지 주문목록출력
	@RequestMapping("userMyPage")
	public String userMyPage(@RequestParam(defaultValue = "1") int page, Model model, HttpSession session, ProductReviewDto prDto) {
		int itemsPerPage = 5; // 페이지당 아이템 개수
		UserDto sessionUser = (UserDto) session.getAttribute("user");
		int id = (int) sessionUser.getUser_id();
		prDto.setUser_id(id);
		List<ProductReviewDto> review = storeService.getreview(prDto); // 상품마다 리뷰 비교
		List<ProductOrderItemDto> fullList = storeService.getMypageList(id); // 전체 상품 목록 가져오기
		
		// 페이지 번호에 따라 상품 목록을 제한하여 새로운 리스트를 생성합니다.
		List<ProductOrderItemDto> paginatedList = new ArrayList<>();
		int startIdx = (page - 1) * itemsPerPage;
		int endIdx = Math.min(startIdx + itemsPerPage, fullList.size());
		
		for (int i = startIdx; i < endIdx; i++) {
			paginatedList.add(fullList.get(i));
		}
		
		int pageCount = (int) Math.ceil((double) fullList.size() / itemsPerPage); // 총 페이지 수 계산
		model.addAttribute("sessionUser", sessionUser);
		model.addAttribute("review", review);// 상품마다 리뷰 비교 
		model.addAttribute("list", paginatedList);
		model.addAttribute("currentPage", page);
		model.addAttribute("pageCount", pageCount);
		return "www/main/userMyPage";
	}

	// ==등록 관련
	@RequestMapping("adminPage")
	public String adminPage() {
		return "www/main/adminPage";
	}

	@RequestMapping("protuctRegist")
	public String protuctRegist() {
		return "www/main/protuctRegist";
	}

	@RequestMapping("protuctProcess")
	public String protuctProcess(ProductDto productDto, HttpSession session) {
		AdminDto sessionUser = (AdminDto) session.getAttribute("sessionUser");

		int adminId = sessionUser.getAdmin_id();
		System.out.println(adminId);
		productDto.setAdmin_id(adminId);
		storeService.registerProduct(productDto);
		return "redirect:./loginPage";
	}

	@RequestMapping("thumbnail")
	public String thumbnail() {
		return "www/main/thumbnail";
	}

	@ResponseBody
	@RequestMapping("thumbnailProcess")
	public String thumbnailProcess(ProductThumbnailDto params, MultipartFile[] imageFiles) {
		int totalFiles = imageFiles.length; // 등록된 이미지 파일의 총 개수

		List<ProductThumbnailDto> thumbnailList = new ArrayList<>();

		if (totalFiles > 0) {
			for (int i = 0; i < totalFiles; i++) {
				MultipartFile multipartFile = imageFiles[i];

				if (multipartFile.isEmpty()) {
					continue;
				}

				System.out.println("파일명: " + multipartFile.getOriginalFilename());

				String rootFolder = "C:/uploadFiles/";

				String saveFileName = multipartFile.getOriginalFilename();

				try {
					multipartFile.transferTo(new File(rootFolder + saveFileName));
				} catch (Exception e) {
					e.printStackTrace();
				}

				ProductThumbnailDto thumbnail = new ProductThumbnailDto();
				thumbnail.setName(saveFileName);
				thumbnail.setOrder_list(i);
				thumbnailList.add(thumbnail);
			}
		}

		storeService.registThumbnail(params, thumbnailList);
		return "1";
	}

	@RequestMapping("type")
	public String type() {
		return "www/main/type";
	}

	@RequestMapping("typeProcess")
	public String typeProcess(ProductCategoryTypeDto catyDto) {
		storeService.registerType(catyDto);
		return "www/main/mainPage";
	}
	
	@RequestMapping("loginPage")
	public String loginPage() {
		return "www/main/loginPage";
	}

	@ResponseBody
	@RequestMapping("loginProcess")
	public String loginProcess(HttpSession session, ProductUserDto userDto) {
		ProductUserDto sessionUser = storeService.login(userDto);
		session.setAttribute("sessionUser", sessionUser);
		if (sessionUser != null) {
			return "1";
		} else {
			return "0";
		}
	}

	@RequestMapping("logoutProcess")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:./mainPage";
	}

}
