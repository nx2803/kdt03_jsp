<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    // 1. 폼에서 전송된 값 받기
    String selectedPage = request.getParameter("gugudan"); 
    String danInput = request.getParameter("num");   
    String targetURL = "";
    if (selectedPage != null && !selectedPage.isEmpty()) {
        if (selectedPage.equals("GuGuDan3.jsp") || selectedPage.equals("GuGuDan4.jsp")) {
            if (danInput != null && !danInput.isEmpty()) {
                targetURL = selectedPage + "?dan=" + danInput;
            } else {
                targetURL = selectedPage;
            }
        } else {
            targetURL = selectedPage; 
        }
        response.sendRedirect(targetURL);
        
    } else {
        response.sendRedirect("index.jsp?error=no_selection");
    }
%>