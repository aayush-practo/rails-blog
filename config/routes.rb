# == Route Map
#
#                   Prefix Verb   URI Pattern                                  Controller#Action
#         new_user_session GET    /users/sign_in(.:format)                     devise/sessions#new
#             user_session POST   /users/sign_in(.:format)                     devise/sessions#create
#     destroy_user_session DELETE /users/sign_out(.:format)                    devise/sessions#destroy
#            user_password POST   /users/password(.:format)                    devise/passwords#create
#        new_user_password GET    /users/password/new(.:format)                devise/passwords#new
#       edit_user_password GET    /users/password/edit(.:format)               devise/passwords#edit
#                          PATCH  /users/password(.:format)                    devise/passwords#update
#                          PUT    /users/password(.:format)                    devise/passwords#update
# cancel_user_registration GET    /users/cancel(.:format)                      devise/registrations#cancel
#        user_registration POST   /users(.:format)                             devise/registrations#create
#    new_user_registration GET    /users/sign_up(.:format)                     devise/registrations#new
#   edit_user_registration GET    /users/edit(.:format)                        devise/registrations#edit
#                          PATCH  /users(.:format)                             devise/registrations#update
#                          PUT    /users(.:format)                             devise/registrations#update
#                          DELETE /users(.:format)                             devise/registrations#destroy
#         article_comments POST   /articles/:article_id/comments(.:format)     comments#create
#          article_comment DELETE /articles/:article_id/comments/:id(.:format) comments#destroy
#                 articles GET    /articles(.:format)                          articles#index
#                          POST   /articles(.:format)                          articles#create
#              new_article GET    /articles/new(.:format)                      articles#new
#             edit_article GET    /articles/:id/edit(.:format)                 articles#edit
#                  article GET    /articles/:id(.:format)                      articles#show
#                          PATCH  /articles/:id(.:format)                      articles#update
#                          PUT    /articles/:id(.:format)                      articles#update
#                          DELETE /articles/:id(.:format)                      articles#destroy
#

Rails.application.routes.draw do
  devise_for :users
  root "welcome#index"

  resources :articles do
    resources :comments, :only => [:create, :destroy]
  end
end
