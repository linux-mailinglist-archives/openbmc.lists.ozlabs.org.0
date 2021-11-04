Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BDE9444E7C
	for <lists+openbmc@lfdr.de>; Thu,  4 Nov 2021 06:53:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HlCVh3GdHz2xvV
	for <lists+openbmc@lfdr.de>; Thu,  4 Nov 2021 16:53:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=NaCyrz9a;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bewilderbeest.net (client-ip=2605:2700:0:5::4713:9cab;
 helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net
 header.a=rsa-sha256 header.s=thorn header.b=NaCyrz9a; 
 dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [IPv6:2605:2700:0:5::4713:9cab])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HlCVJ3xnfz2xBv
 for <openbmc@lists.ozlabs.org>; Thu,  4 Nov 2021 16:53:11 +1100 (AEDT)
Received: from hatter.bewilderbeest.net (97-113-240-219.tukw.qwest.net
 [97.113.240.219])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 750972A8;
 Wed,  3 Nov 2021 22:53:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1636005186;
 bh=XeFbgdJ2Yqn6WJpXgg9rKGLjP/98H293E4Bigju4Vi4=;
 h=From:To:Subject:Date:From;
 b=NaCyrz9aG2pVG9yYAFls0RzwPSq/EwGYAq22tS+IlW/deqZZC99sLjr0NpyxekR+m
 ZfsqYbxbvGC1SUv6VoAH6SZxS8d7He1jfyDhcEBeqv/9DWHxuE/Fi/rIjB9cHPe07p
 NiCiXzM/EFv8YpvgOM/bmTyrivr+BnAYyEqlS6lM=
From: Zev Weiss <zev@bewilderbeest.net>
To: openbmc@lists.ozlabs.org,
	Joel Stanley <joel@jms.id.au>
Subject: [PATCH linux dev-5.15] media: aspeed-video: ignore interrupts that
 aren't enabled
Date: Wed,  3 Nov 2021 22:52:53 -0700
Message-Id: <20211104055253.1518-1-zev@bewilderbeest.net>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

As partially addressed in commit 65d270acb2d6 ("media: aspeed: clear
garbage interrupts"), the ASpeed video engine sometimes asserts
interrupts that the driver hasn't enabled.  In addition to the
CAPTURE_COMPLETE and FRAME_COMPLETE interrupts dealt with in that
patch, COMP_READY has also been observed.  Instead of playing
whack-a-mole with each one individually, we can instead just blanket
ignore everything we haven't explicitly enabled.

Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
Tested-by: Lei YU <yulei.sh@bytedance.com>
Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---

This patch fixes a problem that can sometimes bite the OpenBMC iKVM, and
is now in mainline as commit ea8a5c118e24.

 drivers/media/platform/aspeed-video.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
index 7bb6babdcade..77611c296a25 100644
--- a/drivers/media/platform/aspeed-video.c
+++ b/drivers/media/platform/aspeed-video.c
@@ -563,6 +563,12 @@ static irqreturn_t aspeed_video_irq(int irq, void *arg)
 	struct aspeed_video *video = arg;
 	u32 sts = aspeed_video_read(video, VE_INTERRUPT_STATUS);
 
+	/*
+	 * Hardware sometimes asserts interrupts that we haven't actually
+	 * enabled; ignore them if so.
+	 */
+	sts &= aspeed_video_read(video, VE_INTERRUPT_CTRL);
+
 	/*
 	 * Resolution changed or signal was lost; reset the engine and
 	 * re-initialize
@@ -629,16 +635,6 @@ static irqreturn_t aspeed_video_irq(int irq, void *arg)
 			aspeed_video_start_frame(video);
 	}
 
-	/*
-	 * CAPTURE_COMPLETE and FRAME_COMPLETE interrupts come even when these
-	 * are disabled in the VE_INTERRUPT_CTRL register so clear them to
-	 * prevent unnecessary interrupt calls.
-	 */
-	if (sts & VE_INTERRUPT_CAPTURE_COMPLETE)
-		sts &= ~VE_INTERRUPT_CAPTURE_COMPLETE;
-	if (sts & VE_INTERRUPT_FRAME_COMPLETE)
-		sts &= ~VE_INTERRUPT_FRAME_COMPLETE;
-
 	return sts ? IRQ_NONE : IRQ_HANDLED;
 }
 
-- 
2.33.1

