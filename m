Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B64B40AD92
	for <lists+openbmc@lfdr.de>; Tue, 14 Sep 2021 14:27:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H82fm2M77z2yn1
	for <lists+openbmc@lfdr.de>; Tue, 14 Sep 2021 22:27:28 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H7zBS67G2z2xXm;
 Tue, 14 Sep 2021 19:51:08 +1000 (AEST)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 18E9Uefk047557;
 Tue, 14 Sep 2021 17:30:40 +0800 (GMT-8)
 (envelope-from jammy_huang@aspeedtech.com)
Received: from JammyHuang-PC.aspeed.com (192.168.2.115) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 14 Sep 2021 17:50:30 +0800
From: Jammy Huang <jammy_huang@aspeedtech.com>
To: <eajames@linux.ibm.com>, <mchehab@kernel.org>, <joel@jms.id.au>,
 <andrew@aj.id.au>, <linux-media@vger.kernel.org>,
 <openbmc@lists.ozlabs.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH resend] media: aspeed: refine to avoid full jpeg update
Date: Tue, 14 Sep 2021 17:49:20 +0800
Message-ID: <20210914094919.3506-1-jammy_huang@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [192.168.2.115]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 18E9Uefk047557
X-Mailman-Approved-At: Tue, 14 Sep 2021 22:27:15 +1000
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
Cc: BMC-SW@aspeedtech.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The switch of jpeg 420/444 subsampling will update full jpeg header for
aspeed now.

Just update the 420/444 subsampling part of jpeg header is fine.

Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
---
 resend the patch becuase cc-list isn't complete.

 drivers/media/platform/aspeed-video.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
index 3c90f3f3cf14..8b3939b8052d 100644
--- a/drivers/media/platform/aspeed-video.c
+++ b/drivers/media/platform/aspeed-video.c
@@ -401,6 +401,21 @@ static void aspeed_video_init_jpeg_table(u32 *table, bool yuv420)
 	}
 }
 
+// just update jpeg dct table per 420/444
+static void aspeed_video_update_jpeg_table(u32 *table, bool yuv420)
+{
+	int i;
+	unsigned int base;
+
+	for (i = 0; i < ASPEED_VIDEO_JPEG_NUM_QUALITIES; i++) {
+		base = 256 * i;	/* AST HW requires this header spacing */
+		base += ASPEED_VIDEO_JPEG_HEADER_SIZE +
+			ASPEED_VIDEO_JPEG_DCT_SIZE;
+
+		table[base + 2] = (yuv420) ? 0x00220103 : 0x00110103;
+	}
+}
+
 static void aspeed_video_update(struct aspeed_video *video, u32 reg, u32 clear,
 				u32 bits)
 {
@@ -1274,7 +1289,7 @@ static void aspeed_video_update_jpeg_quality(struct aspeed_video *video)
 static void aspeed_video_update_subsampling(struct aspeed_video *video)
 {
 	if (video->jpeg.virt)
-		aspeed_video_init_jpeg_table(video->jpeg.virt, video->yuv420);
+		aspeed_video_update_jpeg_table(video->jpeg.virt, video->yuv420);
 
 	if (video->yuv420)
 		aspeed_video_update(video, VE_SEQ_CTRL, 0, VE_SEQ_CTRL_YUV420);
-- 
2.25.1

