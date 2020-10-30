#!/usr/bin/env python3

import os
import time
import sys
import pandas as pd

lista=pd.read_csv('gmail.csv' , delimiter=';')
lista.head()

os.system("sudo rm -rf *.png")
os.system("sudo rm -rf url*")

for label, row in lista.iterrows():

    print(" ")
    conta=row['email']
    print(conta)

    user=conta.replace(".com","")
    print(user)

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

    chrome_options.add_argument('--user-agent=Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.75 Safari/537.36')

    driver = webdriver.Chrome(executable_path=CHROMEDRIVER_PATH,chrome_options=chrome_options)

    driver.refresh()
    driver.delete_all_cookies()
    driver.get(url.read())

    time.sleep(2)
    driver.get_screenshot_as_file('screenshot_0.png')

    #print( driver.page_source )

    driver.find_element_by_id('identifierId').send_keys(conta)
    driver.get_screenshot_as_file('screenshot_1.png')
    driver.find_element_by_id('identifierNext').click()
    time.sleep(2)
    driver.get_screenshot_as_file('screenshot_2.png')
    driver.find_element_by_name('password').click()
    driver.find_element_by_name('password').send_keys(row['senha'])
    driver.find_element_by_id('passwordNext').click()
    time.sleep(2)
    #driver.find_element_by_id('accept').click() #botao de nova conta G Suite
    time.sleep(2)
    driver.get_screenshot_as_file('screenshot_3.png')

    page = open('page.html','w')
    texto=driver.page_source
    texto=texto.encode('utf8')
    page.write(texto)

    driver.find_element_by_xpath('//*[@id="view_container"]/div/div/div[2]/div/div[1]/div/form/span/section/div/div/div/ul/li[1]/div/div[2]').click()
    time.sleep(10)
    driver.get_screenshot_as_file('screenshot_4.png')

    page = open('page2.html','w')
    texto=driver.page_source
    texto=texto.encode('utf8')
    page.write(texto)

    driver.find_element_by_id('knowledge-preregistered-email-response').send_keys('contato.salesgames@gmail.com')
    driver.find_element_by_xpath('//*[@id="view_container"]/div/div/div[2]/div/div[2]/div/div[1]/div/div/button').click()

    time.sleep(10)

    page = open('page3.html','w')
    texto=driver.page_source
    texto=texto.encode('utf8')
    page.write(texto)

    driver.get_screenshot_as_file('screenshot_5.png')

    driver.find_element_by_id('submit_approve_access').click()
    time.sleep(2)
    print("Inserindo codigo")
    print(driver.find_element_by_xpath('/html/body/div[1]/div[1]/div[2]/div/div[2]/div/div/div[2]/div/div[1]/div/form/span/section/div/div/div/span/div/textarea').text)

    os.system("tmux send -t '_login' " + driver.find_element_by_xpath('/html/body/div[1]/div[1]/div[2]/div/div[2]/div/div/div[2]/div/div[1]/div/form/span/section/div/div/div/span').text + " C-m")
    time.sleep(2)

    print("Instalando " + user )
    os.system("tmux new -s " + user + " -d " )
    time.sleep(2)
    os.system("tmux send-keys -t " + user + " ' ./cloud-shell.sh ' " + conta + " C-m " )
    time.sleep(4) #Para o processo nao morrer
    print("OK!")

    del driver
