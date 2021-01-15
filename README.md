# 南京工业大学 Matlab应用实践

## 项目说明

此项目是南京工业大学电子信息专业《Matlab应用实践》中几个实验的代码记录，由于本课程是没有老师授课的自学课程，可能会有所难度，所以共享出我在实验过程中调试成功的代码供学弟学妹们参考学习。还请不要原封不动的照抄。

## 实验内容

实验总共分为五个章节，代码已经放在对应的文件夹中了，可以看仓库里面的《Matlab应用实践指导书》中所述内容，仓库中各个文件对应实验如下表所示：

<table>
   <tr>
      <td>第1章</td>
      <td>Lx0701~Lx0704</td>
      <td>练习3.1的四个</td>
   </tr>
   <tr>
      <td></td>
      <td>Lx07051</td>
      <td>例3-5 方法一</td>
   </tr>
   <tr>
      <td></td>
      <td>Lx07052</td>
      <td>例3-5 方法二</td>
   </tr>
   <tr>
      <td></td>
      <td>Lx0710</td>
      <td>例3-10</td>
   </tr>
   <tr>
      <td></td>
      <td>Lx0714</td>
      <td>例4-1</td>
   </tr>
   <tr>
      <td></td>
      <td>Lx0715</td>
      <td>例4-2</td>
   </tr>
   <tr>
      <td></td>
      <td>Lx0716</td>
      <td>例5-1</td>
   </tr>
   <tr>
      <td></td>
      <td>Lx0502</td>
      <td>例5-2</td>
   </tr>
   <tr>
      <td>第2章</td>
      <td>待补充</td>
      <td>待补充</td>
   </tr>
   <tr>
      <td>第3章</td>
      <td>matlab_3</td>
      <td>全部内容分节展示</td>
   </tr>
   <tr>
      <td>第4章</td>
      <td>task1-1~task1~3</td>
      <td>实验4第一项三个任务</td>
   </tr>
   <tr>
      <td></td>
      <td>task2</td>
      <td>第二个任务</td>
   </tr>
   <tr>
      <td></td>
      <td>task3</td>
      <td>第三个任务</td>
   </tr>
   <tr>
      <td>第5章:综合项目</td>
      <td>useful.fig</td>
      <td>GUI界面文件</td>
   </tr>
   <tr>
      <td></td>
      <td>useful.m</td>
      <td>GUI回调函数</td>
   </tr>
   <tr>
      <td></td>
   </tr>
</table>

补充说明：最后的大项目我选的是语音处理，拓展功能是男女声音色识别和反转（识别到男声则可以男声转女声 反之亦然）。在运行代码时，需要让Matlab进入实验四的目录下，并且从软件内运行“useful.m”文件，直接运行“useful.fig”在使用一些功能时会报错。

## 实验中可能会遇到的问题

但需要注意仓库里的实验指导书有几处错误：

* 实验四的task 1中指导书所给的器件图是有错误的，以我仓库里task1-1.slx的图为准。

* 实验四中第三个实验设计数字滤波器中所用到的“Spectrum Scope”模块在新版本的Matlab中已经不再提供，可以使用仓库的task3.slx中的“Spectrum Analyzer”模块来代替。

上面提到的两个错误已经由同学向老师反馈，老师会在下一个版本的实验指导书中更新。
