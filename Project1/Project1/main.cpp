#include <iostream>
#include <string>
#include <fstream>
#include <utility>
#include <direct.h>  
#include <io.h>  

#include <seeta/FaceDetector2.h>
#include <seeta/PointDetector2.h>
#include <seeta\Struct_cv.h>
#include <opencv2/core/core.hpp>  
#include<opencv2/highgui/highgui.hpp> 

using std::string;
using std::vector;
using std::pair;
using std::cout;
using std::endl;

void getFiles(string path, vector<string> &imgs);
vector<pair<double, double>> getPoints(string imgPath);

int main()
{
	/*
	vector<pair<double, double>> pairs = getPoints("D:\\57.jpg");
	for (auto it = pairs.begin(); it != pairs.end(); ++it) {
		cout << it->first << " " << it->second << endl;
	}
	*/
	
	vector<string> imgs;
	getFiles("D:\\MyKinFace\\raw\\children", imgs);
	getFiles("D:\\MyKinFace\\raw\\parents", imgs);
	std::ofstream out("D:\\MyKinFace\\raw\\points2.txt");
	for (auto it = imgs.begin(); it != imgs.end(); ++it) {
		cout << *it << " ";
		out << *it << " ";
		vector<pair<double, double>> pairs = getPoints(* it);
		for (auto it1 = pairs.begin(); it1 != pairs.end(); ++it1) {
			cout << it1->first << " " << it1->second << " ";
			out << it1->first << " " << it1->second << " ";
		}
		cout << endl;
		out << "\n";
	}
	out.flush();
	out.close();
	system("pause");
}

void getFiles(string path, vector<string> &imgs) {
	//文件句柄  
	long   hFile = 0;
	//文件信息  
	struct _finddata_t fileinfo;
	string p;
	if ((hFile = _findfirst(p.assign(path).append("\\*").c_str(), &fileinfo)) != -1)
	{
		do
		{
			//如果是目录,迭代之  
			//如果不是,加入列表  
			if ((fileinfo.attrib &  _A_SUBDIR))
			{
				if (strcmp(fileinfo.name, ".") != 0 && strcmp(fileinfo.name, "..") != 0)
					getFiles(p.assign(path).append("\\").append(fileinfo.name), imgs);
			}
			else
			{
				string str = p.assign(path).append("\\").append(fileinfo.name);
				int length = str.size();
				if (str[length - 3] == 'j' && str[length - 2] == 'p' && str[length - 1] == 'g')
					imgs.push_back(str);
			}
		} while (_findnext(hFile, &fileinfo) == 0);
		_findclose(hFile);
	}
}

vector<pair<double, double>> getPoints(string imgPath) {
	seeta::FaceDetector2 FD("D:/SeetaFaceDetector2.0.ats");
	cv::Mat mat = cv::imread(imgPath);
	seeta::cv::ImageData image = mat;
	int num = 0;    // save the number of detected faces
	SeetaRect *face = FD.Detect(image, &num);
	if (num == 0) return vector<pair<double, double>>();
	seeta::PointDetector2 PD("D:/SeetaPointDetector2.0.pts5.ats");
	vector<pair<double, double>> pairs;
	SeetaPointF *points = PD.Detect(image, *face);
	if (points)
	{
		for (int j = 0; j < PD.LandmarkNum(); ++j)
		{
			pairs.push_back(pair<double, double>(points[j].x, points[j].y));
		}
	}
	return pairs;
}

