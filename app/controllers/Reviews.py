from system.core.controller import *

class Reviews(Controller):
    def __init__(self, action):
        super(Reviews, self).__init__(action)
        self.load_model('Review')
        self.db = self._app.db
   
    def index(self,id):
        book = self.models['Review'].get_book(id)
        reviews= self.models['Review'].get_book_reviews(id)
        return self.load_view('show.html',book=book,reviews=reviews)

    def add_book_and_review(self):
        form_data = request.form
        add_author = self.models['Review'].add_author(form_data)
        author_id = add_author['author']['id']
        add_book = self.models['Review'].add_book(author_id,form_data)
        book_id = add_book['book']['id']
        review = request.form['review']
        rating = request.form['rating']
        user_id = session['id']
        add_review = self.models['Review'].add_review(book_id,user_id,author_id,review,rating)
        return redirect('/books/'+ str(book_id))

    def add_review(self,id):
        review = request.form['review']
        rating = request.form['rating']
        book_id=id
        get_author_id = self.models['Review'].get_author_id(id)
        author_id = get_author_id['author'][0]
        print author_id
        user_id = session['id']
        add_review = self.models['Review'].add_review(book_id,user_id,author_id,review,rating)
        return redirect('/books/'+str(id))

    def create(self):
        authors = self.models['Review'].get_authors()
        return self.load_view('add.html',authors=authors)

    def delete(self,book_id,review_id):
        self.models['Review'].delete(review_id)
        return redirect('/books/' +str(book_id))

