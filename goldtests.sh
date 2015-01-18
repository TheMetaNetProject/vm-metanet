#!/bin/bash
# Run all the gold tests, logging all messages. Output files will be written to the current directory. 
/u/metanet/sbin/startsesame.sh
sleep 30
rm -f m4log.txt
m4detect -v -j /u/metanet/IARPATesting/gold/GSEN_m4detect_input.json >>m4log.txt 2>&1
m4detect -v -j /u/metanet/IARPATesting/gold/GSES_m4detect_input.json >>m4log.txt 2>&1
m4detect -v -j /u/metanet/IARPATesting/gold/GSRU_m4detect_input.json >>m4log.txt 2>&1
m4detect -v -j /u/metanet/IARPATesting/gold/GSFA_m4detect_input.json >>m4log.txt 2>&1
m4mapping -v -j /u/metanet/IARPATesting/gold/GSEN_m4mapping_input.json >>m4log.txt 2>&1
m4mapping -v -j /u/metanet/IARPATesting/gold/GSES_m4mapping_input.json >>m4log.txt 2>&1
m4mapping -v -j /u/metanet/IARPATesting/gold/GSRU_m4mapping_input.json >>m4log.txt 2>&1
m4mapping -v -j /u/metanet/IARPATesting/gold/GSFA_m4mapping_input.json >>m4log.txt 2>&1
/u/metanet/sbin/stopsesame.sh
