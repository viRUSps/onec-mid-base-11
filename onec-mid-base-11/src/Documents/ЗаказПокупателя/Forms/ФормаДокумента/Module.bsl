
#Область ОбработчикиСобытийФормы

&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	
	// СтандартныеПодсистемы.ПодключаемыеКоманды
	ПодключаемыеКоманды.ПриСозданииНаСервере(ЭтотОбъект);
	// Конец СтандартныеПодсистемы.ПодключаемыеКоманды
	
КонецПроцедуры

&НаКлиенте
Процедура ПриОткрытии(Отказ)
	
    // СтандартныеПодсистемы.ПодключаемыеКоманды
    ПодключаемыеКомандыКлиент.НачатьОбновлениеКоманд(ЭтотОбъект);
    // Конец СтандартныеПодсистемы.ПодключаемыеКоманды
	
КонецПроцедуры

&НаСервере
Процедура ПриЧтенииНаСервере(ТекущийОбъект)
	
    // СтандартныеПодсистемы.ПодключаемыеКоманды
    ПодключаемыеКомандыКлиентСервер.ОбновитьКоманды(ЭтотОбъект, Объект);
    // Конец СтандартныеПодсистемы.ПодключаемыеКоманды
	
КонецПроцедуры

&НаКлиенте
Процедура ПослеЗаписи(ПараметрыЗаписи)
    ПодключаемыеКомандыКлиент.ПослеЗаписи(ЭтотОбъект, Объект, ПараметрыЗаписи);
КонецПроцедуры

#КонецОбласти

#Область ОбработчикиСобытийЭлементовТаблицыФормыТовары

&НаКлиенте
Процедура ТоварыКоличествоПриИзменении(Элемент)
	
	ТекущиеДанные = Элементы.Товары.ТекущиеДанные;
	
	РассчитатьСуммуСтроки(ТекущиеДанные);
	
КонецПроцедуры

&НаКлиенте
Процедура ТоварыЦенаПриИзменении(Элемент)
	
	ТекущиеДанные = Элементы.Товары.ТекущиеДанные;
	
	РассчитатьСуммуСтроки(ТекущиеДанные);
	
КонецПроцедуры

&НаКлиенте
Процедура ТоварыПриИзменении(Элемент)
	РассчитатьСуммуДокумента();
КонецПроцедуры

&НаКлиенте
Процедура ТоварыСкидкаПриИзменении(Элемент)
	
	ТекущиеДанные = Элементы.Товары.ТекущиеДанные;
	
	РассчитатьСуммуСтроки(ТекущиеДанные);
	
КонецПроцедуры

#КонецОбласти

#Область ОбработчикиСобытийЭлементовТаблицыФормыУслуги

&НаКлиенте
Процедура УслугиКоличествоПриИзменении(Элемент)
	
	ТекущиеДанные = Элементы.Услуги.ТекущиеДанные;
	
	РассчитатьСуммуСтроки(ТекущиеДанные);
	
КонецПроцедуры

&НаКлиенте
Процедура УслугиЦенаПриИзменении(Элемент)
	
	ТекущиеДанные = Элементы.Услуги.ТекущиеДанные;
	
	РассчитатьСуммуСтроки(ТекущиеДанные);
	
КонецПроцедуры

&НаКлиенте
Процедура УслугиСкидкаПриИзменении(Элемент)
	
	ТекущиеДанные = Элементы.Услуги.ТекущиеДанные;
	
	РассчитатьСуммуСтроки(ТекущиеДанные);
	
КонецПроцедуры

&НаКлиенте
Процедура УслугиПриИзменении(Элемент)
	РассчитатьСуммуДокумента();
КонецПроцедуры

#КонецОбласти


&НаКлиенте
Процедура ПересчитатьТаблицу(Команда)
	//+Попов Сергей Александрович, 20.11.24
	ОпределитьТекущиеДанныеТаблицы();
КонецПроцедуры

&НаКлиенте
Процедура ОпределитьТекущиеДанныеТаблицы() 
	//+Попов Сергей Александрович, 20.11.24
	//Определяем ТекущиеДанные
	Для Каждого  СтрокаТовары Из Объект.Товары Цикл  
		
		ТекущиеДанные = СтрокаТовары;
		
		Если ТекущиеДанные = Неопределено Тогда
			Возврат;
		КонецЕсли;
		
		РассчитатьСуммуСтроки(ТекущиеДанные);	
	КонецЦикла; 
	
	Для Каждого  СтрокаУслуги Из Объект.Услуги Цикл  
		
		ТекущиеДанные = СтрокаУслуги;
		Если ТекущиеДанные = Неопределено Тогда
			Возврат;
		КонецЕсли;
		
		РассчитатьСуммуСтроки(ТекущиеДанные);	
	КонецЦикла;
	
