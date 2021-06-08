API 接口設計
===

## 接口種類

### 業務接口

* reserve(user_id: int, item_id: int, time_id: int) -> (sucess: bool, queue_size: int)  
預定 `time_id` 時段的 `item_id` 的資源；預定成功則回傳 success = true 而 queue_size 為 don\'t care，預定失敗則回傳 success = false 且 queue_size 為目前排隊人數

* wait(user_id: int, item_id: int, time_id: int) -> (success: bool, waiting_number: int)  
排隊等待 `time_id` 時段的 `item_id` 的資源；若隊列長度小於

```
    這邊的「隊列長度」概念可以用於幫助用戶也可以幫助服務器：
    第一種用法，用戶可以像是買股票一樣，「只有當排隊人數小於一定人數才去排隊」
    同時如果他們真的無論如何都想排，那也可以把隊列長度設成零 default 排
    第二種則是限定每個時段的資源使用最多的排隊數，這樣可以減少服務器的負擔
```

```
    目前我也不確定要不要加上排隊的機制，要加上排隊的話會多很多細節要考慮
    舉例來說一個人有一定的排隊額度（類似以太坊的 Gas），防止有人一下子全部都排隊
    或者說是一個資源佔了很多的排隊資源等等
    同時如果要考慮可能的黃牛的話，還要加上身份驗證的機制
    最後一個則是萬一前面的人撤銷需求後，後面排隊的遞補上了，那要怎麼通知等到的那個人？
    以上這些實現全部都會讓服務器需要處理的負載增加
```

* revoke() ->  

## 管理接口

管理員負責設定部份操作的許可權限，以及新增/刪除資源，調整會員的權限
管理員的角色是綁在群組上面的，每個管理員身份都有對應的群
有些資源可能會暫時不可用，或者永久性的增加/刪除

同時最初的管理員是由 root 權限新增的，也可以理解為 root 權限是所有管理員權限的父節點
因此以下的接口都要考慮到最初創世用 root 權限的情況

```
另外一個可行的架構就是階層化的權限（有上下級的群組）
但是這會讓設計變得更複雜，所以目前先跳過
```

* init_item(user_id: int) -> (success: bool, item_id: int)  

* remove_item(user_id: int, item_id: int) -> success: bool  

* modify_item(user_id: int, item_id: int, args: list) -> success: bool  

* promote(promoter_id: int, promotee_id: int) -> success: bool  

* demote(demoter_id: int, demotee_id: int) -> success: bool  

* create_group(creator_id: int, group_id: int) -> success: bool  

* assign_manager(assigner_id: int, group_id: int, manager_id: int) -> success: bool  

* modify_manager(modifier_id: int, group_id: int, new_manager_id: int) -> success: bool  