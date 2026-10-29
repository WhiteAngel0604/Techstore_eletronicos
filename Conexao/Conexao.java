// Criação arquivo de conexão com SQL Server
// 06.10.2026
// Loja de Eletronicos: Alicia Fontes, Geovanna Novais, Felippi Angelo, Larissa Dias
// FUNCIONANDO !!!
// Ajustar configurações do SQL Server para efetuar a conexão

package Conexao;

import javax.swing.JOptionPane;
import java.sql.*; // executar comandos sql

public class Conexao 
{
    final private String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver"; // driver do sql server
    final private String url = "jdbc:sqlserver://localhost:1433;instanceName=SQLEXPRESS;databaseName=Banco_LojaEletronico_SERVER;encrypt=false;";// acesso ao banco
    final private String usuario = "sa"; // preciso entender isso aqui
    final private String senha = "GALF"; // senha que não existe
    
    private Connection conexao; // variavel que guarda a conaxão com o banco, vai ser usada em todas as classes que tem conexão com o banco
    
    public Statement statement; // variavel que executa os comandos sql aqui
    public ResultSet resultset; // variavel que guarda o resultado da execução de um comnado sql
    
    public boolean conecta() // basicamente checagem do sistema e se foi conectado ou não 
    {
        boolean result = true;
        
        try
        {
            Class.forName(driver);
            conexao = DriverManager.getConnection(url, usuario, senha);
            
            JOptionPane.showMessageDialog(null,"Conexão Estabelecida","Mensagem do programa",JOptionPane.INFORMATION_MESSAGE );  
        }
        catch (ClassNotFoundException Driver)
        {
            JOptionPane.showMessageDialog(null, "Driver não localizado"+Driver,"Mensagem do Programa", JOptionPane.INFORMATION_MESSAGE);
            result = false;
        }
        catch (SQLException SqlErro) 
        { 
        JOptionPane.showMessageDialog(null, "Erro de Conexão com o Banco: " + SqlErro.getMessage(), "Mensagem do Programa", JOptionPane.ERROR_MESSAGE);
        result = false;
        }
        return result;
    }
    
    public void desconecta() // desconecta o banco do sistema
    {
        try
        {
            conexao.close();
            JOptionPane.showMessageDialog(null, "Conexão com o banco finalizada", "Mensagem do programa", JOptionPane.INFORMATION_MESSAGE);
        }
        catch (SQLException fecha)
        {
            
        }
        
    }
    
    public void executaSQL (String sql)
    {
        try
        {
            statement = conexao.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
            resultset = statement.executeQuery(sql);
        }
        catch (SQLException excecao)
        {
            JOptionPane.showMessageDialog(null, "Erro no SQL! \n Erro: "+excecao,"Mensagem do Programa", JOptionPane.INFORMATION_MESSAGE);
        }
    }
    
}
