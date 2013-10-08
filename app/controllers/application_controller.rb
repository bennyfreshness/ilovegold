class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  require 'net/http'
  require 'open-uri'

  def index
    gold   = 'no gold'
    result = JSON.parse(open('http://store.apple.com/us/retail/availabilitySearch?parts.0=ME307LL%2FA&zip=92101').read)
    result['body']['stores'][0..4].each do |s|
      if s['partsAvailability']['ME307LL/A']['pickupDisplay'] != 'unavailable'
        gold = 'give me the gold: ' + s['storeDisplayName'] + ' ' + s['phoneNumber']
        GoldMailer.gold(gold).deliver
      end
    end
    render text: gold
  end

end
