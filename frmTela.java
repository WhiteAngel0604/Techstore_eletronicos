/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controle;

import javax.swing.JOptionPane;
import java.sql.*;
import javax.swing.table.DefaultTableModel;
/**
 *
 * @author Admin
 */
public class frmTela extends javax.swing.JFrame {

    // Construtor da Tela
    public frmTela() {
        initComponents();
        con_cliente = new Conexao();
        con_cliente.conecta();
        con_cliente.executaSQL("select * from tbclientes order by cod");
        preencherTabela();
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
} // <-- Esta chave fecha a classe frmTela por completo
