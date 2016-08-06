Rails.application.routes.draw do
  get 'assignment/assign'
  get 'assignment/about'

  root 'assignment#about'
end
