$(document).ready(function() {
	function SidebarViewModel(){
		//Data
		var self = this; 
		self.executives = ['Grant Isom', 'Cole Jurden', 'Evan Nichols'];
		self.developers = ['Stefan Mendoza','Alex Ugarte','Wes Hoffman', 'Noah Benham', 'Lei Wang', 'Paydon Wilson'];
		self.staffInfo = {
			"Grant Isom":
			{
	                    "image":"http://i.imgur.com/9nSL4B2.jpg",
	                    "github": "glisom",
	                    "email": "grant@calibercontracting.co",
	                    "phone": "(918)-691-9891",
	                    "motto": "Burrito King is really good",
	                    "name":"Grant Isom",
	                    "description":"With over three years of software consulting experience, and three internships over his fours years at KU, Grant runs Caliber's day to day operations including finances and customer relations.",
	                    "position": "Operations"
	        }, 
	        "Cole Jurden":
			{
	                    "image":"http://i.imgur.com/lzt17Di.png?1",
	                    "github": "cjurden",
	                    "email": "jurden@calibercontracting.co",
	                    "phone": "(918)-691-9892",
	                    "motto": "Burger King is really good",
	                    "name":"Cole Jurden",
	                    "description":"Cole has worked with companies such as TuneIn and Cerner in the past, and manages all the legal aspects of Caliber. He is also in charge of contract generation and B2B communication.",
	                    "position": "Operations"
	        },            
            "Evan Nichols":
			{
	                    "image":"http://i.imgur.com/D9uIg4p.png",
	                    "github": "enichols",
	                    "email": "nochols@calibercontracting.co",
	                    "phone": "(918)-691-9893",
	                    "motto": "KFC King is really good",
	                    "name":"Evan Nichols",
	                    "description":"Evan has done design work for many KU organizations and Kansas City Startups, he also has worked with Garmin in the past. He runs recruitment and manages our student matching and vetting processes.",
	                    "position": "Lead Developer"
	        }

		}

		self.chosenStaffData = ko.observable();
		//Behaviors
		self.goToStaff = function(name) {

			self.chosenStaffData({"image": self.staffInfo[name].image, 
									"name": self.staffInfo[name].name, 	
									"github": self.staffInfo[name].github,
	                    			"email": self.staffInfo[name].email,
	                    			"phone": self.staffInfo[name].phone,
	                    			"motto": self.staffInfo[name].motto,
									"description": 	self.staffInfo[name].description, 
									"position": self.staffInfo[name].position
									});
									
		}
		self.goToStaff("Grant Isom");

	}


	ko.applyBindings(new SidebarViewModel());
});