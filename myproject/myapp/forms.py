# query_app/forms.py
from django import forms

class QueryForm(forms.Form):
    queryset = forms.CharField(
        widget=forms.Textarea(attrs={'rows': 5, 'placeholder': 'Enter your Django queryset here...'}),
        label='Queryset',
        required=True
    )
