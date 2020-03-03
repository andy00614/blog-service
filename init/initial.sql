CREATE DATABASE  IF NOT EXISTS `blog_service` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `blog_service`;
-- MySQL dump 10.13  Distrib 8.0.18, for macos10.14 (x86_64)
--
-- Host: localhost    Database: blog_service
-- ------------------------------------------------------
-- Server version	8.0.18

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `blogs`
--

DROP TABLE IF EXISTS `blogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blogs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `time` bigint(20) NOT NULL,
  `title` varchar(45) NOT NULL,
  `articleId` varchar(45) NOT NULL,
  `content` longtext NOT NULL,
  PRIMARY KEY (`articleId`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blogs`
--

LOCK TABLES `blogs` WRITE;
/*!40000 ALTER TABLE `blogs` DISABLE KEYS */;
INSERT INTO `blogs` VALUES (6,1582040830587,'test4','2020-2-18-est4','# title \\n ## title2'),(7,1582159365564,'ts-config','2020-2-20-ts-config','# 前言\n之前开发都是在用脚手架,几乎0配置,只需要会ts的语法就完全可以开发ts项目了，这次自己从零折腾了一个ts项目，发现配置方面还是有挺多坑的，所以不如从头看一下具体的方法和文档，于是总结出了这篇文章。相信我，自己系统的了解一遍和使用脚手架直接配置相比，理解上肯定会有不一样的认知。<br>\n本文主要从简单的方式了解tsconfig.json是干什么的、怎么用、和webpack结合起来会有一些常见的坑以及一些常用的配置，结合文档来看效果更佳 https://www.typescriptlang.org/v2/en/tsconfig<br>\n由于第一次写文章，肯定会有些不严谨或者不好的地方，请大家多多指出建议，谢谢~\n# what\n\n用于编译时遵循的规则表\n\n# why\n\n在没有tsconfig的情况下，我们可以用命令行的方式去执行\n\n`tsc --outFile file.js --target es3 --module commonjs index.ts`\n\n解释上半句：将index.ts用es3的代码和commonjs的形式，编译为file.js在根目录下\n\n1. 需要编译的调调框框很多的情形下(后面将要写一坨)\n2. 团队协作的情形下(大家需要有统一的规范)\n\n# how\n\n## 纯手工命令式\n\n上文有阐述，得自己打一坨\n\n## 配置文件命令式\n\n- 不显式指定 `tsconfig.json` ，此时，编译器会从当前路径开始寻，直到找到tsconfig.json文件为止**和require,import不写具体路径的查找规则差不多**\n- 通过 `--project` （或缩写 `-p` ）指定一个包含 `tsconfig.json` 的路径，和**import,require写个相对路径差不多**\n\n# 配置文件里的具体参数\n\n配置文件里有很多参数，具体场景有的确实还比较抽象，这里统一举例说明\n\n这个`tsconfig.json`大体可以分为两个部分描述，第一部分是编译的规则配置(compilerOptions)，第二个部分是对哪些文件进行编译(files,include,exclude)\n\n最常用的结构代码举例如下:\n\n    {\n        \"compilerOptions\": {},\n        \"files\": [], \n        \"include\": [],\n        \"exclude\": [] \n    }\n\n## compilerOptions\n\n顾名思义就是编译规则,下面会具体说一些常用的详细配置\n\n## files\n\n用法很简单，就是个数组，里面的元素为待编译的ts文件，如下图。\n\nfiles就是根据上面编译规则需要将哪些文件编译,举个例子\n\n\n![Untitled.png](https://user-gold-cdn.xitu.io/2020/2/1/16ffe79d8c9e22df?w=1762&h=862&f=png&s=86316)\n\n上面的配置文件的规则就是将compilerOption的编译规则应用于index.ts下，那如果我下面这样写就肯定会报错了\n\n![2.png](https://user-gold-cdn.xitu.io/2020/2/1/16ffe7b9f3e698ac?w=2476&h=908&f=png&s=119056)\n\n所以**得出结论：file适用于比较小型的项目，规定几个特定的文件。**\n\n最后一个小细节，file里面只是入口文件，比如test里面依赖一个`rely.ts`那么在files中不写rely.ts也不会报错。在当前目录下运行一下tsc做比较就知道了~\n\n那文件很多的项目怎么办，下面的include和exclude就派上用场了\n\n## include && exclude\n\n当文件有很多的时候，就可以用include和exclude(当然也可以不用)结合使用，比如现在只想让src下的除了带except文件编译，如图所示：\n\n![3.png](https://user-gold-cdn.xitu.io/2020/2/1/16ffe7bf007a6b4c?w=1746&h=1050&f=png&s=120448)\n\n在该项目根目录输入tsc会发生什么呢？\n\n![4.png](https://user-gold-cdn.xitu.io/2020/2/1/16ffe7c637c8c2e6?w=812&h=938&f=png&s=66144)\n\n会发现并没有编译except.ts的文件\n\n### 注意\n\n当用webpack进行打包并暴露出bundle文件的时候会和tsconfig产生冲突，因为他俩都是编译/打包出来的文件，因此要在tsconfig.json中添加exclude到webpack打包出的指定路径，理解如图：\n\n![5.png](https://user-gold-cdn.xitu.io/2020/2/1/16ffe7caa92666fc?w=2708&h=1936&f=png&s=314209)\n\n把注释中的引开就解决这个问题了~\n\n### PS\n\n- include可以和file联用\n- exclude只对include有效，对files无效\n- 如果 files 和 include 都未设置，那么除了 exclude 排除的文件，编译器会默认包含路径下的所有 TS 文件\n\n# 几个常用的编译配置\n\n### allowJs\n\n允许编译js文件\n\n### sourceMap\n\n生成一个.map.js的文件，用于其他工具来debugg，类似于webpack的sourceMap\n\n### noImplicitAny\n\n不允许用any，如果初学ts，建议项目部太复杂的情况下，可以借此来进行限制，前置自己培养对ts的理解\n\n### module && target\n\n这两个有一定的关联关系\n\ntarget是编译成哪个版本的js(es3,es5,es6...)\n\nmodule模板生成的形式，默认情况下，当target是es3的时候，那module默认为commonjs形式，否则为es6形式。\n\n**注意(和outFile搭配使用)**：生成的模块形式：none、commonjs、amd、system、umd、es6、es2015 或 esnext 只有 amd 和 system 能和 outFile 一起使用 target 为 es5 或更低时可用 es6 和 es2015\n\n### lib\n\n引入ES的功能库，比如想在项目中用js中Set，Map等新的数据结构，或promise等，那要在lib中引入es2015\n\n### removeComments\n\n编译出的文件是否带注释，当为false的时候可以减少编译出文件的体积\n\n### allowSyntheticDefaultImports\n\n这个配置挺重要的，如果不知道会很纳闷，不好排查为啥会报错\n\n当它为false的时候,引入模块的时候必须以*as的形式，例如引入react\n\n`import * as React from \'react\'`\n\n当为true的时候\n\n`import React from \'react\'`\n但要注意，他要配合module是esModule的格式或者--esModuleInterop为true的时候，因为react是commonjs写的，并没有default,所以import React from 这种default引入是不对的，具体可以看下这篇文章 https://blog.leodots.me/post/40-think-about-allowSyntheticDefaultImports.html\n\n### jsx\n\n如果用tsx文件(React-ts)那么该项要配置成 jsx:\"react\"\n\n### baseUrl\n\n举个例子:\n\n在根目录的src目录有个hello文件夹，其中hello里包含world.ts\n\n在根目录的app.ts下\n\n`import { example } from \"./src/hello/world\"`\n\n当baseUrl: \'./src\'\n\n则上面的目录可以简写成`import { example } from \"hello/world\"`\n\n### paths\n\npaths必须和上面的baseUrl联用，举个例子：\n\n![6.png](https://user-gold-cdn.xitu.io/2020/2/1/16ffe7d1a3071000?w=1050&h=1340&f=png&s=106459)\n那么将可以这样引入：\n\n![7.png](https://user-gold-cdn.xitu.io/2020/2/1/16ffe7d530e9d070?w=1864&h=970&f=png&s=174807)\n\n**但是有一点必须要特别注意：**\n\n如果用了webpack使用了alias,那么导致baseUrl不会生效，从而paths也不会生效，所以paths岂不是没用了吗？其实从实际作用来说确实是没用了，**不过可以将paths的配置和alias配置成一样的，在vscode中会有路径的自动提示，也是很方便很爽的**'),(12,1582209941053,'test10','2020-2-20/test10','xxxxxxxxxxxx'),(13,1582209946499,'test11','2020-2-20/test11','xxxxxxxxxxxx'),(14,1582209949495,'test12','2020-2-20/test12','xxxxxxxxxxxx'),(8,1582209842357,'test5','2020-2-20/test5','xxxxxxxxxxxx'),(9,1582209846449,'test6','2020-2-20/test6','xxxxxxxxxxxx'),(10,1582209851364,'test7','2020-2-20/test7','xxxxxxxxxxxx'),(11,1582209887466,'test9','2020-2-20/test9','xxxxxxxxxxxx'),(16,1582251729336,'test12','2020-2-21-test12','xxxxxxxxxxxx'),(19,1582251959723,'test14','2020-2-21-test14','xxxxxxxxxxxx'),(17,1582251803025,'test155','2020-2-21-test155','xxxxxxxxxxxx'),(3,1582040570886,'test1','test12020-2-18','contenttest1'),(4,1582040703176,'test2','test22020-2-18','contenttest2'),(5,1582040773081,'test3','test3-2020-2-18','contenttest3');
/*!40000 ALTER TABLE `blogs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `passwords`
--

DROP TABLE IF EXISTS `passwords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `passwords` (
  `password` varchar(20) NOT NULL,
  PRIMARY KEY (`password`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passwords`
--

LOCK TABLES `passwords` WRITE;
/*!40000 ALTER TABLE `passwords` DISABLE KEYS */;
INSERT INTO `passwords` VALUES ('saveblog');
/*!40000 ALTER TABLE `passwords` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-03-03  0:12:53
