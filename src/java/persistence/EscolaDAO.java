package persistence;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Escola;
import model.EscolaOfertas;

/**
 *
 * @author Pietro
 * @author Bianca
 */
public class EscolaDAO {

    private Connection connection;

    public EscolaDAO() throws DAOException {
        this.connection = ConnectionFactory.getConnection();
    }

    /**
     * Recupera a lista de escolas de um dado Município
     * 
     * @param String codigoMunicipio    : código do município
     * 
     * @return uma List<Escola> com as escolas recuperadas do banco
     */
    public List<Escola> listar(String codigoMunicipio) {

        List<Escola> escolas = new ArrayList<>();

        try {

            String sql = "SELECT e.co_escola, e.nome_escola FROM escola e ";
            sql += "WHERE e.co_distrito IN (";
            sql += "SELECT d.co_distrito FROM distrito d ";
            sql += "WHERE d.co_municipio = " + codigoMunicipio + ")";
            sql += "ORDER BY e.nome_escola";

            PreparedStatement stmt = connection.prepareStatement(sql);

            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Escola e = new Escola();
                e.setCodigo(rs.getInt("co_escola"));
                e.setNome(rs.getString("nome_escola"));

                escolas.add(e);
            }

        } catch (SQLException ex) {
            Logger.getLogger(EstadoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return escolas;

    }


    /**
     * Recupera o JSON para utilização da DataTable das Escolas
     * 
     * @param String codigoEstado       : código do Estado
     * @param String campoBusca         : campo digitado na busca
     * @param String limit              : número de itens por página
     * @param String offset             : "deslocamento" para o SELECT
     * @param String draw               
     * @param String qtdEscolasEstado   : quantidade total de escolas, fornecida pela sessão
     * 
     * @return uma String contendo o JSON
     * 
     */
    public String listarPorEstadoJSON(String codigoEstado, String campoBusca, String limit, String offset, String draw, String qtdEscolasEstado, String orderColumn, String orderDirection) {

        List<Escola> escolas = new ArrayList<>();
        String json = "";

        try {
            
            /**
             * COM LIMIT
             */

            String sql = "SELECT  e.co_escola, e.nome_escola, e.situacao_funcionamento, e.dependencia_adm, ";
            sql += "e.bercario, e.creche, e.pre_escola, e.ens_fundamental_anos_iniciais, ";
            sql += "e.ens_fundamental_anos_finais, e.ens_medio_normal, e.ens_medio_integrado ";
            sql += "FROM escola e ";
            sql += "WHERE e.co_distrito IN (";
            sql += "SELECT d.co_distrito ";
            sql += "FROM distrito d ";
            sql += "WHERE d.co_municipio IN (";
            sql += "SELECT m.co_municipio ";
            sql += "FROM municipio m ";
            sql += "WHERE m.co_microrregiao IN (";
            sql += "SELECT mi.co_microrregiao ";
            sql += "FROM microrregiao mi ";
            sql += "WHERE mi.co_mesorregiao IN (";
            sql += "SELECT me.co_mesorregiao ";
            sql += "FROM mesorregiao me ";
            sql += "WHERE me.co_uf = " + codigoEstado;
            sql += ")";
            sql += ")";
            sql += ")";
            sql += ")";
            
            // =======================================================
            // Caso o usuário tenha digitado algo no campo de busca
            // =======================================================

            if (!campoBusca.isEmpty()) {
                sql += "AND e.nome_escola ILIKE '%"+campoBusca+"%' ";
            }
            
            // =======================================================
            // Ordenação
            // =======================================================
            
            switch (orderColumn) {
                case "0":
                    sql += "ORDER BY e.co_escola "+orderDirection+" ";
                    break;
                case "1":
                    sql += "ORDER BY e.nome_escola "+orderDirection+" ";
                    break;
                case "2":
                    sql += "ORDER BY e.situacao_funcionamento "+orderDirection+" ";
                    break;
                case "3":
                    sql += "ORDER BY e.dependencia_adm "+orderDirection+" ";
                    break;
                default:
                    sql += "ORDER BY e.qtd_funcionarios ";
                    break;
            }
            
            // =======================================================
            // LIMIT e OFFSET para paginação
            // =======================================================
            
            sql += "LIMIT "+limit+" OFFSET "+offset;
            

            PreparedStatement stmt = connection.prepareStatement(sql);

            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Escola e = new Escola();
                EscolaOfertas eo = new EscolaOfertas();

                e.setCodigo(rs.getInt("co_escola"));
                e.setNome(rs.getString("nome_escola"));
                e.setSituacaoFuncionamento(rs.getString("situacao_funcionamento"));
                e.setDependenciaAdm(rs.getString("dependencia_adm"));

                eo.setBercario(rs.getBoolean("bercario"));
                eo.setCreche(rs.getBoolean("creche"));
                eo.setPreEscola(rs.getBoolean("pre_escola"));
                eo.setEFI(rs.getBoolean("ens_fundamental_anos_iniciais"));
                eo.setEFII(rs.getBoolean("ens_fundamental_anos_finais"));
                eo.setEMN(rs.getBoolean("ens_medio_normal"));
                eo.setEMI(rs.getBoolean("ens_medio_integrado"));

                e.setEo(eo);

                escolas.add(e);
            }


            /**
             * SEM LIMIT (para contar os elementos)
             */
            
            sql = "SELECT count(e.co_escola) AS total ";
            sql += "FROM escola e ";
            sql += "WHERE e.co_distrito IN (";
            sql += "SELECT d.co_distrito ";
            sql += "FROM distrito d ";
            sql += "WHERE d.co_municipio IN (";
            sql += "SELECT m.co_municipio ";
            sql += "FROM municipio m ";
            sql += "WHERE m.co_microrregiao IN (";
            sql += "SELECT mi.co_microrregiao ";
            sql += "FROM microrregiao mi ";
            sql += "WHERE mi.co_mesorregiao IN (";
            sql += "SELECT me.co_mesorregiao ";
            sql += "FROM mesorregiao me ";
            sql += "WHERE me.co_uf = " + codigoEstado;
            sql += ")";
            sql += ")";
            sql += ")";
            sql += ")";
            
            // =======================================================
            // Caso o usuário tenha digitado algo no campo de busca
            // =======================================================

            if (!campoBusca.isEmpty()) {
                sql += "AND e.nome_escola ILIKE '%"+campoBusca+"%' ";
            }
            
            stmt = connection.prepareStatement(sql);

            rs = stmt.executeQuery();
            rs.next();
            
            Integer qtdSemLimit = rs.getInt("total");

            
            /**
             * CRIA O JSON
             */
            
            String data = "";
            
            if (!escolas.isEmpty()) {
                
                int total = escolas.size();
                int i = 1;
                
                for (Escola escola : escolas) {
                    
                    data += "["+
                            "\""+ escola.getCodigo() +"\", "+
                            "\""+ escola.getNome() +"\", "+
                            "\""+ escola.getSituacaoFuncionamento() +"\", "+
                            "\""+ escola.getDependenciaAdm() +"\""+
                        "]";
                    if (i < total)
                        data += ",";
                    
                    i++;
                }
                
            }
            
            json = "{"+
                "\"draw\": " + draw + ","+
                "\"recordsTotal\": " + qtdEscolasEstado + ","+     // o total é o valor de 'qtd_escolas_estado' na sessão
                "\"recordsFiltered\": " + qtdSemLimit.toString() + ","+
                "\"data\": ["+
                    data +
                "]"+ // fechamento do data
            "}"; // fechamento do json
            

        } catch (SQLException ex) {
            Logger.getLogger(EstadoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
        return json;

    }
    
    
    /**
     * Recupera a quantidade de escolas em um Estado
     * 
     * @param String codigoEstado   : código do estado
     * 
     * @return um Integer com o número de escolas
     */
    public Integer contarEscolasEstado(String codigoEstado) {
        
        Integer total = 0;
        
        try {

            String sql = "SELECT count(e.co_escola) AS total FROM escola e ";
            sql += "WHERE e.co_distrito IN (";
            sql += "SELECT d.co_distrito ";
            sql += "FROM distrito d ";
            sql += "WHERE d.co_municipio IN (";
            sql += "SELECT m.co_municipio ";
            sql += "FROM municipio m ";
            sql += "WHERE m.co_microrregiao IN (";
            sql += "SELECT mi.co_microrregiao ";
            sql += "FROM microrregiao mi ";
            sql += "WHERE mi.co_mesorregiao IN (";
            sql += "SELECT me.co_mesorregiao ";
            sql += "FROM mesorregiao me ";
            sql += "WHERE me.co_uf = " + codigoEstado;
            sql += ")";
            sql += ")";
            sql += ")";
            sql += "); ";

            PreparedStatement stmt = connection.prepareStatement(sql);

            ResultSet rs = stmt.executeQuery();
            rs.next();
            total = rs.getInt("total");

        } catch (SQLException ex) {
            Logger.getLogger(EstadoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return total;
    }

}
