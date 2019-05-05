import java.net.*;
import java.io.*;

public class download{
    static String url = "http://tb-video.bdstatic.com/tieba-smallvideo-transcode/20991405_8499d2367af370313dba6eaeaaf2fcde_0.mp4";
    public static void main(String args[])throws MalformedURLException{
        downloadNet();
    }
    public static void downloadNet() throws MalformedURLException {
        // 下载网络文件
        int bytesum = 0;
        int byteread = 0;
 
        URL url = new URL("http://tb-video.bdstatic.com/tieba-smallvideo-transcode/20991405_8499d2367af370313dba6eaeaaf2fcde_0.mp4");
 
        try {
            URLConnection conn = url.openConnection();
            InputStream inStream = conn.getInputStream();
            FileOutputStream fs = new FileOutputStream("c:/video.mp4");
            
            byte[] buffer = new byte[1204];
            int length;
            while ((byteread = inStream.read(buffer)) != -1) {
                bytesum += byteread;
                System.out.println(bytesum);
                fs.write(buffer, 0, byteread);
            }
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}