Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C4CE9473C36
	for <lists+openbmc@lfdr.de>; Tue, 14 Dec 2021 05:54:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JCmJY5BhDz30GD
	for <lists+openbmc@lfdr.de>; Tue, 14 Dec 2021 15:54:53 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JCmJG3XF1z2ywF;
 Tue, 14 Dec 2021 15:54:35 +1100 (AEDT)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 1BE4SSVb001929;
 Tue, 14 Dec 2021 12:28:28 +0800 (GMT-8)
 (envelope-from jammy_huang@aspeedtech.com)
Received: from JammyHuang-PC.aspeed.com (192.168.2.115) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 14 Dec 2021 12:53:47 +0800
From: Jammy Huang <jammy_huang@aspeedtech.com>
To: <eajames@linux.ibm.com>, <mchehab@kernel.org>, <joel@jms.id.au>,
 <andrew@aj.id.au>, <linux-media@vger.kernel.org>,
 <openbmc@lists.ozlabs.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] media: aspeed: Fix no complete irq for non-64-aligned width
Date: Tue, 14 Dec 2021 12:53:48 +0800
Message-ID: <20211214045348.13702-1-jammy_huang@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [192.168.2.115]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 1BE4SSVb001929
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

In ast2500, engine will stop occasionally for 1360x768.

This is a bug which has been addressed, but the workaround is specific
for 1680 only. Here we make it more complete.

Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
---
 drivers/media/platform/aspeed-video.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
index 793b2adaa0f5..4d3e6b105d44 100644
--- a/drivers/media/platform/aspeed-video.c
+++ b/drivers/media/platform/aspeed-video.c
@@ -1055,18 +1055,20 @@ static void aspeed_video_set_resolution(struct aspeed_video *video)
 	/* Set capture/compression frame sizes */
 	aspeed_video_calc_compressed_size(video, size);
 
-	if (video->active_timings.width == 1680) {
+	if (!IS_ALIGNED(act->width, 64)) {
 		/*
 		 * This is a workaround to fix a silicon bug on A1 and A2
 		 * revisions. Since it doesn't break capturing operation of
 		 * other revisions, use it for all revisions without checking
-		 * the revision ID. It picked 1728 which is a very next
-		 * 64-pixels aligned value to 1680 to minimize memory bandwidth
+		 * the revision ID. It picked new width which is a very next
+		 * 64-pixels aligned value to minimize memory bandwidth
 		 * and to get better access speed from video engine.
 		 */
+		u32 width = ALIGN(act->width, 64);
+
 		aspeed_video_write(video, VE_CAP_WINDOW,
-				   1728 << 16 | act->height);
-		size += (1728 - 1680) * video->active_timings.height;
+				   width << 16 | act->height);
+		size = width * act->height;
 	} else {
 		aspeed_video_write(video, VE_CAP_WINDOW,
 				   act->width << 16 | act->height);
-- 
2.25.1

