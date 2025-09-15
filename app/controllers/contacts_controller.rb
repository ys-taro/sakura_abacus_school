class ContactsController < ApplicationController
  def create
    @contact = Contact.new(contact_params)

    if @contact.save
      redirect_to root_path, notice: "お問い合わせを送信しました。ありがとうございました。"
    else
      render :new
    end
  end

  private

  def contact_params
    params.require(:contact).permit(
      :last_name,
      :first_name,
      :last_name_kana,
      :first_name_kana,
      :text,
      :email,
      :phone_number,
      :contact_type
    )
  end
end
