Rails.application.routes.draw do
  get 'assignment/assign'
  get 'assignment/about'
  post 'assignment/assign'

  root 'assignment#about'
end
