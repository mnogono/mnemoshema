//---------------------------------------------------------------------------
#include "pch.h"
#pragma hdrstop
//---------------------------------------------------------------------------
#pragma package(smart_init)

TUser::TUser() : TRecord() {
	record_type = TRecordType::RECORD_TYPE_USER;
}

String TUser::GetName() const {
	return login;
}
