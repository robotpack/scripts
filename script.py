#!/usr/bin/env python3
#vs 1.0

import os
import time
import sys

listaContas=open('lista.txt', 'r')

os.system("sudo rm -rf *.png")
os.system("sudo rm -rf url*")

for contas in listaContas :
    
    print(" ")
    conta=contas
    print(conta)
    
    user=conta[0:3]
    
    os.system("tmux kill-window -t _login")
    print("Criando tmux login...")
    os.system("tmux new -s _login -d './login.sh'")
    os.system("./capturar_url.sh")
    print("Formatando url")
    os.system("./format_url.sh")
    url = open('url.txt', 'r')
    os.system("sudo pkill chrome*")
    print("Criando drive")
    from selenium import webdriver
    from selenium.webdriver.chrome.options import Options
    CHROMEDRIVER_PATH = '/usr/local/bin/chromedriver'
    WINDOW_SIZE = "1920,1080"
    chrome_options = Options()
    chrome_options.add_argument("--headless")
    chrome_options.add_argument("--window-size=%s" % WINDOW_SIZE)
    chrome_options.add_argument('--no-sandbox')
    #chrome_options.add_argument('--user-agent=Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.75 Safari/537.36')
    driver = webdriver.Chrome(executable_path=CHROMEDRIVER_PATH,chrome_options=chrome_options)
    
    driver.refresh()
    driver.delete_all_cookies()
    driver.get(url.read())
    time.sleep(2)
    
    driver.find_element_by_id('Email').send_keys(conta)
    #driver.find_element_by_id('next').click()
    time.sleep(2)
    driver.find_element_by_id('password').click()
    driver.find_element_by_id('password').send_keys("tWxZxrVGfk2E2L4")
    driver.find_element_by_id('submit').click()
    time.sleep(2)
    #driver.get_screenshot_as_file('screenshot.png')
    driver.find_element_by_id('accept').click() #botao de nova conta G Suite
    time.sleep(2)
    driver.find_element_by_id('submit_approve_access').click()
    time.sleep(2)
    print("Inserindo codigo")
    print(driver.find_element_by_xpath('/html/body/div[1]/div[1]/div[2]/div/div[2]/div/div/div[2]/div/div[1]/div/form/span/section/div/div/div/span/div/textarea').text)

    os.system("tmux send -t '_login' " + driver.find_element_by_xpath('/html/body/div[1]/div[1]/div[2]/div/div[2]/div/div/div[2]/div/div[1]/div/form/span/section/div/div/div/span').text + " C-m")
    time.sleep(4)

    email=conta[0:14]

    print("Instalando " + user )
    os.system("tmux new -s " + user + " -d " ) 
    time.sleep(2)
    os.system("tmux send-keys -t " + user + " ' ./cloud-shell.sh ' " + email + " C-m " )
    time.sleep(4) #Para o processo nao morrer
    print("OK!")

    del driver
