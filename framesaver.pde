/**
 * Saves frames
 */

boolean is_recording = false;
static final int NUM_FRAMES = 30;
int frame_drawn = 0;

void setup()
{
  size(1280, 780);
}

void draw()
{
  background(0);
  
  draw_something(frame_drawn, NUM_FRAMES);
  frame_drawn += 1;
  
  if (is_recording) {
    saveFrame("output/frames####.png"); // sharps are replaced by the frame number
  }
  
  if (frame_drawn == NUM_FRAMES)
  {
    is_recording = false;
  }
  
  // -------------------------------
  // What is after the call to saveFrame will not be drawn in the output images.  
  draw_recording_state(is_recording);
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
    start_recording();
  }
}


void start_recording()
{
  frame_drawn = 0;
  is_recording = true;
}

void draw_recording_state(boolean recording)
{
  textAlign(CENTER);
  fill(255);
  if (recording)
  {
    text("Press r to stop recording.", width / 2, height - 24);
  } 
  else
  {
    text("Press r to start recording.", width / 2, height - 24);
  }

  text("Frame " + frame_drawn, width / 2, height - 30);
  // A red dot for when we are recording
  stroke(255);
  if (recording)
  {
    fill(255, 0, 0);
  }
  else
  { 
    noFill();
  }
  ellipse(width / 2, height - 48, 16, 16);
}