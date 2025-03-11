json.extract! term, :id, :name, :start_date, :end_date
json.current (term.start_date <= Date.current && term.end_date >= Date.current)
