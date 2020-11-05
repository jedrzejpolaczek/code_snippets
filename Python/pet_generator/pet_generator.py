import random
import time


class PetGenerator:

    def __init__(self):
        self.__species = ['CAT', 'DOG']
        self.__breeds = {
            'CAT': [],
            'DOG': []
        }
        self.__names_list = list
        self.pets_data = []

        self.__data_loader()
        self.__generate()

    def __load_pets(self, pet_type):
        pet_path = '{}_breeds'.format(pet_type)
        with open(pet_path) as breeds:
            self.__breeds[pet_type] = breeds.read().split()
            for index in range(0, len(self.__breeds[pet_type])-1):
                self.__breeds[pet_type][index] = self.__breeds[pet_type][index] \
                    if self.__breeds[pet_type][index][-1:] != ',' \
                    else self.__breeds[pet_type][index][:-1]

    def __data_loader(self):
        self.__load_pets('CAT')
        self.__load_pets('DOG')

        with open('pet_names') as names:
            self.__names_list = names.read().split()
            for index in range(0, len(self.__names_list)):
                self.__names_list[index] = self.__names_list[index] \
                    if self.__names_list[index][-1:] != ',' \
                    else self.__names_list[index][:-1].capitalize()

    def __generate(self):
        for index in range(0, 100000):
            self.pets_data.append({'Name': '', 'Species': '', 'Breed': '', 'Age': '', 'Weight': ''})
            self.pets_data[index]['Name'] = random.choice(self.__names_list)
            self.pets_data[index]['Species'] = random.choice(self.__species)
            self.pets_data[index]['Breed'] = random.choice(self.__breeds[self.pets_data[index]['Species']])
            self.pets_data[index]['Age'] = random.randint(0, 20) \
                if self.pets_data[index]['Species'] == 'cat' \
                else random.randint(0, 10)
            self.pets_data[index]['Weight'] = random.randint(1, 5) \
                if self.pets_data[index]['Species'] == 'cat'\
                else random.randint(1, 20)

    def print(self):
        for i in self.pets_data:
            print('Name: {}', repr(i['Name']).ljust(8),
                  'Species: ', repr(i['Species']).ljust(0),
                  'Breed: ', repr(i['Breed']).ljust(8),
                  'Age: ', repr(i['Age']).ljust(2),
                  'Weight: ', repr(i['Weight']).ljust(2))


start = time.time()
pet_generator = PetGenerator()

final_data_file = open('data', 'r+')
for pet in pet_generator.pets_data:
    string_pet = str(pet)[1:-1]
    final_data_file.write('{}\n'.format(string_pet))

end = time.time()
print(end - start)

