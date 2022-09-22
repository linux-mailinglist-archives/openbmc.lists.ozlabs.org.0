Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F01075E75DD
	for <lists+openbmc@lfdr.de>; Fri, 23 Sep 2022 10:32:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MYll64PBvz3cXf
	for <lists+openbmc@lfdr.de>; Fri, 23 Sep 2022 18:32:34 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.255; helo=szxga08-in.huawei.com; envelope-from=liushixin2@huawei.com; receiver=<UNKNOWN>)
X-Greylist: delayed 1103 seconds by postgrey-1.36 at boromir; Fri, 23 Sep 2022 00:15:27 AEST
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MYHPC5QMsz30hw;
	Fri, 23 Sep 2022 00:15:27 +1000 (AEST)
Received: from dggpemm500024.china.huawei.com (unknown [172.30.72.53])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4MYGv23Dhwz14QgY;
	Thu, 22 Sep 2022 21:52:46 +0800 (CST)
Received: from dggpemm100009.china.huawei.com (7.185.36.113) by
 dggpemm500024.china.huawei.com (7.185.36.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 22 Sep 2022 21:56:54 +0800
Received: from huawei.com (10.175.113.32) by dggpemm100009.china.huawei.com
 (7.185.36.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Thu, 22 Sep
 2022 21:56:54 +0800
From: Liu Shixin <liushixin2@huawei.com>
To: Eddie James <eajames@linux.ibm.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery
	<andrew@aj.id.au>
Subject: [PATCH] media: aspeed: use DEFINE_SHOW_ATTRIBUTE to simplify code
Date: Thu, 22 Sep 2022 22:30:38 +0800
Message-ID: <20220922143038.3251456-1-liushixin2@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.113.32]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm100009.china.huawei.com (7.185.36.113)
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Fri, 23 Sep 2022 18:30:55 +1000
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
Cc: Liu
 Shixin <liushixin2@huawei.com>, openbmc@lists.ozlabs.org, linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Use DEFINE_SHOW_ATTRIBUTE helper macro to simplify the code.
No functional change.

Signed-off-by: Liu Shixin <liushixin2@huawei.com>
---
 drivers/media/platform/aspeed/aspeed-video.c | 16 ++--------------
 1 file changed, 2 insertions(+), 14 deletions(-)

diff --git a/drivers/media/platform/aspeed/aspeed-video.c b/drivers/media/platform/aspeed/aspeed-video.c
index 20f795ccc11b..26f067c77217 100644
--- a/drivers/media/platform/aspeed/aspeed-video.c
+++ b/drivers/media/platform/aspeed/aspeed-video.c
@@ -1753,19 +1753,7 @@ static int aspeed_video_debugfs_show(struct seq_file *s, void *data)
 
 	return 0;
 }
-
-static int aspeed_video_proc_open(struct inode *inode, struct file *file)
-{
-	return single_open(file, aspeed_video_debugfs_show, inode->i_private);
-}
-
-static const struct file_operations aspeed_video_debugfs_ops = {
-	.owner   = THIS_MODULE,
-	.open    = aspeed_video_proc_open,
-	.read    = seq_read,
-	.llseek  = seq_lseek,
-	.release = single_release,
-};
+DEFINE_SHOW_ATTRIBUTE(aspeed_video_debugfs);
 
 static struct dentry *debugfs_entry;
 
@@ -1779,7 +1767,7 @@ static int aspeed_video_debugfs_create(struct aspeed_video *video)
 {
 	debugfs_entry = debugfs_create_file(DEVICE_NAME, 0444, NULL,
 					    video,
-					    &aspeed_video_debugfs_ops);
+					    &aspeed_video_debugfs_fops);
 	if (!debugfs_entry)
 		aspeed_video_debugfs_remove(video);
 
-- 
2.25.1

