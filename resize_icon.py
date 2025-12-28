from PIL import Image
import os

def resize_icon():
    input_path = r'c:\Snap Alarm\assets\icon\play_store_512.png'
    output_path = r'c:\Snap Alarm\assets\icon\play_store_512_padded.png'
    
    try:
        # Open the original image
        img = Image.open(input_path).convert("RGBA")
        width, height = img.size
        
        # Get the background color from the top-left pixel
        # Assuming the background is uniform or the top-left pixel is representative
        bg_color = img.getpixel((0, 0))
        
        # Create a new image with the background color
        new_img = Image.new("RGBA", (width, height), bg_color)
        
        # Calculate new size (85%)
        scale_factor = 0.85
        new_width = int(width * scale_factor)
        new_height = int(height * scale_factor)
        
        # Resize the original image
        # Using LANCZOS for high quality downsampling
        resized_img = img.resize((new_width, new_height), Image.Resampling.LANCZOS)
        
        # Calculate position to center the resized image
        x_offset = (width - new_width) // 2
        y_offset = (height - new_height) // 2
        
        # Paste the resized image onto the new background
        # Use the resized image itself as mask if it has transparency, 
        # but here we want to paste it over. 
        # Since we are shrinking the whole image (including its background),
        # we paste it "as is" on top of the solid color background.
        new_img.paste(resized_img, (x_offset, y_offset), resized_img)
        
        # Save the result
        new_img.save(output_path)
        print(f"Successfully created padded icon at: {output_path}")
        
    except Exception as e:
        print(f"Error processing image: {e}")

if __name__ == "__main__":
    resize_icon()
