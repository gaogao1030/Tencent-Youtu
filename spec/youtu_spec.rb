require "spec_helper"

RSpec.describe Youtu do
  before(:all) do
    Youtu.configure do |config|
      config.app_id = "10082760"
      config.secret_id = "AKIDJUR8dwrpOindx39Xv50iBPN7duxkZiqi"
      config.secret_key = "lIbfU6TbS3PVTCgvwiEWaOxHMBk25sPg"
      config.user_id = "411388327"
    end
  end

  it "sign pass" do
    url = "http://girigiri.gaoyh.me/uploads/gallery/cover/2017/9335f793c8be018dd011bbfaa365c183.png?imageView2/2/w/480&e=1514649600&token=MJuHFwYi4Bd9fET9iqpe9kjk8UBMObtADzL0XzjD:ODpb9wTyxIr-gEHYZcrmnL1fnSY="
    Youtu::Request.post("/youtu/api/detectface",{"url": url,"model": 1}) {|response,request,result|
      expect(response.code).to eq(200)
    }
  end
end
