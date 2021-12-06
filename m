Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 182CE468E48
	for <lists+openbmc@lfdr.de>; Mon,  6 Dec 2021 01:23:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J6kgM6gQkz2yYS
	for <lists+openbmc@lfdr.de>; Mon,  6 Dec 2021 11:23:43 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.71;
 helo=twspam01.aspeedtech.com; envelope-from=jammy_huang@aspeedtech.com;
 receiver=<UNKNOWN>)
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com
 [211.20.114.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J6kg44cG1z2x9D;
 Mon,  6 Dec 2021 11:23:27 +1100 (AEDT)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 1B5NvL4l019924;
 Mon, 6 Dec 2021 07:57:21 +0800 (GMT-8)
 (envelope-from jammy_huang@aspeedtech.com)
Received: from JammyHuang-PC.aspeed.com (192.168.2.115) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 6 Dec 2021 08:22:11 +0800
From: Jammy Huang <jammy_huang@aspeedtech.com>
To: <hverkuil-cisco@xs4all.nl>, <sakari.ailus@linux.intel.com>,
 <gregkh@linuxfoundation.org>, <laurent.pinchart@ideasonboard.com>,
 <eajames@linux.ibm.com>, <mchehab@kernel.org>, <joel@jms.id.au>,
 <andrew@aj.id.au>, <linux-media@vger.kernel.org>,
 <openbmc@lists.ozlabs.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] media: aspeed: move err-handling together to the bottom
Date: Mon, 6 Dec 2021 08:22:09 +0800
Message-ID: <20211206002209.412-1-jammy_huang@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [192.168.2.115]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 1B5NvL4l019924
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

refine aspeed_video_setup_video() flow.

Change-Id: Icc7bcec800d5a9d478ead1b283fdb3aa15a86b80
Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
---
 drivers/media/platform/aspeed-video.c | 24 +++++++++++-------------
 1 file changed, 11 insertions(+), 13 deletions(-)

diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
index fea5e4d0927e..f5c40d6b4ece 100644
--- a/drivers/media/platform/aspeed-video.c
+++ b/drivers/media/platform/aspeed-video.c
@@ -1641,11 +1641,8 @@ static int aspeed_video_setup_video(struct aspeed_video *video)
 
 	rc = video->ctrl_handler.error;
 	if (rc) {
-		v4l2_ctrl_handler_free(&video->ctrl_handler);
-		v4l2_device_unregister(v4l2_dev);
-
 		dev_err(video->dev, "Failed to init controls: %d\n", rc);
-		return rc;
+		goto err_ctrl_init;
 	}
 
 	v4l2_dev->ctrl_handler = &video->ctrl_handler;
@@ -1663,11 +1660,8 @@ static int aspeed_video_setup_video(struct aspeed_video *video)
 
 	rc = vb2_queue_init(vbq);
 	if (rc) {
-		v4l2_ctrl_handler_free(&video->ctrl_handler);
-		v4l2_device_unregister(v4l2_dev);
-
 		dev_err(video->dev, "Failed to init vb2 queue\n");
-		return rc;
+		goto err_vb2_init;
 	}
 
 	vdev->queue = vbq;
@@ -1685,15 +1679,19 @@ static int aspeed_video_setup_video(struct aspeed_video *video)
 	video_set_drvdata(vdev, video);
 	rc = video_register_device(vdev, VFL_TYPE_GRABBER, 0);
 	if (rc) {
-		vb2_queue_release(vbq);
-		v4l2_ctrl_handler_free(&video->ctrl_handler);
-		v4l2_device_unregister(v4l2_dev);
-
 		dev_err(video->dev, "Failed to register video device\n");
-		return rc;
+		goto err_video_reg;
 	}
 
 	return 0;
+
+err_video_reg:
+	vb2_queue_release(vbq);
+err_vb2_init:
+err_ctrl_init:
+	v4l2_ctrl_handler_free(&video->ctrl_handler);
+	v4l2_device_unregister(v4l2_dev);
+	return rc;
 }
 
 static int aspeed_video_init(struct aspeed_video *video)
-- 
2.25.1

