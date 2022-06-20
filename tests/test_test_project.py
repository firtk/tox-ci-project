import sys

from django.test import TestCase


class DummyTest(TestCase):
    def test_equal(self):
        print(sys.version_info)
        self.assertTrue(1 == 1)
