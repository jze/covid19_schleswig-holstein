#!/usr/bin/python3
# coding: utf-8

# In[1]:


import geopandas as gpd
import pandas as pd
import matplotlib.pyplot as plt


# In[2]:


df = gpd.read_file("landkreise_simplify200.geojson")


# In[3]:


data = pd.read_csv('data.csv', sep='\t')


# In[4]:


letzterTag = data.tail(1).transpose().drop(['#','SUMME']).reset_index()
letzterTag.columns = ['GEN','Positivmeldungen']


# In[5]:


sh = pd.merge(df,letzterTag,on='GEN')


# In[6]:


sh['pro_100000'] = sh['Positivmeldungen'] / sh['population'] * 100000


# In[11]:


fig, ax = plt.subplots(1, figsize=(10, 6))
ax.axis('off')

ax.set_title('COVID-19 Meldungen pro 100.000 Einwohner', fontdict={'fontsize': 20, 'fontweight' : 3})
ax.annotate('Quelle: Webseite des Landes "Positivmeldungen der Kreise"\nKartendaten: ©GeoBasis-DE / BKG 2013 (Daten verändert)',xy=(0.1, .08),  xycoords='figure fraction', horizontalalignment='left', verticalalignment='top', fontsize=12, color='#555555')

sm = plt.cm.ScalarMappable(cmap='Reds', norm=plt.Normalize(vmin=sh['pro_100000'].min(), vmax=sh['pro_100000'].max()))
sm._A = []
fig.colorbar(sm)

sh.plot(column='pro_100000', cmap='Reds', linewidth=0.8, ax=ax, edgecolor='0.3', figsize=(12,8));

fig.savefig('karte.png', dpi=90)

