<%@ tag pageEncoding="UTF-8" %>
<%@ include file="../../../baseAttr.tag" %>
<%@taglib prefix="cd" tagdir="/WEB-INF/tags/application/code" %>

<%@ attribute name="cssClass" required="false" rtexprvalue="true" %>
<%@ attribute name="name" required="false" rtexprvalue="true" %>
<%@ attribute name="id" required="false" rtexprvalue="true" %>

<cd:code-example-decorator>
<pre class="prettyprint">
    <code class="language-javascript">
  const e = React.createElement;
  
  // Отображение кнопки "Like"
  return e(
    'button',
    { onClick: () => this.setState({ liked: true }) },
    'Like'
  );
    </code>
</pre>
</cd:code-example-decorator>