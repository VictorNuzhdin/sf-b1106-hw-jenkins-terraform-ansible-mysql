#!/bin/bash

clear

echo '--EXECUTING VERY SECRET SQL QUERY..'
mysql --user rfamro --host mysql-rfam-public.ebi.ac.uk --port 4497 --database Rfam < mysql_queries/get_rfam_data_1.sql
echo

echo '--DONE'
