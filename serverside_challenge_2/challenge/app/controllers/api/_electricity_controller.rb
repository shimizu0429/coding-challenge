class Api::ElectricityController < ApplicationController
    #skip_before_action :verify_authenticity_token # POST用

    # GET /api/electricity_bill?consumption=100
    # POST /api/electricity_bill { "consumption": 100 }
    def get_electricity_bill
      # パラメータ取得
      consumption = params[:consumption].to_f

      # 設定値（単価）取得
      rate = ELECTRICITY_SETTINGS['electricity_rate'].to_f

      # 電気料金計算
      bill = consumption * rate

      render json: { consumption: consumption, rate: rate, bill: bill }
    end

    # 新規: テスト画面表示用アクション
    def test
      # app/views/api/test.html.erb を表示
      render 'api/electricity/test'
    end

end
