package com.hillelcoren.utils
{
	import com.hillelcoren.components.AutoComplete;
	
	import mx.utils.StringUtil;
	
	public class StringUtils
	{
		/**
		 * Check if the string begins with the pattern
		 */
		public static function beginsWith( string:String, pattern:String):Boolean
		{
			if (!string)
			{
				return false;
			}
			
			string  = string.toLowerCase();
			pattern = pattern.toLowerCase();
			
			return pattern == string.substr( 0, pattern.length );
		}
		
		public static function contains( string:String, searchStr:String ):Boolean
		{
			var regExp:RegExp = new RegExp( searchStr, "i" );
			
			return regExp.test( string );			
		}
				
		public static function anyWordBeginsWith( string:String, pattern:String ):Boolean
		{
			if (!string)
			{
				return false;
			}
			
			if (beginsWith( string, pattern ))
			{
				return true;
			}
			
			// check to see if one of the words in the string is a match
			var words:Array = string.split( " " );
			
			for each (var word:String in words)
			{
				if (beginsWith( word, pattern ))
				{
					return true;
				}
			}
			
			return false;
		}
				
		public static function capitalize( string:String ):String
		{
			return string.charAt(0).toUpperCase() + string.substring( 1, string.length );
		}
		
		public static function capitalizeWords( string:String ):String
		{
			var origWords:Array = string.split( " " );
			var newWords:Array = [];
			
			for each (var word:String in origWords)
			{
				newWords.push( StringUtils.capitalize( word ) ); 
			}

			return newWords.join( " " ); 
		}
				
		public static function unCapitalize( string:String ):String
		{
			return string.charAt(0).toLowerCase() + string.substring( 1, string.length );
		}
		
		
		/**
		 * This will convert a string to const upper case (ie, ringGroup becomes RING_GROUP)
		 */
		public static function toConstUpperCase( string:String ):String
		{
			var newString:String = "";
			
			for (var x:uint = 0; x < string.length; x++)
			{
				var char:String = string.charAt( x );
				
				// is letter upper case
				if (char.charCodeAt() <= 90 && newString.length > 0)
				{
					newString += "_";
				}
				
				newString += char;
				
			}
			
			return newString.toUpperCase();
		}
		
		public static function getFirstWord( string:String ):String
		{
			var newString:String = "";
			
			for (var x:uint = 0; x < string.length; x++)
			{
				var char:String = string.charAt( x );
				
				// is letter upper case
				if (char.charCodeAt() <= 90 && newString.length > 0)
				{
					return newString;
				}
				
				newString += char;
				
			}
			
			return newString;			
		}
		
		/**
		 * This will separate the words in a camel caps string (ie, ringGroup becomes Ring Group)
		 */
		public static function seperateWords( string:String ):String
		{
			var newString:String = "";
			
			for (var x:uint = 0; x < string.length; x++)
			{
				var char:String = string.charAt( x );
				
				// is letter upper case
				if (char.charCodeAt() <= 90 && newString.length > 0)
				{
					newString += " ";
				}
				
				newString += char;
				
			}
			
			return StringUtils.capitalizeWords( newString.toLowerCase() );
		}		
		
		public static function toCamelCaps( string:String ):String
		{
			var returnStr:String = "";
			var words:Array = string.split( "_" );
			
			for (var index:uint = 0; index < words.length; index++)
			{	
				var word:String = words[index];
				word = word.toLowerCase();
				
				if (index > 0)
				{
					word = capitalize( word );
				}
				
				returnStr += word;
			}
			
			return returnStr;		
		}
		
		/* given a string it will return true, iff it is "true", everything else will be false */
		public static function toBoolean( value:String ):Boolean
		{
			value = value.toLowerCase();
			
			if (value == "true" || value == "yes")
			{
				return true;
			}
			
			return false;			
		}
		
		public static function trimCommas( value:String ):String
		{
			value = StringUtil.trim( value );
			
			while (value.length > 0 && value.charAt(0) == ",")
			{
				value = value.substring( 1, value.length );
			}
			
			while (value.length > 0 && value.charAt( value.length - 1 ) == ",")
			{
				value = value.substring( 0, value.length - 1);
			}
			
			return value;
		}
				
		public static function highlightMatch( string:String, searchStr:String ):String
		{
			// solution by Jan Reges, 2009-07-17
			var searchStrPattern:String = "(" + searchStr + ")";
			var regExp:RegExp = new RegExp( searchStrPattern, "igm" );
			var returnStr:String = string.replace( regExp, "<b><u>$1</u></b>" );

			return returnStr;
		}		
	}
}