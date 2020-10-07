class Vegetable():
    growing_season = "";
    time_to_harvest = 0;
    def __init__(self, growing_season, time_to_harvest):
        self.growing_season = growing_season;
        self.time_to_harvest = time_to_harvest;

    def get_bite_sound(self):
        raise NotImplementedError("get_bit_sound is an abstract method and must be implemented in the subclass");

class Carrot(Vegetable):
    def __init__(self,growing_season, time_to_harvest):
        super().__init__(growing_season, time_to_harvest);

    def get_bite_sound(self):
        return "crunch";

class Tomato(Vegetable):
    def __init__(self,growing_season, time_to_harvest):
        super().__init__(growing_season, time_to_harvest);

    def get_bite_sound(self):
        return "squish";
