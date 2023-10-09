FactoryBot.define do 
    factory :article, class: "Article" do
        name {Faker::Name.unique.name }
        body {Faker::Name.unique.name}
    end   
end 