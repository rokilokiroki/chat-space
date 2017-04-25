
# DB設計

**users table**

|column|type|options|
|:-:|:-:|:-:|
|name|string|index: true, null: false, unique: true|
|mail|string|null: false, unique: true|

Association
* has_many :groups, through: user_groups
* has_many :messages
* has_many user_groups

**groups table**

|column|type|options|
|:-:|:-:|:-:|
|name|string|index: true, null: false|

Association
* has_many :users, through: user_groups
* has_many :messages
* has_many user_groups

**user_groups**

|column|type|options|
|:-:|:-:|:-:|
|user_id|integer||
|group_id|integer||

Assosiation
* belongs_to :user
* belongs_to :group

**messages**

|column|type|options|
|:-:|:-:|:-:|
|body|integer|index: true, null: false,|
|image|string||
|group_id|integer||
|user_id|integer||

Assosiation
* belongs_to user
