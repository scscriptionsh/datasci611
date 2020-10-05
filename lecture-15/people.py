class Person:
    name = "";
    def __init__(self, nm):
        self.name = nm;

    def __str__(self):
        return "Person: {0}".format(self.name);

    def get_name(self):
        return self.name;

    def greet_another(self, person):
        print("Hello {0}, my name is {1}".format(person.get_name(), self.get_name()));
        
class Employee(Person):
    company = "";
    def __init__(self,name,cmp):
        super().__init__(name);
        self.company = cmp;
    
    def __str__(self):
        return super().__str__() + (", Employed at: {0}".format(self.company));

