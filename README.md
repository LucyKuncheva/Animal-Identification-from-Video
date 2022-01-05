# Animal-Identification-from-Video
Repository of annotated videos of multiple animals and MATLAB code for processing the data

![ExampleAnnotation](https://user-images.githubusercontent.com/18727206/138719482-354c4c32-b282-4d69-8a04-cd5851bae687.jpg)


## 1. Videos
The original videos included in this repository have been sourced from Pixabay under Pixabay License
* Free for commercial use
* No attribution required

The video data is summarised below:

*Video Name*    |     *# Frames*  |  *Size*   |   *# Bounding boxes*  |  *# Identities* 
----------------|----------------|-----------|---------------------|--------------
[Pigeons_8234_1280_720.mp4](https://lucykuncheva.co.uk/other_research/restricted_set_classification_images/Pigeons_8234_1280_720.mp4) |   443 | (1280, 720)|  4700|17
[Pigeons_29033_960_540_300f.mp4](https://lucykuncheva.co.uk/other_research/restricted_set_classification_images/Pigeons_29033_960_540_300f.mp4) |   300 | ( 960, 540)|  4892|28
[Pigeons_4927_960_540_600f.mp4](https://lucykuncheva.co.uk/other_research/restricted_set_classification_images/Pigeons_4927_960_540_600f.mp4) |   600 | ( 960, 540)|  3079|17
[Koi_5652_952_540.mp4](https://lucykuncheva.co.uk/other_research/restricted_set_classification_images/Koi_5652_952_540.mp4) |   536 | ( 952, 540)|  1635| 9
[Pigs_49651_960_540_500f.mp4](https://lucykuncheva.co.uk/other_research/restricted_set_classification_images/Pigs_49651_960_540_500f.mp4) |   500 | ( 960, 540)|  6185|26


Annotated videos are available here:
* [Annotated_Pigeons_8234_1270_720.mp4](https://lucykuncheva.co.uk/other_research/restricted_set_classification_images/Annotated_Pigeons_8234_1280_720.mp4)
    Annotation contributed by [Wilf Langdon](wll19pkk@bangor.ac.uk)   
* [Annotated_Pigeons_29033_960_540_300f.mp4](https://lucykuncheva.co.uk/other_research/restricted_set_classification_images/Annotated_Pigeons_29033_960_540_300f.mp4)
    Annotation contributed by [Owen West](wnw19njx@bangor.ac.uk)  
 * [Annotated_Pigeons_4927_960_540_600f.mp4](https://lucykuncheva.co.uk/other_research/restricted_set_classification_images/Annotated_Pigeons_4927_960_540_600f.mp4)
    Annotation contributed by [Frank Krzyzowski](eeub05@bangor.ac.uk) 
* [Annotated_Koi_5652_952_540.mp4](https://lucykuncheva.co.uk/other_research/restricted_set_classification_images/Annotated_Koi_5652_952_540.mp4)
    Annotation contributed by [Lucy Kuncheva](mas00a@bangor.ac.uk)
* [Annotated_Pigs_49651_960_540_500f.mp4](https://lucykuncheva.co.uk/other_research/restricted_set_classification_images/Annotated_Pigs_49651_960_540_500f.mp4)
    Annotation contributed by [Lucy Kuncheva](mas00a@bangor.ac.uk)



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

## 3. Code (MATLAB functions)
* `trim_video(video_name, output_file_name, number_of_frames)` Trims a video to a desired number of frames.
* `store_frames(im_folder,video_file)` Breaks a video into frames and saves them in a given folder. The frames are named scene00001.jpg, scene00002.jpg, etc.
* `create_annotated_video(image_folder, bb_file_name, label_flag)` Creates an MP4 annotated video from the video stored as frames scene00001.jpg, scene00002.jpg, ... and a csv file with bounding boxes in the format explained in Section 2. The label flag determines whether the bounding boxes should be labelled. The default value of label_flag is True.
* `create_clips(folder,bb_file)` Saves the clips from the frames in 'folder'. Each frame is examined in turn and the clips from the bounding boxes are cropped and stored in sub-folders with the name of the individual. The clip file names are formed as 'IndividualsName_frame_XXXXX.jpg'.
* `show_annotated_frame(im_folder,f_name, bb_file)` Reads image 'f_name' from 'im_folder' and displays the image with overlayed labelled bounding boxes. Annotations are in the bb_file csv file (see create_annotated_video for the csv file format). 

WORK IN PROGRESS

