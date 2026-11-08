<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron">

  <sch:title>Note and measure durations</sch:title>

  <sch:p>This schema validates timing constructs for notes and measures.</sch:p>

  <!-- Check that divisions has been set before any note duration. -->
  <sch:pattern id="divisions-before-durations">
    <sch:rule context="note[duration]">
      <sch:assert test="(preceding-sibling::attributes[divisions], ancestor::measure/preceding-sibling::measure[attributes/divisions])[1]">
        divisions should be set before the occurrence of any note/duration.
      </sch:assert>
    </sch:rule>
  </sch:pattern>

</sch:schema>
