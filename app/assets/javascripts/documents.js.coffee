
year = () ->
  $('#document_year')[0].value

semester = () ->
  $('#document_semester')[0].value

$ ()->
  title = $('input[id="document_title"]')[0]
  fields = $('#document_year, #document_semester')
  fields.change ()->
    existing = title.value.match(/(.*) -/)
    if existing and existing[1]
      title.value = "#{existing[1]} - #{semester()} #{year()}"
    else
      title.value = "Document - #{semester()} #{year()}"
