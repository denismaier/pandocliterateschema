#### Citation

The `cs:citation` element describes the formatting of citations, which
consist of one or more references (\"cites\") to bibliographic sources.
Citations appear in the form of either in-text citations (in the author
(e.g. \"\[Doe\]\"), author-date (\"\[Doe 1999\]\"), label
(\"\[doe99\]\") or number (\"\[1\]\") format) or notes. The required
`cs:layout` child element describes what, and how, bibliographic data
should be included in the citations (see [Layout](#layout)). `cs:layout`
may be preceded by a `cs:sort` element, which can be used to specify how
cites within a citation should be sorted (see [Sorting](#sorting)). The
`cs:citation` element may carry attributes for [Citation-specific
Options](#citation-specific-options) and [Inheritable Name
Options](#inheritable-name-options). An example of a `cs:citation`
element:

``` {.xml}
<citation>
  <sort>
    <key variable="citation-number"/>
  </sort>
  <layout>
    <text variable="citation-number"/>
  </layout>
</citation>
```

**A note to CSL processor developers** In note styles, a citation is
often a sentence by itself. Therefore, the first character of a citation
should preferably be uppercased when there is no preceding text in the
note. In all other cases (e.g. when a citation is inserted into the
middle of a pre-existing footnote), the citation should be printed as
is.


#### Bibliography

The `cs:bibliography` element describes the formatting of
bibliographies, which list one or more bibliographic sources. The
required `cs:layout` child element describes how each bibliographic
entry should be formatted. `cs:layout` may be preceded by a `cs:sort`
element, which can be used to specify how references within the
bibliography should be sorted (see [Sorting](#sorting)). The
`cs:bibliography` element may carry attributes for
[Bibliography-specific Options](#bibliography-specific-options) and
[Inheritable Name Options](#inheritable-name-options). An example of a
`cs:bibliography` element:

``` {.xml}
<bibliography>
  <sort>
    <key macro="author"/>
  </sort>
  <layout>
    <group delimiter=". ">
      <text macro="author"/>
      <text variable="title"/>
    </group>
  </layout>
</bibliography>
```

::: rnc
div {
  style.citation =
    
    ## Use to describe the formatting of citations.
    element cs:citation { citation.options, sort?, citation.layout }
  
  style.bibliography =
    
    ## Use to describe the formatting of the bibliography.
    element cs:bibliography {
      bibliography.options, sort?, bibliography.layout
    }
  
  citation.layout =
    element cs:layout {
      affixes, delimiter, font-formatting, rendering-element+
    }
  
  bibliography.layout =
    element cs:layout { affixes, font-formatting, rendering-element+ }
}
:::