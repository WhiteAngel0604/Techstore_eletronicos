/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package conexao;
package controle;

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
    public class frmTela extends javax.swing.JFrame {

    // Construtor da Tela
    public frmTela() {
        initComponents();
        con_cliente = new Conexao();
        con_cliente.conecta();
        con_cliente.executaSQL("select * from tbclientes order by cod");
        preencherTabela();
        posicionarRegistro();
        tblClientes.setAutoCreateRowSorter(true);    //ativa a classificação ordenada da tabela
    } 

    // Método preencherTabela (AGORA FORA DO CONSTRUTOR)
    public void preencherTabela() {
        tblClientes.getColumnModel().getColumn(0).setPreferredWidth(4);
        tblClientes.getColumnModel().getColumn(1).setPreferredWidth(150);
        tblClientes.getColumnModel().getColumn(2).setPreferredWidth(11);
        tblClientes.getColumnModel().getColumn(3).setPreferredWidth(14);
        tblClientes.getColumnModel().getColumn(4).setPreferredWidth(100);

        DefaultTableModel modelo = (DefaultTableModel) tblClientes.getModel();
        modelo.setNumRows(0);

        try {
            con_cliente.resultset.beforeFirst();
            while (con_cliente.resultset.next()) {
                modelo.addRow(new Object[]{
                    con_cliente.resultset.getString("cod"), 
                    con_cliente.resultset.getString("nome") // Complete o restante dos campos aqui
                });
            }
        } catch (SQLException erro) {
            JOptionPane.showMessageDialog(null, "\n Erro ao listar dados da tabela!! :\n" + erro);
        }
    }
        public void posicionarRegistro() [
        try {
            con_cliente.resultset.first(); //posiciona no 1° registro da tabeça
            mostrar_Dados();
        }catch(SQLException erro){
        JOptionPane.showMessageDialog(null,"Não foi possível posicionar no primeiro registro: "+erro,"Mensagem do Programa",JOptionPane.INFORMATION_MESSAGE);
}

public void mostrar_Dados(); {
    try {
        txtCod.setText(con_cliente.resultset.getString("cod")); //Associar a caixa de texto ao campo cod
        txtNome.setText(con_cliente.resultset.getString("nome")); //Associar a caixa de texto ao campo nome
        txtNasc.setText(con_cliente.resultset.getString("dt_nasc")); 
        txtFone.setText(con_cliente.resultset.getString("telefone"));
        txtEmail.setText(con_cliente.resultset.getString("email"));
    }catch (SQLException erro){
        JOptionPane.showMessageDialog(null,"Não localizou dados: "+erro,"Mensagem do Programa",JOptionPane.INFORMATION_MESSAGE);
    }
public static void main(String args[]) {
    }
} // <-- Esta chave fecha a classe frmTela por completo
}

