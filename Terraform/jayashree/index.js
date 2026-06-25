class Details {
    constructor(name, age) {
        this.name = name;
        this.age = age
    }

    getDetails() {
        return {
            name: this.name,
            age: this.age
        }
    }
}

const person = new Details("Jayashree", 28)

console.log(person.getDetails())