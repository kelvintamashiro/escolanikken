/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.Dao;

import br.com.Form.AlunoForm;
import br.com.Form.NotaItinerarioForm;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author macuser
 */
public class NotaItinerarioDao {

    private static NotaItinerarioDao notaProjeto = null;

    public static final NotaItinerarioDao getInstance() {
        if (notaProjeto == null) {
            notaProjeto = new NotaItinerarioDao();
        }
        return notaProjeto;
    }

    public List<NotaItinerarioForm> obterItinerariosPorProfessor(Connection conn, String idProfessor) throws SQLException {
        List<NotaItinerarioForm> listaDisciplinaPorProfessor = new ArrayList<>();
        String query = "select i.id_itinerario, i.id_serie_ano, i.categoria_ensino, i.nome_itinerario, i.id_professor, pf.nome, ds.descricao "
                + " from itinerario i, pessoa_fisica pf, descricao_serie_ano ds"
                + " where i.id_professor = pf.id"
                + " and i.id_serie_ano = ds.id"
                + " and i.id_professor = ?"
                + " order by i.categoria_ensino, i.id_serie_ano, i.nome_itinerario";
        PreparedStatement prep = conn.prepareStatement(query);
        prep.setString(1, idProfessor);
        ResultSet rs = prep.executeQuery();
        while (rs.next()) {
            NotaItinerarioForm notaItinerarioForm = new NotaItinerarioForm();
            notaItinerarioForm.setIdItinerario(rs.getInt("id_itinerario"));
            notaItinerarioForm.setIdSerieAno(rs.getInt("id_serie_ano"));
            notaItinerarioForm.setDsSerieAno(rs.getString("descricao"));
            notaItinerarioForm.setCategoriaEnsino(rs.getString("categoria_ensino"));
            notaItinerarioForm.setNomeItinerario(rs.getString("nome_itinerario"));
            notaItinerarioForm.setIdProfessor(rs.getInt("id_professor"));
            notaItinerarioForm.setNomeProfessor(rs.getString("nome"));

            listaDisciplinaPorProfessor.add(notaItinerarioForm);
        }
        rs.close();
        prep.close();

        return listaDisciplinaPorProfessor;
    }

    public ArrayList<AlunoForm> obterListaAlunosPorSerieSemNotasItinerario(Connection conn, String idSerieAno, int anoVigente, String bimestre, int idItinerario) throws SQLException {
        ArrayList<AlunoForm> listaAlunos = new ArrayList<>();
        String query = "select pf.id, pf.nome, ia.id_serie, ni.id, ni.id_itinerario, ni.nr_bimestre, ni.ano, ni.falta, ni.nota"
                + " from pessoa_fisica pf, itinerario_alunos ia "
                + " left join nota_itinerario ni "
                + " on ia.id_aluno = ni.id_aluno"
                + " and ni.id_itinerario = ?"
                + " and ni.ano = ?"
                + " and ni.nr_bimestre = ?"
                + " where pf.id = ia.id_aluno"
                + " and ia.id_itinerario = ?"
                + " and ia.id_serie = ?"
                + " and ni.id_itinerario is null"
                + " and ia.ano = ?"
                + " and pf.status = 1";

        PreparedStatement prep = conn.prepareStatement(query);
        prep.setInt(1, idItinerario);
        prep.setInt(2, anoVigente);
        prep.setString(3, bimestre);
        prep.setInt(4, idItinerario);
        prep.setString(5, idSerieAno);
        prep.setInt(6, anoVigente);
        ResultSet rs = prep.executeQuery();
        while (rs.next()) {
            AlunoForm aForm = new AlunoForm();
            aForm.setIdPF(rs.getInt("id"));
            aForm.setNome(rs.getString("nome"));
            aForm.setSerieAno(rs.getInt("id_serie"));
            listaAlunos.add(aForm);
        }
        rs.close();
        prep.close();

        return listaAlunos;
    }

