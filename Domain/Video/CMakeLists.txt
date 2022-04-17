add_headers(
    EthernetVideoProvider.h  
    IDataProcessor.h  
    IDataProvider.h
    ObjectDetectionProcessor.h
)

add_sources(
    EthernetVideoProvider.cpp
    ObjectDetectionProcessor.cpp 
)

propagate_to_parent()
