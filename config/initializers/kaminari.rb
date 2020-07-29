Kaminari.configure do |config|
  config.page_method_name = :kaminari_page
  config.default_per_page = 20 #1ページ辺りの項目数
  #config.max_per_page = 5    #1ページ辺りの最大数
end