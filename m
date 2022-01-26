Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 91F8B49C0E4
	for <lists+openbmc@lfdr.de>; Wed, 26 Jan 2022 02:49:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jk68b3f4Lz3bXn
	for <lists+openbmc@lfdr.de>; Wed, 26 Jan 2022 12:49:19 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jk67w5fwQz30L9;
 Wed, 26 Jan 2022 12:48:44 +1100 (AEDT)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 20Q1eo9C090811;
 Wed, 26 Jan 2022 09:40:50 +0800 (GMT-8)
 (envelope-from jammy_huang@aspeedtech.com)
Received: from JammyHuang-PC.aspeed.com (192.168.2.115) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 26 Jan 2022 09:48:13 +0800
From: Jammy Huang <jammy_huang@aspeedtech.com>
To: <eajames@linux.ibm.com>, <mchehab@kernel.org>, <joel@jms.id.au>,
 <andrew@aj.id.au>, <linux-media@vger.kernel.org>,
 <openbmc@lists.ozlabs.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 1/2] media: aspeed: Add macro for the fields of the
 mode-detect registers
Date: Wed, 26 Jan 2022 09:47:24 +0800
Message-ID: <20220126014725.1511-2-jammy_huang@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220126014725.1511-1-jammy_huang@aspeedtech.com>
References: <20220126014725.1511-1-jammy_huang@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [192.168.2.115]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 20Q1eo9C090811
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

VE_MODE_DT_HOR_TOLER: the tolerance in detecting for stable horizontal
signal.
VE_MODE_DT_VER_TOLER: the tolerance in detecting for stable vertical
signal.
VE_MODE_DT_HOR_STABLE: the minimum required count in detecting stable
HSYNC signal to set mode detection horizontal signal stable.
VE_MODE_DT_VER_STABLE: the minimum required count in detecting stable
VSYNC signal to set mode detection vertical signal stable.

Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
---
 drivers/media/platform/aspeed-video.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
index 51fb18453b81..5d1ec3de50ad 100644
--- a/drivers/media/platform/aspeed-video.c
+++ b/drivers/media/platform/aspeed-video.c
@@ -178,6 +178,12 @@
 #define  VE_INTERRUPT_VSYNC_DESC	BIT(11)
 
 #define VE_MODE_DETECT			0x30c
+#define  VE_MODE_DT_HOR_TOLER		GENMASK(31, 28)
+#define  VE_MODE_DT_VER_TOLER		GENMASK(27, 24)
+#define  VE_MODE_DT_HOR_STABLE		GENMASK(23, 20)
+#define  VE_MODE_DT_VER_STABLE		GENMASK(19, 16)
+#define  VE_MODE_DT_EDG_THROD		GENMASK(15, 8)
+
 #define VE_MEM_RESTRICT_START		0x310
 #define VE_MEM_RESTRICT_END		0x314
 
@@ -1105,7 +1111,12 @@ static void aspeed_video_init_regs(struct aspeed_video *video)
 	aspeed_video_write(video, VE_SCALING_FILTER3, 0x00200000);
 
 	/* Set mode detection defaults */
-	aspeed_video_write(video, VE_MODE_DETECT, 0x22666500);
+	aspeed_video_write(video, VE_MODE_DETECT,
+			   FIELD_PREP(VE_MODE_DT_HOR_TOLER, 2) |
+			   FIELD_PREP(VE_MODE_DT_VER_TOLER, 2) |
+			   FIELD_PREP(VE_MODE_DT_HOR_STABLE, 6) |
+			   FIELD_PREP(VE_MODE_DT_VER_STABLE, 6) |
+			   FIELD_PREP(VE_MODE_DT_EDG_THROD, 0x65));
 }
 
 static void aspeed_video_start(struct aspeed_video *video)
-- 
2.25.1

