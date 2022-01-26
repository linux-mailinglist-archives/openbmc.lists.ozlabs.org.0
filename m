Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B01649C0E9
	for <lists+openbmc@lfdr.de>; Wed, 26 Jan 2022 02:49:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jk69643KBz3cN6
	for <lists+openbmc@lfdr.de>; Wed, 26 Jan 2022 12:49:46 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jk68C22VXz3bYw;
 Wed, 26 Jan 2022 12:48:58 +1100 (AEDT)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 20Q1eoOV090812;
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
Subject: [PATCH v5 2/2] media: aspeed: Fix unstable timing detection
Date: Wed, 26 Jan 2022 09:47:25 +0800
Message-ID: <20220126014725.1511-3-jammy_huang@aspeedtech.com>
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
X-MAIL: twspam01.aspeedtech.com 20Q1eoOV090812
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

Using stable-signal in resolution detection, and try detection again
if unstable.

VE_MODE_DETECT_EXTSRC_ADC: 1 if video source is from ADC output.
VE_MODE_DETECT_H_STABLE: 1 if horizontal signal detection is stable.
VE_MODE_DETECT_V_STABLE: 1 if vertical signal detection is stable.

Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
---
 drivers/media/platform/aspeed-video.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
index 5d1ec3de50ad..eb9c17ac0e14 100644
--- a/drivers/media/platform/aspeed-video.c
+++ b/drivers/media/platform/aspeed-video.c
@@ -153,9 +153,14 @@
 
 #define VE_MODE_DETECT_STATUS		0x098
 #define  VE_MODE_DETECT_H_PERIOD	GENMASK(11, 0)
+#define  VE_MODE_DETECT_EXTSRC_ADC	BIT(12)
+#define  VE_MODE_DETECT_H_STABLE	BIT(13)
+#define  VE_MODE_DETECT_V_STABLE	BIT(14)
 #define  VE_MODE_DETECT_V_LINES		GENMASK(27, 16)
 #define  VE_MODE_DETECT_STATUS_VSYNC	BIT(28)
 #define  VE_MODE_DETECT_STATUS_HSYNC	BIT(29)
+#define  VE_MODE_DETECT_VSYNC_RDY	BIT(30)
+#define  VE_MODE_DETECT_HSYNC_RDY	BIT(31)
 
 #define VE_SYNC_STATUS			0x09c
 #define  VE_SYNC_STATUS_HSYNC		GENMASK(11, 0)
@@ -909,6 +914,7 @@ static void aspeed_video_get_resolution(struct aspeed_video *video)
 	bool invalid_resolution = true;
 	int rc;
 	int tries = 0;
+	u32 mds;
 	u32 src_lr_edge;
 	u32 src_tb_edge;
 	struct v4l2_bt_timings *det = &video->detected_timings;
@@ -939,6 +945,13 @@ static void aspeed_video_get_resolution(struct aspeed_video *video)
 			return;
 		}
 
+		mds = aspeed_video_read(video, VE_MODE_DETECT_STATUS);
+		// try detection again if current signal isn't stable
+		if (!(mds & VE_MODE_DETECT_H_STABLE) ||
+		    !(mds & VE_MODE_DETECT_V_STABLE) ||
+		    (mds & VE_MODE_DETECT_EXTSRC_ADC))
+			continue;
+
 		aspeed_video_check_and_set_polarity(video);
 
 		aspeed_video_enable_mode_detect(video);
-- 
2.25.1

