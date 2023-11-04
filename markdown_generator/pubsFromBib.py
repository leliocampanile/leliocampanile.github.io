#!/usr/bin/env python
# coding: utf-8

# # Publications markdown generator for academicpages
# 
# Takes a set of bibtex of publications and converts them for use with [academicpages.github.io](academicpages.github.io). This is an interactive Jupyter notebook ([see more info here](http://jupyter-notebook-beginner-guide.readthedocs.io/en/latest/what_is_jupyter.html)). 
# 
# The core python code is also in `pubsFromBibs.py`. 
# Run either from the `markdown_generator` folder after replacing updating the publist dictionary with:
# * bib file names
# * specific venue keys based on your bib file preferences
# * any specific pre-text for specific files
# * Collection Name (future feature)
# 
# TODO: Make this work with other databases of citations, 
# TODO: Merge this with the existing TSV parsing solution


from pybtex.database.input import bibtex
import pybtex.database.input.bibtex 
from time import strptime
import string
import html
import os
import re

from pprint import pprint, pformat

#todo: incorporate different collection types rather than a catch all publications, requires other changes to template
publist = {
    "journal":{
        "file": "scopus_full.bib",
        "venuekey" : "journal",
        "venue-pretext" : "",
        "collection" : {"name":"publications",
                        "permalink":"/publication/"}
    } 
}

html_escape_table = {
    "&": "&amp;",
    '"': "&quot;",
    "'": "&apos;"
    }

def html_escape(text):
    """Produce entities within text."""
    return "".join(html_escape_table.get(c,c) for c in text)


for pubsource in publist:
    parser = bibtex.Parser()
    bibdata = parser.parse_file(publist[pubsource]["file"])

    #loop through the individual references in a given bibtex file
    for bib_id in bibdata.entries:
        #reset default date
        pub_year = "1900"
        pub_month = "01"
        pub_day = "01"
        
        b = bibdata.entries[bib_id].fields
        entry = bibdata.entries[bib_id]
        try:
            pub_year = f'{b["year"]}'

            #todo: this hack for month and day needs some cleanup
            if "month" in b.keys(): 
                if(len(b["month"])<3):
                    pub_month = "0"+b["month"]
                    pub_month = pub_month[-2:]
                elif(b["month"] not in range(12)):
                    tmnth = strptime(b["month"][:3],'%b').tm_mon   
                    pub_month = "{:02d}".format(tmnth) 
                else:
                    pub_month = str(b["month"])
            if "day" in b.keys(): 
                pub_day = str(b["day"])

                
            pub_date = pub_year+"-"+pub_month+"-"+pub_day
            
            #strip out {} as needed (some bibtex entries that maintain formatting)
            clean_title = b["title"].replace("{", "").replace("}","").replace("\\","").replace(" ","-")    

            url_slug = re.sub("\\[.*\\]|[^a-zA-Z0-9_-]", "", clean_title)
            url_slug = url_slug.replace("--","-")

            md_filename = (str(pub_date) + "-" + url_slug + ".md").replace("--","-")
            html_filename = (str(pub_date) + "-" + url_slug).replace("--","-")

            #Build Citation from text
            citation = ""

            #citation authors - todo - add highlighting for primary author?
            authors = ""
            for author in bibdata.entries[bib_id].persons["author"]:
                authors = authors+" "+author.first_names[0]+", "+author.last_names[0]+" and "
                citation = citation+" "+author.first_names[0]+" "+author.last_names[0]+", "

            #citation title
            citation = citation + "\"" + html_escape(b["title"].replace("{", "").replace("}","").replace("\\","")) + ".\""

            #add venue logic depending on citation type
            venue = publist[pubsource]["venue-pretext"]+b[publist[pubsource]["venuekey"]].replace("{", "").replace("}","").replace("\\","")

            citation = citation + " " + html_escape(venue)
            citation = citation + ", " + pub_year + "."

            
            ## YAML variables
            md = "---\ntitle: \""   + html_escape(b["title"].replace("{", "").replace("}","").replace("\\","")) + '"\n'
            
            md += """collection: """ +  publist[pubsource]["collection"]["name"]

            md += """\npermalink: """ + publist[pubsource]["collection"]["permalink"]  + html_filename
            
            doi = False
            doi_text = ""
            if "doi" in b.keys():
                doi_text = html_escape(b['doi'])
                doi = True 
                
            issn = False
            issn_text = ""
            if "isbn" in b.keys():
                issn_text = html_escape(b['isbn'])
                issn = True
            
            note = False
            if "note" in b.keys():
                if len(str(b["note"])) > 5:
                    md += "\nexcerpt: '" + html_escape(b["note"]) + "'"
                    note = True

            md += "\ndate: " + str(pub_date) 

            md += "\nvenue: '" + html_escape(venue) + "'"
            
            url = False
            if "url" in b.keys():
                if len(str(b["url"])) > 5:
                    md += "\npaperurl: '" + b["url"] + "'"
                    url = True

            md += "\ncitation: '" + html_escape(citation) + "'"

            md += "\n---"

            # Added by Lelio Campanile
            abstract = False
            if "abstract" in b.keys():
                abstract = True
            
            author_keywords = False
            if "author_keywords" in b.keys():
                author_keywords = True
                            
            ## Markdown description for individual page
            if note:
                md += "\n" + html_escape(b["note"]) + "\n"

            if url:
                md += "\n[Access paper here](" + b["url"] + "){:target=\"_blank\"}\n" 
            else:
                md += "\nUse [Google Scholar](https://scholar.google.com/scholar?q="+html.escape(clean_title.replace("-","+"))+"){:target=\"_blank\"} for full citation"

            if abstract:
                md+="\n __Abstract:__ " + html_escape(b["abstract"]) + "\n"
                
            if author_keywords:
                md += "\n __Author Keywords:__ " + html_escape(b["author_keywords"]) + "\n"
            
            try:
                del entry.fields['abstract']
            except KeyError as e:
                print("key not found in entry", e)
                
            try:
                del entry.fields['author_keywords']
            except KeyError as e:
                print("key not found in entry", e)
                
            try:
                del entry.fields['keywords']
            except KeyError as e:
                print("key not found in entry", e)
                
            try:
                del entry.fields['note']
            except KeyError as e:
                print("key not found in entry", e)
            
            try:
                del entry.fields['source']
            except KeyError as e:
                print("key not found in entry", e)
                
            try:
                del entry.fields['publication_stage']
            except KeyError as e:
                print("key not found in entry", e)
                     
            try:
                del entry.fields['url']
            except KeyError as e:
                print("key not found in entry", e)     

            try:
                del entry.fields['source']
            except KeyError as e:
                print("key not found in entry", e) 
            
            bibtext_citation = ""       
            bibtex_citation = entry.to_string('bibtex')
            
            md += "\n __Bibtex citation:__ \n```bibtex \n" + bibtex_citation + "\n``` \n"
            
            with open("../files/bibfiles/"+bib_id+".bib", 'w') as bibfile:
                bibfile.write(bibtex_citation)
            
            
            md += "[Download .bib file]({{ site.url }}/files/bibfiles/"+bib_id+".bib) \n"
                
            md_filename = os.path.basename(md_filename)
            
            
            
            with open("../_publications/" + md_filename, 'w') as f:
                f.write(md)
            
            print(f'SUCESSFULLY PARSED {bib_id}: \"', b["title"][:60],"..."*(len(b['title'])>60),"\"")
        # field may not exist for a reference
        except KeyError as e:
            print(f'WARNING Missing Expected Field {e} from entry {bib_id}: \"', b["title"][:30],"..."*(len(b['title'])>30),"\"")
            continue
