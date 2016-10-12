/**
 * Saves frames
 */

boolean is_recording = false;
static final int NUM_FRAMES = 30;
int frame_drawn = 0;
FramesWriter writer;

void setup()
{
  size(1280, 780);
  writer = new FramesWriter(NUM_FRAMES);
}

void draw()
{
  background(0);
  
  draw_something(writer.get_frames_drawn(), NUM_FRAMES);
  writer.save_frame_if_recording();
  // -------------------------------
  // What is after the call to saveFrame will not be drawn in the output images.  
  writer.draw_recording_state();
}


void draw_something(int frame_number, int total_num_frames)
{
  // An arbitrary oscillating rotating animation 
  // so that we have something to render
  for (float a = 0; a < TWO_PI; a+= 0.2) {
    pushMatrix();
    translate(width / 2, height / 2);
    rotate(a+sin(frameCount*0.004*a));
    stroke(255);
    line(-100, 0, 100, 0);
    popMatrix();
  }
}


void keyPressed()
{  
  // If we press r, start or stop recording!
  if (key == 'r' || key == 'R')
  {
    writer.start_recording();
  }
}