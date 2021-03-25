#!/bin/bash
set -e  # Exit immediately if a command exits with a non-zero status.
dropdb helios
createdb helios
python manage.py makemigrations
python manage.py migrate
echo "from helios_auth.models import User; User.objects.create(user_type='google',user_id='thiago.b.vasconcelos@gmail.com', info={'name':'Thiago Vasconcelos'})" | python manage.py shell
echo "from helios_auth.models import User; User.objects.create(user_type='password',user_id='thiago.b.vasconcelos@gmail.com', info={'name':'Admin','password':'923885'}, admin_p=True)" | python manage.py shell