Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, 'a8c047e002f157b0e275', 'b0baee1021624b18156f0a51f55f16ea6241b023'
end
