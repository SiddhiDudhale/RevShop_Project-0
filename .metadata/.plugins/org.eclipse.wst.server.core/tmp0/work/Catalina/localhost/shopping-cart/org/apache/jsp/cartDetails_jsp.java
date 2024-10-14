/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/10.1.24
 * Generated at: 2024-09-14 08:58:15 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.jsp.*;
import com.revature.service.impl.*;
import com.revature.service.*;
import com.revature.beans.*;
import java.util.*;
import jakarta.servlet.ServletOutputStream;
import java.io.*;

public final class cartDetails_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports,
                 org.apache.jasper.runtime.JspSourceDirectives {

  private static final jakarta.servlet.jsp.JspFactory _jspxFactory =
          jakarta.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.LinkedHashSet<>(8);
    _jspx_imports_packages.add("com.revature.service.impl");
    _jspx_imports_packages.add("com.revature.beans");
    _jspx_imports_packages.add("java.util");
    _jspx_imports_packages.add("jakarta.servlet");
    _jspx_imports_packages.add("com.revature.service");
    _jspx_imports_packages.add("java.io");
    _jspx_imports_packages.add("jakarta.servlet.http");
    _jspx_imports_packages.add("jakarta.servlet.jsp");
    _jspx_imports_classes = new java.util.LinkedHashSet<>(1);
    _jspx_imports_classes.add("jakarta.servlet.ServletOutputStream");
  }

  private volatile jakarta.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public boolean getErrorOnELNotFound() {
    return false;
  }

  public jakarta.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final jakarta.servlet.http.HttpServletRequest request, final jakarta.servlet.http.HttpServletResponse response)
      throws java.io.IOException, jakarta.servlet.ServletException {

    if (!jakarta.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      final java.lang.String _jspx_method = request.getMethod();
      if ("OPTIONS".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        return;
      }
      if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSPs only permit GET, POST or HEAD. Jasper also permits OPTIONS");
        return;
      }
    }

    final jakarta.servlet.jsp.PageContext pageContext;
    jakarta.servlet.http.HttpSession session = null;
    final jakarta.servlet.ServletContext application;
    final jakarta.servlet.ServletConfig config;
    jakarta.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    jakarta.servlet.jsp.JspWriter _jspx_out = null;
    jakarta.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=ISO-8859-1");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<title>Cart Details</title>\r\n");
      out.write("<meta charset=\"utf-8\">\r\n");
      out.write("<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\r\n");
      out.write("<link rel=\"stylesheet\"\r\n");
      out.write("    href=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css\">\r\n");
      out.write("<link rel=\"stylesheet\" href=\"css/changes.css\">\r\n");
      out.write("<script\r\n");
      out.write("    src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js\"></script>\r\n");
      out.write("<script\r\n");
      out.write("    src=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js\"></script>\r\n");
      out.write("<link rel=\"stylesheet\"\r\n");
      out.write("    href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css\">\r\n");
      out.write("</head>\r\n");
      out.write("<body style=\"background-color: #E6F9E6;\">\r\n");
      out.write("\r\n");
      out.write("    ");

    /* Checking the user credentials */
    String userName = (String) session.getAttribute("username");
    String password = (String) session.getAttribute("password");

    if (userName == null || password == null) {
        response.sendRedirect("login.jsp?message=Session Expired, Login Again!!");
    }

    String addS = request.getParameter("add");
    if (addS != null) {
        int add = Integer.parseInt(addS);
        String uid = request.getParameter("uid");
        String pid = request.getParameter("pid");
        int avail = Integer.parseInt(request.getParameter("avail"));
        int cartQty = Integer.parseInt(request.getParameter("qty"));
        CartServiceImpl cart = new CartServiceImpl();

        if (add == 1) {
            // Add Product into the cart
            cartQty += 1;
            if (cartQty <= avail) {
                cart.addProductToCart(uid, pid, 1);
            } else {
                response.sendRedirect("./AddtoCart?pid=" + pid + "&pqty=" + cartQty);
            }
        } else if (add == 0) {
            // Remove Product from the cart
            cart.removeProductFromCart(uid, pid);
        }
    }
    
      out.write("\r\n");
      out.write("\r\n");
      out.write("    ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "header.jsp", out, false);
      out.write("\r\n");
      out.write("\r\n");
      out.write("    <div class=\"text-center\"\r\n");
      out.write("        style=\"color: green; font-size: 24px; font-weight: bold;\">Cart\r\n");
      out.write("        Items</div>\r\n");
      out.write("\r\n");
      out.write("    <!-- Start of Product Items List -->\r\n");
      out.write("    <div class=\"container\">\r\n");
      out.write("        <table class=\"table table-hover\">\r\n");
      out.write("            <thead\r\n");
      out.write("                style=\"background-color: #186188; color: white; font-size: 16px; font-weight: bold;\">\r\n");
      out.write("                <tr>\r\n");
      out.write("                    <th>Picture</th>\r\n");
      out.write("                    <th>Products</th>\r\n");
      out.write("                    <th>Price</th>\r\n");
      out.write("                    <th>Quantity</th>\r\n");
      out.write("                    <th>Add</th>\r\n");
      out.write("                    <th>Remove</th>\r\n");
      out.write("                    <th>Amount</th>\r\n");
      out.write("                </tr>\r\n");
      out.write("            </thead>\r\n");
      out.write("            <tbody\r\n");
      out.write("                style=\"background-color: white; font-size: 15px; font-weight: bold;\">\r\n");
      out.write("                ");

                CartServiceImpl cart = new CartServiceImpl();
                List<CartBean> cartItems = cart.getAllCartItems(userName);
                double totAmount = 0;
                for (CartBean item : cartItems) {
                    String prodId = item.getProdId();
                    int prodQuantity = item.getQuantity();
                    ProductBean product = new ProductServiceImpl().getProductDetails(prodId);
                    double currAmount = product.getProdPrice() * prodQuantity;
                    totAmount += currAmount;

                    if (prodQuantity > 0) {
                
      out.write("\r\n");
      out.write("                <tr>\r\n");
      out.write("                    <td><img src=\"./ShowImage?pid=");
      out.print(product.getProdId());
      out.write("\"\r\n");
      out.write("                        style=\"width: 50px; height: 50px;\"></td>\r\n");
      out.write("                    <td>");
      out.print(product.getProdName());
      out.write("</td>\r\n");
      out.write("                    <td>");
      out.print(product.getProdPrice());
      out.write("</td>\r\n");
      out.write("                    <td><form method=\"post\" action=\"./UpdateToCart\">\r\n");
      out.write("                            <input type=\"number\" name=\"pqty\" value=\"");
      out.print(prodQuantity);
      out.write("\"\r\n");
      out.write("                                style=\"max-width: 70px;\" min=\"0\"> <input type=\"hidden\"\r\n");
      out.write("                                name=\"pid\" value=\"");
      out.print(product.getProdId());
      out.write("\"> <input\r\n");
      out.write("                                type=\"submit\" name=\"Update\" value=\"Update\"\r\n");
      out.write("                                style=\"max-width: 80px;\">\r\n");
      out.write("                        </form></td>\r\n");
      out.write("                    <td><a\r\n");
      out.write("                        href=\"cartDetails.jsp?add=1&uid=");
      out.print(userName);
      out.write("&pid=");
      out.print(product.getProdId());
      out.write("&avail=");
      out.print(product.getProdQuantity());
      out.write("&qty=");
      out.print(prodQuantity);
      out.write("\"><i\r\n");
      out.write("                            class=\"fa fa-plus\"></i></a></td>\r\n");
      out.write("                    <td><a\r\n");
      out.write("                        href=\"cartDetails.jsp?add=0&uid=");
      out.print(userName);
      out.write("&pid=");
      out.print(product.getProdId());
      out.write("&avail=");
      out.print(product.getProdQuantity());
      out.write("&qty=");
      out.print(prodQuantity);
      out.write("\"><i\r\n");
      out.write("                            class=\"fa fa-minus\"></i></a></td>\r\n");
      out.write("                    <td>");
      out.print(currAmount);
      out.write("</td>\r\n");
      out.write("                </tr>\r\n");
      out.write("                ");

                    }
                }
                
      out.write("\r\n");
      out.write("                <tr style=\"background-color: grey; color: white;\">\r\n");
      out.write("                    <td colspan=\"6\" style=\"text-align: center;\">Total Amount to\r\n");
      out.write("                        Pay (in Rupees)</td>\r\n");
      out.write("                    <td>");
      out.print(totAmount);
      out.write("</td>\r\n");
      out.write("                </tr>\r\n");
      out.write("                ");

                if (totAmount != 0) {
                
      out.write("\r\n");
      out.write("                <tr style=\"background-color: grey; color: white;\">\r\n");
      out.write("                    <td colspan=\"4\" style=\"text-align: center;\">\r\n");
      out.write("                    <td><form method=\"post\">\r\n");
      out.write("                            <button formaction=\"userHome.jsp\"\r\n");
      out.write("                                style=\"background-color: black; color: white;\">Cancel</button>\r\n");
      out.write("                        </form></td>\r\n");
      out.write("                    <td colspan=\"2\" align=\"center\"><form method=\"post\">\r\n");
      out.write("                            <button style=\"background-color: blue; color: white;\"\r\n");
      out.write("                                formaction=\"payment.jsp?amount=");
      out.print(totAmount);
      out.write("\">Pay Now</button>\r\n");
      out.write("                        </form></td>\r\n");
      out.write("                </tr>\r\n");
      out.write("                ");

                }
                
      out.write("\r\n");
      out.write("            </tbody>\r\n");
      out.write("        </table>\r\n");
      out.write("    </div>\r\n");
      out.write("    <!-- End of Product Items List -->\r\n");
      out.write("\r\n");
      out.write("    ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "footer.html", out, false);
      out.write("\r\n");
      out.write("\r\n");
      out.write("</body>\r\n");
      out.write("</html>\r\n");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof jakarta.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
