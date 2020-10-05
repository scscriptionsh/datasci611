from . import Vegetable

class Eggplant(Vegetable):
    def __init__(self,growing_season, time_to_harvest):
        super().__init__(growing_season, time_to_harvest);

    def get_bite_sound(self):
        return "soft crunch";

class Rutabaga(Vegetable):
    def __init__(self,growing_season, time_to_harvest):
        super().__init__(growing_season, time_to_harvest);

    def get_bite_sound(self):
        return "hard crunch";

