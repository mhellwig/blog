<?python from genshi import HTML ?>
<?python top = "../" ?>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml"
      xmlns:py="http://genshi.edgewall.org/">
    <head>
        <title>Tag: ${c.tag}</title>
        <meta http-equiv="Content-type" content="text/html; charset=utf-8" />
        <meta name="robots" content="index, follow" />
        <meta http-equiv="content-language" content="en" />
        <link rel="stylesheet" type="text/css" href="${top}css/all-min.css" />
        <link rel="start" href="${top}" />
    </head>
    <body>
    <div id="wrap">
        <div id="header">
            <h1><a href="${top}">ein Blog</a></h1>
	    <p class="claim">ramblings/betrachtungen</p>
            <ul py:def="navigation()" class="nav">
                <li class="prev">
                    <span class="disabled">zurück</span>
                </li>
                <li class="next">
                    <span class="disabled">next</span>
                </li>
                <li class="up"><a href="${top}tags/">up</a><br/><a href="${top}">Blog</a> / <a href="${top}tags/">Tags</a></li>
            </ul>
            ${navigation()}
        </div>
	<div id="main">
        <div class="article">
            <h2 class="title">Tag: ${c.tag} </h2>
            <ul py:if="c.dict">
                <li py:for="path in reversed(sorted(c.dict.keys()))">
                    <a href="../${path}">${c.dict[path]}</a>
                </li>
            </ul>
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
            ${navigation()}
        </div>
    </div>
    </body>
</html>
