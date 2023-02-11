Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 310F1692DD5
	for <lists+openbmc@lfdr.de>; Sat, 11 Feb 2023 04:23:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PDGCD0J14z3f8f
	for <lists+openbmc@lfdr.de>; Sat, 11 Feb 2023 14:23:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=S82rD2Qa;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bewilderbeest.net (client-ip=71.19.156.171; helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=S82rD2Qa;
	dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net [71.19.156.171])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PDGBb1TGYz3f5y
	for <openbmc@lists.ozlabs.org>; Sat, 11 Feb 2023 14:22:47 +1100 (AEDT)
Received: from hatter.bewilderbeest.net (97-113-250-99.tukw.qwest.net [97.113.250.99])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: zev)
	by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 307D747B;
	Fri, 10 Feb 2023 19:22:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
	s=thorn; t=1676085763;
	bh=ejyyyJa0OEuSXGnZ31FdfCcEif3kT9V+H7dQPoAqC5w=;
	h=From:To:Cc:Subject:Date:From;
	b=S82rD2Qacr3R/Fz0AsZ1GTptrdsvwLOUcJMMYr85D18zoEF5Wts/Uz4ZeWPciIx0c
	 KjBhExnR0H/+iok1+TSjbctqYwycZn61LboS+1ygphVC5EvZgwIiTbTR324gyPcr3D
	 VQp/64HywuyD2QeGJvMjm0rn8mbWJj0rNVWJUepc=
From: Zev Weiss <zev@bewilderbeest.net>
To: Joel Stanley <joel@jms.id.au>
Subject: [PATCH linux dev-6.0] media: aspeed: Use v4l2_dbg to replace v4l2_warn to avoid log spam
Date: Fri, 10 Feb 2023 19:22:35 -0800
Message-Id: <20230211032235.20220-1-zev@bewilderbeest.net>
X-Mailer: git-send-email 2.39.1
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
Cc: Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org, Zev Weiss <zev@bewilderbeest.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Jammy Huang <jammy_huang@aspeedtech.com>

If the host is powered off, there will be many warning log. To avoid the
log spam in this condition, replace v4l2_warn with v4l2_dbg.

Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
(cherry picked from commit def4d25856b2fa41c1c1390f1e8d1b027166f5e9)
---

This patch eliminates a lot of needless aspeed-video log noise that
the current dev-6.0 kernel exhibits.  It's now in the mainline kernel
and should be in the 6.2 release; it'd be nice to also backport to the
OpenBMC kernel.

 drivers/media/platform/aspeed/aspeed-video.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/aspeed/aspeed-video.c b/drivers/media/platform/aspeed/aspeed-video.c
index 20f795ccc11b..c0cebac4b966 100644
--- a/drivers/media/platform/aspeed/aspeed-video.c
+++ b/drivers/media/platform/aspeed/aspeed-video.c
@@ -549,13 +549,13 @@ static int aspeed_video_start_frame(struct aspeed_video *video)
 	u32 seq_ctrl = aspeed_video_read(video, VE_SEQ_CTRL);
 
 	if (video->v4l2_input_status) {
-		v4l2_warn(&video->v4l2_dev, "No signal; don't start frame\n");
+		v4l2_dbg(1, debug, &video->v4l2_dev, "No signal; don't start frame\n");
 		return 0;
 	}
 
 	if (!(seq_ctrl & VE_SEQ_CTRL_COMP_BUSY) ||
 	    !(seq_ctrl & VE_SEQ_CTRL_CAP_BUSY)) {
-		v4l2_warn(&video->v4l2_dev, "Engine busy; don't start frame\n");
+		v4l2_dbg(1, debug, &video->v4l2_dev, "Engine busy; don't start frame\n");
 		return -EBUSY;
 	}
 
@@ -564,7 +564,7 @@ static int aspeed_video_start_frame(struct aspeed_video *video)
 				       struct aspeed_video_buffer, link);
 	if (!buf) {
 		spin_unlock_irqrestore(&video->lock, flags);
-		v4l2_warn(&video->v4l2_dev, "No buffers; don't start frame\n");
+		v4l2_dbg(1, debug, &video->v4l2_dev, "No buffers; don't start frame\n");
 		return -EPROTO;
 	}
 
@@ -977,7 +977,7 @@ static void aspeed_video_get_resolution(struct aspeed_video *video)
 						      res_check(video),
 						      MODE_DETECT_TIMEOUT);
 		if (!rc) {
-			v4l2_warn(&video->v4l2_dev, "Timed out; first mode detect\n");
+			v4l2_dbg(1, debug, &video->v4l2_dev, "Timed out; first mode detect\n");
 			clear_bit(VIDEO_RES_DETECT, &video->flags);
 			return;
 		}
@@ -998,7 +998,7 @@ static void aspeed_video_get_resolution(struct aspeed_video *video)
 						      MODE_DETECT_TIMEOUT);
 		clear_bit(VIDEO_RES_DETECT, &video->flags);
 		if (!rc) {
-			v4l2_warn(&video->v4l2_dev, "Timed out; second mode detect\n");
+			v4l2_dbg(1, debug, &video->v4l2_dev, "Timed out; second mode detect\n");
 			return;
 		}
 
@@ -1021,7 +1021,7 @@ static void aspeed_video_get_resolution(struct aspeed_video *video)
 	} while (invalid_resolution && (tries++ < INVALID_RESOLUTION_RETRIES));
 
 	if (invalid_resolution) {
-		v4l2_warn(&video->v4l2_dev, "Invalid resolution detected\n");
+		v4l2_dbg(1, debug, &video->v4l2_dev, "Invalid resolution detected\n");
 		return;
 	}
 
@@ -1683,7 +1683,7 @@ static void aspeed_video_stop_streaming(struct vb2_queue *q)
 				!test_bit(VIDEO_FRAME_INPRG, &video->flags),
 				STOP_TIMEOUT);
 	if (!rc) {
-		v4l2_warn(&video->v4l2_dev, "Timed out when stopping streaming\n");
+		v4l2_dbg(1, debug, &video->v4l2_dev, "Timed out when stopping streaming\n");
 
 		/*
 		 * Need to force stop any DMA and try and get HW into a good
-- 
2.39.1

