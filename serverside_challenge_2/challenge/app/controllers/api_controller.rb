class ApiController < ApplicationController
def get_price

	#リクエストパラメータから契約アンペア数と使用量を取得
	ampere = params[:ampere].to_i
	usage_kwh = params[:usage_kwh].to_f
	
	#設定ファイルからプラン情報を読み込み
	plans = EnergyPlan.load_plans
	
	#各プランごとに料金を計算
	result = plans.map do |plan|
		
		fee = plan.calculate_fee(ampere, usage_kwh)
		
		next if fee.nil? # 対象外のアンペア数はスキップ
		
		#返却用データを組み立て
		{
		  provider_name: plan.provider_name,
		  plan_name: plan.plan_name,
		  price: fee
		}
		
	end.compact
	
	#JSON 形式で結果を返す
	render json: { results: result }
end

def test1
	render json: { message: "API test successful" }
end
  
end