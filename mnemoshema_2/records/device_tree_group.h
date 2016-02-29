//---------------------------------------------------------------------------

#ifndef device_tree_groupH
#define device_tree_groupH

//#include "record.h"
//---------------------------------------------------------------------------

struct TDeviceTreeGroup : public TRecord {
	String name;
	String parent_uuid;
	String child_uuid;
	int child_record_type;

	TDeviceTreeGroup();

	String GetName() const;
};

#endif
