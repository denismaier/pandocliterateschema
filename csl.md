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

#### Macro

Macros, defined with `cs:macro` elements, contain formatting
instructions. Macros can be called with `cs:text` from within other
macros and the `cs:layout` element of `cs:citation` and
`cs:bibliography`, and with `cs:key` from within `cs:sort` of
`cs:citation` and `cs:bibliography`. It is recommended to place macros
after any `cs:locale` elements and before the `cs:citation` element.

Macros are referenced by the value of the required `name` attribute on
`cs:macro`. The `cs:macro` element must contain one or more [rendering
elements](#rendering-elements).

The use of macros can improve style readability, compactness and
maintainability. It is recommended to keep the contents of `cs:citation`
and `cs:bibliography` compact and agnostic of item types (e.g. books,
journal articles, etc.) by depending on macro calls. To allow for easy
reuse of macros in other styles, it is recommended to use common macro
names.

In the example below, cites consist of the item title, rendered in
italics when the item type is \"book\":

``` {.xml}
<style>
  <macro name="title">
    <choose>
      <if type="book">
        <text variable="title" font-style="italic"/>
      </if>
      <else>
        <text variable="title"/>
      </else>
    </choose>
  </macro>
  <citation>
    <layout>
      <text macro="title"/>
    </layout>
  </citation>
</style>
```

::: rnc
div {
  style.macro =
    
    ## Use to create collections of (reusable) formatting instructions.
    element cs:macro {
      attribute name { xsd:NMTOKEN },
      rendering-element+
    }
  
  rendering-element =
    rendering-element.names
    | rendering-element.date
    | rendering-element.label
    | rendering-element.text
    | rendering-element.title
    | rendering-element.number
    | rendering-element.choose
    | rendering-element.group
}
:::