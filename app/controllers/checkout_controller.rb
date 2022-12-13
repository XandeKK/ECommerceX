class CheckoutController < ApplicationController
  def checkout_session
    session = Stripe::Checkout::Session.create({
      line_items: [{quantity: params[:quantity], price: params[:price]}],
      mode: 'payment',
      success_url: checkout_success_url,
      cancel_url: checkout_cancel_url,
    })

    redirect_to session.url, status: 303, allow_other_host: true
  end

  def success
  end

  def cancel
  end
end
