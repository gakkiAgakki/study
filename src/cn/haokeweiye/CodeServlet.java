package cn.haokeweiye;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;

@WebServlet("/codeServlet")
public class CodeServlet extends HttpServlet {



	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 使用java图形界面技术绘制一张图片

		int charNum = 4;
		int width = 20 * 4;
		int height = 28;

		// 1. 创建一张内存图片
		BufferedImage bufferedImage = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);

		// 2.获得绘图对象
		Graphics graphics = bufferedImage.getGraphics();

		// 3、绘制背景颜色
		graphics.setColor(Color.YELLOW);
		graphics.fillRect(0, 0, width, height);

		// 4、绘制图片边框
		graphics.setColor(Color.GRAY);
		graphics.drawRect(0, 0, width - 1, height - 1);

		// 5、输出验证码内容
		graphics.setColor(Color.RED);
		graphics.setFont(new Font("宋体", Font.BOLD, 22));

		// 随机输出4个字符
		String s = "ABCDEFGHGKLMNPQRSTUVWXYZ23456789";
		Random random = new Random();

		// session中要用到
		String msg = "";

		int x = 5;
		for (int i = 0; i < charNum; i++) {
			int index = random.nextInt(32);
			String content = String.valueOf(s.charAt(index));

			msg += content;
			graphics.setColor(new Color(random.nextInt(255), random.nextInt(255), random.nextInt(255)));
			graphics.drawString(content, x, 22);
			x += 20;
		}

		// 6、绘制干扰线
		graphics.setColor(Color.GRAY);
		for (int i = 0; i < 5; i++) {
			int x1 = random.nextInt(width);
			int x2 = random.nextInt(width);

			int y1 = random.nextInt(height);
			int y2 = random.nextInt(height);
			graphics.drawLine(x1, y1, x2, y2);
		}
		request.getSession().setAttribute("piccode", msg.toString());

		// 释放资源
		graphics.dispose();

		// 图片输出 ImageIO
		ImageIO.write(bufferedImage, "jpg", response.getOutputStream());

	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}




//	private static final long serialVersionUID = 1L;
//
//
//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		//这个方法实现验证码的生成
//		response.setCharacterEncoding("utf-8");
//		//创建图片缓冲区设置其大小    BufferedImage(int width,  int height, int imageType)
//		BufferedImage bImage=new BufferedImage(100, 30, BufferedImage.TYPE_3BYTE_BGR);
//		//在缓冲区上创建画布
//		Graphics g=bImage.getGraphics();
//		//设置背景颜色
//		g.setColor(Color.orange);
//		//创建画布矩形，位置（0，0）点，大小100，30
//		g.fillRect(0, 0, 100, 30);
//		//创建随机对象
//		Random r=new Random();
//		int index;//存放随机数
//		//得到的文字东西存放处
//		StringBuffer sBuffer=new StringBuffer();
//		//循环产生四个字
//		for (int i = 0; i < 4; i++) {
//			//中文字的第一个十六进制码为4e00转十进制是19968，最后一个是9fa0十进制为40869，所以可以产生在此之间的随机数
//			index=r.nextInt(40869-19968+1)+19968;//产生随机数字
//			//设置随机颜色，
//			g.setColor(new Color(r.nextInt(255), r.nextInt(255), r.nextInt(255)));
//			//设置文字的类型，大小
//			g.setFont(new Font("", Font.BOLD, 20));
//                      /*画字，将随机数字转换成十六进制Integer.toHexString(index),16)再转换字符(char)(Integer.parseInt，
//                      在设置每个文字的位置
//                      */
//			g.drawString((char)(Integer.parseInt(Integer.toHexString(index),16))+"", i*22+4, 18);
//			//将其存放在StringBuffer中，以便后面读取作比较
//			sBuffer.append((char)(Integer.parseInt(Integer.toHexString(index),16)));
//		}
//		//将得到的文字设置到session中
//		request.getSession().setAttribute("piccode", sBuffer.toString());
//                  /*将这个验证码图片读写到页面中
//                   * write(RenderedImage im, String formatName, OutputStream output)
//                */
//		ImageIO.write(bImage, "jpg", response.getOutputStream());
//	}
//
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		doGet(request, response);
//	}

}
