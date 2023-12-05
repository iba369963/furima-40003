class Order
  include ActiveModel::Model
  attr_accessor :user_id, :furima_id, :postal_code, :prefecture_id, :city, :addresses, :home_name, :phone_number

  attr_accessor :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/, message: "は「3桁ハイフン4桁」の形式で入力してください" }
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: "は10桁以上11桁以内の半角数値で入力してください" }
    validates :token, presence: true
    validates :city, presence: true
    validates :addresses, presence: true
  end

  def save
    # ログの保存
    log = Log.create(user_id: user_id, furima_id: furima_id)

    # 宛先情報の保存
    destination = Destination.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, addresses: addresses, home_name: home_name, phone_number: phone_number, log_id: log.id)

  end
end