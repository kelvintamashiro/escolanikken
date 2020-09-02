/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.Action;

import br.com.ConnectionPool.JDCConnectionDriver;
import br.com.Util.VerificaSessaoUsuario;
import br.com.abre.Util.Errors;
import br.com.abre.Util.UsuarioSessaoUtil;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionError;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author macuser
 */
public abstract class IDRAction extends Action {

    protected static JDCConnectionDriver connectionPool;
    protected boolean requerAutorizacao;
    protected UsuarioSessaoUtil usuario;

    public IDRAction() {
        requerAutorizacao = true;
    }

    public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) {
        ActionErrors actionErrors = new ActionErrors();
        Errors errors = new Errors();
        ActionForward forward = null;

        try {
            ServletContext context = super.getServlet().getServletContext();
            connectionPool = (JDCConnectionDriver) context.getAttribute("POOL");//Obtendo a referencia do Pool de Conexoes
            if (connectionPool == null) {
                throw new IllegalArgumentException();
            } else {
                String action = request.getParameter("action");
                if (action == null) {
                    action = "page";
                }
                usuario = new UsuarioSessaoUtil(request.getSession());
                forward = this.execute(mapping, form, request, response, errors, action);
            }
        } catch (IllegalArgumentException ex) {
            ex.printStackTrace();
            actionErrors.add(ActionErrors.GLOBAL_ERROR, new ActionError("error.usuarionaoConectado"));
            forward = mapping.findForward("nonConnected");
        } catch (Exception ex) {
            ex.printStackTrace();
        }

        //Salva os erros
        errors.save(request);

        if (!actionErrors.isEmpty()) {
            saveErrors(request, actionErrors);
        }
        return forward;

    }

    public abstract ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
            HttpServletResponse response, Errors errors, String action);
}
