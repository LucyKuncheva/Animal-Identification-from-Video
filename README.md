# Animal-Identification-from-Video
Repository of annotated videos of multiple animals and MATLAB code for processing the data

![ExampleAnnotation](https://user-images.githubusercontent.com/18727206/138719482-354c4c32-b282-4d69-8a04-cd5851bae687.jpg)


## 1. Videos
The original videos included in this repository have been sourced from Pixabay under Pixabay License
* Free for commercial use
* No attribution required

Each video clip is about 600 frames or less and contains multiple animals of the same species (koi fish, pigeons, pigs). 

The manually annotated versions of some of the videos are available through the following links:

* Pigeons

    - Pigeons_8234_960_540.mp4 https://lucykuncheva.co.uk/other_research/restricted_set_classification_images/Annotated_Pigeons_8234_960_540.mp4
    Annotation contributed by Mr Wilf Langdon wll19pkk@bangor.ac.uk
    
    - Pigeons_29033_960_540_300f.mp4 https://lucykuncheva.co.uk/other_research/restricted_set_classification_images/Annotated_Pigeons_29033_960_540_300f.mp4
    Annotation contributed by Mr Owen West wnw19njx@bangor.ac.uk 
    
    - Pigeons_4927_960_540_600f.mp4 https://lucykuncheva.co.uk/other_research/restricted_set_classification_images/Annotated_Pigeons_4927_960_540_600f.mp4
    Annotation contributed by Mr Frank Krzyzowski eeub05@bangor.ac.uk 
    
* Koi fish

    - Koi_5652_952_540.mp4 https://lucykuncheva.co.uk/other_research/restricted_set_classification_images/Annotated_Koi_5652_952_540.mp4
    Annotation contributed by Dr Lucy Kuncheva mas00a@bangor.ac.uk
    
    - Fish_20771_960_540.mp4 https://lucykuncheva.co.uk/other_research/restricted_set_classification_images/Annotated_NO_LABELS_Fish_20771_960_540.mp4
    Annotation contributed by Mr Luke Jones lkj18dfh@bangor.ac.uk

## 2. Data
The data is stored in Excel files with names BB_XXX.csv, where XXX stands for the name of the video. Each Excel file is organised as follows:

*Name*    |     *x*  |  *y*   |   *w*  |  *h*  |  *filename*   |   *max_x* |  *max_y*
--------|--------|------|------|-----|-------------|--------|-------
Mahrez	 |   1059|	  85|   221|	312|	scene00001.jpg	|1280|	720
Torres	 |   686 |	 174|   367|	342|	scene00001.jpg	|1280|	720
Sterling |	564	 |   132|   283|	145|	scene00001.jpg	|1280|	720
Silva    |	102	 |   557|   356|	163|	scene00001.jpg	|1280|	720
... | ... | ... | ... | ... | ... | ... | ... |

The columns are: Names of the individual animals (class labels), the x and y coordinates in pixels of the top left corner of the bounding box, the (w)idth and (h)eight of the bounding box in pixels, the filename containing the frame of the video and the horizontal and vertical image dimensions. The file format was chosen to match that outputted by the labelling software provided by https://www.makesense.ai/.

## 3. Code (MATLAB)
* `trim_video(video_name, output_file_name, number_of_frames)` - a function to trim a video to a desired number of frames
* `StoreFrames` - a script to break a video into frames and save them in a given folder. The frames are named scene00001.jpg, scene00002.jpg, etc.
* `create_annotated_video(image_folder, bb_file_name, label_flag)` - a function to create an MP4 annotated video from the video stored as frames scene00001.jpg, scene00002.jpg, ... and a csv file with bounding boxes in the format explained in Section 2. The label flag determines whether the bounding boxes should be labelled. The default value of label_flag is True.

WORK IN PROGRESS

