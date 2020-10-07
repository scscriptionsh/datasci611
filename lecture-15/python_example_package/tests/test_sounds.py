import unittest

from veggies import Carrot


class TestSunds(unittest.TestCase):
    def test_list_carrot(self):
        """
        Test that carrots are crunch.
        """
        c = Carrot("winter",3);
        self.assertEqual(c.get_bite_sound(),"crunch")

if __name__ == '__main__':
    unittest.main()
