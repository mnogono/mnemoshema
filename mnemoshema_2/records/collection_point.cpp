//---------------------------------------------------------------------------
#include "pch.h"
#pragma hdrstop
//---------------------------------------------------------------------------
#pragma package(smart_init)

TCollectionPoint::TCollectionPoint() : TRecord() {
	record_type = TRecordType::RECORD_TYPE_COLLECTION_POINT;
}

String TCollectionPoint::GetName() const{
	return title;
}


