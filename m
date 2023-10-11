Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C2A117C4BD7
	for <lists+openbmc@lfdr.de>; Wed, 11 Oct 2023 09:31:08 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=MHUsKJJ+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S54FQ4rgsz3cNk
	for <lists+openbmc@lfdr.de>; Wed, 11 Oct 2023 18:31:06 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=MHUsKJJ+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com; envelope-from=milkfafa@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S54Dm2N5Kz3c5L
	for <openbmc@lists.ozlabs.org>; Wed, 11 Oct 2023 18:30:31 +1100 (AEDT)
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1c9b95943beso11377945ad.1
        for <openbmc@lists.ozlabs.org>; Wed, 11 Oct 2023 00:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697009429; x=1697614229; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=481kwyoPSHDX+4JF1QVKBTbkhSw4SWArgmqeSO/N9bg=;
        b=MHUsKJJ+zN2PFy9CGJIcnRFz3KgTEueufKJjvelowclZ+ZNoKxXXxu2jVZAY/9iBnA
         4WNb9htIfh4YFH2jUFE+vPCwvQCSEXgr9WaFpCgdigKdq8na3yRIkmY4cKsN5zGv9bJj
         7P95oNBnbSTu2avTdqyv+KwdzzlR0P3lLEeC6mEOukEsYKb6ZqxqV6iYrx6lKQpyg0xT
         Lg1UJygQwS3I9lGI/pOsuIdivs65PGUl4Gnt9Zlzwo4/S0ToZ7CZGccBZLikBh497a61
         ePDIZLEJm4o1kA3SDnvqtD7HxlS2nyh1LlNgXr9eIp0caGEr0/19ZGSsJ+UV2nNpLQaH
         VxWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697009429; x=1697614229;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=481kwyoPSHDX+4JF1QVKBTbkhSw4SWArgmqeSO/N9bg=;
        b=xSToPSRScFmTMjjeHGr5OSmONqbeaXyIdurmMjErVzyPROrbcRQafeV5QxWqPRwY8x
         Asmz/r3ZyoX5mdlnGaUX3DoV7VxqKrAO7Xno1UPUgAeonMh2Vhbc5m6W5UG6K4Y22nRp
         w88ZowVw87yhn2SVvTv4s3c1WycAcu2h/u2I4wy+ru1Ci3JtX2iFFB6CX1nqvYkZ034X
         XKXWiJJ2iNvJ7wcjbvt3/j2Ej7sZNO2wPjphBZpY0YKlGbGkGOJs6gyuhWvXJuO7kyfG
         x225scxzP/R186Pcf8CqOSDMhf2Xzpw0ilf/UbEbeapVkoMVC0QHFtbiaelI8Vs6Ma1V
         pFwQ==
X-Gm-Message-State: AOJu0YwzdSoEcSKRet7mwRMjsEH8JQX+QIKSJXc6EtAM12rXQnbcinbi
	wz5TTEVXDU1uHk2JrbyHDq5orEILC0k=
X-Google-Smtp-Source: AGHT+IEmMVessNgXQdctBaoEjzu3v9Hkz36qlqr9ZgEJpfbYpmyP0b6kG6ar/DJxrRBysDOssMM0ww==
X-Received: by 2002:a17:902:82c4:b0:1c6:694:1dda with SMTP id u4-20020a17090282c400b001c606941ddamr19079607plz.63.1697009428492;
        Wed, 11 Oct 2023 00:30:28 -0700 (PDT)
