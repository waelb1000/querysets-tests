from django.core.management.base import BaseCommand
from .models import Project
from faker import Faker

class Command(BaseCommand):
    help = 'Populate the database with sample data'

    def handle(self, *args, **kwargs):
        fake = Faker()
        for _ in range(1000):
            Project.objects.create(
                name=fake.company(),
                description=fake.text(),
                status=fake.random_element(['active', 'completed', 'pending'])
            )
        self.stdout.write(self.style.SUCCESS('Database populated with sample data!'))
