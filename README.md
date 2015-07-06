# samutil
> Javascript and ExtJs 3 debugging and logging tool belt

## Getting Started

Install the module with: `npm install samutil`

```javascript
var samutil = require('samutil');
samutil.awesome(); // "awesome"
```

## Documentation

##Logging 
before fixing a bug one must fist find what is causing the bug. offend times this involves inspecting and tracking values as they are pasted through a complex web of method calls attribute access and attribute setting. Logging is one the most ways to inspect theses complexities.

###logCall

`logCall` - log each call to a function or method

Example 1
	
	//obj is a object with a metiod add
	obj = {
		add: function( num1, num2 ){
			return num1 + num2;
		}
	};
<!---->
	//log all invocations of add
	logCall(obj, 'add')
	
	//then on 
	obj.add(10, 12)
	
	//the following string wil be loged to the console
	"time: add( 10, 12 )"
	
	

###logProp

`logProp` - log every get and set on a object property

###logGet

`logGet` - log every access to a property

###logSet

`logSet`- log every set to a property

## Examples

_(Coming soon)_

## Contributing


## Release History


## License
Copyright (c) 2013 Sam Sheftel  
Licensed under the MIT license.
