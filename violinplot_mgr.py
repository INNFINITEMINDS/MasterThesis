#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Sat May 12 23:13:53 2018

@author: mlempicka
"""

"""
Violin plot

"""
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

import warnings
warnings.filterwarnings("ignore")

SMALL2_SIZE = 12
SMALL_SIZE = 12
MEDIUM_SIZE = 18
BIGGER_SIZE = 16

plt.rc('axes', titlesize=SMALL2_SIZE)     # fontsize of the axes title
plt.rc('axes', labelsize=MEDIUM_SIZE)    # fontsize of the x and y labels
plt.rc('xtick', labelsize=SMALL_SIZE)    # fontsize of the tick labels
plt.rc('ytick', labelsize=SMALL_SIZE)    # fontsize of the tick labels
plt.rc('legend', fontsize=SMALL2_SIZE)    # legend fontsize
plt.rc('figure', titlesize=BIGGER_SIZE)  # fontsize of the figure title


'''  HIPOTEZA I  '''
df = pd.read_csv("/home/mlempicka/MLempicka/Magisterka/Programy/hipoteza_I.csv")
df.head() #to show top 5 rows

sns.set_style('whitegrid')

with sns.axes_style(style=None): # A1
    plt.rc('axes', titlesize=SMALL2_SIZE)     # fontsize of the axes title
    plt.rc('axes', labelsize=MEDIUM_SIZE)    # fontsize of the x and y labels
    plt.rc('xtick', labelsize=SMALL_SIZE)    # fontsize of the tick labels
    plt.rc('ytick', labelsize=SMALL_SIZE)    # fontsize of the tick labels
    plt.rc('legend', fontsize=SMALL2_SIZE)    # legend fontsize
    plt.rc('figure', titlesize=BIGGER_SIZE)  # fontsize of the figure title
    #plt.suptitle('Hipoteza I\nRozkład wartości asymetrii rytmu alfa z zastosowaniem \nwzoru A1 na elektrodach O i F')
    plt.subplot(1,2,1)
    plt.title('A_1,O')
    sns.violinplot( x='typ',y="A1_O", hue="diagnoza", data=df, split=True, inner="quartile",palette=["lightblue", "lightpink"]);
    plt.ylim(-4.0,4.6)
    plt.ylabel('Wartość asymetrii rytmu alfa')

    plt.subplot(1,2,2)
    plt.title('A_1,F')
    sns.violinplot( x='typ',y="A1_F", hue="diagnoza", data=df,split=True, inner="quartile",palette=["lightblue", "lightpink"]);
    plt.ylim(-4.0,4.6)
    plt.ylabel(' ')
plt.show()

with sns.axes_style(style=None): # A2
    #plt.suptitle('Hipoteza I\nRozkład wartości asymetrii rytmu alfa z zastosowaniem \nwzoru A2 na elektrodach O i F')
    plt.subplot(1,2,1)
    plt.title('A_2,O')
    sns.violinplot( x='typ',y="A2_O", hue="diagnoza", data=df,split=True, inner="quartile",palette=["lightblue", "lightpink"]);
    plt.ylim(-0.9,0.9) 
    plt.ylabel('Wartość asymetrii rytmu alfa')
    
    plt.subplot(1,2,2)
    plt.title('A_2,F')
    sns.violinplot( x='typ',y="A2_F", hue="diagnoza", data=df,split=True, inner="quartile",palette=["lightblue", "lightpink"]);
    plt.ylim(-0.9,0.9) 
    plt.ylabel(' ')
plt.show()  

    
'''  HIPOTEZA II  '''

dfa = pd.read_csv("/home/mlempicka/MLempicka/Magisterka/Programy/hipoteza_II.csv")
dfa.head() #to show top 5 rows

sns.set_style('whitegrid')


with sns.axes_style(style=None): # A1
    #plt.suptitle('Hipoteza II\nRozkład wartości asymetrii rytmu alfa z zastosowaniem \nwzoru A1 na elektrodach O i F')
    plt.subplot(1,2,1)
    plt.title('A_1,O')
    sns.violinplot( x='diagnoza',y="A1_O", hue="pomiar", data=dfa, split=True, inner="quartile",palette=["lightblue", "lightpink"]);
    plt.ylim(-4.5,4.5)
    plt.ylabel('Wartość asymetrii rytmu alfa')
       
    plt.subplot(1,2,2)
    plt.title('A_1,F')
    sns.violinplot( x='diagnoza',y="A1_F", hue="pomiar", data=dfa, split=True, inner="quartile",palette=["lightblue", "lightpink"]);
    plt.ylim(-4.5,4.5)
    plt.ylabel(' ')
plt.show()

with sns.axes_style(style=None): # A2
    #plt.suptitle('Hipoteza II\nRozkład wartości asymetrii rytmu alfa z zastosowaniem \nwzoru A2 na elektrodach O i F')
    plt.subplot(1,2,1)
    plt.title('A_2,O')
    sns.violinplot( x='diagnoza',y="A2_O", hue="pomiar", data=dfa, split=True, inner="quartile",palette=["lightblue", "lightpink"]);
    plt.ylim(-0.9,0.9) 
    plt.ylabel('Wartość asymetrii rytmu alfa')

    plt.subplot(1,2,2)
    plt.title('A_2,F')
    sns.violinplot( x='diagnoza',y="A2_F", hue="pomiar", data=dfa, split=True, inner="quartile",palette=["lightblue", "lightpink"]);
    plt.ylim(-0.9,0.9) 
    plt.ylabel(' ')
plt.show()



with sns.axes_style(style=None):  # A1
    #plt.suptitle('Hipoteza II\nRozkład wartości asymetrii rytmu alfa z zastosowaniem \nwzoru A1 na elektrodach O i F')
    plt.subplot(1,2,1)
    plt.title('A_1,O')
    sns.violinplot( x='pomiar',y="A1_O", hue="diagnoza", data=dfa, split=True, inner="quartile",palette=["lightblue", "lightpink"]);
    plt.ylim(-5.0,5.0)
    plt.ylabel('Wartość asymetrii rytmu alfa')
     
    plt.subplot(1,2,2)
    plt.title('A_1,F')
    sns.violinplot( x='pomiar',y="A1_F", hue="diagnoza", data=dfa, split=True, inner="quartile",palette=["lightblue", "lightpink"]);
    plt.ylim(-5.0,5.0) 
    plt.ylabel(' ')
plt.show()

with sns.axes_style(style=None): # A2
    #plt.suptitle('Hipoteza II\nRozkład wartości asymetrii rytmu alfa z zastosowaniem \nwzoru A2 na elektrodach O i F')
    plt.subplot(1,2,1)
    plt.title('A_2,O')
    sns.violinplot( x='pomiar',y="A2_O", hue="diagnoza", data=dfa, split=True, inner="quartile",palette=["lightblue", "lightpink"]);
    plt.ylim(-0.9,0.9) 
    plt.ylabel('Wartość asymetrii rytmu alfa')
 
    plt.subplot(1,2,2)
    plt.title('A_2,F')
    sns.violinplot( x='pomiar',y="A2_F", hue="diagnoza", data=dfa, split=True, inner="quartile",palette=["lightblue", "lightpink"]);
    plt.ylim(-0.9,0.9) 
    plt.ylabel(' ')
plt.show()


'''  HIPOTEZA III  '''

dafa = pd.read_csv("/home/mlempicka/MLempicka/Magisterka/Programy/hipoteza_III.csv")
dafa.head() #to show top 5 rows

sns.set_style('whitegrid')


with sns.axes_style(style=None): # A1
    #plt.suptitle('Hipoteza III\nRozkład wartości asymetrii rytmu alfa z zastosowaniem \nwzoru A1  na elektrodach O i F')
    plt.subplot(1,2,1)
    plt.title('A_1,O')
    sns.violinplot( x='typ',y="A1_O", hue="diagnoza", data=dafa, split=True, inner="quartile",palette=["lightblue", "lightpink"]);
    plt.ylim(-4.1,5.0)
    plt.ylabel('Wartość asymetrii rytmu alfa')

    plt.subplot(1,2,2)
    plt.title('A_1,F')
    sns.violinplot( x='typ',y="A1_F", hue="diagnoza", data=dafa, split=True, inner="quartile",palette=["lightblue", "lightpink"]);
    plt.ylim(-4.1,5.0)
    plt.ylabel(' ')

plt.show()

with sns.axes_style(style=None): # A2
    #plt.suptitle('Hipoteza III\nRozkład wartości asymetrii rytmu alfa z zastosowaniem \nwzoru A2 na elektrodach O i F')
    plt.subplot(1,2,1)
    plt.title('A_2,O')
    sns.violinplot( x='typ',y="A2_O", hue="diagnoza", data=dafa, split=True, inner="quartile",palette=["lightblue", "lightpink"]);
    plt.ylim(-0.9,1.0)
    plt.ylabel('Wartość asymetrii rytmu alfa')
    
    plt.subplot(1,2,2)
    plt.title('A_2,F')
    sns.violinplot( x='typ',y="A2_F", hue="diagnoza", data=dafa, split=True, inner="quartile",palette=["lightblue", "lightpink"]);
    plt.ylim(-0.9,1.0)
    plt.ylabel(' ')
    
plt.show()


'''  HIPOTEZA IV '''
'''
dafa4 = pd.read_csv("/home/mlempicka/MLempicka/Magisterka/Programy/hipoteza_IV.csv")
dafa4.head() #to show top 5 rows

sns.set_style('whitegrid')


with sns.axes_style(style=None): # A1
    #plt.suptitle('Hipoteza IV\nRozkład wartości asymetrii rytmu alfa z zastosowaniem \nwzoru A1  na elektrodach O i F')
    plt.subplot(1,2,1)
    sns.violinplot( x='typ',y="A1_O", hue="diagnoza", data=dafa4, split=True, inner="quartile",palette=["lightblue", "lightpink"]);
    plt.ylim(-4.0,4.0)

    plt.subplot(1,2,2)
    sns.violinplot( x='typ',y="A1_F", hue="diagnoza", data=dafa4, split=True, inner="quartile",palette=["lightblue", "lightpink"]);
    plt.ylim(-4.0,4.0)

plt.show()

with sns.axes_style(style=None): # A2
    plt.suptitle('Hipoteza IV\nRozkład wartości asymetrii rytmu alfa z zastosowaniem \nwzoru A2 na elektrodach O i F')
    plt.subplot(1,2,1)
    sns.violinplot( x='typ',y="A2_O", hue="diagnoza", data=dafa4, split=True, inner="quartile",palette=["lightblue", "lightpink"]);
    plt.ylim(-0.8,0.9)
    
    plt.subplot(1,2,2)
    sns.violinplot( x='typ',y="A2_F", hue="diagnoza", data=dafa4, split=True, inner="quartile",palette=["lightblue", "lightpink"]);
    plt.ylim(-0.8,0.9)
    
plt.show()

'''
'''  HIPOTEZA V '''
'''
dafa5 = pd.read_csv("/home/mlempicka/MLempicka/Magisterka/Programy/hipoteza_V.csv")
dafa5.head() #to show top 5 rows

sns.set_style('whitegrid')


with sns.axes_style(style=None): # A1
    plt.suptitle('Hipoteza V\nRozkład wartości asymetrii rytmu alfa z zastosowaniem \nwzoru A1  na elektrodach O i F')
    plt.subplot(1,2,1)
    sns.violinplot( x='typ',y="A1_O", hue="diagnoza", data=dafa5, split=True, inner="quartile",palette=["lightblue", "lightpink"]);
    plt.ylim(-5.5,5.5)

    plt.subplot(1,2,2)
    sns.violinplot( x='typ',y="A1_F", hue="diagnoza", data=dafa5, split=True, inner="quartile",palette=["lightblue", "lightpink"]);
    plt.ylim(-5.5,5.5)

plt.show()

with sns.axes_style(style=None): # A2
    plt.suptitle('Hipoteza V\nRozkład wartości asymetrii rytmu alfa z zastosowaniem \nwzoru A2 na elektrodach O i F')
    plt.subplot(1,2,1)
    sns.violinplot( x='typ',y="A2_O", hue="diagnoza", data=dafa5, split=True, inner="quartile",palette=["lightblue", "lightpink"]);
    plt.ylim(-1.1,1.1)
    
    plt.subplot(1,2,2)
    sns.violinplot( x='typ',y="A2_F", hue="diagnoza", data=dafa5, split=True, inner="quartile",palette=["lightblue", "lightpink"]);
    plt.ylim(-1.1,1.1)
    
plt.show()
'''