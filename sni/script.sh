#!/bin/bash
curl "https://kaeferjaeger.gay/sni-ip-ranges/amazon/ipv4_merged_sni.txt">> ipv4_amazon_sni.txt
curl "https://kaeferjaeger.gay/sni-ip-ranges/digitalocean/ipv4_merged_sni.txt">> ipv4_digitalocean_sni.txt
curl "https://kaeferjaeger.gay/sni-ip-ranges/google/ipv4_merged_sni.txt">> ipv4_google_sni.txt
curl "https://kaeferjaeger.gay/sni-ip-ranges/microsoft/ipv4_merged_sni.txt">> ipv4_microsoft_sni.txt
curl "https://kaeferjaeger.gay/sni-ip-ranges/oracle/ipv4_merged_sni.txt">> ipv4_oracle_sni.txt
