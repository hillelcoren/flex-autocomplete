package com.hillelcoren.components.autoComplete.interfaces
{
	import flash.events.IEventDispatcher;
	
	import mx.collections.ArrayCollection;
	import mx.collections.ListCollectionView;
	
	public interface IBrowser extends IEventDispatcher
	{
		function init():void
		function set selectedItems( value:Array ):void
		function get selectedItems():Array;
		function set filterFunction( value:Function ):void
		function set title( value:String ):void;
		function set dataProvider( value:ListCollectionView ):void
		function set labelFunction( value:Function ):void
		function set browserFields( value:Array ):void;
		function set allowMultipleSelection( value:Boolean ):void
		function set searchStr( value:String ):void 
	}
}