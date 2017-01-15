ActiveAdmin.register Event do
  permit_params :name, :occurs_on, :source_id
end
