from system.core.controller import *
from time import strftime

class Users(Controller):
    def __init__(self, action):
        super(Users, self).__init__(action)
        self.load_model('User')
        self.load_model('Review')
        self.db = self._app.db
    
    def index(self):
        return self.load_view('index.html')

    def home(self):
        reviews = self.models['Review'].get_reviews()
        all_reviews = sorted(reviews, key=lambda k: k['created_at'], reverse=True)
        id= session['id']
        user = self.models['User'].get_user(id)
        books = self.models['Review'].get_books()
        return self.load_view('books.html', all_reviews=all_reviews, user=user, books=books)

    def profile(self,id):
        user = self.models['User'].get_user(id)
        reviews = self.models['Review'].get_user_reviews(id)
        user_alias = user[0]['alias']
        user_email = user[0]['email']
        user_full_name = user[0]['full_name']
        return self.load_view('profile.html', user_alias=user_alias, user_email=user_email, user_full_name=user_full_name, reviews=reviews)

    def process(self,methods=['POST']):
        user_info = request.form
        create_status = self.models['User'].create_new(user_info)
        if create_status['status'] == True:
            session['id'] = create_status['user']['id']
            session['alias'] = create_status['user']['alias']
            return redirect('/books')
        else:
            for message in create_status['errors']:
                flash(message, 'error')
            return redirect('/')

    def login(self,methods=['POST']):
        info = request.form
        if self.models['User'].login_user(info) == False:
            flash("Invalid login!",'error')
            return redirect('/')
        else:
            user = self.models['User'].login_user(info)
            session['id'] = user['id']
            session['alias'] = user['alias']
            return redirect('/books')
    
    def logoff(self):
        session.pop('id')
        flash("You are now logged out",'error')
        return redirect('/')

