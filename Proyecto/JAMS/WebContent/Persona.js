/**
 * 
 */

class Persona{
	constructor(user_ID,first_name,age,interests,gender,about_me,work,age_range){
		this.user_ID = user_ID;
		this.first_name = first_name;
		this.age = age;
		this.interests = interests;
		this.gender = gender;
		this.about_me = about_me;
		this.work = work;
		this.age_range = age_range;
	}
	
	
	saludar(){
		console.log("Hola mi nombre es ${this.first_name} y tengo ${this.age");
	}
}

let persona = new Persona(1,"Serzulu", 22,"nada","MachoAlfa", "EstoyBueno", "MiTrabajoEsLaMierda",22);

persona.saludar();