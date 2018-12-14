package br.com.shipping.controller;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.util.JRLoader;

@Controller
@RequestMapping("/relatorio")
public class RelatorioController {
	
	@Autowired
	private DataSource dataSource;

	@RequestMapping(value = "/funcionarios/", method = RequestMethod.GET)
	public void relFuncionarios(@RequestParam Map<String, Object> parametros, HttpServletResponse response) throws JRException, SQLException, IOException {
		
		parametros = parametros == null ? parametros = new HashMap<>() : parametros;
		
		
		InputStream jasperStream = this.getClass().getResourceAsStream("/relatorios/Funcionarios.jasper");
		
		
		JasperReport jasperReport = (JasperReport) JRLoader.loadObject(jasperStream);
		
		JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, parametros, dataSource.getConnection());

		
		response.setContentType("application/pdf");
		
		response.setHeader("Content-Disposition", "attachment; filename=funcionarios.pdf");

		
		final OutputStream outStream = response.getOutputStream();
		JasperExportManager.exportReportToPdfStream(jasperPrint, outStream);
	}
	
	@RequestMapping(value = "/viagens/", method = RequestMethod.GET)
	public void relViagens(@RequestParam Map<String, Object> parametros, HttpServletResponse response) throws JRException, SQLException, IOException {
		
		parametros = parametros == null ? parametros = new HashMap<>() : parametros;
		
		
		InputStream jasperStream = this.getClass().getResourceAsStream("/relatorios/Viagens.jasper");
		
		
		JasperReport jasperReport = (JasperReport) JRLoader.loadObject(jasperStream);
		
		JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, parametros, dataSource.getConnection());

		
		response.setContentType("application/pdf");
		
		response.setHeader("Content-Disposition", "attachment; filename=viagens.pdf");

		
		final OutputStream outStream = response.getOutputStream();
		JasperExportManager.exportReportToPdfStream(jasperPrint, outStream);
	}
	
	@RequestMapping(value = "/despesas/", method = RequestMethod.GET)
	public void relDespesas(@RequestParam Map<String, Object> parametros, HttpServletResponse response) throws JRException, SQLException, IOException {
		
		parametros = parametros == null ? parametros = new HashMap<>() : parametros;
		
		
		InputStream jasperStream = this.getClass().getResourceAsStream("/relatorios/Despesas.jasper");
		
		
		JasperReport jasperReport = (JasperReport) JRLoader.loadObject(jasperStream);
		
		JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, parametros, dataSource.getConnection());

		
		response.setContentType("application/pdf");
		
		response.setHeader("Content-Disposition", "attachment; filename=despesas.pdf");

		// 
		final OutputStream outStream = response.getOutputStream();
		JasperExportManager.exportReportToPdfStream(jasperPrint, outStream);
	}
	
}
