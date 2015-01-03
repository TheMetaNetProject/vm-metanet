#!/bin/bash
# Run all the gold tests, logging all messages. Output files will be written to the current directory. 
rm -f m4log.txt
m4detect -v -j /u/metanet/IARPATesting/gold/GSEN_m4detect_input.json >>m4log.txt 2>&1
m4detect -v -j /u/metanet/IARPATesting/gold/GSES_m4detect_input.json >>m4log.txt 2>&1
m4detect -v -j /u/metanet/IARPATesting/gold/GSRU_m4detect_input.json >>m4log.txt 2>&1
m4detect -v -j /u/metanet/IARPATesting/gold/GSFA_m4detect_input.json >>m4log.txt 2>&1
m4mapping -v -j /u/metanet/IARPATesting/gold/GSEN_m4mapping_input.json >>m4log.txt 2>&1
m4mapping -v -j /u/metanet/IARPATesting/gold/GSES_m4mapping_input.json >>m4log.txt 2>&1
m4mapping -v -j /u/metanet/IARPATesting/gold/GSRU_m4mapping_input.json >>m4log.txt 2>&1
m4mapping -v -j /u/metanet/IARPATesting/gold/GSFA_m4mapping_input.json >>m4log.txt 2>&1
m4source -v -j /u/metanet/IARPATesting/gold/GSEN_m4source_input.json >>m4log.txt 2>&1
m4source -v -j /u/metanet/IARPATesting/gold/GSES_m4source_input.json >>m4log.txt 2>&1
m4source -v -j /u/metanet/IARPATesting/gold/GSRU_m4source_input.json >>m4log.txt 2>&1
m4source -v -j /u/metanet/IARPATesting/gold/GSFA_m4source_input.json >>m4log.txt 2>&1
m4affect -v -j /u/metanet/IARPATesting/gold/GSEN_m4affect_input.json >>m4log.txt 2>&1
m4affect -v -j /u/metanet/IARPATesting/gold/GSES_m4affect_input.json >>m4log.txt 2>&1
m4affect -v -j /u/metanet/IARPATesting/gold/GSRU_m4affect_input.json >>m4log.txt 2>&1
m4affect -v -j /u/metanet/IARPATesting/gold/GSFA_m4affect_input.json >>m4log.txt 2>&1