    public ArrayList<NotaItinerarioForm> obterListaAlunosPorSerieComNotasItinerario(Connection conn, String idSerieAno, int anoVigente, String bimestre, int idItinerario) throws SQLException {
        ArrayList<NotaItinerarioForm> listaAlunos = new ArrayList<>();
        String query = "select pf.id, pf.nome, ia.id_serie, ni.id as idNotaItinerario, ni.id_itinerario, ni.nr_bimestre, ni.ano, ni.falta, ni.nota"
                + " from pessoa_fisica pf, itinerario_alunos ia "
                + " left join nota_itinerario ni "
                + " on ia.id_aluno = ni.id_aluno"
                + " and ni.id_itinerario = ?"
                + " and ni.ano = ?"
                + " and ni.nr_bimestre = ?"
                + " where pf.id = ia.id_aluno"
                + " and ia.id_itinerario = ?"
                + " and ia.id_serie = ?"
                + " and ni.id_itinerario is not null";

        PreparedStatement prep = conn.prepareStatement(query);
        prep.setInt(1, idItinerario);
        prep.setInt(2, anoVigente);
        prep.setString(3, bimestre);
        prep.setInt(4, idItinerario);
        prep.setString(5, idSerieAno);
        ResultSet rs = prep.executeQuery();
        while (rs.next()) {
            NotaItinerarioForm notaItinerarioForm = new NotaItinerarioForm();
            notaItinerarioForm.setIdAluno(rs.getInt("id"));
            notaItinerarioForm.setNomeAluno(rs.getString("nome"));
            notaItinerarioForm.setIdSerieAno(rs.getInt("id_serie"));
            notaItinerarioForm.setIdNotaItinerario(rs.getInt("idNotaItinerario"));
            notaItinerarioForm.setIdItinerario(rs.getInt("id_itinerario"));
            notaItinerarioForm.setNrBimestre(rs.getInt("nr_bimestre"));
            notaItinerarioForm.setAno(rs.getInt("ano"));
            notaItinerarioForm.setNotaBimestral(rs.getString("nota"));

            listaAlunos.add(notaItinerarioForm);
        }
        rs.close();
        prep.close();

        return listaAlunos;
    }

    public void lancarNota(Connection conn, NotaItinerarioForm notaItinerarioForm) throws SQLException {
        String query = "INSERT INTO nota_itinerario (id_itinerario, id_aluno, nr_bimestre, ano, serie_ano, nota) VALUES (?,?,?,?,?,?)";
        PreparedStatement prep = conn.prepareStatement(query);
        prep.setInt(1, notaItinerarioForm.getIdItinerario());
        prep.setInt(2, notaItinerarioForm.getIdAluno());
        prep.setInt(3, notaItinerarioForm.getNrBimestre());
        prep.setInt(4, notaItinerarioForm.getAno());
        prep.setInt(5, notaItinerarioForm.getIdSerieAno());
        prep.setString(6, notaItinerarioForm.getNotaBimestral());
        prep.execute();
        prep.close();
    }

    public void excluirNota(Connection conn, NotaItinerarioForm notaItinerarioForm) throws SQLException {
        String query = "DELETE FROM nota_itinerario WHERE id=?";
        PreparedStatement prep = conn.prepareStatement(query);
        prep.setInt(1, notaItinerarioForm.getIdNotaItinerario());
        prep.execute();
        prep.close();
    }

    public List<NotaItinerarioForm> obterItinerariosAluno(Connection conn, int idAluno) throws SQLException {
        List<NotaItinerarioForm> listaItinerarios = new ArrayList<>();
        String query = "select i.id_itinerario, i.nome_itinerario"
                + " from nota_itinerario n, itinerario i"
                + " where n.id_itinerario = i.id_itinerario"
                + " and n.id_aluno = ?"
                + " group by i.id_itinerario"
                + " order by i.nome_itinerario";

        PreparedStatement prep = conn.prepareStatement(query);
        prep.setInt(1, idAluno);
        ResultSet rs = prep.executeQuery();
        while (rs.next()) {
            NotaItinerarioForm notaItinerarioForm = new NotaItinerarioForm();
            notaItinerarioForm.setIdItinerario(rs.getInt("id_itinerario"));
            notaItinerarioForm.setNomeItinerario(rs.getString("nome_itinerario"));
            listaItinerarios.add(notaItinerarioForm);
        }
        rs.close();
        prep.close();

        return listaItinerarios;
    }

