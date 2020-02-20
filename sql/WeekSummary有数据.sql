-- --------------------------------------------------------
-- 主机:                           127.0.0.1
-- 服务器版本:                        5.5.28 - MySQL Community Server (GPL)
-- 服务器操作系统:                      Win64
-- HeidiSQL 版本:                  10.3.0.5771
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- 导出 test 的数据库结构
CREATE DATABASE IF NOT EXISTS `test` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `test`;

-- 导出  表 test.admin 结构
CREATE TABLE IF NOT EXISTS `admin` (
  `a_id` int(11) NOT NULL AUTO_INCREMENT,
  `a_name` varchar(100) DEFAULT NULL,
  `a_password` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`a_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='登入用户';

-- 正在导出表  test.admin 的数据：~2 rows (大约)
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
REPLACE INTO `admin` (`a_id`, `a_name`, `a_password`) VALUES
	(1, 'admin', 'admin'),
	(2, 'zwz', '123');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;

-- 导出  表 test.summary 结构
CREATE TABLE IF NOT EXISTS `summary` (
  `s_id` int(11) NOT NULL AUTO_INCREMENT,
  `s_author` varchar(100) DEFAULT NULL,
  `s_intro` varchar(100) DEFAULT NULL,
  `s_content` text,
  `s_date` varchar(100) DEFAULT NULL,
  `s_publish` int(11) DEFAULT NULL,
  `s_status` int(11) DEFAULT NULL,
  PRIMARY KEY (`s_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COMMENT='周总结内容';

-- 正在导出表  test.summary 的数据：~28 rows (大约)
/*!40000 ALTER TABLE `summary` DISABLE KEYS */;
REPLACE INTO `summary` (`s_id`, `s_author`, `s_intro`, `s_content`, `s_date`, `s_publish`, `s_status`) VALUES
	(1, 'zwz', '大一第一学期', '## 要求1\n**年终总结（1、在这一年来，你在ACM团队中的得与失；2、做了多少题，懂了哪些算法；3、为实验室、团队做了什么贡献；4、自学能力、人际关系的锻炼5、对实验室的感想； 6、为更好的发挥实验室的作用，提高大家的编程水平，有什么好建议。，7,8。。。。大一的写写属于你自己的一年 尽量写，写得越详细越好）**\n\n1.自从2017年12月8日加入了ACM团队，在其中得到了C语言的大幅提升；失去了晚自修学习其他学科的若干时间。\n\n2.至2017年12月22日，我在元培OJ中A了327题，在杭电A了111题；无论是从ACM社团还是在实验室的自我学习中，懂得了选择排序，插入排序，碾转相减法，碾转相除法，百元买白鸡（统计硬币），以及一系列的递归问题；01背包，完全背包等问题还在学习中。\n\n3.最大的贡献是参与17市竞赛当了一回翻译员，拿了二等奖。\n\n4.加入ACM实验室，使我在平时的课余时间，除了回寝室以外，有了选择余地；实验室中我也得到了学长学姐们的指导，也不亚于在学生会中的交际锻炼。\n\n5.实验室虽然没有那些大型高端的仪器设备，但能满足我们正常编程的需求，比起在教室或者在机房集体上机，在实验室编程效率更高。\n\n6.ACM实验室顾名思义是学编程的地方，希望有系列性的算法学习。比如几天内学某一个算法，并给出相应的题目加以巩固练习。\n\n7.大一到现在，除ACM以外，我也在高数上花了很多时间，我也在高数期中考考了82分，期末考只需考到26分就可以不挂科；其他科目挂科几率也比较低（除英语），但在英语方面还有很大欠缺，停留在初中英语基础上的我学习大学英语也存在很大的挑战性。\n\n\n------------\n## 要求2\n**2018年度目标与计划（这里的计划不仅包括ACM的，也包括其他的，写明具体的目标计划以及实施时间段，写得合理点,一年后你再来看看自己的计划）**\n\n#### 2018年度目标与计划：\n##### ACM方面：\n1.在寒假结束前做完ACM杭电练习表中的基础题、字符串的所有题，若有剩余时间去做贪心类和递推类的题。主要是熟练掌握字符串常规问题的解题套路。\n\n2.寒假结束后开始学C++，在4月初之前掌握C++的基本语法。\n\n##### 其他方面：\n3.有机会再考一下计算机二级C语言。\n\n4.像第一学期那样做到0旷课，重点放在高数上面。\n英语方面若有空余精力则去学，若没有则放弃，没有兴趣加上基础太差，花太多时间或许得不偿失。', '2020-02-20', 1, 0),
	(2, 'zwz', '大一第二学期', '#### 一、题数\n元培OJ	431题\n本部OJ	176题\n杭电OJ	260题\nPAT乙级模拟题	85题\n\n大一开学到目前已经AC了 952 题，其中：\n\n☞国庆做的Pta 115题大多和元培OJ重复 所以不计。\n#### 二、算法\n\n###### 大一新学：\n二分法、尺取法、基础递推、快速(矩阵)幂、dfs、bfs、并查集、最短路、基础动态规划、碾转相除(减)法、排序(冒泡、插入、选择排序、快排)、二进制法、素数判断法、容斥原理、海伦公式 、欧拉函数(正在学)。\n###### 初高中：\n十字相乘法、数学归纳法、二项式定理。\n\n#### 三、《入门经典》阅读情况\n\n见Word文档...', '2020-02-20', 1, 0),
	(3, 'zwz', '第三学期', '#### 去年计划完成情况\n1.基础题全部完成，字符串大部分已完成，贪心、递推各做了一半\n2.C++基本语法已学会\n3.计算机二级C语言已考  预计能过\n4.目前没挂科，且已拿到综合三等奖学金\n5.英语方面放在第四学期，如果四级能过最好，要是四级过不了且英语没挂科，则大学四年放弃英语。\n其他成就：PAT乙级100分、市三等、GYB证书、驾驶证C1。\n#### 明年计划和目标\n##### 目标：\n1.希望有资格进入CCCC的第一组队伍参赛\n2.希望有资格参加省赛\n3.希望明年市竞赛能有二等奖以上\n4.希望明年元培院赛能够有二等奖以上\n5.希望明年年底之前能考出英语四级证书，还有英语不要挂科\n##### 计划：\n###### 寒假之前：\n以复习数据结构和大学物理为主，学好以后编程打下好的基础。\n###### 寒假：\n1.侧重学习dp和搜索，杭电做题、争取破400题，准备明年省赛\n2.争取把紫书除最后一章以外的所有算法理解、且能够独立写出相应代码\n###### 下个学期：\n1.开始学习蓝书。\n2.预习JAVA的基本语法，尝试用java写水题。\n3.坚持参加每周的训练赛，并补题，有必要时写总结。', '2020-02-20', 1, 0),
	(4, 'zwz', '第四学期', '## 元培第四学期ACM总结\n\n------------\n\n\n**时间过得很快，大学一半已经过去了；回想这两年，经历了很多，也基本颠覆了大学前的三观。无论是初中还是高中，不知为什么，总是能受到班主任的重点关注，初高中的班主任经常单独找我做思想工作，强调学习改变命运，要和学习好的人在一块，再加上家校联系很密切，所以自从初中以来，我一直遵循学习至上的原则，相信老师所说的”普高优于职高”，”本科优于专科”的观点，遵循题海战术，坚信分数决定一切，毕竟在一个综合本科率不到25%的农村普高，能考上省内本科是非常不容易的。**\n\n**继承高中的习惯，对于大学里数学类的课和专业相关的课，我不仅追求高绩点，也在意是否真正能学到什么。自大一到现在，我都遵循”寒暑假自学上课复习”的策略，例如C语言、高数、线代、数据结构、JAVA，包括即将到来的Android、概率论和数据库。不管上课老师讲好讲差，我认为只要假期预先学过，就可以赢在起跑线，跟上老师的上课节奏。**\n\n**另外一方面是英语，最后一次英语的通过，无论从物质还是精神方面，都大大减轻了我的负担，挂科一方面非但拿不到奖学金还要倒贴重修费，陷入恶性循环，另一方面也是大学生涯的污点和难以抹去的黑历史。但即使通过，我还会争取一下四级，每天积累一点词汇量，方便解决之后ACM的翻译问题。**\n\n**最重要的是ACM,其一它使我融入了优秀的群体，接触了优秀的人，”近朱者赤近墨者黑”并非说说而已；其二为我的专业课学习降低了大量门槛，使得学习专业课更加容易；其三让我拿到了若干奖项，去了之前没去过的城市，长了见识也丰富了简历；其四提升了自学能力，也让大学生活更有意义。。。。。。**\n\n**对于未来两年，我打算调整一下自己的规划。想想自己的职业规划，我会遵循就近原则，首先考虑在余姚工作，其次去宁波市区找对口的工作。工作应该是以安卓软件开发为主，所以在毕业之前要打好JAVA基础，尽量往这个方向去发展。作为计算机专业的应届生，需要的不仅仅是算法功底，另外团队合作能力、逻辑思维能力、项目经验、自学能力都是不可或缺的。总之在剩余的大学两年中，我会以ACM和学习专业课为主，另外试着考一下PAT甲级和英语四级，学一些自己想学的课程，为以后找工作打一个良好的基础。**', '2020-02-20', 1, 0),
	(5, 'zwz', '第五学期第一周', '#### 大三开始了，英语终于解脱了，的确轻松了不少。学一些自己不愿意学但一定要学的课程，明明听不懂还要强带微笑装作在听，真的很累，也算是一种悲哀吧。新大三目前来说有Android、数据库、组成原理、Java、网络安全、路由交换技术 这六门课，其中Java被齐鸣鸣老师改成了ExtJS课程（JS的前端框架）。我想主打Android、数据库两门，因为Android开发是我比较理想的工作之一，关系数据库SQL是绝大多数软件开发类岗位的必要条件，另外我也想考一下数据库三级。\n\n#### 大三这一年我计划参加 数据库三级、市赛、物理竞赛(水能力分)，年后参加 PAT甲级、元培院赛、文理院赛、天梯赛、市联赛、省赛，基本已经固定，参加的肯定参加，不参加的肯定不参加。开学这一周每天7点起床吃早饭，10点半吃完夜宵睡觉，吃饭什么的都是定点，估计之后也一直都是这样。除了上课之外，主要复习巩固了老师上课讲的内容，在寝室翻翻发的新书，看看慕课，敲敲代码，累了就睡个觉，过着相对比较规律的生活。另外7月10号绍兴的城铁到宁波正式开通，回家城铁票就6块钱，以后一般情况我会两个礼拜回一次家。\n\n#### ACM方面我最近在温故一下以前学的内容，比如最短路，深广搜这种，因为这周我做了一些题目，我写了好久最后还是看了模板才AC。最近三场网络赛水题写的很快，难题根本没思路，很多题目都翻译不出来，跟别人差距很大。离市赛还有两个多月的时间，每天多写写代码，尽量保三争二吧。', '2020-02-20', 1, 0),
	(6, 'zwz', '第五学期第二周', '#### 9月9号到9月15号，也就是大三的第二周，ACM方面复习了线性筛素数、欧拉函数、矩阵快速幂、并查集、LIS、用string实现大数加减法的模版，初步预习了一下“莫比乌斯反演”这个算法。\n\n#### Android方面，学习了5种布局管理器（相对、线性、帧、表格、网格），十多种UI组件（TextView、EditView、Button、ImageButton、RadioButton、CheckBox等），界面Activity、使用Bundle实现界面跳转、信使的显隐式Intent，也学了前置课程 Java多线程 的相关知识，并制作了一个供自己使用的APP。\n\n#### Android本学期课堂共教十章，目前已学完第七章，希望第三周能够把剩下的尽量学完，之后才有更多精力投入到ACM之中。\n', '2020-02-20', 1, 0),
	(7, 'zwz', '第五学期第三周', '#### 9月16~9月22，大三的第三周，周一到周五上午基本早中晚全天都在忙焊电路板的事情，虽然最后还是没全部成功，但大概体验了一下焊电路板的流程。\n \n#### 周五下午晚上和周六主要复习了三个常用背包相关的知识点，重温了这些背包问题的原理，整理如下：\n#### 01背包\n`for (i = 1; i <= n; i++)\n{\n	for (j = v; j >= a[i].cost; j--)\n	{\n		if (f[j] < f[j - a[i].cost] + a[i].val)\n			f[j] = f[j - a[i].cost] + a[i].val;\n	}\n}`\n#### 完全背包\n`for (int i = 1; i <= n; i++)\n{\n	for (int j = w[i]; j <= v; j++)\n	{\n		dp[j] = min(dp[j], dp[j - w[i]] + p[i]);\n	}\n}`\n#### 多重背包\n`for (int i = 0; i<n; i++)\n{      \n	for (int k = 0; k<num[i]; k++)\n	{            \n		for (int j = cc; j >= v[i]; j--)\n		{   \n			dp[j] = max(dp[j], dp[j - v[i]] + v[i]);\n		}\n	}\n}`\n#### 然后周日和朋友去了一趟杭州西湖，也是我第一次出远门，圆了我曾经杭州一日游的梦想。', '2020-02-20', 1, 0),
	(8, 'zwz', '第五学期第四周', '#### 9月23号到9月29号，也就是大三的第四周，这周以学习算法为主。为了准备市赛，开始复习预习各种常用的算法，并争取早日做出适合自己的算法模板。9月23号到9月29号，也就是大三的第四周，这周以学习算法为主。为了准备市赛，开始复习预习各种常用的算法，并争取早日做出适合自己的算法模板。\n\n#### 周一学(复)习了矩阵快速幂，从最简单的斐波那契数列开始推导：然后发现矩阵快速幂不仅仅只能用到斐波那契，在一般的递推公式中也可以使用，原本o(n)的for循环递推，优化后o(logn)就可以求出答案。\n\n#### 周二复习了并查集，在原先的基础上，看了优化后版本的博客，即设置三个数组，ID[]数组是这个人的老大(祖宗节点),然后是SZ[]数组，设置这个门派的人数，用于在mix函数合并的时候进行优化。然后做出了需记录路径(不能路径压缩)和不需记录路径(可以路径压缩)的两份模板。\n\n#### 周三周四学习了Manacher马拉车算法，去年省赛就有一题马拉车算法的变形题。根据我的理解，马拉车算法就是求一个字符串中的最大回文串。算法是线性时间复杂度，先在每个字符之间包括头尾加入一个特殊字符，使总长度为奇数；然后分别求每个位置的p数组，即以这个点为中心的最大回文半径。算法核心公式是：P[i] = right > i ? min(P[2 * mi - i], right - i) : 1;Right是维护时候的最右边的点，mi是当前处理的中心点，如果i在right范围里面，那么2 * mi – i这个点相对于mi这个中心，和i对称，然后回文半径也相同，这是利用了回文串的性质，降低了复杂度。如果i在right右边，那只能笨方法一步一步判断了。\n\n#### 周五本来想学一下用dfs在图中找环，后来在博客中看到有一个前置算法tarjan，然后就大概学了一下，这个算法是用来求有向图的强连通分量的。它是使用DFN[]和LOW[]两个数组，我是看懂了程序算法进行的流程，如果给我一副图我能讲出来，用文字我也说不清楚，所以。。。。。。\n \n就是1进栈；\n1到2成功，2进栈；\n2到3成功，3进栈；\n3到6成功，6进栈；\n6无路可走，6出栈；\n3也无路可走，3出栈；\n2到5成功，5进栈；\n5到6发现6走过，忽略；\n5到1发现1已经在栈里，此时1 2 5为强连通分量，记录。\n然后返回到2（因为成功了已经所以不出栈）；\n然后返回到1；\n1到4成功，4进栈；\n4到5，发现5已经在栈里，此时1 2 5 4为强连通分量，记录。\n后面依次回到1，程序结束。\n反正就是这么回事，具体的算法思路我也不清楚。。。\n#### 周六周日主要学了线性筛素数和欧拉函数，然后莫比乌斯反演还在看，那些公式感觉好复杂，推导过程比较繁琐，打算国庆假期深入学一学。', '2020-02-20', 1, 0),
	(9, 'zwz', '第五学期第五周', '#### 国庆长假即将结束，这一周基本都宅在家里，最澎湃人心的就是奖学金评比结果出来了，之前大二为了考高的分数，疯狂刷题库，抬高绩点，而现在到头来也只是个三等，心里有点小失落，大三这一年就顺其自然吧，能力分该拿的拿住，稳个三等应该问题不大。\n#### 国庆受我朋友的邀约，大概花了一天的时间，有幸接触学习了久仰的Spring框架，主要是学习了配置spring的环境和了解了spring是干什么的和基本工作原理，并且写了篇博客，网址：[点我这里](https://blog.csdn.net/qq_41464123/article/details/101856696 "点我这里")\n#### 另外提前预习了数据库相关和SQL语言，备考计算机三级。\n', '2020-02-20', 1, 0),
	(10, 'zwz', '第五学期第六周', '### 国庆回来的这一周，主要在忙以下六点\n\n#### 1.《计算机组成原理》课程中原码、反码、补码、移码、进制转换、IEEE754浮点数转换。（一个下午）\n\n#### 2.《数据库原理》课程中，查询中文语句转化为关系代数表达式、画E-R图（作业，大概4张A4纸）（2天左右）\n\n#### 3.报名了蓝桥杯，开始刷蓝桥杯的题库，三天内水了18道题。\n\n#### 4.初步了解了自动AC机，将在接下来这几天温故一下KMP，学一下字典树这两门前置算法。\n\n#### 5.重新开始做一轮杭电的题目，争取做到“随便抽出一道做过的题，都能独立AC”，原本计划市赛前做100题，现在因为蓝桥杯也要做，尽力而为吧。\n\n#### 6.整理了一下大学以来所有的照片库，大概4个多G的照片，把没用的删了，取其精华（半天）。', '2020-02-20', 1, 0),
	(11, 'zwz', '第五学期第七周', '#### 这一周主要在预习数据库SQL语言相关内容，包括单表查询的选择、投影、as别名、between and语法、like字符串匹配、查询结果排序、聚合函数统计，多表连接的内连接、左外连接、右外连接，以及两种不同的语法（ANSI方式、Theta方式）、TOP语句使用、case语句的使用，查询结果保存表的INTO语句、子查询模块、EXISTS谓词；视图的定义、使用、修改、删除SQL语法；数据的插入、更新、删除用SQL如何实现，还简单了解了一下数据控制功能（授权、回收授权、拒权），预计下周自学查询优化，争取等级考试前学完数据库这门课，减轻期末复习的压力。\n\n#### 另外做了一套18级出的社团比赛的题目，感觉蛮有意思，有脑洞，有算法，也有很多坑点，仿佛回到了大一的时候屡屡踩坑；也复习了一下奇偶校验码、海明校验码、循环冗余校验码，另外整理了一份《计算机组成原理》目前学过知识的复习提纲，以便期末复习的时候能够更加得心应手。', '2020-02-20', 1, 0),
	(12, 'zwz', '第五学期第八周', '#### 这一周有点被IEEE754浮点数计算卡心态，老师讲的和书上的不一样，上课听懂了，课后又忘记则么做了，然后自己推了好久，最后还是找老师答疑解决了问题。当然数据库最近也在学函数依赖、范式的概念，也是重头戏，所以最近感觉有点力不从心，时间过的特别快。\n\n#### 我之所以花时间去学数据库，主要是报了计算机等级考试，感觉这种“以赛促学”的模式效果挺好，等级考试之后随之而来的就是ACM市赛，所以这周要尽快把模板准备好（主要添加一些新学的算法或者温故后发现有优化版的），然后跟队友整合模板，一起努力争二保三；这次社团比赛，19级新生的第一名既然选择了我们组，那我也肯定争取不让他失望。PAT、蓝桥杯也是这样，只有交了钱报名考试了，才会努力的去刷题学算法，这可能就是人类的本质把。\n\n#### 另外我发现社团公众号没人愿意和我一起维护运营，所以我打算把社团公众号的内容逐步过渡到微信小程序上，因为小程序的功能更加强大，相当于一个APP，可以用于明年院赛的报名，可以设计出一个类似元培官网的ACM实验室专属官网，也应该可以作为我明年的毕业设计，它是JS语言开发的web前端应用。（只是一个设想，到时候根据实际情况再订）', '2020-02-20', 1, 0),
	(13, 'zwz', '第五学期第九周', '#### 这一周有点意外，周五居然没课，然后我再一次回到了家，欢度没有任何节日的三天假期。这周最大的成就就是把模板重新做了一遍，我觉得适合自己的模板才能真正发挥作用，然后去掉一些高深的算法，把我认为经常用到、我能驾驭的算法重新学了一遍，包括算法思路和代码模板重新整理、OJ交题验证，所有的代码都是重新验证复习的，日均花费3小时时间，礼拜六做到凌晨1点终于加工完毕，然后今天把模板格式调整、美化了一下，希望在接下来的市赛中能够得心应手。这周大部分课余时间都用于整理复习算法，别的也就是双11天猫的卖楼吧，真心希望能在市赛拿到奖。另外吐槽一下奖学金发放咋就这么慢呢，交学费催了又催，奖学金拖到现在还在拖。下一周就全力复习数据结构和数据库了，备考三级数据库等级考试。', '2020-02-20', 1, 0),
	(14, 'zwz', '第五学期第十周', '#### 本周主要在学习微信小程序的内容，从图书馆借了两本书，参考微信官网的教学视频，在编译器上敲代码实践。通过最近的学习，感觉做一个简单的小程序界面其实不难，主要是一些容器及其属性的英文单词，要能够耳熟能详；主要的开发思想和开发Android比较类似，也是分为视图层和逻辑层，也是用xml开发界面，用js语言编写事件。对我来说，用这个做毕业设计我还是蛮有信心的，另外我也做了个介绍实验室的小程序，二维码见Word文档。\n\n#### 自从大三以来，也许是我慢慢在走下坡路，也许是其他人开始奋发图强；我发现班里好多原本都不则么努力的同学，自大三开始都往各自的方向努力发展了，比如ctf、物理竞赛、服务外包等等。他们有的拿了省奖直接免毕设，什么spring，什么linux，什么虚拟机......大三开始再也不是一枝独放的时代。我并不是后悔参与acm而想搞其他，只是感受到了一种压迫感，学如逆水行舟，不进则退；在大一大二拿过别人所得不到的成就，而大三，就只能期望蓝桥杯和省赛来翻身了。在主学算法的同时，也要兼顾一些作为计算机专业学生所必需的模块，不求有多精通，只求一定要会。除了微信公众号、小程序以外，计划年底之前再接触一下Linux，然后想补一补大一《计算机网络》这门课，这门课上的很水，但貌似真的很重要，还有JS的前端Ext，既然课上教了，也要作为期末作品，不如抓住机会好好学一学。', '2020-02-20', 1, 0),
	(15, 'zwz', '第五学期第十一周', '#### 转眼间半个多学期过去了，本学期新学的东西不多，学来学去都是数据库、Android和在学的理论课程这些，我也重新回顾了前十周的周总结，发现自己问题就出在想的太多，做的太少。这让我回想起以前大一C语言课堂上，老蔡使用excel表格讲的pow(0.99,365)和pow(1.01,365)的差距。一次偶然的机会，我到隔壁寝室看了看，他们柜子上都贴着学习计划，什么四级单词、python，还有一些看不太懂的专业词汇；加上我平时听到他们百词斩的”叮~叮~”声，以及看到他们课堂上看着看似课外的书籍，再次印证了他们确实在付出与实践。然而对于我来说，今后就一步一个脚印吧，一周专心学习一至两块内容，比如这周数据库考试，就专心复习数据库；下周市赛，就专心刷市赛的题目……\n\n#### 本周参加了数据库等级考试，其中三级数据库，三级网络技术，三级单片机是一个教室考试的。本以为会很难，结果不到半小时就做完了，考网络技术的还要夸张，开考15分钟就开始陆陆续续交卷了，开考半小时的时候我回头一看，教室就剩我一个人了，两位监考老师眼巴巴的看着我，仿佛在说：快点交吧，我们要下班了…… 然后本来还有几道题我想重新检查做一遍的，也就直接填不管了，希望能顺利通过。\n\n#### 本周也跟着我朋友一起去了快递站做兼职，主要是扫描分拣快递，赚了点外快，也买了点吃的、用的犒劳自己，用双手成就我的梦想，不以物喜，不以己悲，对自己好一点，准没有错。虽然跟专业没什么关系，但兼职肯定要比在寝室打游戏要来的好。', '2020-02-20', 1, 0),
	(16, 'zwz', '第五学期第十二周', '#### 本周是第十二周，这一周主要两件事情，一个就是终于把运动世界校园的70KM跑完，这学期就不必在冬夜的冷风中跑步了；另一个就是在市赛中正常发挥，应该有个银奖把。\n\n#### 市赛的A题经过分析，实际上就是判断输入的二维数组能够分为多少个同值矩形块，那么答案就是( 块数-1 )，最开始用暴力模拟WA了，这题和17年市赛的巧克力冰淇淋那题很像，题解都忘记了导致代码写不出来；B题是水题，经典的a+b的入门题......；C题跳马题，刚开始一直在考虑会不会压马脚，后来一看小胖学长1A通过，然后我们感觉是一道脑洞题，用不着搜索，后面我们特判了一下也1A了，(在此特别感谢小胖学长!)，矩形大小n*m，小矩形答案n*m-1，即留一个空位即可，长扁型矩形答案n*m-2，即一个空格的另外一边马能跳到的位置也要为空，才能满足题意，大矩形答案就是n*m-3，只要把空位放在任意一个角落，然后把两个能跳到的空位空出来，能保证角落的空格必定没马能跳到。D题看起来是图论，因为比赛时候没人做我们也没做，等题解来了再补。E题最基础的贪心，技能1消耗1点能量打一点伤害，技能2消耗3点能量打三点伤害，那肯定就是优先用技能2打，最后余下的血大于3用技能2，小于3用技能1补刀。F、G题同D题，日后补题。H题貌似是用某种高级数据结构做的，我们先是用了可重复set，超时，然后套上输入挂、输出挂，再进行一些列的优化，还是超时...... I题字符串分割，因为粗心没看到要输出分割后个数，WA了三发，实在是不应该。J题是排列组合，刚开始以为开1000W的数组打表会爆内容，结果不但没爆还AC了，有点意思。总体来说，这次市赛算正常发挥吧，和队友配合很好，把能做的题都做出来了。\n\n#### 下周计划补一补我的组成原理，感觉已经拉下好多了，不然期末复习就麻烦了；然后数据库有个单元测试，到时候那些数据库的关键字还是要背一背的，英文单词不经常用还真的记太不住。', '2020-02-20', 1, 0),
	(17, 'zwz', '第五学期第十三周', '#### 本周是第十三周，周一帮我高中同学写了一份java作业，其中部分题目要求使用Junit完成对类的测试，然后我就接触了一下Junit5，感觉这个挺有用的，以后可能会用得到，就写了一篇博客，以备不时之需，网址如下。其实我觉得Junit5就是一个java测试框架，能够多方面的对编写的java类进行测试。\n\n#### 网址: [点我这里](https://blog.csdn.net/qq_41464123/article/details/103253830 "点我这里")\n#### 本周主要预习了一下javascript的基本语法，主要是一些和C++和Java不太一样的地方，比如js的弱数据类型var，万能的数据类型，还有一些foreach、for in循环遍历方法，with语句语法，内置onclick方法、使用外部js文件实现js代码和html代码相分离。还有就是复习了一下html、css的排版网页，给extjs的学习打了个基础。虽然说ext是一个比较老的框架了，但如果能学好这一个，学别的框架的时候可以轻松不少吧。另外连着写了数据库的三份实验报告，预习了SQL Server数据库的游标、存储过程、触发器。然后周末会了趟家，本周主要就这些事情吧。', '2020-02-20', 1, 0),
	(18, 'zwz', '第五学期第十四周', '#### 本周是第十四周，时间很快，又到期末了。随着第一门课的题库下发，紧接着就是打印，然后刷题，接着答疑，最后考试。数据库190多页的题目，最近尽力而为刷题库吧。\n\n#### 这周参加了绍兴公共大数据竞赛，和队友一起写了一个评估绍兴各县区发展水平的APP，其实通俗来说就是使用java代码访问某一个网址，然后把网址全部内容返回为一个字符串，最后再用java代码对其格式整理，放入适合的数据容器，再从Android的XML界面输出显示。从中学习到了：\n\n#### 1.使用URL类爬取网址数据。\n\n#### 2.Android网页爬取功能，不能放在主线程，必须新开辟一个Runnable\n\n#### 3.网页接口的使用调取方法\n\n#### 这学期6门课，都有各自的题库，反正不管考不考，刷就完事了。这学期学的东西有点杂，可能跟在学课程有关，也可能有点从众心理。期末考考完之后的一整个寒假包括下学期就真的一定刷ACM了，不再放飞自我了。', '2020-02-20', 1, 0),
	(19, 'zwz', '第五学期第十五周', '#### 本周是第十五周，临近期末也没有别的事情，就是全力复习准备期末考。所谓准备期末考就是看课本，刷题库，答疑。所以这礼拜我主要把《数据库原理》、《计算机组成原理》这两门的题库各刷了一遍，对于不会的题目总结好哪里不会，下周问同学或者到老师那答疑。\n\n#### 因为本学期期末没了英语，轻松了很多，所以总体来说还不算很忙，就是劳逸结合，题库刷累了睡个觉，睡醒了继续刷，然后周末回了个家，写了一个实验室年终总结，本周就这些事情。', '2020-02-20', 1, 0),
	(20, 'zwz', '第五学期年终总结', '### 今年获得奖项：\n##### 今年是大二转大三的一年，也是大学生涯中非常关键的一年。今年主要以161分的个人得分参与了CCCC天梯赛，取得了国二省三；然后和我斌哥一起参加了绍兴市赛，拿了市二；还有元培院赛拿了二等；然后省赛打铁，距离省三还差10来个名次，还有参加了三级数据库考试，成绩还没出来。\n\n------------\n\n\n### 去年计划完成情况：\n##### 总体来说除了英语四级没过之外，去年其余的计划基本实现。\n\n------------\n\n\n### 做题：\n##### 今年没做较多的题，省赛过后很多精力放在别的事情上。\nHdu：     488题（2019.2.10 411题）\n元培OJ：  应该500+题\n文理OJ ： 232题\nPoj ：    12题\n\n------------\n\n\n### 非acm方面总结:\n##### 1.顺利解放了英语，拿到综三奖学金。\n\n##### 2.维护了实验室的微信公众号，发布35篇原创推文，吸引170个用户关注，并自学并制作了微信小程序。\n\n##### 3.自学了Android，学会开发含一般的界面和基础功能的APP。\n\n##### 4.自学了JavaScript、HTML、css，然后学了ExtJS，结合MySQL编写简单的web管理系统。\n\n##### 5.本学期内推进了某个部门的志愿者，工作中学习到了电脑相关设备的组装和维护、宽带路由网络连线，以及学会解决各种奇奇怪怪的电脑故障。\n\n------------\n\n\n### 2020年度目标与计划：\n#### **1月6日前：**\n##### 全力准备期末考试，力争高分。\n\n#### **1月7日到寒假结束**\n##### 1.在保质保量的前提下，刷hdu，重温算法，先学算法思路，再照着思路模拟代码，最后交题验证。\n##### 2.预估实验室的寒假作业是带数据库的管理系统或者带数据库的网页，在寒假复习ExtJs，初步接触一下SpringBoot，做出一个美观、实用的web程序。\n##### 3.结合下学期的课程，做相应预习工作。主要是Android高级部分、操作系统(Linux)。\n\n#### 新学期开始到省赛结束：\n##### 这段比赛黄金期，保证文化课正常的情况下，以acm比赛为主。元培院赛争一保二，天梯赛争一保二，蓝桥杯争取省三，acm省赛争取拿一个省三免毕设，然后考一下计算机三级网络技术。(年底争取考一下国二office)\n\n#### 省赛结束之后：\n##### 看个人状况，我个人认为17级(包括我)之所以现在都各自单飞，放飞自我，主要原因还是今年省赛打铁，心有不甘。不过对于ACM来说，能力最重要，功利心不能太重。自从大一加入了ACM实验室，我也亲身体验到，有了ACM基础，学习其他课程，就有一种无法用言语表达的优越感，比如大二的数据结构、Java，大三的Android、ExtJs、JavaScript等等，别人看不懂的代码我能看懂，就像别人能看懂的英文我看不懂那样。所以，对于我来说，分两种情况:\n\n##### 如果省赛拿奖，且有队友继续发展acm，那么有望参加ICPC、CCPC，则参加暑期集训，和上半年一样正常搞ACM，下半年根据实际情况组队参加ICPC或者CCPC的其中一站，哪怕是个优胜奖也好。\n##### 如果省赛依旧打铁，那么省赛之后和行政班的同学们一起参加5月的服务外包竞赛。另外的话多学一些框架，多积累一些开发经验，然后自己开发一些管理系统什么的练练手，个人觉得后端门槛要比前端高一点，换个角度讲薪水也会高一点。', '2020-02-20', 1, 0),
	(21, 'zwz', '用于测试功能01', '# 用于测试功能01\n## 用于测试功能01\n### 用于测试功能01\n#### 用于测试功能01\n##### 用于测试功能01\n###### 用于测试功能01', '2020-02-20', 1, 1),
	(22, 'zwz', '用于测试功能02', '# 用于测试功能02\n## 用于测试功能02\n### 用于测试功能02\n#### 用于测试功能02\n##### 用于测试功能02\n###### 用于测试功能02', '2020-02-20', 1, 1);
/*!40000 ALTER TABLE `summary` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
