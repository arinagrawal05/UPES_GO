import 'package:cloud_firestore/cloud_firestore.dart';

class MessData {
  static final sunday = {
    "": [],
  };
  static final monday = {
    "breakfast": ["Hot Milk", "Aloo Pyaza", "Dahi", "Shezwan Chutney"],
    "lunch": [
      "Salad, pickle,lemon & chili",
      "Kala Chana Dal",
      "Plain Roti & Rice",
      "Cucumber Raita",
      "Cabage mutter"
    ],
    "hiTea": ["bread Roll", "Tea", "saunt & Green Chutney"],
    "dinner": [
      "Salad, pickle,lemon & chili",
      "aloo matar rasilla",
      "Kali masoor dal",
      "Jeera Rice & roti",
      "Sponge Rasgulla"
    ]
  };
  static final tuesday = {
    "breakfast": ["Hot Milk", "Idli", "Sambhar", "Vada", "Coconut Chutney"],
    "lunch": [
      "Salad, pickle,lemon & chili",
      "Mix Veg",
      "Jeera Rice & roti",
      "Rajma Masala",
      "Masala pyaza & boondi Raita"
    ],
    "hiTea": ["Cold Bourvita Milk", "Chowmein", "Schezwan Sauce"],
    "dinner": [
      "Salad, pickle,lemon & chili",
      "Brinjal Bharta with matar",
      "Ural dal",
      "Masala Rice & roti",
      "Modak"
    ]
  };
  static final wednesday = {
    "breakfast": [
      "Masala owmlet",
      "Veg Cutlet",
      "Kutchup",
      "Green Chutney",
      "Bread,Butter & Jam"
    ],
    "lunch": [
      "Salad, pickle,lemon & chili",
      "aalo ghobi",
      "pindi chole",
      "Jeera Rice & roti",
      "boondi Raita",
      "Sirka pyaza"
    ],
    "hiTea": ["Veg Burger", "Tikka Fried", "Cold Mango/Orange Tang", "Ketchup"],
    "dinner": [
      "Salad, pickle,lemon & chili",
      "tadka Dal",
      "afghani chikken",
      "Paneer lababdar",
      "Masala Rice & Naan",
      "Cold Fruit Custard"
    ]
  };
  static final thursday = {
    "breakfast": [
      "Masala owmlet",
      "Veg Cutlet",
      "Kutchup",
      "Green Chutney",
      "Bread,Butter & Jam"
    ],
    "lunch": [
      "Salad, pickle,lemon & chili",
      "aalo ghobi",
      "pindi chole",
      "Jeera Rice & roti",
      "boondi Raita",
      "Sirka pyaza"
    ],
    "hiTea": ["Veg Burger", "Tikka Fried", "Cold Mango/Orange Tang", "Ketchup"],
    "dinner": [
      "Salad, pickle,lemon & chili",
      "tadka Dal",
      "afghani chikken",
      "Paneer lababdar",
      "Masala Rice & Naan",
      "Cold Fruit Custard"
    ]
  };
}

class EventData {
  static final set1 = {
    "event_name": "Muj Hackathon Conference 2021",
    "event_date": DateTime.now(),
    "event_venue": "Online Event",
    "Description":
        "2020 marks the year of disruption through technology. The 7th annual MIT FinTech Conference is a student-run event that brings together over 1,000 leaders, companies, and students dedicated to transforming and innovating the FinTech space across the globe. Join us in understanding what this critical juncture means for FinTech's trajectory over the next 10 years.",
    "event_attendee_count": 5,
    "event_id": "1004",
    "event_register_link":
        "https://www.eventbrite.com/e/mit-sloan-fintech-conference-2021-tickets-124594929789?aff=ebdssbonlinesearch",
    "isVisible": true,
    "event_bookmark_list": [],
    "event_attendees_profile": [],
    "event_cover_image":
        "https://img.evbuc.com/https%3A%2F%2Fcdn.evbuc.com%2Fimages%2F120100739%2F485586024857%2F1%2Foriginal.20201204-212244?h=2000&w=720&auto=format%2Ccompress&q=75&sharp=10&s=bbd7d4240d4e7bea6e7e7dddc2b9d9b6",
  };
}

class FaqData {
  static final set1 = {
    "answer":
        "Absolutely, we go beyond the traditional placement support. We offer comprehensive career orientation sessions, enabling you to explore various career paths and gain clarity on your aspirations. Crafting an impactful resume is a crucial step, and we provide assistance in creating an outstanding one. Not only that, our expert guidance extends to helping you build an impressive LinkedIn profile, enhancing your online professional presence. We also share relevant job offers every month, ensuring you have a consistent stream of opportunities aligning with your envisioned career path.",
    "isPermanant": true,
    "question": "Do UPES offer any placement assistance?",
    "timestamp": DateTime.now()
  };
}

class OutpassData {
  static final set1 = {
    "name": "arin",
    "phone": "5678765678",
    "registration_no": "R214230502",
    "block": "1st",
    "year": "1st",
    "room": "403",
    "parents_phone": "67656575333",
    "leave_from": Timestamp.now(),
    "leave_to": Timestamp.now(),
    "leave_reason": "Medical Urgency",
    "status": "approved",
    "outpass_id": "345432",
  };
}