    public NotaItinerarioForm obterNotasFaltasPorItinerarioAluno(Connection conn, int idAluno, int ano, int idSerieAno, int idItinerario) throws SQLException {
        String query = "select *"
                + " from nota_itinerario n, itinerario i"
                + " where n.id_itinerario = i.id_itinerario"
                + " and n.id_aluno = ?"
                + " and n.ano = ?"
                + " and n.serie_ano = ?"
                + " and n.id_itinerario = ?";
        PreparedStatement prep = conn.prepareCall(query);
        prep.setInt(1, idAluno);
        prep.setInt(2, ano);
        prep.setInt(3, idSerieAno);
        prep.setInt(4, idItinerario);
        ResultSet rs = prep.executeQuery();
        NotaItinerarioForm notaItinerarioForm = new NotaItinerarioForm();
        while (rs.next()) {
            notaItinerarioForm.setNomeItinerario(rs.getString("nome_itinerario"));
            notaItinerarioForm.setIdItinerario(rs.getInt("id_itinerario"));
            int nrBimestre = rs.getInt("nr_bimestre");
            notaItinerarioForm.setNrBimestre(nrBimestre);
            int qtdFalta = this.obterFaltasListaPresenca(conn, idItinerario, ano, idAluno, idSerieAno, nrBimestre);
            switch (nrBimestre) {
                case 1:
                    notaItinerarioForm.setNotaBimestre1(rs.getDouble("nota"));
                    if (qtdFalta > 0) {
                        notaItinerarioForm.setFaltaBimestre1(qtdFalta);
                    } else {
                        notaItinerarioForm.setFaltaBimestre1(0);
                    }
                    break;
                case 2:
                    notaItinerarioForm.setNotaBimestre2(rs.getDouble("nota"));
                    if (qtdFalta > 0) {
                        notaItinerarioForm.setFaltaBimestre2(qtdFalta);
                    } else {
                        notaItinerarioForm.setFaltaBimestre2(0);
                    }
                    break;
                case 3:
                    notaItinerarioForm.setNotaBimestre3(rs.getDouble("nota"));
                    if (qtdFalta > 0) {
                        notaItinerarioForm.setFaltaBimestre3(qtdFalta);
                    } else {
                        notaItinerarioForm.setFaltaBimestre3(0);
                    }
                    break;
                case 4:
                    notaItinerarioForm.setNotaBimestre4(rs.getDouble("nota"));
                    if (qtdFalta > 0) {
                        notaItinerarioForm.setFaltaBimestre4(qtdFalta);
                    } else {
                        notaItinerarioForm.setFaltaBimestre4(0);
                    }
                    break;
                default:
                    break;
            }

        }
        rs.close();
        prep.close();

        return notaItinerarioForm;
    }

    private int obterFaltasListaPresenca(Connection conn, int idItinerario, int ano, int idAluno, int idSerieAno, int nrBimestre) throws SQLException {
        int qtdFalta = -1;
        String query = "select SUM(l.qtd_falta) as qtd_falta"
                + " from lista_presenca_itinerario l "
                + " where l.id_aluno = ?"
                + " and l.id_serie = ?"
                + " and l.nr_bimestre = ?"
                + " and l.id_itinerario = ?"
                + " and l.ano = ?"
                + " group by l.id_aluno";
        PreparedStatement prep = conn.prepareStatement(query);
        prep.setInt(1, idAluno);
        prep.setInt(2, idSerieAno);
        prep.setInt(3, nrBimestre);
        prep.setInt(4, idItinerario);
        prep.setInt(5, ano);
        ResultSet rs = prep.executeQuery();
        if (rs.next()) {
            qtdFalta = rs.getInt("qtd_falta");
        }
        rs.close();
        prep.close();

        return qtdFalta;
    }

}
