USE [master]
GO
/****** Object:  Database [LayIM]    Script Date: 02/08/2017 11:32:20 ******/
CREATE DATABASE [LayIM] ON  PRIMARY 
( NAME = N'LayIM', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\LayIM.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'LayIM_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\LayIM_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [LayIM] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LayIM].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LayIM] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [LayIM] SET ANSI_NULLS OFF
GO
ALTER DATABASE [LayIM] SET ANSI_PADDING OFF
GO
ALTER DATABASE [LayIM] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [LayIM] SET ARITHABORT OFF
GO
ALTER DATABASE [LayIM] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [LayIM] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [LayIM] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [LayIM] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [LayIM] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [LayIM] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [LayIM] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [LayIM] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [LayIM] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [LayIM] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [LayIM] SET  DISABLE_BROKER
GO
ALTER DATABASE [LayIM] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [LayIM] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [LayIM] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [LayIM] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [LayIM] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [LayIM] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [LayIM] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [LayIM] SET  READ_WRITE
GO
ALTER DATABASE [LayIM] SET RECOVERY FULL
GO
ALTER DATABASE [LayIM] SET  MULTI_USER
GO
ALTER DATABASE [LayIM] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [LayIM] SET DB_CHAINING OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'LayIM', N'ON'
GO
USE [LayIM]
GO
/****** Object:  Table [dbo].[layim_user_skin]    Script Date: 02/08/2017 11:32:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[layim_user_skin](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userid] [int] NOT NULL,
	[path] [varchar](200) NOT NULL,
	[isuse] [bit] NOT NULL,
 CONSTRAINT [PK_layim_user_skin] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[layim_user_setting]    Script Date: 02/08/2017 11:32:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[layim_user_setting](
	[id] [int] IDENTITY(10000,1) NOT NULL,
	[userid] [int] NOT NULL,
	[friendsetting] [tinyint] NOT NULL,
	[disturbsetting] [tinyint] NOT NULL,
	[addtime] [datetime] NOT NULL,
	[updatetime] [datetime] NOT NULL,
 CONSTRAINT [PK_layim_user_setting] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'加好友设置，详情看枚举' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'layim_user_setting', @level2type=N'COLUMN',@level2name=N'friendsetting'
GO
/****** Object:  Table [dbo].[layim_user_autoreply]    Script Date: 02/08/2017 11:32:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[layim_user_autoreply](
	[id] [int] IDENTITY(10001,1) NOT NULL,
	[userid] [int] NOT NULL,
	[reply] [varchar](200) NOT NULL,
	[issys] [bit] NOT NULL,
	[isuse] [bit] NOT NULL,
	[addtime] [datetime] NOT NULL,
 CONSTRAINT [PK_layim_user_autoreply] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[layim_user]    Script Date: 02/08/2017 11:32:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[layim_user](
	[id] [int] IDENTITY(10000,1) NOT NULL,
	[loginname] [varchar](20) NOT NULL,
	[loginpwd] [varchar](64) NOT NULL,
	[nickname] [varchar](50) NOT NULL,
	[sign] [varchar](200) NULL,
	[headphoto] [varchar](200) NOT NULL,
	[addtime] [datetime] NOT NULL,
	[im] [int] NOT NULL,
 CONSTRAINT [PK_layim_user] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户登录名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'layim_user', @level2type=N'COLUMN',@level2name=N'loginname'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'密码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'layim_user', @level2type=N'COLUMN',@level2name=N'loginpwd'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'昵称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'layim_user', @level2type=N'COLUMN',@level2name=N'nickname'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'签名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'layim_user', @level2type=N'COLUMN',@level2name=N'sign'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'头像' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'layim_user', @level2type=N'COLUMN',@level2name=N'headphoto'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'layim_user', @level2type=N'COLUMN',@level2name=N'addtime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'IM号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'layim_user', @level2type=N'COLUMN',@level2name=N'im'
GO
/****** Object:  Table [dbo].[layim_sys_user_log]    Script Date: 02/08/2017 11:32:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[layim_sys_user_log](
	[id] [int] IDENTITY(10000,1) NOT NULL,
	[uid] [int] NOT NULL,
	[ip] [varchar](50) NULL,
	[operate] [tinyint] NOT NULL,
	[addtime] [datetime] NOT NULL,
 CONSTRAINT [PK_layim_sys_user_log] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1 登录系统 2 登出系统' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'layim_sys_user_log', @level2type=N'COLUMN',@level2name=N'operate'
GO
/****** Object:  Table [dbo].[layim_sys_backimgs]    Script Date: 02/08/2017 11:32:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[layim_sys_backimgs](
	[id] [int] IDENTITY(10000,1) NOT NULL,
	[path] [varchar](200) NOT NULL,
	[addtime] [datetime] NOT NULL,
	[isuse] [bit] NOT NULL,
 CONSTRAINT [PK_layim_sys_backimgs] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[layim_msg_unread]    Script Date: 02/08/2017 11:32:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[layim_msg_unread](
	[id] [int] NOT NULL,
	[uid] [int] NOT NULL,
	[gid] [int] NOT NULL,
	[msgcount] [int] NOT NULL,
	[udatetime] [datetime] NOT NULL,
 CONSTRAINT [PK_layim_msg_unread] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'未读消息个数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'layim_msg_unread', @level2type=N'COLUMN',@level2name=N'msgcount'
GO
/****** Object:  Table [dbo].[layim_msg_history]    Script Date: 02/08/2017 11:32:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[layim_msg_history](
	[id] [uniqueidentifier] NOT NULL,
	[fromuser] [int] NOT NULL,
	[gid] [varchar](200) NOT NULL,
	[msg] [varchar](2000) NOT NULL,
	[chattype] [tinyint] NOT NULL,
	[addtime] [int] NOT NULL,
	[msgtype] [tinyint] NOT NULL,
 CONSTRAINT [PK_layim_msg_history] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'聊天消息发送人，为0 就是系统消息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'layim_msg_history', @level2type=N'COLUMN',@level2name=N'fromuser'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'组id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'layim_msg_history', @level2type=N'COLUMN',@level2name=N'gid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'消息内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'layim_msg_history', @level2type=N'COLUMN',@level2name=N'msg'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1 单聊 2 群聊' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'layim_msg_history', @level2type=N'COLUMN',@level2name=N'chattype'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'添加时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'layim_msg_history', @level2type=N'COLUMN',@level2name=N'addtime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0 普通消息  1 系统消息 2 其他类型，待定' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'layim_msg_history', @level2type=N'COLUMN',@level2name=N'msgtype'
GO
/****** Object:  Table [dbo].[layim_group_detail]    Script Date: 02/08/2017 11:32:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[layim_group_detail](
	[id] [int] IDENTITY(10000,1) NOT NULL,
	[gid] [int] NOT NULL,
	[uid] [int] NOT NULL,
	[urole] [tinyint] NOT NULL,
	[upower] [tinyint] NOT NULL,
	[remarkname] [varchar](50) NULL,
	[addtime] [datetime] NOT NULL,
 CONSTRAINT [PK_layim_group_detail] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'群id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'layim_group_detail', @level2type=N'COLUMN',@level2name=N'gid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'layim_group_detail', @level2type=N'COLUMN',@level2name=N'uid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0群成员 1 群主 2 群管理员 3游客（游客不能发言）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'layim_group_detail', @level2type=N'COLUMN',@level2name=N'urole'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0正常  1 禁言 2 剔除' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'layim_group_detail', @level2type=N'COLUMN',@level2name=N'upower'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'群昵称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'layim_group_detail', @level2type=N'COLUMN',@level2name=N'remarkname'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'加入时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'layim_group_detail', @level2type=N'COLUMN',@level2name=N'addtime'
GO
/****** Object:  Table [dbo].[layim_group]    Script Date: 02/08/2017 11:32:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[layim_group](
	[id] [int] IDENTITY(10000,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[headphoto] [varchar](200) NOT NULL,
	[groupdesc] [varchar](500) NULL,
	[addtime] [datetime] NOT NULL,
	[groupowner] [int] NOT NULL,
	[status] [int] NOT NULL,
	[issystem] [bit] NOT NULL,
	[pcount] [int] NOT NULL,
	[im] [int] NOT NULL,
 CONSTRAINT [PK_layim_group] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'群组名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'layim_group', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'群头像' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'layim_group', @level2type=N'COLUMN',@level2name=N'headphoto'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'群描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'layim_group', @level2type=N'COLUMN',@level2name=N'groupdesc'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'layim_group', @level2type=N'COLUMN',@level2name=N'addtime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'群主' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'layim_group', @level2type=N'COLUMN',@level2name=N'groupowner'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'群状态，0正常 1已经解散' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'layim_group', @level2type=N'COLUMN',@level2name=N'status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否系统默认群' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'layim_group', @level2type=N'COLUMN',@level2name=N'issystem'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最大人数限制' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'layim_group', @level2type=N'COLUMN',@level2name=N'pcount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'IM号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'layim_group', @level2type=N'COLUMN',@level2name=N'im'
GO
/****** Object:  Table [dbo].[layim_friend_group_detail]    Script Date: 02/08/2017 11:32:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[layim_friend_group_detail](
	[id] [int] IDENTITY(10000,1) NOT NULL,
	[gid] [int] NOT NULL,
	[uid] [int] NOT NULL,
	[addtime] [datetime] NOT NULL,
	[gname] [varchar](50) NULL,
 CONSTRAINT [PK_layim_friend_group_detail] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'组id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'layim_friend_group_detail', @level2type=N'COLUMN',@level2name=N'gid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'layim_friend_group_detail', @level2type=N'COLUMN',@level2name=N'uid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'添加时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'layim_friend_group_detail', @level2type=N'COLUMN',@level2name=N'addtime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户自定义的备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'layim_friend_group_detail', @level2type=N'COLUMN',@level2name=N'gname'
GO
/****** Object:  Table [dbo].[layim_friend_group]    Script Date: 02/08/2017 11:32:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[layim_friend_group](
	[id] [int] IDENTITY(10000,1) NOT NULL,
	[name] [varchar](20) NOT NULL,
	[belonguid] [int] NOT NULL,
	[addtime] [datetime] NOT NULL,
	[sort] [tinyint] NOT NULL,
	[issystem] [bit] NOT NULL,
 CONSTRAINT [PK_layim_friend_group] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'好友组名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'layim_friend_group', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分组归属' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'layim_friend_group', @level2type=N'COLUMN',@level2name=N'belonguid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'组创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'layim_friend_group', @level2type=N'COLUMN',@level2name=N'addtime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'layim_friend_group', @level2type=N'COLUMN',@level2name=N'sort'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否系统默认' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'layim_friend_group', @level2type=N'COLUMN',@level2name=N'issystem'
GO
/****** Object:  Table [dbo].[layim_apply_result]    Script Date: 02/08/2017 11:32:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[layim_apply_result](
	[id] [int] IDENTITY(10000,1) NOT NULL,
	[applyid] [int] NOT NULL,
	[operateid] [int] NOT NULL,
	[operatetime] [datetime] NOT NULL,
	[isread] [bit] NOT NULL,
	[reason] [varchar](50) NULL,
 CONSTRAINT [PK_layim_apply_result] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N' 申请表主键id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'layim_apply_result', @level2type=N'COLUMN',@level2name=N'applyid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作人id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'layim_apply_result', @level2type=N'COLUMN',@level2name=N'operateid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'layim_apply_result', @level2type=N'COLUMN',@level2name=N'operatetime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否已读' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'layim_apply_result', @level2type=N'COLUMN',@level2name=N'isread'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作结果理由' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'layim_apply_result', @level2type=N'COLUMN',@level2name=N'reason'
GO
/****** Object:  Table [dbo].[layim_apply]    Script Date: 02/08/2017 11:32:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[layim_apply](
	[id] [int] IDENTITY(10000,1) NOT NULL,
	[userid] [int] NOT NULL,
	[applytype] [tinyint] NOT NULL,
	[targetid] [int] NOT NULL,
	[applytime] [datetime] NOT NULL,
	[other] [varchar](30) NULL,
	[result] [tinyint] NOT NULL,
 CONSTRAINT [PK_layim_apply] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'layim_apply', @level2type=N'COLUMN',@level2name=N'userid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'申请类型 0 好友 1群' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'layim_apply', @level2type=N'COLUMN',@level2name=N'applytype'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'被申请人id或者群id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'layim_apply', @level2type=N'COLUMN',@level2name=N'targetid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'申请时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'layim_apply', @level2type=N'COLUMN',@level2name=N'applytime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'申请备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'layim_apply', @level2type=N'COLUMN',@level2name=N'other'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'审批结果：0未审批 1 同意 2 拒绝' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'layim_apply', @level2type=N'COLUMN',@level2name=N'result'
GO
/****** Object:  Table [dbo].[salary]    Script Date: 02/08/2017 11:32:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[salary](
	[year] [int] NULL,
	[salary] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[v_layim_random]    Script Date: 02/08/2017 11:32:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_layim_random]
AS 
select CAST(FLOOR(RAND() * 1000000) AS int) AS im
GO
/****** Object:  View [dbo].[v_layim_friend_group_detail_info]    Script Date: 02/08/2017 11:32:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_layim_friend_group_detail_info]
AS 

SELECT A.id AS groupid,a.name AS groupname,a.addtime,u1.id AS userid,u1.nickname AS username,u1.headphoto AS useravatar,u1.sign AS userremark, 
u2.id AS friendid,u2.nickname AS friendname,u2.headphoto AS friendavatar,u2.sign AS friendremark
FROM dbo.layim_friend_group A inner JOIN dbo.layim_friend_group_detail B
ON A.id=b.gid LEFT JOIN dbo.layim_user U1 ON a.belonguid=U1.id
LEFT JOIN dbo.layim_user U2 ON b.[uid]=u2.id
GO
/****** Object:  View [dbo].[v_layim_friend_group_detail]    Script Date: 02/08/2017 11:32:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_layim_friend_group_detail]
as
SELECT gid,[uid],gname,B.nickname,B.[sign],B.headphoto,A.addtime FROM dbo.layim_friend_group_detail A LEFT JOIN dbo.layim_user B ON A.[uid]=b.id
GO
/****** Object:  View [dbo].[v_layim_friend_group]    Script Date: 02/08/2017 11:32:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_layim_friend_group]
AS 
SELECT A.id,a.name,a.addtime,a.sort,b.id AS userid,b.nickname,b.[sign],b.headphoto,b.addtime AS uaddtime FROM dbo.layim_friend_group A LEFT JOIN dbo.layim_user B ON A.belonguid=b.id
GO
/****** Object:  View [dbo].[v_layim_apply]    Script Date: 02/08/2017 11:32:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_layim_apply]
as
SELECT A.id AS applyid,userid,U.im AS applyim,u.nickname AS applyname,u.headphoto AS applyavatar,applytype,targetid,u1.nickname AS targetname,u1.im AS targetim,applytime,other,A.result FROM dbo.layim_apply  A 
LEFT JOIN dbo.layim_user U ON A.userid=U.id
LEFT JOIN dbo.layim_user U1 ON A.targetid=U1.id WHERE A.applytype=0

UNION ALL

SELECT A.id AS applyid,userid,U.im AS applyim,u.nickname AS applyname,u.headphoto AS applyavatar,applytype,targetid,u1.name AS targetname,u1.im AS targetim,applytime,other,A.result FROM dbo.layim_apply  A 
LEFT JOIN dbo.layim_user U ON A.userid=U.id
LEFT JOIN dbo.layim_group U1 ON A.targetid=U1.id where A.applytype=1
GO
/****** Object:  View [dbo].[v_group_detail]    Script Date: 02/08/2017 11:32:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_group_detail]
as

SELECT A.gid,a.uid AS userid,A.urole,A.upower,A.remarkname,b.nickname,b.[sign],b.headphoto,b.addtime FROM dbo.layim_group_detail A LEFT JOIN dbo.layim_user B
 ON A.[uid]=b.id
GO
/****** Object:  View [dbo].[v_group]    Script Date: 02/08/2017 11:32:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_group]
AS 
SELECT a.id AS groupid, b.id AS userid,b.nickname AS username,b.[sign],b.headphoto AS avatar FROM dbo.layim_group A LEFT JOIN dbo.layim_user B 
ON A.groupowner=b.id
GO
/****** Object:  StoredProcedure [dbo].[Proc_LayIM_AddApply]    Script Date: 02/08/2017 11:32:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Proc_LayIM_AddApply]
    @applyuid INT ,
    @applytype INT ,
    @targetid INT ,
    @other VARCHAR(50)
AS
    BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
        SET NOCOUNT ON;
		 DECLARE @fcount INT;
        IF ( @applytype = 0 )
            BEGIN
               
	--我的组
		
                SELECT  @fcount = COUNT(1)
                FROM    dbo.layim_friend_group_detail
                WHERE   [uid] = @targetid
                        AND gid IN ( SELECT id
                                     FROM   dbo.layim_friend_group
                                     WHERE  belonguid = @applyuid );
              
            END;
        
          IF ( @fcount > 0 )
            BEGIN
                SELECT  -1;
            END;
          ELSE
            BEGIN

                INSERT  INTO dbo.layim_apply
                        ( userid ,
                          applytype ,
                          targetid ,
                          applytime ,
                          other ,
                          result
                        )
                VALUES  ( @applyuid , -- userid - int
                          @applytype , -- applytype - tinyint
                          @targetid , -- targetid - int
                          GETDATE() , -- applytime - datetime
                          @other , -- other - varchar(30)
                          0  -- result - tinyint
                        );
                IF(@applytype=0)
                BEGIN
                SELECT @targetid
                END
                ELSE
                BEGIN
                --得到有权限的人的id
					SELECT [uid] FROM dbo.layim_group_detail WHERE gid=@targetid AND urole BETWEEN 1 AND 2
                END
                
            END;
        
    END;
GO
/****** Object:  StoredProcedure [dbo].[Proc_LayIM_UserUpdateSkin]    Script Date: 02/08/2017 11:32:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		fyp
-- Create date: 2016-9-6
-- Description:	用户添加新皮肤
-- =============================================
CREATE PROCEDURE [dbo].[Proc_LayIM_UserUpdateSkin]
	@userid int,
	@path varchar(200)
AS
BEGIN
	
	SET NOCOUNT ON;

   UPDATE dbo.layim_user_skin SET isuse=0 WHERE userid=@userid
   INSERT INTO dbo.layim_user_skin (userid,path,isuse)
   VALUES  (@userid  -- userid - int
            ,@path  -- path - varchar(200)
            ,1 -- isuse - bit
            )
END
GO
/****** Object:  StoredProcedure [dbo].[Proc_LayIM_GetUserIfHasMessage]    Script Date: 02/08/2017 11:32:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- exec [Proc_LayIM_GetUserIfHasMessage] 10002
CREATE PROCEDURE [dbo].[Proc_LayIM_GetUserIfHasMessage] 
	@userid INT
AS
BEGIN

	SET NOCOUNT ON;

	DECLARE @count1 INT,@count2 INT,@count3 INT,@count4 INT

   SELECT @count1=COUNT(*) FROM dbo.layim_apply WHERE targetid=@userid AND applytype=0 AND result=0
   SELECT @count2=COUNT(*) FROM dbo.layim_apply A 
   LEFT JOIN dbo.layim_apply_result B ON A.id=b.applyid
    WHERE A.userid=@userid AND applytype=0 AND result BETWEEN 1 AND 2 AND b.isread=0

	SELECT @count3=COUNT(*) FROM dbo.layim_apply A LEFT JOIN dbo.layim_group_detail B ON  A.targetid=B.gid WHERE b.[uid]=@userid AND b.urole BETWEEN 1 AND 2 and  applytype=1 AND result=0

	--SELECT @count4=COUNT(*) FROM dbo.layim_apply A LEFT JOIN dbo.layim_group_detail B ON  A.targetid=B.gid LEFT JOIN  dbo.layim_apply_result C ON A.id=c.applyid WHERE b.[uid]=@userid AND b.urole BETWEEN 1 AND 2 and  applytype=1 AND result BETWEEN 1 AND 2 AND c.isread=0
	PRINT @count1
	PRINT @count2
	PRINT @count3
	PRINT @count4
	SELECT @count1+@count2+@count3 AS msgcount
END
GO
/****** Object:  UserDefinedFunction [dbo].[Fun_LayIM_GetIMNumber]    Script Date: 02/08/2017 11:32:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[Fun_LayIM_GetIMNumber] ( )
RETURNS INT
AS
    BEGIN
	-- Declare the return variable here
        DECLARE @im INT;
     SELECT  TOP 1 @im=im FROM v_layim_random
        IF ( @im < 100000 )
            BEGIN
                SET @im += 100000;
            END;

        RETURN @im;

    END;
GO
/****** Object:  UserDefinedFunction [dbo].[Func_LayIM_GetGroupDetail]    Script Date: 02/08/2017 11:32:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
Create FUNCTION [dbo].[Func_LayIM_GetGroupDetail] ( @gid INT )
RETURNS @t TABLE
    (
      id INT ,
      groupname VARCHAR(20) ,
      avatar VARCHAR(100) ,
      groupdesc VARCHAR(200) ,
      addtime DATETIME ,
      limitcount INT ,
      im INT ,
      allcount INT
    )
AS
    BEGIN 
	
        INSERT  INTO @t
                ( id ,
                  groupname ,
                  avatar ,
                  groupdesc ,
                  addtime ,
                  limitcount ,
                  im ,
                  allcount
	            )
                SELECT  A.id ,
                        A.name AS groupname ,
                        A.headphoto ,
                        A.groupdesc ,
                        A.addtime ,
                        A.pcount ,
                        A.im ,
                        ( SELECT    COUNT(1)
                          FROM      dbo.layim_group_detail
                          WHERE     gid = A.id
                        ) AS allcount
                FROM    dbo.layim_group A WHERE A.id=@gid

        RETURN; 
    END;
GO
/****** Object:  UserDefinedFunction [dbo].[Func_GetIM]    Script Date: 02/08/2017 11:32:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[Func_GetIM] ( )
RETURNS INT
AS
    BEGIN
        DECLARE @ranIM INT;
        DECLARE @exist BIT;
        SET @exist = 1;
        WHILE ( @exist = 1 )
            BEGIN
			--先生成一个随机IM 号码
                SET @ranIM = [dbo].[Fun_LayIM_GetIMNumber]();
				--如果数据库已经存在该号码了，就继续循环，否则，跳出循环，返回新的IM号码
                IF EXISTS ( SELECT  im
                            FROM    dbo.layim_user
                            WHERE   im = @ranIM )
                    BEGIN
                        SET @exist = 1;
                    END;
                ELSE
                    BEGIN
                        SET @exist = 0;
                    END;
            END;
    
        RETURN @ranIM;

    END;
GO
/****** Object:  UserDefinedFunction [dbo].[Func_GetGroupIM]    Script Date: 02/08/2017 11:32:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
CREATE FUNCTION [dbo].[Func_GetGroupIM] ( )
RETURNS INT
AS
    BEGIN
        DECLARE @ranIM INT;
        DECLARE @exist BIT;
        SET @exist = 1;
        WHILE ( @exist = 1 )
            BEGIN
			--先生成一个随机IM 号码
                SET @ranIM = [dbo].[Fun_LayIM_GetIMNumber]();
				--如果数据库已经存在该号码了，就继续循环，否则，跳出循环，返回新的IM号码
                IF EXISTS ( SELECT  im
                            FROM    dbo.layim_group
                            WHERE   im = @ranIM )
                    BEGIN
                        SET @exist = 1;
                    END;
                ELSE
                    BEGIN
                        SET @exist = 0;
                    END;
            END;
    
        RETURN @ranIM;

    END;
GO
/****** Object:  StoredProcedure [dbo].[Proc_LayIM_HandleApply]    Script Date: 02/08/2017 11:32:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	同意好友或者加群操作，拒绝，忽略
-- exec [Proc_LayIM_HandleApply] 10006,10001,1,''
-- =============================================
CREATE PROCEDURE [dbo].[Proc_LayIM_HandleApply]
    @applyid INT
   ,@userid INT--申请人id
   ,@result TINYINT
   ,@reason VARCHAR(20)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
    SET NOCOUNT ON;
    DECLARE @applytype TINYINT;
    DECLARE @applyuid INT;
    DECLARE @targetid INT;
    SELECT  @applytype=applytype,@applyuid=userid,@targetid=targetid
    FROM    dbo.layim_apply
    WHERE   id=@applyid;
	--先更新主表
    UPDATE  dbo.layim_apply
    SET     result=@result
    WHERE   id=@applyid;
	--插入附表
    INSERT  INTO dbo.layim_apply_result (applyid,operateid,operatetime,isread,reason)
    VALUES  (@applyid, -- applyid - int
             @userid, -- operateid - int
             GETDATE(), -- operatetime - datetime
             0, -- isread - bit
             @reason  -- reason - varchar(50)
             );
	--看结果 如果同意了就加好友或者加群
    IF (@result=1)
    BEGIN
        IF @applytype=0
        BEGIN
		--加好友
		--先获取用户组id --operateid =userid
            DECLARE @gid1 INT;
            DECLARE @gid2 INT;
            SELECT  @gid1=id
            FROM    dbo.layim_friend_group
            WHERE   belonguid=@userid AND issystem=1 AND sort=0;
            SELECT  @gid2=id
            FROM    dbo.layim_friend_group
            WHERE   belonguid=@applyuid AND issystem=1 AND sort=0;
			--互相加好友
            IF NOT EXISTS ( SELECT  *
                            FROM    v_layim_friend_group_detail_info
                            WHERE   groupid=@gid1 AND friendid=@applyuid )
            BEGIN
                INSERT  INTO dbo.layim_friend_group_detail (gid,[uid],addtime,gname)
                VALUES  (@gid1, -- gid - int
                         @applyuid, -- uid - int
                         GETDATE(), -- addtime - datetime
                         ''  -- gname - varchar(50)
                         );
            END;
            IF NOT EXISTS ( SELECT  *
                            FROM    v_layim_friend_group_detail_info
                            WHERE   groupid=@gid2 AND friendid=@targetid )
            BEGIN
                INSERT  INTO dbo.layim_friend_group_detail (gid,[uid],addtime,gname)
                VALUES  (@gid2, -- gid - int
                         @userid, -- uid - int
                         GETDATE(), -- addtime - datetime
                         ''  -- gname - varchar(50)
                         );
            END;
        END;
        ELSE
        BEGIN
		--加群
		IF NOT EXISTS (SELECT [uid] FROM dbo.layim_group_detail WHERE [uid]=@applyuid AND gid=@targetid)
		begin
            INSERT  INTO dbo.layim_group_detail (gid,uid,urole,upower,remarkname,addtime)
            VALUES  (@targetid, -- gid - int
                     @applyuid, -- uid - int
                     0, -- urole - tinyint
                     0, -- upower - tinyint
                     '', -- remarkname - varchar(50)
                     GETDATE()  -- addtime - datetime
                     );
                     END
        END;
        
    END;

    SELECT  id,applytype,targetid,userid,@result AS result
    FROM    dbo.layim_apply
    WHERE   id=@applyid;
    
    IF (@result=1)
    BEGIN
    --如果同意了，需要回传给用户的好友信息或者群信息
        IF (@applytype=0)
        BEGIN
    --好友信息
    --申请人的好友
            SELECT  groupid,friendid,friendname,friendavatar,friendremark
            FROM    v_layim_friend_group_detail_info
            WHERE   userid=@applyuid AND friendid=@targetid;
            --被申请人的好友
            SELECT  groupid,friendid,friendname,friendavatar,friendremark
            FROM    v_layim_friend_group_detail_info
            WHERE   userid=@targetid AND friendid=@applyuid;
        END;
        ELSE
        BEGIN
    --群信息
            SELECT  id AS groupid,name AS groupname,headphoto AS avatar,(SELECT COUNT(1)
                                                                         FROM   dbo.layim_group_detail
                                                                         WHERE  gid=dbo.layim_group.id
                                                                        ) AS members,(SELECT dbo.layim_user.nickname FROM dbo.layim_user WHERE id=@applyuid) AS applyusername
            FROM    dbo.layim_group

			
            WHERE   id=@targetid;
        END;
    END;
END;
GO
/****** Object:  StoredProcedure [dbo].[Proc_LayIM_GetUserInitInfo_RC]    Script Date: 02/08/2017 11:32:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		小小小丶盘子
-- Create date: 2016-8-4
-- Description:	获取用户的聊天室初始化信息
-- EXEC Proc_LayIM_GetUserInitInfo_RC 10000
-- =============================================
CREATE PROCEDURE [dbo].[Proc_LayIM_GetUserInitInfo_RC]
	@userid INT --参数用户id
AS
BEGIN

	SET NOCOUNT ON;
	--mine
	SELECT id,nickname AS username,[sign],headphoto AS avatar FROM dbo.layim_user WHERE id=@userid
	--friend
	--friend-1
	SELECT id,name AS groupname FROM dbo.v_layim_friend_group WHERE userid=@userid ORDER BY sort asc
	--friend-2
	SELECT gid AS groupid,[uid] AS id,gname AS remarkname,nickname AS username,[sign],headphoto AS avatar FROM dbo.v_layim_friend_group_detail ORDER BY nickname ASC
	--group
	SELECT id,name AS groupname,B.headphoto AS avatar,groupdesc FROM dbo.v_group_detail A LEFT JOIN dbo.layim_group B ON A.gid=b.id WHERE a.userid=@userid AND b.[status]=0
END
GO
/****** Object:  StoredProcedure [dbo].[Proc_LayIM_GetUserInitInfo]    Script Date: 02/08/2017 11:32:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		小小小丶盘子
-- Create date: 2016-8-4
-- Description:	获取用户的聊天室初始化信息
-- EXEC Proc_LayIM_GetUserInitInfo 10000
-- =============================================
CREATE PROCEDURE [dbo].[Proc_LayIM_GetUserInitInfo]
	@userid INT --参数用户id
AS
BEGIN

	SET NOCOUNT ON;
	--mine
	SELECT id,nickname,[sign],headphoto AS avatar FROM dbo.layim_user WHERE id=@userid
	--friend
	--friend-1
	SELECT id,name FROM dbo.v_layim_friend_group WHERE userid=@userid ORDER BY sort asc
	--friend-2
	SELECT gid,[uid],gname AS remarkname,nickname,[sign],headphoto AS avatar FROM dbo.v_layim_friend_group_detail ORDER BY nickname ASC
	--group
	SELECT id,name,B.headphoto AS avatar,groupdesc FROM dbo.v_group_detail A LEFT JOIN dbo.layim_group B ON A.gid=b.id WHERE a.userid=@userid AND b.[status]=0
	--groupdetail
	--SELECT A.* FROM dbo.v_group_detail A INNER JOIN dbo.layim_group B ON A.gid=b.id WHERE groupowner=@userid and [status]=0
	--skin
	SELECT [path] FROM dbo.layim_user_skin WHERE userid=@userid ORDER BY isuse DESC 
END
GO
/****** Object:  StoredProcedure [dbo].[Proc_LayIM_GetUserApplyRecord]    Script Date: 02/08/2017 11:32:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--exec Proc_LayIM_GetUserApplyRecord 10001

CREATE PROCEDURE [dbo].[Proc_LayIM_GetUserApplyRecord] @userid INT
AS
    BEGIN

	--先更新为read 
	UPDATE dbo.layim_apply_result SET isread=1 WHERE applyid IN (SELECT id FROM dbo.layim_apply WHERE userid=@userid AND result>0)
--申请加我为好友的
        SELECT  *
        FROM    ( SELECT    applyid ,
                            userid ,
                            applyname ,
							applytype,
                            applyavatar ,
                            applyim ,
                            '请求加你为好友，附加消息:' + other AS msg ,
                            targetid ,
                            applytime AS addtime,result 
                  FROM      v_layim_apply
                  WHERE     targetid = @userid
                            AND applytype = 0
                           
                  UNION ALL
--申请进群的
                  SELECT    applyid ,
                            userid ,
                            applyname ,
								applytype,
                            applyavatar ,
                            applyim ,
                            '请求加入群(' + targetname + ')，附加消息:' + other AS msg ,
                            targetid ,
                            applytime AS addtime,result
                  FROM      dbo.v_layim_apply
                  WHERE     targetid IN ( SELECT    gid
                                          FROM      dbo.layim_group_detail
                                          WHERE     [uid] = @userid
                                                    AND urole BETWEEN 1 AND 2 )
                            AND applytype = 1
                            
                  UNION ALL
--我的加好友信息已经审批的
                  SELECT    A.applyid ,
                            A.userid ,
                            C.nickname  AS applyname,A.applytype,
                            applyavatar ,
                            applyim ,
                            '已经' + CASE result
                                     WHEN 1 THEN '通过'
                                     WHEN 2 THEN '拒绝'
                                   END + '了你的好友请求' + CASE A.result
                                                       WHEN 2
                                                       THEN ',原因:' + B.reason
                                                       ELSE ''
                                                     END AS msg ,
                            A.targetid ,
                            B.operatetime AS addtime,A.result
                  FROM      dbo.v_layim_apply A
                            LEFT JOIN dbo.layim_apply_result B ON A.applyid = B.applyid
                            LEFT JOIN dbo.layim_user C ON B.operateid = C.id
                  WHERE     result BETWEEN 1 AND 2
                            AND userid = @userid
                            AND A.applytype = 0
                  UNION ALL
--我的加群信息
                  SELECT DISTINCT   A.applyid ,
                            A.userid ,
                            C.nickname AS applyname,A.applytype,
							applyavatar,
                            A.applyim ,
                            CASE result
                              WHEN 1 THEN '通过'
                              WHEN 2 THEN '拒绝'
                            END + '了你的加群请求' + CASE A.result
                                                WHEN 2 THEN ',原因:' + B.reason
                                                ELSE ''
                                              END AS msg ,
                            A.targetid ,
                            B.operatetime AS addtime,A.result
                  FROM      dbo.v_layim_apply A
                            LEFT JOIN dbo.layim_apply_result B ON A.applyid = B.applyid
                            LEFT JOIN dbo.layim_user C ON B.operateid = C.id
                            LEFT JOIN dbo.layim_group_detail D ON A.targetid = D.gid
                  WHERE     result BETWEEN 1 AND 2
                            AND userid = @userid
                            AND A.applytype = 1
                ) A
        ORDER BY A.addtime DESC;

    END;
GO
/****** Object:  StoredProcedure [dbo].[Proc_LayIM_GetGroupMembers]    Script Date: 02/08/2017 11:32:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		小小小丶盘子
-- Create date: 2016-8-4
-- Description:	获取用户的聊天室群用户信息
-- EXEC [Proc_LayIM_GetGroupMembers] 10000
-- =============================================
CREATE PROCEDURE [dbo].[Proc_LayIM_GetGroupMembers]
	@groupid INT --参数用户id
AS
BEGIN

	SET NOCOUNT ON;
	SELECT userid,username,[sign],avatar FROM dbo.v_group WHERE groupid=@groupid
	SELECT userid,nickname AS username,[sign],headphoto AS avatar,addtime,remarkname FROM dbo.v_group_detail WHERE gid=@groupid
END
GO
/****** Object:  StoredProcedure [dbo].[Proc_LayIM_UserLoginOrRegister]    Script Date: 02/08/2017 11:32:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		fyp
-- Create date: 8-6
-- Description:	用户登录如果没有该用户名，那么直接注册@

--exec Proc_LayIM_UserLoginOrRegister 'xiaopanzi','77','小盘子'
-- =============================================
CREATE PROCEDURE [dbo].[Proc_LayIM_UserLoginOrRegister] 
	@loginname VARCHAR(20),
	@loginpwd VARCHAR(64),
	@nickname VARCHAR(50)
AS
BEGIN
	
	SET NOCOUNT ON;
	--如果用户名已经存在
		DECLARE @userid INT
	IF EXISTS (SELECT loginname FROM dbo.layim_user WHERE loginname=@loginname)
	BEGIN
	
		
		SELECT @userid= id FROM dbo.layim_user WHERE loginname=@loginname AND loginpwd=@loginpwd
		SELECT  ISNULL(@userid,0)
    END
	ELSE
    BEGIN
		--自动注册
		INSERT INTO dbo.layim_user
		        ( loginname ,
		          loginpwd ,
		          nickname ,
		          [sign] ,
		          headphoto ,
		          addtime,im
		        )
		VALUES  ( @loginname , -- loginname - varchar(20)
		          @loginpwd , -- loginpwd - varchar(64)
		          @nickname , -- nickname - varchar(50)
		          '' , -- sign - varchar(200)
		          '/headphotos/default.jpg' , -- headphoto - varchar(200)
		          GETDATE(),dbo.Func_GetIM()  -- addtime - datetime
		        )
	    SELECT @userid= @@IDENTITY
		--初始化分组信息
		INSERT INTO dbo.layim_friend_group
		        ( name, belonguid, addtime, sort,issystem )
		VALUES  ( '我的好友', -- name - varchar(20)
		          @userid, -- belonguid - int
		          GETDATE(), -- addtime - datetime
		          0,1  -- sort - tinyint
		          )
				  INSERT INTO dbo.layim_friend_group
		        ( name, belonguid, addtime, sort,issystem )
		VALUES  ( '黑名单', -- name - varchar(20)
		          @userid, -- belonguid - int
		          GETDATE(), -- addtime - datetime
		          1,1  -- sort - tinyint
		          )
		SELECT @userid

		----新注册用户全部加系统群
		IF NOT EXISTS(SELECT id FROM dbo.layim_group WHERE issystem=1)
		BEGIN
			INSERT INTO dbo.layim_group (name,headphoto,groupdesc,addtime,groupowner,status,issystem,pcount,im)
			VALUES  ('LayIM.NET交流群'  -- name - varchar(50)
			         ,'/headphotos/group.jpg'  -- headphoto - varchar(200)
			         ,'LayIM.NET交流'  -- groupdesc - varchar(500)
			         ,GETDATE()  -- addtime - datetime
			         ,0  -- groupowner - int
			         ,0  -- status - int
			         ,1  -- issystem - bit
			         ,20  -- pcount - int
			         ,111111  -- im - int
			         )
		end
		  INSERT INTO dbo.layim_group_detail
          ( gid, uid, urole, upower, remarkname )
  VALUES  ( (SELECT TOP 1 id FROM dbo.layim_group WHERE issystem=1), -- gid - int
            @userid, -- uid - int
            0, -- urole - tinyint
            0, -- upower - tinyint
            @nickname  -- remarkname - varchar(50)
            )
		--读取新注册用户信息添加到搜索表ElasticSearch中
		SELECT id,sign AS signstr,nickname,headphoto AS avatar,addtime,im FROM dbo.layim_user WHERE id=@userid

	END
    
END
GO
/****** Object:  StoredProcedure [dbo].[Proc_LayIM_CreateGroup]    Script Date: 02/08/2017 11:32:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
--exec [Proc_LayIM_CreateGroup] '中国社团联合会','社团家园',11007
-- =============================================
CREATE PROCEDURE [dbo].[Proc_LayIM_CreateGroup]
	@groupname VARCHAR(20),
	@groupdesc VARCHAR(100),
	@userid INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	BEGIN TRANSACTION
	INSERT INTO dbo.layim_group
	        ( name ,
	          headphoto ,
	          groupdesc ,
	          addtime ,
	          groupowner ,
	          [status] ,
	          issystem ,
	          pcount ,
	          im
	        )
	VALUES  ( @groupname , -- name - varchar(50)
	          '/headphotos/group.jpg' , -- headphoto - varchar(200)
	          @groupdesc , -- groupdesc - varchar(500)
	          GETDATE() , -- addtime - datetime
	          @userid , -- groupowner - int
	          0 , -- status - int
	          0 , -- issystem - bit
	          200 , -- pcount - int
	         dbo.Func_GetGroupIM()  -- im - int
	        )

			DECLARE @newgroupid INT
			SET @newgroupid=@@IDENTITY
			--插入到用户群表
			INSERT INTO dbo.layim_group_detail
			        ( gid, [uid], urole, upower, remarkname )
			VALUES  ( @newgroupid, -- gid - int
			          @userid, -- uid - int
			          1, -- urole - tinyint
			          1, -- upower - tinyint
			          ''  -- remarkname - varchar(50)
			          )
	    SELECT * FROM  dbo.Func_LayIM_GetGroupDetail(@newgroupid)
		COMMIT      
END
GO
/****** Object:  Default [DF_layim_user_setting_addtime]    Script Date: 02/08/2017 11:32:21 ******/
ALTER TABLE [dbo].[layim_user_setting] ADD  CONSTRAINT [DF_layim_user_setting_addtime]  DEFAULT (getdate()) FOR [addtime]
GO
/****** Object:  Default [DF_layim_user_setting_updatetime]    Script Date: 02/08/2017 11:32:21 ******/
ALTER TABLE [dbo].[layim_user_setting] ADD  CONSTRAINT [DF_layim_user_setting_updatetime]  DEFAULT (getdate()) FOR [updatetime]
GO
/****** Object:  Default [DF_layim_user_autoreply_issys]    Script Date: 02/08/2017 11:32:21 ******/
ALTER TABLE [dbo].[layim_user_autoreply] ADD  CONSTRAINT [DF_layim_user_autoreply_issys]  DEFAULT ((0)) FOR [issys]
GO
/****** Object:  Default [DF_layim_user_autoreply_isuse]    Script Date: 02/08/2017 11:32:21 ******/
ALTER TABLE [dbo].[layim_user_autoreply] ADD  CONSTRAINT [DF_layim_user_autoreply_isuse]  DEFAULT ((1)) FOR [isuse]
GO
/****** Object:  Default [DF_layim_user_autoreply_addtime]    Script Date: 02/08/2017 11:32:21 ******/
ALTER TABLE [dbo].[layim_user_autoreply] ADD  CONSTRAINT [DF_layim_user_autoreply_addtime]  DEFAULT (getdate()) FOR [addtime]
GO
/****** Object:  Default [DF_layim_user_addtime]    Script Date: 02/08/2017 11:32:21 ******/
ALTER TABLE [dbo].[layim_user] ADD  CONSTRAINT [DF_layim_user_addtime]  DEFAULT (getdate()) FOR [addtime]
GO
/****** Object:  Default [DF_layim_user_im]    Script Date: 02/08/2017 11:32:21 ******/
ALTER TABLE [dbo].[layim_user] ADD  CONSTRAINT [DF_layim_user_im]  DEFAULT ((0)) FOR [im]
GO
/****** Object:  Default [DF_layim_sys_user_log_addtime]    Script Date: 02/08/2017 11:32:21 ******/
ALTER TABLE [dbo].[layim_sys_user_log] ADD  CONSTRAINT [DF_layim_sys_user_log_addtime]  DEFAULT (getdate()) FOR [addtime]
GO
/****** Object:  Default [DF_layim_sys_backimgs_addtime]    Script Date: 02/08/2017 11:32:21 ******/
ALTER TABLE [dbo].[layim_sys_backimgs] ADD  CONSTRAINT [DF_layim_sys_backimgs_addtime]  DEFAULT (getdate()) FOR [addtime]
GO
/****** Object:  Default [DF_layim_sys_backimgs_isuse]    Script Date: 02/08/2017 11:32:21 ******/
ALTER TABLE [dbo].[layim_sys_backimgs] ADD  CONSTRAINT [DF_layim_sys_backimgs_isuse]  DEFAULT ((1)) FOR [isuse]
GO
/****** Object:  Default [DF_layim_msg_unread_udatetime]    Script Date: 02/08/2017 11:32:21 ******/
ALTER TABLE [dbo].[layim_msg_unread] ADD  CONSTRAINT [DF_layim_msg_unread_udatetime]  DEFAULT (getdate()) FOR [udatetime]
GO
/****** Object:  Default [DF_layim_msg_history_id]    Script Date: 02/08/2017 11:32:21 ******/
ALTER TABLE [dbo].[layim_msg_history] ADD  CONSTRAINT [DF_layim_msg_history_id]  DEFAULT (newid()) FOR [id]
GO
/****** Object:  Default [DF_layim_msg_history_addtime]    Script Date: 02/08/2017 11:32:21 ******/
ALTER TABLE [dbo].[layim_msg_history] ADD  CONSTRAINT [DF_layim_msg_history_addtime]  DEFAULT ((0)) FOR [addtime]
GO
/****** Object:  Default [DF_layim_msg_history_msgtype]    Script Date: 02/08/2017 11:32:21 ******/
ALTER TABLE [dbo].[layim_msg_history] ADD  CONSTRAINT [DF_layim_msg_history_msgtype]  DEFAULT ((0)) FOR [msgtype]
GO
/****** Object:  Default [DF_layim_group_detail_status]    Script Date: 02/08/2017 11:32:21 ******/
ALTER TABLE [dbo].[layim_group_detail] ADD  CONSTRAINT [DF_layim_group_detail_status]  DEFAULT ((0)) FOR [urole]
GO
/****** Object:  Default [DF_layim_group_detail_power]    Script Date: 02/08/2017 11:32:21 ******/
ALTER TABLE [dbo].[layim_group_detail] ADD  CONSTRAINT [DF_layim_group_detail_power]  DEFAULT ((0)) FOR [upower]
GO
/****** Object:  Default [DF_layim_group_detail_addtime]    Script Date: 02/08/2017 11:32:21 ******/
ALTER TABLE [dbo].[layim_group_detail] ADD  CONSTRAINT [DF_layim_group_detail_addtime]  DEFAULT (getdate()) FOR [addtime]
GO
/****** Object:  Default [DF_layim_group_addtime]    Script Date: 02/08/2017 11:32:21 ******/
ALTER TABLE [dbo].[layim_group] ADD  CONSTRAINT [DF_layim_group_addtime]  DEFAULT (getdate()) FOR [addtime]
GO
/****** Object:  Default [DF_layim_group_status]    Script Date: 02/08/2017 11:32:21 ******/
ALTER TABLE [dbo].[layim_group] ADD  CONSTRAINT [DF_layim_group_status]  DEFAULT ((0)) FOR [status]
GO
/****** Object:  Default [DF_layim_group_issystem]    Script Date: 02/08/2017 11:32:21 ******/
ALTER TABLE [dbo].[layim_group] ADD  CONSTRAINT [DF_layim_group_issystem]  DEFAULT ((0)) FOR [issystem]
GO
/****** Object:  Default [DF_layim_group_pcount]    Script Date: 02/08/2017 11:32:21 ******/
ALTER TABLE [dbo].[layim_group] ADD  CONSTRAINT [DF_layim_group_pcount]  DEFAULT ((200)) FOR [pcount]
GO
/****** Object:  Default [DF_layim_group_im]    Script Date: 02/08/2017 11:32:21 ******/
ALTER TABLE [dbo].[layim_group] ADD  CONSTRAINT [DF_layim_group_im]  DEFAULT ((666666)) FOR [im]
GO
/****** Object:  Default [DF_layim_friend_group_detail_addtime]    Script Date: 02/08/2017 11:32:21 ******/
ALTER TABLE [dbo].[layim_friend_group_detail] ADD  CONSTRAINT [DF_layim_friend_group_detail_addtime]  DEFAULT (getdate()) FOR [addtime]
GO
/****** Object:  Default [DF_layim_friend_group_addtime]    Script Date: 02/08/2017 11:32:21 ******/
ALTER TABLE [dbo].[layim_friend_group] ADD  CONSTRAINT [DF_layim_friend_group_addtime]  DEFAULT (getdate()) FOR [addtime]
GO
/****** Object:  Default [DF_layim_friend_group_sort]    Script Date: 02/08/2017 11:32:21 ******/
ALTER TABLE [dbo].[layim_friend_group] ADD  CONSTRAINT [DF_layim_friend_group_sort]  DEFAULT ((0)) FOR [sort]
GO
/****** Object:  Default [DF_layim_friend_group_issystem]    Script Date: 02/08/2017 11:32:21 ******/
ALTER TABLE [dbo].[layim_friend_group] ADD  CONSTRAINT [DF_layim_friend_group_issystem]  DEFAULT ((0)) FOR [issystem]
GO
/****** Object:  Default [DF_layim_apply_result_operatetime]    Script Date: 02/08/2017 11:32:21 ******/
ALTER TABLE [dbo].[layim_apply_result] ADD  CONSTRAINT [DF_layim_apply_result_operatetime]  DEFAULT (getdate()) FOR [operatetime]
GO
/****** Object:  Default [DF_layim_apply_applytype]    Script Date: 02/08/2017 11:32:21 ******/
ALTER TABLE [dbo].[layim_apply] ADD  CONSTRAINT [DF_layim_apply_applytype]  DEFAULT ((0)) FOR [applytype]
GO
/****** Object:  Default [DF_layim_apply_applytime]    Script Date: 02/08/2017 11:32:21 ******/
ALTER TABLE [dbo].[layim_apply] ADD  CONSTRAINT [DF_layim_apply_applytime]  DEFAULT (getdate()) FOR [applytime]
GO
/****** Object:  Default [DF_layim_apply_result]    Script Date: 02/08/2017 11:32:21 ******/
ALTER TABLE [dbo].[layim_apply] ADD  CONSTRAINT [DF_layim_apply_result]  DEFAULT ((0)) FOR [result]
GO
