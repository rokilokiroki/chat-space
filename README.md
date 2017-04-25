== README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


Please feel free to use a different markup language if you do not plan to run
<tt>rake doc:app</tt>.

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
