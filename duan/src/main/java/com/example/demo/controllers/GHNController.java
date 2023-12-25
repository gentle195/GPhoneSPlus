package com.example.demo.controllers;

import com.example.demo.models.DiaChi;
import com.example.demo.models.HoaDon;
import com.example.demo.services.HoaDonService;
import net.minidev.json.JSONObject;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;
@CrossOrigin(origins = "*")
@RestController
public class GHNController {
	private HoaDon hoaDonnn = new HoaDon();
	public static final String TOKEN = "908a0de5-9f55-11ee-b394-8ac29577e80e";
	public static final Integer SHOP_ID = 4791537;
	public static final String API_ENDPOINT = "https://dev-online-gateway.ghn.vn/shiip/public-api";
	public static final String CREATE_ORDER_URL = API_ENDPOINT + "/v2/shipping-order/create";
	public static final String CALCULATE_TIME_SHIP_URL = API_ENDPOINT + "/v2/shipping-order/leadtime";
	public static final String CALCULATE_SHIP_FEE_URL = API_ENDPOINT + "/v2/shipping-order/fee";
	public static final String GET_TOKEN_URL = API_ENDPOINT + "/v2/a5/gen-token";
	public static final String PRINT_INVOICE_URL = API_ENDPOINT + "/printA5";
	public static final String GET_ORDER_DETAIL_URL = API_ENDPOINT + "/v2/shipping-order/detail";
	public static final String GET_RETURN_ORDER_INFO_URL = API_ENDPOINT + "/v2/shipping-order/preview";
	public static final String CANCEL_ORDER_URL = API_ENDPOINT + "/v2/switch-status/cancel";

	@Autowired
	private HoaDonService hoaDonService;
	@PostMapping(value = "/create-order/{id}")
	public Map<String, Object> createOrder(@PathVariable(name = "id") UUID order_id, @ModelAttribute("hoaDon") HoaDon hoaDon,Model model)
			throws ClientProtocolException, IOException {

		HoaDon o = hoaDonService.findById(order_id);
		model.addAttribute("hoaDon", hoaDonnn);
		JSONObject json = new JSONObject();
		if (o.getHinhThucThanhToan() == 1) {
			json.put("payment_type_id", 1);
			json.put("cod_amount", 0);
		} else {
			json.put("payment_type_id", 2);
			json.put("cod_amount", o.getTongTien());
		}
		json.put("note", "");
		json.put("required_note", "KHONGCHOXEMHANG");
		json.put("client_order_code", o.getId().toString());
		json.put("to_name", o.getNguoiNhan());
		json.put("to_phone", o.getSdt());
		DiaChi diaChi = o.getDiaChi();

		String address = "số 2, Phường Mỹ Xuyên, Thành phố Long Xuyên - An Giang";
		json.put("to_address", address);
		json.put("to_ward_code", o.getToWardCode());
		json.put("to_district_id", o.getToDistrictId());
		json.put("weight", o.getLoai());
		json.put("length", o.getLoai());
		json.put("width", o.getLoai());
		json.put("height", o.getLoai());
		json.put("service_id", 53321);
		json.put("content", "Tao don hang");

		System.out.println(json);

		CloseableHttpClient client = HttpClients.createDefault();
		HttpPost post = new HttpPost(CREATE_ORDER_URL);
		StringEntity stringEntity = new StringEntity(json.toString(), StandardCharsets.UTF_8);
		post.setHeader("content-type", "application/json");
		post.setHeader("Token", TOKEN);
		post.setHeader("shopid", SHOP_ID.toString());
		post.setEntity(stringEntity);
		CloseableHttpResponse res = client.execute(post);
		BufferedReader rd = new BufferedReader(new InputStreamReader(res.getEntity().getContent()));
		StringBuilder resultJsonStr = new StringBuilder();
		String line;
		while ((line = rd.readLine()) != null) {
			resultJsonStr.append(line);
		}

		JSONObject result = new JSONObject(Integer.parseInt(resultJsonStr.toString()));
		JSONObject data = (JSONObject) result.get("data");
		JSONObject fee = (JSONObject) data.get("fee");
		String order_code = data.get("order_code").toString();
		String expected_delivery_time = data.get("expected_delivery_time").toString();
		Long total_fee = Long.parseLong(data.get("total_fee").toString());
		Integer code = Integer.parseInt(result.get("code").toString());
		String message_display = result.get("message_display").toString();
		String message = result.get("message").toString();
		String code_message_value = result.get("code_message_value").toString();
		Map<String, Object> kq = new HashMap<String, Object>();
		kq.put("code", code);
		kq.put("message", message);
		kq.put("message_display", message_display);
		kq.put("code_message_value", code_message_value);
		kq.put("order_code", order_code);
		kq.put("expected_delivery_time", expected_delivery_time);
		kq.put("total_fee", total_fee);
		kq.put("fee", fee.toString());
		return kq;
	}
}
