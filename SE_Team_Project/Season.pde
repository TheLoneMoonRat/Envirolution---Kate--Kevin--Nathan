void getSeason () {
  if (timePassed % 500 == 0 && timePassed % 2000 > 500) 
    for (Food f: foods) 
      lastSeason.add(f);
  for (Food f: lastSeason) {
    if (int(random(0, 1000)) == 0)
      decay.add(f);
  }
  if (timePassed % 2000 < 500) {
    season = "Spring";
    bounty = 6;
  } else if (timePassed % 2000 < 1000) {
    season = "Summer";
    bounty = 3;
  } else if (timePassed % 2000 < 1500) {
    season = "Fall";
    bounty = 4;
  } else {
    season = "Winter";
    bounty = 1;
  }
  for (Food f: decay) {
    
    try {
      foods.remove(foods.indexOf(f));
    } catch (Exception e) {
    
    }
    lastSeason.remove(lastSeason.indexOf(f));
  }
  decay.clear();
}

void createFood() {
  getSeason();
  float nutritionValue = random(40 + nutritionAdjuster, 80 + nutritionAdjuster);
  float x;
  float y;
  color borange;
  
  switch (season) {
    case "Spring":
      borange = color(random(125, 255), 255, 125);
      x = random(225, 475);
      y = random(225, 475);
      break;
    case "Summer":
      x = random(350, 475);
      borange = color(random(45, 133), 133, 45); 
      if (x > 350) 
        y = random(225, 475);
      else
        y = random(350, 475);
      break;
    case "Fall":
      x = random(225, 475);
      borange = color(189, random(57, 189), 80);
      y = random(350, 475);
      break;
    default:
      x = random(350, 475);
      borange = color(133, random(45, 133), 45);
      y = random(350, 475);
      break;
  }
  foods.add(new Food(nutritionValue, 10, borange, x, y));
  //foods.add(new Food(nutritionValue, 10, color((nutritionValue / (80 + nutritionAdjuster)) * 255, 252, 3), x, y));
}
