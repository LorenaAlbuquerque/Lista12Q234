<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Listagem de Pratos</title>
</head>
<body>
    <h1>Listagem de Pratos</h1>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>Nome</th>
            <th>Tipo</th>
            <th>Ingredientes</th>
        </tr>
        <%@ page import="model.Prato" %>
        <%@ page import="java.util.List" %>
        <% List<Prato> listaPratos = (List<Prato>) request.getAttribute("listaPratos"); %>
        <% if (listaPratos != null && !listaPratos.isEmpty()) { %>
            <% for (Prato prato : listaPratos) { %>
                <tr>
                    <td><%= prato.getId() %></td>
                    <td><%= prato.getNome() %></td>
                    <td><%= prato.getTipo() %></td>
                    <td><%= prato.getIngredientes() %></td>
                </tr>
            <% } %>
        <% } else { %>
            <tr>
                <td colspan="4">Nenhum prato encontrado.</td>
            </tr>
        <% } %>
    </table>
</body>
</html>
