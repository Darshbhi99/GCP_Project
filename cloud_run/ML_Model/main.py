import pandas as pd
from sklearn.ensemble import RandomForestClassifier
from sklearn.model_selection import train_test_split
from sklearn.metrics import classification_report
import json

df = pd.read_csv('credit_card_payments.csv')

X= df[df.columns.difference(['Class'])]
y= df['Class']

X_train, X_test, y_train, y_test = train_test_split(X,y, test_size=0.33)
clf = RandomForestClassifier(n_estimators=600)
clf.fit(X_train, y_train)

prediction = clf.predict(X_test)

model_accuracy_metrics = classification_report(y_test, prediction, output_dict=True)

accuracy_metrics = json.dumps(model_accuracy_metrics, indent=4)

with open('classification_report.json', 'w') as outfile:
    outfile.write(accuracy_metrics)

