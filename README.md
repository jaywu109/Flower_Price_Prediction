# Flower_Price_Prediction
香水百合價量分析：Time Series Forecasting in R and Python  
  
台灣地處亞熱帶地區，氣候優越而多樣，非常適合各種花卉的種植和育種。再者，可以通過海拔差異來進行花卉生產的季節性調整，從而使台灣花卉產業蓬勃發展。根據農業和食品管理局的2017年統計數據，批發市場約佔總產量的90％，這表明批發市場對花卉的重要性。批發市場的目的是為生產者和銷售者提供可靠的交易服務平台，並建立運輸和銷售訂單。通過批發市場建立拍賣系統和公開透明的交易流程，我們可以提高運輸和銷售效率，保護買賣雙方的權利，並在市場供求之間保持平衡。
  
由於花卉的批發市場通常是花店或是大型廠商，因此採購的數目都是非常龐大的，即使是些微的價差也有可能造成龐大的價差損失，就如同匯率價差一樣，因此我們希望藉由花卉的模型預測來降低價格的不確定性，以及提供最佳購入時機。
  
於專案中預測未來兩周台北市花卉批發市場十種香水百合的成交價格及成交量。使用爬蟲獲取花卉歷史資料、油價、氣象、百合種球進口資料做到未來14步預測 ，建立 **Temporal Fusion Transformer** 和 **Autoregressive Recurrent Network** 等基於 ***Attention Mechanism、CNN 與 RNN 的深度學習模型***，也嘗試著以 RecursiveMulti-Step Forecasting 的方法使機器學習模型也能達到多步預測，最終結合 ARIMA 模型的結果，將所有模型結果進行 ensemble 得到最終預測

## Temporal Fusion Transformer
![image](https://user-images.githubusercontent.com/36630295/125034660-6bfe3b00-e0c3-11eb-91f0-62e3f7b4297a.png)

## DeepAR
![image](https://user-images.githubusercontent.com/36630295/125034879-b8e21180-e0c3-11eb-956d-82ec3ac1f81c.png)

## Visulization
![image](https://user-images.githubusercontent.com/36630295/125034940-cac3b480-e0c3-11eb-98d7-52495ed0577b.png)

## ARIMA Model Analysis (R)
![image](https://user-images.githubusercontent.com/36630295/125033990-a3201c80-e0c2-11eb-8a0d-4e698bb741a8.png)  
![image](https://user-images.githubusercontent.com/36630295/125034130-d5ca1500-e0c2-11eb-802d-6ecf908be2a3.png)
![image](https://user-images.githubusercontent.com/36630295/125034173-e37f9a80-e0c2-11eb-96dc-414dd20c43bd.png)  
