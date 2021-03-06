package ru.cetelem.cassiope.supplier.io.icfl;

public class ICfl33Trail implements ICFLEntry {

	/*
	Record Id				Name of record							PIC X(02)
	Total Amount			Total amount of records with such name	Numeric(17)
	Number of Data Records	Total number of records with such name	PIC 9(05)
	Filler 					Spaces									PIC X(114)
	Creator 				Company	The company creator				PIC X(02)
	*/

	public String recordId = "3Y";
	public long totalAmount;
	public long numberOfRecords;
	public String filler;
	public String creator;
	public String filler2;

	public ICfl33Trail() {

	}

	public ICfl33Trail(String creator) {
		this.creator = creator;
		this.numberOfRecords = 1;

	}

}
