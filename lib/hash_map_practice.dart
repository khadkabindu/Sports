var user = {
  1: {
    "name": "rajesh",
    "company": [
      {
        "name": "smartmobe",
        "address": {"location": "nepalgunj", "ward": 5}
      },
      {"name": "jeevee"}
    ]
  },
};

Map<String, String> getWordCounts(String data) {}

void main() {
  String name = user[1]['name'];
  print(name);

  List<Map<String, Object>> company = (user[1]['company']);
//  company[0]['name'] = "Leapfrog";

//  print(company[0]['name']);

  Map<String, Object> address = company[0]['address'];
  print(address);
  company[0]['address'] = [
    {"lattitude": 2342342, "longitude": 2343242},
    {}
  ];

  print(user);

  getWordCounts("this is rajesh from ktm");

  List a = [1, 2, 3, 5];

  List b = [2, 3, 4, 5];
  List result = [...a, ...b];

  Map<String, String> person = {"name": "rajesh"};

  Map location = {"location": "Nepal"};

  Map re = {...person, ...address, "qualification": "mbbs"};
  print(re);



}

// hash map is a kind of array the subtle difference is hash map can have any key that is needed

// var user = Map();
