# Flutter navigation with Navigator 2.0
 
## Getting Started
This project is to test how to structure the navigation in a flutter project for Naviator 2.0 with a tab bar (`CupertinoTabBar`). 
This is based off of https://github.com/orestesgaolin/navigator_20_example.
 
## Questions
- Is this the right approach for using Navigator 2.0 with a tab bar?
- There is an exception currently in the debug console that I was not able to resolve: "A HeroController can not be shared by multiple Navigators. The Navigators that share the same HeroController are:"
I believe this is possibly due to having an `IndexedStack` multiple `Navigator`s as it's children. I'm not sure of the correct way of getting around this.
