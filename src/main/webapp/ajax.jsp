<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%-- GET, POST, or PUT --%>
<html>
<head>
    <title>Server Work</title>
</head>
<body>
<%
    request.setCharacterEncoding("utf-8");
    // обрабатываем только POST запросы
    if (request.getMethod().equals("POST"))
    {
        // выставляем правильные параметры заголовка ответа
        response.setContentType("text/html;charset=UTF-8");
        response.setCharacterEncoding("utf-8");
        response.setStatus(HttpServletResponse.SC_OK);

        // обратываем пришедшие на сервер данные
        String   name     = request.getParameter("name"); // get first name
        String   lastname = request.getParameter("lastname"); // get last name
        String[] colors   = request.getParameterValues("colors") == null ? new String[0] : request.getParameterValues("colors"); // prevent NPE, get colors

        // собираем строку для многозначного поля
        String color = "";
        for (String c : colors)
            color += c + ", ";
        // формируем тело ответа и пишем в поток вывода
        out.println(String.format("Your name is %s, your lastname is %s, your colors are %s", name, lastname, color));
    }
%>
</body>
</html>