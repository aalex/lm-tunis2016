/**
 * Saves frames
 */

class FramesWriter {
  private boolean is_recording = false;
  private int num_frames = 30;
  private int frames_drawn = 0;
  private String file_name = "output/frames####.png";
  
  public FramesWriter(int number_of_frames)
  {
    this.num_frames = number_of_frames;
  }
  
  public int get_frames_drawn()
  {
    return this.frames_drawn;
  }
  
  public boolean get_is_recording()
  {
    return this.is_recording;
  }
  
  public boolean save_frame_if_recording()
  {
    boolean ret = false;
    if (this.is_recording)
    {
      this.frames_drawn += 1;
      saveFrame(this.file_name); // sharps are replaced by the frame number
      ret = true;
      println("writer frame " + this.frames_drawn);
      if (this.frames_drawn == this.num_frames)
      {
        println("stop recording");
        this.is_recording = false;
      }
    }
    return ret;
  }
  
  public void start_recording()
  {
    println("start recording");
    this.is_recording = true;
    this.frames_drawn = 0;
  }
  
  public void stop_recording()
  {
    this.is_recording = false;
  }

void draw_recording_state()
{
  textAlign(CENTER);
  fill(255);
  if (writer.get_is_recording())
  {
    text("Press r to stop recording.", width / 2, height - 24);
  } 
  else
  {
    text("Press r to start recording.", width / 2, height - 24);
  }

  text("Frame " + this.frames_drawn, width / 2, height - 30);
  // A red dot for when we are recording
  stroke(255);
  if (this.is_recording)
  {
    fill(255, 0, 0);
  }
  else
  { 
    noFill();
  }
  ellipse(width / 2, height - 48, 16, 16);
}
}