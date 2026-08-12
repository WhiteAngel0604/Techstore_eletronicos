/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package conexao;

import javax.swing.JOptionPane;
import java.sql.*;
import javax.swing.table.DefaultTableModel;
public class Conexao {
    /*
 * Esta classe será reponsável pela conexão com o MySql
 * terá 3 métodos:
 * abertura da conexão
 * fechamento da conexão
 * e execução de comandos SQL
 */

    
    final private String driver = "com.mysql.jdbc.Driver"; // definição do driver Mysql para acesso aos dados
    final private String url = "jdbc:mysql://localhost/clientes"; // acesso ao bd clientes no servidor
    final private String usuario = "root"; // usuário do MySql - usbwebserver
    final private String senha = "usbw"; // senha do MySql - usbwebserver
    private Connection conexao; // variável que armazenará a conexão aberta
    public Statement statement; // variável para execução dos comandos SQL dentro do ambiente Java
    public ResultSet resultset; // variável que armazenará o resultado da execução de um comando SQL

        public boolean conecta() {
        boolean result = true;
        try {
            Class.forName(driver);
            conexao = DriverManager.getConnection(url, usuario, senha);
            JOptionPane.showMessageDialog(null,"Conexão estabelecida","Mensagem do Programa",JOptionPane.INFORMATION_MESSAGE);
        }catch (ClassNotFoundException Driver) {
            JOptionPane.showMessageDialog(null,"Driver não localizado"+Driver,"Mensagem do Programa",JOptionPane.INFORMATION_MESSAGE);
            result = false;
        }catch (SQLException Fonte) {
            JOptionPane.showMessageDialog(null,"Fonte de dados não localizada"+Fonte,"Mensagem do Programa",JOptionPane.INFORMATION_MESSAGE);
            result = false;
        }
        return result;
    }

    public void desconecta() {
        try {
            conexao.close();
            JOptionPane.showMessageDialog(null,"Conexão com o banco fechada","Mensagem do Programa",JOptionPane.INFORMATION_MESSAGE);
        }catch (SQLException fecha) {
            
        }
    }

    public void executaSQL(String sql) {
        try {
            statement = conexao.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
            resultset = statement.executeQuery(sql);
        }catch (SQLException excecao) {
            JOptionPane.showMessageDialog(null,"Erro no comando SQL! \n Erro: "+excecao,"Mensagem do Programa",JOptionPane.INFORMATION_MESSAGE);
        }
    }
    
       
    
    
}

