<?python from genshi import HTML ?>
<?python top = "../../" ?>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml"
      xmlns:py="http://genshi.edgewall.org/">
    <head>
        <title>${unicode(c.get_date().strftime("%B %Y"),"utf-8")}</title>
        <meta http-equiv="Content-type" content="text/html; charset=utf-8" />
        <meta name="robots" content="index, follow" />
        <meta http-equiv="content-language" content="de" />
        <link rel="stylesheet" type="text/css" href="${top}css/all-min.css" />
        <link py:if="c.next" rel="next" href="${top}${c.next.get_deploy_path()}" />
        <link py:if="c.prev" rel="prev" href="${top}${c.prev.get_deploy_path()}" />
        <link rel="start" href="${top}" />
    </head>
    <body>
    <div id="wrap">
        <div id="header">
            <h1><a href="${top}">ein Blog</a></h1>
	    <p class="claim">Betrachtungen</p>
            <ul py:def="navigation(node)" class="nav">
                <li class="prev">
                    <a py:if="c.prev" href="${top}${c.prev.get_deploy_path()}">${unicode(c.prev.get_date().strftime("%B %Y"),"utf-8")}</a>
                    <span py:if="not c.prev" class="disabled">zurück</span>
                </li>
                <li class="next">
                    <a py:if="c.next" href="${top}${c.next.get_deploy_path()}">${unicode(c.next.get_date().strftime("%B %Y"),"utf-8")}</a>
                    <span py:if="not c.next" class="disabled">weiter</span>
                </li>
                <li class="up"><a href="${top}${c.parent.get_deploy_path()}">Nach oben</a><br/>
                    <a href="${top}${c.parent.get_deploy_path()}">${c.parent.get_base_name()}</a>
                </li>
            </ul>
            ${navigation(c)}
        </div>
	<div id="main">
        <div class="article">
            <ul py:if="c.children">
                <li py:for="day in c.children">
                    <a href="${top}${day.get_deploy_path()}">${unicode(day.get_date().strftime("%d. %B %Y"),"utf-8")}</a> (${len(day.children)} Artikel)
                </li>
            </ul>
        </div>
	</div>
	<div id="sidebar">
	  <h2>Navigation</h2>
	  <ul>
	    <li><a href="${top}">Blog-Ursprung</a></li>
	    <li><a href="${top}tags/index.html">Tags (Themen)</a></li>
	    <li><a href="${top}2013/index.html">Archiv 2013</a></li>
	    <li><a href="http://fnanp.in-ulm.de/frederik_und_moritz/sbe">Kinder Blog</a></li>
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