Received: from hcdev-d520mt2.. (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id j6-20020a170902758600b001c61e628e9dsm1011352pll.77.2023.10.11.00.30.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 00:30:27 -0700 (PDT)
From: Marvin Lin <milkfafa@gmail.com>
To: mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl
Subject: [PATCH v2] media: nuvoton: npcm-video: Fix sleeping in atomic context
Date: Wed, 11 Oct 2023 15:30:03 +0800
Message-Id: <20231011073003.1637086-1-milkfafa@gmail.com>
X-Mailer: git-send-email 2.34.1
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
Cc: kwliu@nuvoton.com, Marvin Lin <milkfafa@gmail.com>, tmaimon77@gmail.com, avifishman70@gmail.com, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, kflin@nuvoton.com, dan.carpenter@linaro.org, linux-media@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Change to use mutex instead of spinlock for buffer list lock to fix
sleeping in atomic context warnings reported by the Smatch tool.

Fixes: 70721089985c ("media: nuvoton: Add driver for NPCM video capture and encoding engine")
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Signed-off-by: Marvin Lin <milkfafa@gmail.com>
---
 drivers/media/platform/nuvoton/npcm-video.c | 30 +++++++++------------
 1 file changed, 13 insertions(+), 17 deletions(-)

diff --git a/drivers/media/platform/nuvoton/npcm-video.c b/drivers/media/platform/nuvoton/npcm-video.c
index b9e6782f59b4..ea32d9588bb5 100644
--- a/drivers/media/platform/nuvoton/npcm-video.c
+++ b/drivers/media/platform/nuvoton/npcm-video.c
@@ -26,7 +26,6 @@
 #include <linux/regmap.h>
 #include <linux/reset.h>
 #include <linux/sched.h>
-#include <linux/spinlock.h>
 #include <linux/string.h>
 #include <linux/v4l2-controls.h>
 #include <linux/videodev2.h>
@@ -120,7 +119,7 @@ struct npcm_video {
 	struct mutex video_lock; /* v4l2 and videobuf2 lock */
 
 	struct list_head buffers;
-	spinlock_t lock; /* buffer list lock */
+	struct mutex buffer_lock; /* buffer list lock */
 	unsigned long flags;
 	unsigned int sequence;
 
@@ -782,7 +781,6 @@ static int npcm_video_start_frame(struct npcm_video *video)
 {
 	struct npcm_video_buffer *buf;
 	struct regmap *vcd = video->vcd_regmap;
-	unsigned long flags;
 	unsigned int val;
 	int ret;
 
@@ -798,17 +796,17 @@ static int npcm_video_start_frame(struct npcm_video *video)
 		return -EBUSY;
 	}
 
-	spin_lock_irqsave(&video->lock, flags);
+	mutex_lock(&video->buffer_lock);
 	buf = list_first_entry_or_null(&video->buffers,
 				       struct npcm_video_buffer, link);
 	if (!buf) {
-		spin_unlock_irqrestore(&video->lock, flags);
+		mutex_unlock(&video->buffer_lock);
 		dev_dbg(video->dev, "No empty buffers; skip capture frame\n");
 		return 0;
 	}
 
 	set_bit(VIDEO_CAPTURING, &video->flags);
-	spin_unlock_irqrestore(&video->lock, flags);
+	mutex_unlock(&video->buffer_lock);
 
 	npcm_video_vcd_state_machine_reset(video);
 
@@ -834,14 +832,13 @@ static void npcm_video_bufs_done(struct npcm_video *video,
 				 enum vb2_buffer_state state)
 {
 	struct npcm_video_buffer *buf;
-	unsigned long flags;
 
-	spin_lock_irqsave(&video->lock, flags);
+	mutex_lock(&video->buffer_lock);
 	list_for_each_entry(buf, &video->buffers, link)
 		vb2_buffer_done(&buf->vb.vb2_buf, state);
 
 	INIT_LIST_HEAD(&video->buffers);
-	spin_unlock_irqrestore(&video->lock, flags);
+	mutex_unlock(&video->buffer_lock);
 }
 
 static void npcm_video_get_diff_rect(struct npcm_video *video, unsigned int index)
@@ -1071,12 +1068,12 @@ static irqreturn_t npcm_video_irq(int irq, void *arg)
 
 	if (status & VCD_STAT_DONE) {
 		regmap_write(vcd, VCD_INTE, 0);
-		spin_lock(&video->lock);
+		mutex_lock(&video->buffer_lock);
 		clear_bit(VIDEO_CAPTURING, &video->flags);
 		buf = list_first_entry_or_null(&video->buffers,
 					       struct npcm_video_buffer, link);
 		if (!buf) {
-			spin_unlock(&video->lock);
+			mutex_unlock(&video->buffer_lock);
 			return IRQ_NONE;
 		}
 
@@ -1093,7 +1090,7 @@ static irqreturn_t npcm_video_irq(int irq, void *arg)
 			size = npcm_video_hextile(video, index, dma_addr, addr);
 			break;
 		default:
-			spin_unlock(&video->lock);
+			mutex_unlock(&video->buffer_lock);
 			return IRQ_NONE;
 		}
 
@@ -1104,7 +1101,7 @@ static irqreturn_t npcm_video_irq(int irq, void *arg)
 
 		vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_DONE);
 		list_del(&buf->link);
-		spin_unlock(&video->lock);
+		mutex_unlock(&video->buffer_lock);
 
 		if (npcm_video_start_frame(video))
 			dev_err(video->dev, "Failed to capture next frame\n");
@@ -1508,13 +1505,12 @@ static void npcm_video_buf_queue(struct vb2_buffer *vb)
 	struct npcm_video *video = vb2_get_drv_priv(vb->vb2_queue);
 	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
 	struct npcm_video_buffer *nvb = to_npcm_video_buffer(vbuf);
-	unsigned long flags;
 	bool empty;
 
-	spin_lock_irqsave(&video->lock, flags);
+	mutex_lock(&video->buffer_lock);
 	empty = list_empty(&video->buffers);
 	list_add_tail(&nvb->link, &video->buffers);
-	spin_unlock_irqrestore(&video->lock, flags);
+	mutex_unlock(&video->buffer_lock);
 
 	if (test_bit(VIDEO_STREAMING, &video->flags) &&
 	    !test_bit(VIDEO_CAPTURING, &video->flags) && empty) {
@@ -1744,8 +1740,8 @@ static int npcm_video_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	video->dev = &pdev->dev;
-	spin_lock_init(&video->lock);
 	mutex_init(&video->video_lock);
+	mutex_init(&video->buffer_lock);
 	INIT_LIST_HEAD(&video->buffers);
 
 	regs = devm_platform_ioremap_resource(pdev, 0);
-- 
2.34.1

