<?python from genshi import HTML ?>
<?python top = "./" ?>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml"
      xmlns:py="http://genshi.edgewall.org/"
      lang="en">
    <head>
        <title>ein Blog</title>
        <meta http-equiv="Content-type" content="text/html; charset=utf-8" />
        <meta name="date" py:if="c" content="${c[0].get_article().created.isoformat()}" />
        <meta name="robots" content="index, follow" />
        <meta http-equiv="content-language" content="en" />
        <link rel="stylesheet" type="text/css" href="${top}css/all-min.css" />
        <link rel="alternate" type="application/atom+xml" title="ein Blog" href="${top}atom.xml" />
    </head>
    <body>
    <div id="wrap">
        <div id="header">
            <h1><a href="${top}">ein Blog</a></h1>
	    <p class="claim">ramblings/betrachtungen</p>
            <ul py:def="navigation(node_list)" class="nav">
                <li class="prev">
                    <a py:if="node_list[-1].parent.prev" href="${top}${node_list[-1].parent.prev.get_deploy_path()}">${unicode(node_list[-1].parent.prev.get_date().strftime("%d. %B %Y"),"utf-8")}</a>
                    <span py:if="not node_list[-1].parent.prev" class="disabled">previous</span>
                </li>
                <li class="next">
                    <span class="disabled">next</span>
                </li>
                <li class="up"><a href="${top}tags/">Tags</a></li>
            </ul>
            ${navigation(c)}
        </div>
	<div id="main">
        <div class="article" py:for="node in c">
            <?python article=node.get_article()?>
            <h2 class="title"><a href="${top}${node.get_deploy_path()}">${article.title}</a></h2>
            <div class="info">
                ${unicode(article.created.strftime("%A, %d. %B %Y"),"utf-8")}, 
		<ul class="tags" py:if="article.tags">
		    <li>Tags:</li>
                    <li py:for="i, tag in enumerate(article.tags)">
                        <a href="${top}tags/${tag.lower()}.html">${tag}</a><py:if test="i != len(article.tags)-1">,</py:if>
                    </li>
                </ul>
            </div>
            ${HTML(article.get_html_with_abs_links(node.parent.get_deploy_path()))}
	  <hr />
	  <hr />
        </div>
	</div>
	<div id="sidebar">
	  <h2>Navigation</h2>
	  <ul>
	    <li><a href="${top}">Blog-Root</a></li>
	    <li><a href="${top}tags/index.html">Tags</a></li>
	    <li><a href="${top}2013/index.html">Archive 2013</a></li>
	    <li><a href="http://fnanp.in-ulm.de/frederik_und_moritz/sbe/">Blog about my Kids</a></li>
	    <li><a href="http://fnanp.in-ulm.de/">FNANP Root</a></li>
	  </ul>
	  <hr />
	  <h2>Links</h2>
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
    </div>
    </body>
</html>
