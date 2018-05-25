<?xml version="1.0" encoding="utf-8"?>
<?python from genshi import HTML ?>
<?python home = s.defaults["url"] ?>
<feed xmlns="http://www.w3.org/2005/Atom" 
      xmlns:py="http://genshi.edgewall.org/">
    <title>ein Blog</title>
    <id>http://fnanp.in-ulm.de/blog/</id>
    <link rel="alternate" href="${home}" type="text/html"/>
    <link rel="self" href="${home}/atom.xml" type="application/atom+xml"/>
    <updated>${wb.started.isoformat()[:19]}Z</updated>
    <entry py:for="node in c">
        <?python article=node.get_article()?>
        <title>${article.title}</title>
        <link rel="alternate" href="${home}/${node.get_deploy_path()}" type="text/html"/>
        <id>${article.taguri}</id>
        <updated>${article.get_modification_time().isoformat()[:19]}Z</updated>
        <published>${article.created.isoformat()[:19]}Z</published>
        <category py:for="tag in article.tags" term="${tag}" />
        <author>
            <name>${article.author}</name>
        </author>
        <content type="xhtml"><div xmlns="http://www.w3.org/1999/xhtml">${HTML(article.get_html_with_abs_links(node.parent.get_deploy_path()))}</div></content>
    </entry>
</feed>
