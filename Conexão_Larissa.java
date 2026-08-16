package conexao;

import javax.swing.JOptionPane;
import java.sql.*; // para execução de comandos SQL no ambiente java

public class Conexao 
{
  final private String driver = "com.mysql.jdbc.Driver"; // definição do driver para o acesso de dados
  final private String url = "jdbc:mysql://localhost/clientes"; // acesso ao banco de dados clientes no servidor
  final private String usuario = "root"; // usuario do Mysql - easyphp
  final private String senha = ""; // senha, nula para não termos problemas

  private Connection conexao; // variavel que armazena a conexão aberta

  public Statement statement; // variavel para execução dos comandos sql no java
  public ResultSet resultset; // armazena o resultado da execução de um comando SQL

  public boolean conecta ()
  {
    boolean result = true;

    try
      {
        Class.forName(driver);
        conexao = DriverManager.getConnection(url, usuario, senha);
        JOptionPane.showMessageDialog(null, "Conexão estabelecida", "Mensagem do Programa", JOptionPane.INFORMATION_MESSAGE);
      }
      catch (ClassNotFoundException Driver)
      {
        JOptionPane.showMessageDialog(null, "Driver não localizado"+Driver, "Mensagem do Programa", JOptionPane.INFORMATION_MESSAGE);
        result = false;
      }
      catch (SQLException Fonte)
      {
        JOptionPane.showMessageDialog(null, "Fonte de dados não localizada"+Fonte, "Mensagem do programa", JOptionPane.INFORMATION_MESSAGE);
        result = false;
      }
      result result; 
  }

public void desconecta()
  {
    try
      {
        conexao.close();
        JOptionPane.showMessageDialog(null, "Conexão com o banco fechada", "Mensagem do Programa", JOptionPane.INFORMATION_MESSAGE);
      }
      catch (SQLException fecha)
      {
      }
  }

public void executaSQL (String sql)
  {
    try
      {
        statement = conexaoStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
        resultset = statement.executeQuery(sql);
      }
      catch (SQLException excecao)
      {
        JptionPane.showMessageDialog(null, "Erro no comando SQL! \n Erro: "+excecao, "Mensagem do Programa", JOptionPane.INFORMATION_MESSAGE);
      }
  }
        
