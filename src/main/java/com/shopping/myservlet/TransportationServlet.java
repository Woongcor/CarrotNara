package com.shopping.myservlet;

import java.io.IOException;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.transport.VehicleController;
import com.shopping.utility.MyUtility;

@WebServlet(urlPatterns = {"/Traffic"}, initParams = {
		@WebInitParam(name="txtSetting", value="/WEB-INF/settings.txt"),
		@WebInitParam(name="txtTransportation", value="/WEB-INF/transportation.txt")
})
public class TransportationServlet extends HttpServlet{
	private String txtSetting = null ;
	private String txtTransportation = null ;
	
	private ServletContext application = null ;

	//map for settings.txt file
	private Map<String, String> settingMap = null ;
	
	//map for transportation.txt file
	private Map<String, VehicleController> transportationMap = null ;
	
	
	@Override
	public void init(ServletConfig config) throws ServletException {
		System.out.println(this.getClass() + "init() 메소드 호출됨");
		
		
		this.txtSetting = config.getInitParameter("txtSetting");
		System.out.println("setting file name : " + this.txtSetting);
		
		this.txtTransportation = config.getInitParameter("txtTransportation");
		System.out.println("controller file name : " + this.txtTransportation);
		
		this.application = config.getServletContext();
		
		String txtSettingFile = this.application.getRealPath(txtSetting);
		System.out.println("setting fullfile path : " + txtSettingFile);
		
		System.out.println();
		
		String txtTransportationFile = this.application.getRealPath(txtTransportation);
		System.out.println("setting fullfile path : " + txtTransportationFile);
		
		this.settingMap = MyUtility.getSettingMap(txtSettingFile);
		
		System.out.println("setting file element size : " + this.settingMap.size());
	
		
		this.application.setAttribute("map", this.settingMap);
		
		this.transportationMap = MyUtility.getTransportationmap(txtTransportationFile);
		
		System.out.println("controller file element size : " + this.transportationMap.size());
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		this.doProcess(request, response);
	}

	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doProcess(request, response);
	}
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String method = request.getMethod().toLowerCase();
		System.out.println("method : " + method);
		
		
		String command = request.getParameter("command");
		System.out.println("command is [" + command + "]");
		
		VehicleController controller = this.transportationMap.get(command);
		if(controller != null) {
			controller.drive();
		}else {
			System.out.println("request command is not found");
		}
		
		String gotopage = "example/transportationTo.jsp" ;
		RequestDispatcher dispatcher = request.getRequestDispatcher(gotopage) ;
		dispatcher.forward(request, response) ;
	}
}