КонецПроцедуры

&НаКлиенте
Процедура Дор_СогласованнаяСкидкаПриИзменении(Элемент)
	
	ЗадатьВопросАсинх_ПриОткрытии();		
	
КонецПроцедуры

&НаКлиенте
Асинх Процедура  ЗадатьВопросАсинх_ПриОткрытии()
	
	Режим = РежимДиалогаВопрос.ДаНет;
	Ответ = Ждать ВопросАсинх(НСтр("ru = 'Изменение скидки продолжить?'"), РежимДиалогаВопрос.ДаНет, , КодВозвратаДиалога.Да); 
	Результат = Ждать Ответ; 
	
	Если Результат = КодВозвратаДиалога.Да Тогда 
		ОпределитьТекущиеДанныеТаблицы();
	Иначе
		Отказ = Истина;
	КонецЕсли;
	
КонецПроцедуры


#Область СлужебныеПроцедурыИФункции

&НаКлиенте
Процедура РассчитатьСуммуСтроки(ТекущиеДанные)
	//++Замена кода Попов С.А. 20.11.2024
	//КоэффициентСкидки = 1 - ТекущиеДанные.Скидка / 100;
	//ТекущиеДанные.Сумма = ТекущиеДанные.Цена * ТекущиеДанные.Количество * КоэффициентСкидки;
	//--
	СогласованнаяСкидка = ТекущиеДанные.Цена * ТекущиеДанные.Количество  * (Объект.Дор_СогласованнаяСкидка / 100);
	
	Скидка = ТекущиеДанные.Цена * ТекущиеДанные.Количество * (ТекущиеДанные.Скидка / 100);
	
	ОбщаяРасчетнаяСкидка = Объект.Дор_СогласованнаяСкидка + ТекущиеДанные.Скидка; 
	
	Если ОбщаяРасчетнаяСкидка > 100 Тогда
		ОбщаяРасчетнаяСкидка = 100;  
		Сообщить(СтрШаблон("Суммарная скида больше 100 по номенклатуре %1", ТекущиеДанные.Номенклатура));
	КонецЕсли; 
	
	ОбщаяСкидка = ТекущиеДанные.Цена * ТекущиеДанные.Количество * (ОбщаяРасчетнаяСкидка/100);
	
	ТекущиеДанные.Сумма= ТекущиеДанные.Цена * ТекущиеДанные.Количество - ОбщаяСкидка ; 
	
	РассчитатьСуммуДокумента();
	
	
КонецПроцедуры

&НаКлиенте
Процедура РассчитатьСуммуДокумента()
	
	Объект.СуммаДокумента = Объект.Товары.Итог("Сумма") + Объект.Услуги.Итог("Сумма");
	
КонецПроцедуры

#Область ПодключаемыеКоманды

// СтандартныеПодсистемы.ПодключаемыеКоманды
&НаКлиенте
Процедура Подключаемый_ВыполнитьКоманду(Команда)
    ПодключаемыеКомандыКлиент.НачатьВыполнениеКоманды(ЭтотОбъект, Команда, Объект);
КонецПроцедуры

&НаКлиенте
Процедура Подключаемый_ПродолжитьВыполнениеКомандыНаСервере(ПараметрыВыполнения, ДополнительныеПараметры) Экспорт
    ВыполнитьКомандуНаСервере(ПараметрыВыполнения);
КонецПроцедуры

&НаСервере
Процедура ВыполнитьКомандуНаСервере(ПараметрыВыполнения)
    ПодключаемыеКоманды.ВыполнитьКоманду(ЭтотОбъект, ПараметрыВыполнения, Объект);
КонецПроцедуры

&НаКлиенте
Процедура Подключаемый_ОбновитьКоманды()
    ПодключаемыеКомандыКлиентСервер.ОбновитьКоманды(ЭтотОбъект, Объект);
КонецПроцедуры
// Конец СтандартныеПодсистемы.ПодключаемыеКоманды

#КонецОбласти

#КонецОбласти
