class Person {
  constructor(givenName, familyName) {

  }

  fullName() {
    return this.givenName + ' ' + this.familyName;
  }
}

export var one = 1;
export var opposite = !true;

export function hello(name) {
  return 'Hello, ' + name + '!';
};

export function obj(name) {
  return {
    name: name
  };
};

export function arr(name) {
  return [
    name,
    1,
    2,
    3
  ];
};

export function person(givenName, familyName) {
  return new Person(givenName, familyName);
};

var obj = {address: {street: 'Blossom Tree'}};

obj.address.street;
obj['address']['street'];
var address = 'address';
var street = 'street';
obj[address][street];

var anon = function(first, second) {
  return first ? 'Cool' : second ? 'Hello' : 'Goodbye';
};

anon(true, false);
anon(false, true);