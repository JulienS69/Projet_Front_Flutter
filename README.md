# Projet Listing Opérations

Projet FRONT WEB Flutter consistant à afficher la liste des opérations bancaires récupérer depuis une API construite avec Laravel et cette API connectée à une base de données hébergée et sécurisée sur une machine virtuelle Linux. 

Un projet à rendre pour monsieur KENORE Ahmed.

## Tutoriel d'installation

- 1ère étape : Création de la base de données webAPP sur la machine Linux avec la création du user "webappuser" et la création de son mot de passe.(A noter, afin que l'application fonctionne parfaitement et n'avoir aucunes modifications à faire, il est nécéssaire d'avoir la même syntaxe sur les attributs et le nom de la table Opération. Dans notre projet, pour le front et l'API, la table Opération se note "operations" et ses attributs sont :
```sql
"Id_op" => type int
"Type" => type varchar
"DateOp" => type date
"Montant" => type decimal
"Id_Cpt" => type int
```
Voici le jeu de données à insérer : 
```sql
insert into operations values(1,'Transaction', '2022-05-03', 150, 1);
insert into operations values(2,'Virement', '2022-07-01', 200, 1);
insert into operations values(3,'Crédit Immobilier', '2022-07-03', 400, 1);
insert into operations values(4,'Crédit Conso', '2022-07-04', 450, 1);
insert into operations values(5,'Rachat de crédit', '2022-07-05', 550, 1);
insert into operations values(6,'Assurance prêt immobilier', '2022-07-06', 200000, 1);
insert into operations values(7,'Banque en ligne', '2022-07-07', 2000, 1);
insert into operations values(8,'Épargne', '2022-07-08', 1600, 1);

```
- 2ème étape : Ne pas oublié d'autoriser votre adresse IP, pour se faire aller dans une invite de commande, chercher votre adresse IP puis autoriser la avec tous les droit dans votre base de données : 

![image](https://user-images.githubusercontent.com/60474003/176898409-2b1a666a-e30b-49e1-b775-0783d0ff2a7d.png)

![image](https://user-images.githubusercontent.com/60474003/176898616-7174adc5-79e7-47ff-a73a-adc1848902fc.png)


3ème étape : Démarrer votre serveur dans la machine virtuel pour y avoir accès depuis l'extérieur de celle-ci : ![image](https://user-images.githubusercontent.com/60474003/176899269-4cfc44b5-99b3-4ae0-97cf-6542c7063e6f.png)

4ème étape : Récupérer l'API en clonant ce dépôt : https://github.com/JulienS69/Projet-Back-API-for-Flutter-Front.git



5ème étape : Vérrifier les variables d'environnements dans le fichier .ENV de l'API : 

![image](https://user-images.githubusercontent.com/60474003/176900654-c6209066-927b-404b-99a5-333a77ff05dd.png) 

puis démarrer le serveur en tapant la commande :

```php 
php artisan serve 
```
Vous pouvez tester la connection avec votre API via Postman (Uniquement la route "operations" a été créée pour le besoin du projet, pour que le projet Front fonctionne correctement, elle doit vous retourner les données comme ci-dessous : 

![image](https://user-images.githubusercontent.com/60474003/176900346-a4a42f32-0187-49bf-83c4-611f294d6cff.png)


6ème étape : 
Pré-requis : Avoir installer le SDK Flutter sur votre PC (https://docs.flutter.dev/get-started/install)

Ouvrir le projet "Projet_Front_Flutter-master" et lancer le vous devriez aprecevoir le même résultat que la vidéo ci-dessous : 



Enjoy !

