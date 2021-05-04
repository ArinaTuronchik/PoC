# PoC
## templates/ --> has one template file
What we should improve:
1. maybe think about clientapi/partnerapi/deviceapi

## render.py --> simply renders /templates/nginx.conf
What we should improve in python code:
1. add env. vars
2. maybe create new function for creating environments
3. think about nginx structure itself (now it has only one file nginx.conf)
4. rethink of python code logic (it is not perfect at all)

## docker.yaml --> creates pod with nginx container and init container (they are connected via volume) that renders nginx.conf and a service
What we CAN improve:
1. what about the NodePort service, does it suits?

## docker-compose --> ups 2 containers, nginx and initial which does it's job and dies. they are also connected via volume
What we can improve;
1. delete it.
