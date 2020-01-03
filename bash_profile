
#------ VulnHound Customs ------ *Thank you NahamSec!*

mass(){
hunt
cd massdns
./scripts/subbrute.py /Users/Dex/tools/wordlists/all.txt $1 | ./bin/massdns -r lists/resolvers.txt -t
bb
}

s3ls(){
aws s3 ls s3://$1
} #h/t Nahamsec

s3cp(){
aws s3 cp $2 s3://$1 
} #h/t Nahamsec

thewadl(){ #this grabs endpoints from a application.wadl and puts them in yahooapi.txt
curl -s $1 | grep path | sed -n "s/.*resource path=\"\(.*\)\".*/\1/p" | tee -a ~/tools/dirsearch/db/yahooapi.txt
} #h/t Nahamsec

crtndstry(){
./tools/crtndstry/crtndstry $1
} #h/t Nahamsec

am(){ #runs amass passively and saves to json
amass enum --passive -d $1 -json $1.json
jq .name $1.json | sed "s/\"//g"| httprobe -c 60 | tee -a $1-domains.txt
} #h/t Nahamsec

certprobe(){ #runs httprobe on all the hosts from certspotter
curl -s https://crt.sh/\?q\=\%.$1\&output\=json | jq -r '.[].name_value' | sed 's/\*\.//g' | sort -u | httprobe | tee -a ./all.txt
} #h/t Nahamsec

mscan(){ #runs masscan
sudo masscan -p4443,2075,2076,6443,3868,3366,8443,8080,9443,9091,3000,8000,5900,8081,6000,10000,8181,3306,5000,4000,8888,5432,15672,9999,161,4044,7077,4040,9000,8089,443,744$}
} #h/t Nahamsec

certspotter(){ 
curl -s https://certspotter.com/api/v0/certs\?domain\=$1 | jq '.[].dns_names[]' | sed 's/\"//g' | sed 's/\*\.//g' | sort -u | grep $1
} #h/t Michiel Prins

crtsh(){
curl -s https://crt.sh/?q\=%.$1\&output\=json | jq -r '.[].name_value' | sed 's/\*\.//g' | sort -u
} #h/t Nahamsec

certnmap(){
curl https://certspotter.com/api/v0/certs\?domain\=$1 | jq '.[].dns_names[]' | sed 's/\"//g' | sed 's/\*\.//g' | sort -u | grep $1  | nmap -T5 -Pn -sS -i - -$
} #h/t Jobert Abma

ipinfo(){
curl http://ipinfo.io/$1
} #h/t Nahamsec

dirsearch(){ runs dirsearch and takes host and extension as arguments
python3 ~/tools/dirsearch/dirsearch.py -u $1 -e html,asp,aspx,php,txt,xml,js -t 50 -b 
} #h/t Nahamsec

sqlmap(){
python ~/tools/sqlmap*/sqlmap.py -u $1 
} #h/t Nahamsec

ncx(){
nc -l -n -vv -p $1 -k
} #h/t Nahamsec

crtshdirsearch(){ #gets all domains from crtsh, runs httprobe and then dir bruteforcers
curl -s https://crt.sh/?q\=%.$1\&output\=json | jq -r '.[].name_value' | sed 's/\*\.//g' | sort -u | httprobe -c 50 | grep https | xargs -n1 -I{} python3 ~/tools/dirsearch/dirsearch.py -u {} -e $2 -t 50 -b 
} #h/t Nahamsec

hgrip(){                                                                                  
history | grep $1                                                                         
} #h/t Nahamsec

lf(){                                                                                     
cd ~/tools/LinkFinder && clear                                                        
python linkfinder.py -i $1 -d -o cli                                                  
}

alias devpy="cd ~/Documents/Python && clear && pwd && ls -l"
alias devc="cd ~/Documents/CLang && clear && pwd && ls -l"
alias devgo="cd ~/Documents/GoLang && clear && pwd && ls -l"
alias devbash="cd ~/Documents/BASH && clear && pwd && ls -l"
alias hunt="cd ~/tools && clear && pwd && ls -l"
alias bb="cd ~/BugBounty && clear && pwd && ls -l"
alias cl="clear && pwd && ls -l"
