class Avo::Resources::User < Avo::BaseResource
  # self.includes = []
  # self.attachments = []
  # self.search = {
  #   query: -> { query.ransack(id_eq: params[:q], m: "or").result(distinct: false) }
  # }
  
  def fields
    field :id, as: :id
    field :email_address, as: :text
    field :referral_codes, as: :has_many
    field :referrals, as: :has_many
    field :referral, as: :has_one
    field :sessions, as: :has_many
  end
end
