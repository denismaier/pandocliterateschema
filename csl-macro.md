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