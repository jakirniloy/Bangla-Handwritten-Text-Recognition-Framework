from learningpoint.models import Newusers
from learningpoint.models import Userpost
from django.contrib import messages
from django.contrib.messages.api import success
from django.core.mail import send_mail
from django.conf import settings
from django.contrib.auth.hashers import make_password
from django.contrib.auth.hashers import check_password
import hashlib
from django.contrib.messages.api import success
from django.shortcuts import redirect, render
from django.shortcuts import render
from django.views.decorators.csrf import csrf_exempt
from django.http import JsonResponse
import cv2
import pytesseract
import numpy as np
import urllib.request
import os
import easyocr
from django.conf import settings
from django.core.files.storage import default_storage
from django.core.files.base import ContentFile
from django.http import JsonResponse


def index(request):    
    return render(request, 'index.html')

# def userreg(request):
#     if request.method=='POST':
#         Username=request.POST['username']
#         Email= request.POST['Email']
#         password = request.POST['password']
#         Newusers(Username=Username,Email=Email,password=password).save()
#         messages.success(request, 'The New User  '+request.POST['username']+' is Saved Successfully...!')
#         return render(request, 'registration.html')
#     else:
#        return render(request, 'registration.html')

def userreg(request):
    context = {
        
    }
    if request.method == 'POST':
        if request.POST.get('firstName') and request.POST.get('lastName') and request.POST.get('phoneNumber') and request.POST.get('expert') and request.POST.get('Email') and request.POST.get('password'):
            saveRecord = Newusers()

            t_email = request.POST.get('Email')

            saveRecord.firstName = request.POST.get('firstName')
            saveRecord.lastName = request.POST.get('lastName')
            saveRecord.phoneNumber = request.POST.get('phoneNumber')
            saveRecord.expert = request.POST.get('expert')
            saveRecord.point = '100'
            saveRecord.Email = t_email
            saveRecord.Username = t_email.split('@')[0]
            saveRecord.password = make_password(request.POST.get('password'))

            if saveRecord.isExists():
                messages.error(request, t_email +
                               " email address already registered!")
                return render(request, 'registration.html', context)
            else:
                saveRecord.save()
                messages.success(
                    request, "New user " + t_email.split('@')[0] + ", registration details saved successfully...! Please Log in now.")
                return render(request, 'index.html', context)

    else:
        return render(request, 'registration.html', context)


def loginpage(request):
    context = {
        
    }
    if request.method == 'POST':
        try:
            userDetail = Newusers.objects.get(Email=request.POST.get('Email'))
            if check_password(request.POST.get('password'), (userDetail.password)):
                request.session['Email'] = userDetail.Email
                return render(request, 'index.html', context)
            else:
                messages.success(
                    request, 'Password incorrect...!')
        except Newusers       .DoesNotExist as e:
            messages.success(
                request, 'No user found of this email....!')

    return render(request, 'login.html', context) 




# def loginpage(request):
#     context = {}
#     if request.method == 'POST':
#         try:
#             UserDetails = Newusers.objects.get(Email=request.POST.get(
#                 'Email'), password=request.POST.get('password'))
#             request.session['Email'] = UserDetails.Email       
#             return render(request, 'home.html', context)       
#         except Newusers.DoesNotExist as e:
#             messages.success(request, 'Username / Password Invalid...!')
#     return render(request, 'login.html', context)

def logout(request):
    try:
        del request.session['Email']
    except:
        return render(request, 'index.html')
    return render(request, 'index.html')

def home(request):
    
     if request.method == 'POST':
        if request.POST.get('questionTitle') and request.POST.get('qustionDescription') :
            saveQuestion = Userpost()

            users = Newusers.objects.raw(
                'SELECT * FROM learningpoint_newusers WHERE EMAIL = %s', [request.session['Email']])

            for user in users:

                saveQuestion.publisherId = user.id
                saveQuestion.publisherName = user.firstName + " " + user.lastName
                saveQuestion.title = request.POST.get('questionTitle')
                saveQuestion.description = request.POST.get(
                    'qustionDescription')
                
                

                if int(user.point) >= 10:
                    user.point = str(int(user.point) - 10)

                    user.save()

                    saveQuestion.save()
                    messages.success(
                        request, "Your question has been submitted!")
                    return render(request, 'home.html', {'users': users})
                else:
                    messages.success(
                        request, "You don't have enough point! Please buy points.")
                    return render(request, 'home.html', {'users': users})
     else:
        try:
            users = Newusers.objects.raw(
                'SELECT * FROM learningpoint_newusers WHERE EMAIL = %s', [request.session['Email']])
            return render(request, 'home.html', {'users': users})
        except:
            messages.success(request, 'You need to login first')
            return redirect('login')
#endhome
def term(request):
    return render(request, 'term.html')
def privacy(request):
    return render(request, 'privacy.html')
def notes(request):
    return render(request, 'mynotes.html')
def upload(request):
    return render(request, 'upload.html')
def mylibrary(request):
    return render(request, 'mylibrary.html')
def lstore(request):
    return render(request, 'store.html') 
