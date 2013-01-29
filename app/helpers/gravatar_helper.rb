module GravatarHelper
  def gravatar_url(user, options)
    options = options.reverse_merge({
      size: 128,
      secure: true,
      default: :mm
    })
    gravatr_id = Digest::MD5.hexdigest(user.email.to_s.downcase)
    prefix = if options[:secure] then "https://secure" else "http://www" end
    "#{prefix}.gravatar.com/avatar/#{gravatr_id}?s=#{options[:size].to_s}&d=#{options[:default].to_s}"
  end
end
