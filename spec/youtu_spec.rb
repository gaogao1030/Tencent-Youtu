require "spec_helper"

RSpec.describe Youtu do
  let(:signature_file) { "/tmp/youtu_signature" }
  let(:url) { "http://girigiri.gaoyh.me/uploads/gallery/cover/2017/9335f793c8be018dd011bbfaa365c183.png?imageView2/2/w/480&e=1514649600&token=MJuHFwYi4Bd9fET9iqpe9kjk8UBMObtADzL0XzjD:ODpb9wTyxIr-gEHYZcrmnL1fnSY=" }

  before(:all) do
    Youtu.configure do |config|
      config.app_id = "10082760"
      config.secret_id = "AKIDJUR8dwrpOindx39Xv50iBPN7duxkZiqi"
      config.secret_key = "lIbfU6TbS3PVTCgvwiEWaOxHMBk25sPg"
      config.user_id = "411388327"
    end
  end

  after :each do
    File.delete(signature_file) if File.exist?(signature_file)
  end

  describe "signature"
    specify "post request should be pass" do
      Youtu::Request.post("/youtu/api/detectface",{"url": url,"model": 1}) {|response,request,result|
        expect(response.code).to eq(200)
      }
    end

    specify "refresh signature if signature file didn't exist" do
      expect(File.exist? signature_file).to be false
      Youtu::Sign.signature
      expect(File.exist? signature_file).to be true
    end

    specify "refresh signature if signature file is nivalid" do
      expect(File.exist? signature_file).to be false
      File.open(signature_file,'w') { |f| f.write('signature') }
      Youtu::Request.post("/youtu/api/detectface",{"url": url,"model": 1}) {|response,request,result|
        expect(response.code).to eq(200)
      }
    end

    specify "don't refresh signature if signature is correct" do
      _signature = Youtu::Sign.signature
      expect(_signature).to eq(Youtu::Sign.signature)
    end
end
