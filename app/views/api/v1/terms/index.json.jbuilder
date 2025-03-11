json.array! @terms do |term|
  json.partial! 'api/v1/terms/term', term: term
end