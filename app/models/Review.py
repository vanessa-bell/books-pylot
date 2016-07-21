""" 
    Sample Model File

    A Model should be in charge of communicating with the Database. 
    Define specific model method that query the database for information.
    Then call upon these model method in your controller.

    Create a model using this template.
"""
from system.core.model import Model

class Review(Model):
    def __init__(self):
        super(Review, self).__init__()
    """
    Below is an example of a model method that queries the database for all users in a fictitious application
    
    Every model has access to the "self.db.query_db" method which allows you to interact with the database

    def get_users(self):
        query = "SELECT * from users"
        return self.db.query_db(query)

    def get_user(self):
        query = "SELECT * from users where id = :id"
        data = {'id': 1}
        return self.db.get_one(query, data)

    def add_message(self):
        sql = "INSERT into messages (message, created_at, users_id) values(:message, NOW(), :users_id)"
        data = {'message': 'awesome bro', 'users_id': 1}
        self.db.query_db(sql, data)
        return True
    
    def grab_messages(self):
        query = "SELECT * from messages where users_id = :user_id"
        data = {'user_id':1}
        return self.db.query_db(query, data)

    """
    def add_author(self,form_data):
        if form_data['existing_authors'] == '-':
            new_author = form_data['author']
            sql = "INSERT into authors (full_name, created_at, updated_at) values(:full_name, NOW(), NOW())"
            data = {'full_name': new_author}
            self.db.query_db(sql, data)
            get_author_query = "SELECT * from authors ORDER BY id DESC LIMIT 1"
            author = self.db.query_db(get_author_query)
        else:
            author_id = form_data['existing_authors']
            get_author = "SELECT * from authors WHERE authors.id= :author_id"
            data = {'author_id': author_id}
            author = self.db.query_db(get_author,data)
        print author
        #then insert new book with that author ID
        return {'author':author[0]}

    def add_book(self,id,form_data):
        sql = "INSERT into books (title, author_id, created_at, updated_at) values(:title, :author_id, NOW(),NOW())"
        data = {'title':form_data['title'],'author_id':id}
        self.db.query_db(sql,data)
        get_book_query = "SELECT * from books ORDER BY id DESC LIMIT 1"
        book= self.db.query_db(get_book_query)
        return {'book':book[0]}

    def add_review(self,book_id,user_id,author_id,review,rating):
        sql = "INSERT into reviews (review, rating, book_id, user_id, author_id, created_at, updated_at) values(:review,:rating,:book_id,:user_id,:author_id,NOW(),NOW())"
        data = {'review':review,'rating':rating,'book_id':book_id,'user_id':user_id,'author_id':author_id}
        return self.db.query_db(sql,data)

    def get_book(self,id):
        query = "SELECT books.id as book_id, title as book_title, full_name as author FROM books.books JOIN authors on author_id = authors.id WHERE books.id = :book_id"
        data= {'book_id': id}
        return self.db.get_one(query, data)

    def get_books(self):
        query = "SELECT * FROM books"
        return self.db.query_db(query)

    def get_author_id(self,book_id):
        query = "SELECT books.author_id as author_id FROM books.books WHERE books.id = :book_id"
        data = {'book_id': book_id}
        author = self.db.get_one(query,data)
        return {'author':author}

    def get_authors(self):
        query = "SELECT * from authors"
        return self.db.query_db(query)

    def get_reviews(self):
        query ="SELECT reviews.user_id as user_id, review, rating, title, books.id as book_id, users.alias, authors.full_name as author, reviews.created_at FROM books.reviews JOIN authors ON authors.id = author_id JOIN books ON books.id = book_id JOIN users ON user_id = users.id"
        return self.db.query_db(query)

    def get_book_reviews(self,id):
        query ="SELECT reviews.user_id as user_id, reviews.id as review_id, review, rating, title, books.id as book_id, users.alias, authors.full_name as author, reviews.created_at FROM books.reviews JOIN authors ON authors.id = author_id JOIN books ON books.id = book_id JOIN users ON user_id = users.id WHERE books.id =:book_id"
        data = {'book_id': id}
        return self.db.query_db(query,data)

    def get_user_reviews(self,id):
        query ="SELECT users.id as user_id, review, rating, title, books.id as book_id, users.alias, authors.full_name as author, reviews.created_at FROM books.reviews JOIN authors ON authors.id = author_id JOIN books ON books.id = book_id JOIN users ON user_id = users.id WHERE reviews.user_id =:user_id"
        data = {'user_id': id}
        return self.db.query_db(query,data)

    def delete(self,id):
        query = "DELETE from reviews WHERE id = :id"
        data = {
        'id' : id
        }
        return self.db.query_db(query,data)
