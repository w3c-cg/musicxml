<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron">

  <sch:title>Note attributes</sch:title>

  <sch:p>This schema validates combinations of note attributes.</sch:p>

  <!-- Check that rests don't have notehead declarations. -->
  <sch:pattern id="rest-notehead">
    <sch:rule context="note[rest]">
      <sch:assert test="not(notehead)">
        rest notes should not declare a notehead.
      </sch:assert>
    </sch:rule>
  </sch:pattern>

</sch:schema>
