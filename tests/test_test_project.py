from django.test import TestCase


class DummyTest(TestCase):
    def test_equal(self):
        self.assertTrue(1 == 1)
