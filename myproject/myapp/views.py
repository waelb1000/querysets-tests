import time
from django.shortcuts import render
from django.db import connection
from myapp.models import Project, Task, Employee
from myapp.forms import QueryForm

def measure_time(queryset):
    start_time = time.time()
    list(queryset)  # Force evaluation
    end_time = time.time()
    return end_time - start_time

def test_querysets(request):
    # Example 1: Simple query
    queryset1 = Project.objects.filter(status='active')
    time1 = measure_time(queryset1)

    # Example 2: Using select_related (doesn't apply here since no related fields)
    time2 = measure_time(Project.objects.all())

    # Example 3: Using values() to fetch specific fields
    queryset3 = Project.objects.values('name', 'status')
    time3 = measure_time(queryset3)

    # Example 4: Using iterator() for large querysets
    start_time = time.time()
    for project in Project.objects.iterator():
        pass
    time4 = time.time() - start_time

    return render(request, 'myapp/query_performance.html', {
        'time1': time1,
        'time2': time2,
        'time3': time3,
        'time4': time4,
    })
    


def query_view(request):
    result = None
    execution_time = None
    error = None

    if request.method == 'POST':
        form = QueryForm(request.POST)
        if form.is_valid():
            user_query = form.cleaned_data['queryset']

            try:
                # Measure the execution time
                start_time = time.time()
                
                # Execute the queryset using `eval`
                result = eval(user_query)
                
                # Calculate the time taken
                execution_time = time.time() - start_time
            except Exception as e:
                error = str(e)
    else:
        form = QueryForm()

    context = {
        'form': form,
        'result': result,
        'execution_time': execution_time,
        'error': error
    }
    return render(request, 'myapp/query.html', context)

