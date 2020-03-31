package ru.cetelem.supplier.ui.component;


import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.vaadin.flow.component.grid.Grid;
import com.vaadin.flow.component.html.Label;
import com.vaadin.flow.component.orderedlayout.VerticalLayout;

import ru.cetelem.cassiope.supplier.model.Car;
import ru.cetelem.cassiope.supplier.model.PayloadItem;
import ru.cetelem.supplier.service.PayloadService;


public class PayloadItemListBrief extends VerticalLayout  {
	private static final Log log = LogFactory.getLog(PayloadItemListBrief.class); 
	

	private Grid<PayloadItem> crudGrid ;

	
	public PayloadItemListBrief(List<PayloadItem> payloadItems) {
		log.info("CarPayloadItemList started");
		

		Label caption = new Label();
		caption.setText("Payload items	");
		caption.addClassName("splitter");
		add(caption);

		crudGrid = new Grid<PayloadItem>(PayloadItem.class);

		

		crudGrid.setItems(payloadItems);
		

		
		crudGrid.setColumns("payload.payloadType", "payload.state", "payload.processedDate", "eventCode");
		
		add(crudGrid);

		crudGrid.setSizeFull();
		setHeight("300px");
		
	}

	



	
	
}
