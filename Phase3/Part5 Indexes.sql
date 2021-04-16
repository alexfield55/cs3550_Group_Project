--1. sort assignment by sectionid 
CREATE INDEX idx_assign_by_section
ON assignment (sectionID);

--2. announcements by sectionid
CREATE INDEX idx_announce_by_section
ON announcements (sectionID);