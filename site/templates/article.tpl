<?python from genshi import HTML ?>
<?python article = c.get_article() ?>
<?python top = "../../../" ?>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml"
      xmlns:py="http://genshi.edgewall.org/">
    <head>
        <title>${article.title}</title>
        <meta http-equiv="Content-type" content="text/html; charset=utf-8" />
        <meta name="author" content="${article.author}" />
        <meta name="keywords" content="${', '.join(article.tags)}" />
        <meta name="date" content="${article.created.isoformat()}" />
        <meta name="robots" content="index, follow" />
        <meta http-equiv="content-language" content="en" />
        <link rel="stylesheet" type="text/css" href="${top}css/all-min.css" />
        <link py:if="c.next" rel="next" href="${top}${c.next.get_deploy_path()}" />
        <link py:if="c.prev" rel="prev" href="${top}${c.prev.get_deploy_path()}" />
        <link rel="start" href="${top}" />
    </head>
    <body>
    <div id="wrap">
        <div id="header">
            <h1><a href="${top}">ein Blog</a></h1>
 	    <p class="claim">ramblings/betrachtungen</p>
            <ul py:def="navigation(node)" class="nav">
                <li class="prev">
                    <a py:if="c.prev" href="${top}${c.prev.get_deploy_path()}">${c.prev.get_article().title}</a>
                    <span py:if="not c.prev" class="disabled">zurück</span>
                </li>
                <li class="next">
                    <a py:if="c.next" href="${top}${c.next.get_deploy_path()}">${c.next.get_article().title}</a>
                    <span py:if="not c.next" class="disabled">weiter</span>
                </li>
                <li class="up"><a href="${top}${c.parent.get_deploy_path()}">Nach oben</a><br/>
                    <a href="${top}${c.parent.parent.parent.get_deploy_path()}">${c.parent.parent.parent.get_base_name()}</a> / 
                    <a href="${top}${c.parent.parent.get_deploy_path()}">${c.parent.parent.get_base_name()}</a> / 
                    <a href="${top}${c.parent.get_deploy_path()}">${c.parent.get_base_name()}</a>
                </li>
            </ul>
            ${navigation(c)}
        </div>
	<div id="main">
        <div class="article">
            <h2 class="title">${article.title}</h2>
            <div class="info">
                ${unicode(article.created.strftime("%A, %d. %B %Y"),"utf-8")}, 
                <ul class="tags" py:if="article.tags">
		    <li>Tags:</li>
                    <li py:for="i, tag in enumerate(article.tags)">
                        <a href="${top}tags/${tag.lower()}.html">${tag}</a><py:if test="i != len(article.tags)-1">,</py:if>
                    </li>
                </ul>
            </div>
            ${HTML(article.get_html())}
        </div>
	</div>
	<div id="sidebar">
	  <h2>Navigation</h2>
	  <ul>
	    <li><a href="${top}">Blog-Ursprung</a></li>
	    <li><a href="${top}tags/index.html">Tags (Themen)</a></li>
	    <li><a href="${top}2013/index.html">Archiv 2013</a></li>
	    <li><a href="http://fnanp.in-ulm.de/frederik_und_moritz/sbe/">Kinder Blog</a></li>
	    <li><a href="http://fnanp.in-ulm.de/">FNANP Hauptseite</a></li>
	  </ul>
	  <hr />
	  <h2>Externe Links</h2>
	  <ul>
	  </ul>
	  <hr />
	  <h2>Feed</h2>
	  <ul>
	    <li><a href="${top}atom.xml">ATOM</a></li>
	  </ul>
	  <hr />
	  <h2>Contact</h2>
	  <ul>
	    <li><a href="mailto:mhellwig@in-ulm.de">Mail</a></li>
	    <li><a href="https://twitter.com/das_aug">Twitter</a></li>
	  </ul>
	  <hr />
	  <h2>Info</h2>
	  <ul>
	    <li><a href="http://fnanp.in-ulm.de/impressum.html">Impressum</a></li>
	  </ul>
	  <p>This blog is statically generated with <a href="http://fnanp.in-ulm.de/sbe/">sbe.py</a></p>
	  <hr />

	</div>
	
        <div id="footer">
            ${navigation(c)}
       </div>
        <!-- for the disqus commenting system
            <py:if test="article.comments">
                <script type="text/javascript">
                    //<![CDATA[
                    (function() {
                        var links = document.getElementsByTagName('a');
                        var query = '?';
                        for(var i = 0; i < links.length; i++) {
                        if(links[i].href.indexOf('#disqus_thread') >= 0) {
                            query += 'url' + i + '=' + encodeURIComponent(links[i].href) + '&';
                        }
                        }
                        document.write('<script charset="utf-8" type="text/javascript" src="http://disqus.com/forums/crivens/get_num_replies.js' + query + '"></' + 'script>');
                    })();
                    //]]>
                    </script>
            </py:if>
        -->
    </div>
    </body>
</html>
