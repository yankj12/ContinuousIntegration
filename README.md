# ContinuousIntegration
本项目用于持续集成实践过程中整理出来的相关文档、思路及产生的脚本

过程（阶段）
停web服务器
更新项目代码
编译及打包
部署到web服务器
启动web服务器

Version:最简陋版
使用shell脚本部署一个项目

Version：使用输出信息
在shell脚本部署多个项目，其中一些项目有依赖关系，使用输出信息使操作人员清晰地了解到当前部署进度

Version：使用ant或者maven

Version：将脚本抽象化，将每个项目个性的内容移动到配置文件

Version：将多个项目公共的配置数据移动到配置中心