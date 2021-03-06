<%@ tag pageEncoding="UTF-8" %>
<%@ include file="../../../baseAttr.tag" %>
<%@taglib prefix="cd" tagdir="/WEB-INF/tags/application/code" %>

<%@ attribute name="cssClass" required="false" rtexprvalue="true" %>
<%@ attribute name="name" required="false" rtexprvalue="true" %>
<%@ attribute name="id" required="false" rtexprvalue="true" %>

<cd:code-example-decorator>
<pre class="prettyprint">
    <code class="language-javascript">
  class Foo extends Component {
    // Замечание: данный синтаксис экспериментальный и пока не стандартизирован.
    
    handleClick = () =&gt; {
      console.log('Click happened');
    }
    
    render() {
      return &lt;button onClick={this.handleClick}&gt;Click Me&lt;/button&gt;;
    }
  }
    </code>
</pre>
</cd:code-example-decorator>
