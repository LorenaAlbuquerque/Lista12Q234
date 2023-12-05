package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Banco;
import model.Prato;

@WebServlet("/ListarPratos")
public class ListarPratos extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Prato> listaPratos = new ArrayList<>();

        try {
            Connection connection = Banco.getConnection();
            String sql = "SELECT * FROM prato";
            
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(sql);

            while (resultSet.next()) {
                Prato prato = new Prato();
                prato.setId(resultSet.getInt("id"));
                prato.setNome(resultSet.getString("nome"));
                prato.setTipo(resultSet.getString("tipo"));
                prato.setIngredientes(resultSet.getString("ingredientes"));
                listaPratos.add(prato);
            }

            resultSet.close();
            statement.close();
            connection.close();

            request.setAttribute("listaPratos", listaPratos);
            request.getRequestDispatcher("listarPratos.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("erro", "Erro ao listar pratos");
            request.getRequestDispatcher("listarPratos.jsp").forward(request, response);
        }
    }
}
