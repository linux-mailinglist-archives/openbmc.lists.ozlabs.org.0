Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 01B0416EF7B
	for <lists+openbmc@lfdr.de>; Tue, 25 Feb 2020 20:57:19 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48RqTR321vzDqTP
	for <lists+openbmc@lfdr.de>; Wed, 26 Feb 2020 06:57:15 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.115; helo=mga14.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48RqSd2Hb9zDqS9;
 Wed, 26 Feb 2020 06:56:31 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 25 Feb 2020 11:56:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,485,1574150400"; d="scan'208";a="230230964"
Received: from maru.jf.intel.com ([10.54.51.77])
 by fmsmga007.fm.intel.com with ESMTP; 25 Feb 2020 11:56:27 -0800
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
To: Eddie James <eajames@linux.ibm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH -next] media: aspeed: add AST2600 support
Date: Tue, 25 Feb 2020 11:58:53 -0800
Message-Id: <20200225195853.17480-1-jae.hyun.yoo@linux.intel.com>
X-Mailer: git-send-email 2.17.1
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
Cc: openbmc@lists.ozlabs.org, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
 linux-aspeed@lists.ozlabs.org, linux-media@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Video engine in AST2600 has the exactly same register set with
AST2500 except VR084 register which provides more precise JPEG
size read back. This commit adds support for the difference and
adds 'aspeed,ast2600-video-engine' compatible OF string.

Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
---
 drivers/media/platform/aspeed-video.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
index 47444a336ebb..7d98db1d9b52 100644
--- a/drivers/media/platform/aspeed-video.c
+++ b/drivers/media/platform/aspeed-video.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 // Copyright 2020 IBM Corp.
-// Copyright (c) 2019 Intel Corporation
+// Copyright (c) 2019-2020 Intel Corporation
 
 #include <linux/atomic.h>
 #include <linux/bitfield.h>
@@ -132,7 +132,8 @@
 #define  VE_COMP_CTRL_HQ_DCT_CHR	GENMASK(26, 22)
 #define  VE_COMP_CTRL_HQ_DCT_LUM	GENMASK(31, 27)
 
-#define VE_OFFSET_COMP_STREAM		0x078
+#define AST2400_VE_COMP_SIZE_READ_BACK	0x078
+#define AST2600_VE_COMP_SIZE_READ_BACK	0x084
 
 #define VE_SRC_LR_EDGE_DET		0x090
 #define  VE_SRC_LR_EDGE_DET_LEFT	GENMASK(11, 0)
@@ -252,12 +253,17 @@ struct aspeed_video_config {
 
 static const struct aspeed_video_config ast2400_config = {
 	.jpeg_mode = AST2400_VE_SEQ_CTRL_JPEG_MODE,
-	.comp_size_read = VE_OFFSET_COMP_STREAM,
+	.comp_size_read = AST2400_VE_COMP_SIZE_READ_BACK,
 };
 
 static const struct aspeed_video_config ast2500_config = {
 	.jpeg_mode = AST2500_VE_SEQ_CTRL_JPEG_MODE,
-	.comp_size_read = VE_OFFSET_COMP_STREAM,
+	.comp_size_read = AST2400_VE_COMP_SIZE_READ_BACK,
+};
+
+static const struct aspeed_video_config ast2600_config = {
+	.jpeg_mode = AST2500_VE_SEQ_CTRL_JPEG_MODE,
+	.comp_size_read = AST2600_VE_COMP_SIZE_READ_BACK,
 };
 
 static const u32 aspeed_video_jpeg_header[ASPEED_VIDEO_JPEG_HEADER_SIZE] = {
@@ -1673,6 +1679,7 @@ static int aspeed_video_init(struct aspeed_video *video)
 static const struct of_device_id aspeed_video_of_match[] = {
 	{ .compatible = "aspeed,ast2400-video-engine", .data = &ast2400_config },
 	{ .compatible = "aspeed,ast2500-video-engine", .data = &ast2500_config },
+	{ .compatible = "aspeed,ast2600-video-engine", .data = &ast2600_config },
 	{}
 };
 MODULE_DEVICE_TABLE(of, aspeed_video_of_match);
-- 
2.17.1

