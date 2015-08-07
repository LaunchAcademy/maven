require "./config/application"

get "/" do
  redirect to("scans")
end

get "/scans" do
  @scans = Scan.order(created_at: :desc).limit(40)
  haml :"scans/index"
end
