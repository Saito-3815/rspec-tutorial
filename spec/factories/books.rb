FactoryBot.define do
  factory :book do # :book はモデル名を全小文字にしてシンボルにしたもの
    title { "RubyBook" } # カラム title のデータとして "RubyBook" をつかう
    author { "matz" } # カラム author のデータとして "matz" をつかう
  end

  trait :with_variations do
    after(:create) do |book|
      book.variations.create!(kind: "paper book")
    end
    # （動作未確認）上のafterメソッドの代わりに、関連先のFactoryBotがあればこう書ける。
    # こちらだとFactoryBot.build時に関連先もbuildで作成できるかも。
    # FactoryBot.create_list(:variations, count, book: book)
  end
end
