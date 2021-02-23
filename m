Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FB6A3224D4
	for <lists+openbmc@lfdr.de>; Tue, 23 Feb 2021 05:12:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dl5H00nlRz3cJJ
	for <lists+openbmc@lfdr.de>; Tue, 23 Feb 2021 15:12:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=FeYR2qol;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=163.com
 (client-ip=220.181.12.17; helo=m12-17.163.com;
 envelope-from=dingsenjie@163.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256
 header.s=s110527 header.b=FeYR2qol; dkim-atps=neutral
X-Greylist: delayed 1006 seconds by postgrey-1.36 at boromir;
 Tue, 23 Feb 2021 13:28:06 AEDT
Received: from m12-17.163.com (m12-17.163.com [220.181.12.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dl2yt1hWlz30LL;
 Tue, 23 Feb 2021 13:27:57 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=EQlFb
 PsFTZi9ewGkDle+g/qeavm7rzg+OmBnQFzqMn8=; b=FeYR2qolkQI8aS4sNCwbv
 LD6hnD2hBkUU6yBOYGBp+V4kbVdWswAmZgpJfXtK7hpMF7Ts8v/P260WmG0DN40t
 7uuEPFdhx7/iEoa+S9u4KUOLgA6gwZiR1wkEa2+IMPzcbwilWaA1dk55ad5MvyTA
 pJT6W/PiMis5d/GTW/RbCQ=
Received: from COOL-20201222LC.ccdomain.com (unknown [218.94.48.178])
 by smtp13 (Coremail) with SMTP id EcCowACHPXrSYzRgRuu7mQ--.4187S2;
 Tue, 23 Feb 2021 10:09:23 +0800 (CST)
From: dingsenjie@163.com
To: brendanhiggins@google.com, benh@kernel.crashing.org, joel@jms.id.au,
 andrew@aj.id.au, openbmc@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org
Subject: [PATCH] i2c/busses:remove unneeded variable: "ret"
Date: Tue, 23 Feb 2021 10:09:25 +0800
Message-Id: <20210223020925.22856-1-dingsenjie@163.com>
X-Mailer: git-send-email 2.21.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: EcCowACHPXrSYzRgRuu7mQ--.4187S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrur43XF4xKw1rur4xWryxAFb_yoWfArX_KF
 1kW3Z7Gr1DZr95A345A3s8XryDKFyrurn5W3Z5Kay3CFy5Z348XFWDuryfJrs8Xrs7CFnr
 Zr1UWF47Aw17GjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU0StC7UUUUU==
X-Originating-IP: [218.94.48.178]
X-CM-SenderInfo: 5glqw25hqmxvi6rwjhhfrp/1tbiThNCyFUDH1LYqgAAs+
X-Mailman-Approved-At: Tue, 23 Feb 2021 15:12:00 +1100
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
Cc: dingsenjie <dingsenjie@yulong.com>, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: dingsenjie <dingsenjie@yulong.com>

remove unneeded variable: "ret".

Signed-off-by: dingsenjie <dingsenjie@yulong.com>
---
 drivers/i2c/busses/i2c-aspeed.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
index 724bf30..efad900 100644
--- a/drivers/i2c/busses/i2c-aspeed.c
+++ b/drivers/i2c/busses/i2c-aspeed.c
@@ -175,7 +175,6 @@ struct aspeed_i2c_bus {
 static int aspeed_i2c_recover_bus(struct aspeed_i2c_bus *bus)
 {
 	unsigned long time_left, flags;
-	int ret = 0;
 	u32 command;
 
 	spin_lock_irqsave(&bus->lock, flags);
@@ -232,7 +231,7 @@ static int aspeed_i2c_recover_bus(struct aspeed_i2c_bus *bus)
 out:
 	spin_unlock_irqrestore(&bus->lock, flags);
 
-	return ret;
+	return 0;
 
 reset_out:
 	spin_unlock_irqrestore(&bus->lock, flags);
-- 
1.9.1


