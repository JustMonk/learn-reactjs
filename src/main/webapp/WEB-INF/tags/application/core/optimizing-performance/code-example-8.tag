<%@ tag pageEncoding="UTF-8" %>
<%@ include file="../../../baseAttr.tag" %>
<%@taglib prefix="cd" tagdir="/WEB-INF/tags/application/code" %>

<%@ attribute name="cssClass" required="false" rtexprvalue="true" %>
<%@ attribute name="name" required="false" rtexprvalue="true" %>
<%@ attribute name="id" required="false" rtexprvalue="true" %>
<%@ attribute name="codePenUrl" required="false" rtexprvalue="true"%>

<cd:code-example-decorator codePenUrl="${codePenUrl}">
  <pre class="prettyprint">
    <code class="language-javascript">
  plugins: [
    // ...
    require('rollup-plugin-replace')({
      'process.env.NODE_ENV': JSON.stringify('production')
    }),
    require('rollup-plugin-commonjs')(),
    require('rollup-plugin-uglify')(),
    // ...
  ]</code>
  </pre>
</cd:code-example-decorator>