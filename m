Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EAF374A69B5
	for <lists+openbmc@lfdr.de>; Wed,  2 Feb 2022 02:49:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JpPqc5tFDz30JB
	for <lists+openbmc@lfdr.de>; Wed,  2 Feb 2022 12:49:32 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.131;
 helo=out30-131.freemail.mail.aliyun.com;
 envelope-from=yang.lee@linux.alibaba.com; receiver=<UNKNOWN>)
X-Greylist: delayed 309 seconds by postgrey-1.36 at boromir;
 Tue, 01 Feb 2022 15:09:56 AEDT
Received: from out30-131.freemail.mail.aliyun.com
 (out30-131.freemail.mail.aliyun.com [115.124.30.131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jns044RXhz2yPm;
 Tue,  1 Feb 2022 15:09:55 +1100 (AEDT)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R111e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04423; MF=yang.lee@linux.alibaba.com;
 NM=1; PH=DS; RN=12; SR=0; TI=SMTPD_---0V3MZ6Gv_1643688273; 
Received: from localhost(mailfrom:yang.lee@linux.alibaba.com
 fp:SMTPD_---0V3MZ6Gv_1643688273) by smtp.aliyun-inc.com(127.0.0.1);
 Tue, 01 Feb 2022 12:04:34 +0800
From: Yang Li <yang.lee@linux.alibaba.com>
To: eajames@linux.ibm.com
Subject: [PATCH -next] media: aspeed: Remove duplicated include in
 aspeed-video.c
Date: Tue,  1 Feb 2022 12:04:31 +0800
Message-Id: <20220201040431.9881-1-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 02 Feb 2022 12:48:36 +1100
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
Cc: jammy_huang@aspeedtech.com, linux-aspeed@lists.ozlabs.org, andrew@aj.id.au,
 openbmc@lists.ozlabs.org, Abaci Robot <abaci@linux.alibaba.com>,
 linux-kernel@vger.kernel.org, Yang Li <yang.lee@linux.alibaba.com>,
 mchehab@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Fix following includecheck warning:
./drivers/media/platform/aspeed-video.c: linux/videodev2.h is included
more than once.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 drivers/media/platform/aspeed-video.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
index 51fb18453b81..53409d86fe44 100644
--- a/drivers/media/platform/aspeed-video.c
+++ b/drivers/media/platform/aspeed-video.c
@@ -32,7 +32,6 @@
 #include <media/v4l2-event.h>
 #include <media/v4l2-ioctl.h>
 #include <media/videobuf2-dma-contig.h>
-#include <linux/videodev2.h>
 
 #define DEVICE_NAME			"aspeed-video"
 
-- 
2.20.1.7.g153144c

