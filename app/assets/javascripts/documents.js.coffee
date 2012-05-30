
year = () ->
  $('#document_year')[0].value

semester = () ->
  $('#document_semester')[0].value

category = () ->
  cat = $('#document_category')[0].value
  if cat == 'Other'
    'Document'
  else
    cat

getExisting = (value)->
  existing = value.match(/(.*) -/)
  if existing and existing[1]
    existing = existing[1]
    unless existing in ['Final','Test','Quiz','Notes','Document']
      return existing
  false


$ ()->
  title = $('input[id="document_title"]')[0]
  fields = $('#document_year, #document_semester, #document_category')
  fields.change ()->
    existing = getExisting(title.value)
    if existing
      title.value = "#{existing[1]} - #{semester()} #{year()}"
    else
      title.value = "#{category()} - #{semester()} #{year()}"
