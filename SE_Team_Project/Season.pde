void getSeason () {
  if (timePassed % 2000 < 500) {
    season = "Spring";
    println(season);
    bounty = 6;
  } else if (timePassed % 2000 < 1000) {
    for (Food f: foods) {
      if (f.xPos < 350 && f.yPos > 350) {
        if (int(random(0, 100)) < 15) {
          decay.add(f);
        }
      }
    }
    season = "Summer";
    println(season);
    bounty = 2;
  } else if (timePassed % 2000 < 1500) {
    for (Food f: foods) {
      if (f.yPos > 350) {
        if (int(random(0, 100)) < 5) {
          decay.add(f);
        }
      }
    }
    season = "Fall";
    println(season);
    bounty = 4;
  } else {
    for (Food f: foods) {
      if (f.xPos < 500 && f.yPos > 350) {
        if (int(random(0, 100)) < 25) {
          decay.add(f);;
        }
      }
    }
    season = "Winter";
    println(season);
    bounty = 2;
  }
  for (Food f: decay) {
    foods.remove(foods.indexOf(f));
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
      x = random(150, 450);
      y = random(150, 450);
      break;
    case "Summer":
      x = random(350, 450);
      borange = color(random(45, 133), 133, 45); 
      if (x > 350) 
        y = random(150, 450);
      else
        y = random(350, 450);
      break;
    case "Fall":
      x = random(150, 450);
      borange = color(189, random(57, 189), 80);
      y = random(350, 450);
      break;
    default:
      x = random(350, 450);
      borange = color(133, random(45, 133), 45);
      y = random(350, 450);
      break;
  }
  foods.add(new Food(nutritionValue, 10, borange, x, y));
  //foods.add(new Food(nutritionValue, 10, color((nutritionValue / (80 + nutritionAdjuster)) * 255, 252, 3), x, y));
}