def profile(request):
    users = Newusers.objects.raw('SELECT * FROM learningpoint_newusers WHERE EMAIL = %s', [request.session['Email']])
    return render(request, 'profile.html', {'users': users})

def blog(request):
    
    
        user = Newusers.objects.get(Email=request.session['Email'])
        questions = Userpost.objects.raw(
            'SELECT * FROM users_post  WHERE PUBLISHERID =  %s ORDER BY id DESC', [user.id])
        users = Newusers.objects.raw(
            'SELECT * FROM learningpoint_newusers WHERE EMAIL = %s', [request.session['Email']])
        return render(request, 'blog.html', {'questions': questions,'users': users})

  
# def upload(request):
#     # Check if the request method is POST
#     if request.method == "POST":
#         # Get the image from the request
#         image_data = request.FILES.get("image")
#         if image_data:
#             # # image_array = np.array(image_data)
#             # input = preprocess_image(image_data) 
          
#             # text = model.predict(input)
#             #create a prepossessing function
            
            
#             # Read the image and preprocess it
#             # image = Image.open(image_data)
#             # image = image.convert("RGB")
#             # image = image.resize(100, 250)
#             # image = np.array(image) / 255.0
#             # image = np.expand_dims(image, axis=0)
#             # img_resized = Image.resize((100, 250), resample=Image.Resampling.NEAREST)

#             # Make a prediction using the OCR model
#             # prediction = model.predict(image)
#             # Decode the prediction
#             text = "আপনার জ্ঞান বাড়াতে আপনাকে সাহায্য করার জন্য আমাদের হৃদয়ে সর্বোত্তম উদ্দেশ্য রয়েছে"

#         # Render template with recognized text
#         return render(request, "upload.html", {"text": text})

#     return render(request, "upload.html")


def upload(request):
    # Check if the request method is POST
    if request.method == "POST":
        # Get the image from the request
        img_url =  request.FILES.get("image")
        
        img_np = np.array(bytearray(img_url.read()), dtype=np.uint8)
        img = cv2.imdecode(img_np, cv2.IMREAD_COLOR)

        # Convert image to grayscale
        gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)

        # Apply threshold to remove noise
        thresh = cv2.threshold(gray, 0, 255, cv2.THRESH_BINARY_INV + cv2.THRESH_OTSU)[1]

        # Apply dilation to make text more visible
        kernel = np.ones((5,5),np.uint8)
        dilate = cv2.dilate(thresh, kernel, iterations = 1)

        # Perform OCR using pytesseract
        text = pytesseract.image_to_string(dilate, lang='ben', config='--psm 6')
        
        # text = 'বৃহত্তর'
        # Render template with recognized text

        
        return render(request, "upload.html", {"text": text, 'image': img_url})
    
    return render(request, 'upload.html')

    


def edit_profile(request):
    if request.method == 'POST':
        users = Newusers.objects.raw(
            'SELECT * FROM learningpoint_newusers WHERE EMAIL = %s', [request.session['Email']])
        if request.POST.get('editFirstName') and request.POST.get('editLastName') and request.POST.get('editPhoneNumber') and request.POST.get('editEmail') and request.POST.get('editUsername') and request.POST.get('editExpert'):

            updateRecord = Newusers()

            updateRecord.id = users[0].id
            updateRecord.firstName = request.POST.get('editFirstName')
            updateRecord.lastName = request.POST.get('editLastName')
            updateRecord.phoneNumber = request.POST.get('editPhoneNumber')
            updateRecord.Email = request.POST.get('editEmail')
            updateRecord.Username = request.POST.get('editUsername')
            updateRecord.expert = request.POST.get('editExpert')
            updateRecord.password = users[0].password
            updateRecord.point = users[0].point

            if len(request.FILES) != 0:
                updateRecord.image = request.FILES['editPhoto']

            updateRecord.save()
            messages.success(
                request, "User details updated successfully...!")

            return redirect('edit-profile')

    else:
        try:
            users = Newusers.objects.raw(
                'SELECT * FROM learningpoint_newusers WHERE EMAIL = %s', [request.session['Email']])
            return render(request, 'edit-profile.html', {'users': users})
        except:
            messages.success(request, 'You need to login first')
            return redirect('loginpage')

def blog(request):
    if request.method == 'POST':
        image_file = request.FILES['image']
        image_path = default_storage.save(os.path.join(settings.MEDIA_ROOT, 'temp', image_file.name), ContentFile(image_file.read()))
        image_url = os.path.join(settings.MEDIA_URL, 'temp', image_file.name)
        reader = easyocr.Reader(['bn'], gpu=False)  # Create an EasyOCR reader for Bangla language
        results = reader.readtext(image_path, detail=0)  # Perform OCR on the uploaded image
        return reader(request, "blog.html",{'image_url': image_url, 'results': results})
    return render(request, 'blog.html')

def lstore(request):
    if request.method == 'POST' and request.FILES['image']:
        image = request.FILES['image'].read()
        reader = easyocr.Reader(['bn'])

        #image preprocessing gussian blur
    

    

    
                

        

        results = reader.readtext(image, detail=0)
       
           
        text="".join(results)
            
        
        return render(request, 'store.html', {'text': results})
    return render(request, 'store.html')
   






           