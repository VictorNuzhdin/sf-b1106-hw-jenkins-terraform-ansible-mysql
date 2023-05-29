# sf-b1106-hw-jenkins-terraform-ansible-mysql
For Skill Factory study project (B11, HW)

<br>


### 01. Общее описание
```bash
В данном репозитории представлены аналитические SQL-запросы к проекту открытого исследования РНК различных патогенных микроорганизмов (бактерий, вирусов, грибов и т.п.)

Public MySQL Database
https://docs.rfam.org/en/latest/about-rfam.html
https://docs.rfam.org/en/latest/database.html
- The Rfam database is a collection of RNA sequence families of structural RNAs including non-coding RNA genes as well as cis-regulatory elements.
  Each family is represented by a multiple sequence alignment and a covariance model (CM).
- Rfam provides a public read-only MySQL database containing the latest version of Rfam data.
  The database will be updated with each release.
```

### 02. Порядок работы

```bash
1. Установить MySQL CLI клиент вручную или с помощью shell-скрипта
   $ sudo apt install -y mysql-client
   или
   $ sudo ./mysql_deploy_client.sh

2. Выполнить один из SQL запросов вручную в любой IDE, либо вызвав MySQL CLI с параметрами, либо с помощью shell-скрипта
   $ cat mysql_queries/get_rfam_data_1.sql
   или
   $ mysql --user rfamro --host mysql-rfam-public.ebi.ac.uk --port 4497 --database Rfam < mysql_queries/get_rfam_data_1.sql
   или
   $ sudo ./mysql_execute_testQuery1.sh

3. в результате будет получена выборка по научным публикациям исследований генома короновируса CoV-19

4. кол-во записей в выборке устанавливается с помощью директивы LIMIT в SQL запросе (в исходной версии запроса выбирается 1 запись)
   и в итоге отобразится статус сервиса postgresql
```
