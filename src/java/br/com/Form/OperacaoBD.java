/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.Form;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author macuser
 */
public class OperacaoBD implements Serializable {

    public OperacaoBD() {
    }

    public void atualizar(String sQuery, Statement st, Connection conexao) throws SQLException, Exception {
        if (conexao != null) {
            int result = st.executeUpdate(sQuery);
        } else {
            System.err.println("OperacaoBD >> Erro: nao foi possivel conectar");
        }

    }

    public ResultSet consultar(String sQuery, Statement st, Connection conexao) throws SQLException, Exception {
        ResultSet retorno = null;

        if (conexao != null) {
            retorno = st.executeQuery(sQuery);
            return retorno;
        }
        return null;
    }

    public void iniciarTransacao(Connection conexao) throws SQLException {
        if (conexao != null) {
            conexao.setAutoCommit(false);
        } else {
            System.err.println("OperacaoBD >> Erro: nao foi possivel conectar");
        }

    }

    public void finalizarTransacao(Connection conexao) throws SQLException {
        if (conexao != null) {
            conexao.commit();
            conexao.setAutoCommit(true);
        } else {
            System.err.println("OperacaoBD >> Erro: nao foi possivel conectar");
        }
    }

    public void rollbackTransacao(Connection conexao) throws SQLException {
        if (conexao != null) {
            conexao.rollback();
            conexao.setAutoCommit(true);
        } else {
            System.err.println("OperacaoBD >> Erro: nao foi possivel conectar");
        }
    }
}
