<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Inserir Prato</title>
</head>
<body>
    <form action="InserirPrato" method="post">
        Nome do Prato: <input type="text" name="nome" required><br><br>
        Tipo: <input type="text" name="tipo" required><br><br>
        Ingredientes: <textarea name="ingredientes" rows="4" cols="50" required></textarea><br><br>
        <input type="submit" value="Inserir Prato">
    </form>
</body>
</html>
