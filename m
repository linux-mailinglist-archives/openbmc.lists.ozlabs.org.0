Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 60DDD96B170
	for <lists+openbmc@lfdr.de>; Wed,  4 Sep 2024 08:21:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WzC6m4Dpcz3c6c
	for <lists+openbmc@lfdr.de>; Wed,  4 Sep 2024 16:21:04 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a01:4f8:c0c:45b4::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725133291;
	cv=none; b=iKukslF6R99vYjcws3c1bEOWKvARg2P7DVN7JqGFhUgjI3vIAG1/FqP8LCO9A/yN0rhVqj7U2nvHytnt5EEQPnn/pttSCXgND2eoOoFYEBRx+BUKOlEvl3T8bMVBO7T81byZ4/WHngKMKwhybcgaK50jqiS47Tsnz062+KyFbuVvR2LNc1p9RHZMtT8laWAd+qhBJqAT3qMEcUIoD7Q4RDrNcGcTdCMlVnK8eaYeNjzPe8qVDJvhrgYZ6J02Axkb5RhmNK4AITmwexvfOahT4soXj9zYaJpGGOXTVIATM8vFfoApIt2o/IhrFNZJniebG+A95oCGOjVY/xt5j/PNMw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725133291; c=relaxed/relaxed;
	bh=46QX0kuhx180X/8BVQKfdic538oR3Z6r3UiNROg8Mi8=;
	h=X-Greylist:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version; b=IHbWZ/pVal3JUlnPpjsQhvzsK9iLHM3BLLsWBPBcoKEVMpJtTuaaC5DEh0iEgwnj0Nv5MfEx69Ahcx+2ihTjGouY3Lw0uukDcYXhBZ5o3UkiOgI7arkvS92inyn8mBSuh8CXKFjevWdoe2UBY4RxjQtpVPNCjBZAHx4AIhw6y6x3jw+MvPG6rqPToXtP/SWwPcMmB90lsnE+go/XCGrX2N8amuW68kOmRP/YOxAha7y+8NloAT7AAC2qsZesLwViMbEc3ETuFAc0yJlqVK8CM1QyqsFBRV6pm0Y60OIFHRSbETsRYf5tg7dJ8QwmHTmFSP+fsEjZZ2NNs3OplR74Pw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=diekuehnen.com; dkim=pass (2048-bit key; unprotected) header.d=diekuehnen.com header.i=@diekuehnen.com header.a=rsa-sha256 header.s=dkim header.b=T7lf2pXs; dkim-atps=neutral; spf=pass (client-ip=2a01:4f8:c0c:45b4::3; helo=mail.diekuehnen.com; envelope-from=andreas.kuehn@diekuehnen.com; receiver=lists.ozlabs.org) smtp.mailfrom=diekuehnen.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=diekuehnen.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=diekuehnen.com header.i=@diekuehnen.com header.a=rsa-sha256 header.s=dkim header.b=T7lf2pXs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=diekuehnen.com (client-ip=2a01:4f8:c0c:45b4::3; helo=mail.diekuehnen.com; envelope-from=andreas.kuehn@diekuehnen.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 314 seconds by postgrey-1.37 at boromir; Sun, 01 Sep 2024 05:41:30 AEST
Received: from mail.diekuehnen.com (mail.diekuehnen.com [IPv6:2a01:4f8:c0c:45b4::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wx54B1XdMz2yDx
	for <openbmc@lists.ozlabs.org>; Sun,  1 Sep 2024 05:41:30 +1000 (AEST)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 17CBA7E699;
	Sat, 31 Aug 2024 21:36:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=diekuehnen.com;
	s=dkim; t=1725132967;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=46QX0kuhx180X/8BVQKfdic538oR3Z6r3UiNROg8Mi8=;
	b=T7lf2pXsSKOnmASVTCVThS7v+FSiSl+ZgeUhKY/kPdUlCRCWjb+hHnoj/rHaBsnEU+lj1h
	et9GEtGPAYjp5isu1sRgRrmL44oBlOYNl/NV5dDEZecEi6aJqrfFwS90nQxUF9Ee1xOzfR
	v2tsGDtD0Se+IENU7xyLpg0q5Aelm7J5fJPJYaM56xA+2Oj2w1mbCgN9vVYdTCR/g87LZz
	ajljGKi1MYGSF5oQRQRtedXIYUjDKsc7TWxcCLmggbZmDGHqRr++uzPpm0nJQViJi2BgBF
	JIvtc23HLLmXj+BJb4lv+rNQWcYZL918sHbUp3UbCxFaJrXVcP7xqhuu+HEb8w==
From: =?UTF-8?q?Andreas=20K=C3=BChn?= <andreas.kuehn@diekuehnen.com>
To: avifishman70@gmail.com,
	tmaimon77@gmail.com,
	tali.perry1@gmail.com,
	venture@google.com,
	yuenn@google.com,
	benjaminfair@google.com,
	peter.chen@kernel.org,
	gregkh@linuxfoundation.org
Subject: [PATCH] usb: chipidea: npcm: Fix coding style with missing space
Date: Sat, 31 Aug 2024 21:34:06 +0200
Message-ID: <20240831193407.11302-1-andreas.kuehn@diekuehnen.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Approved-At: Wed, 04 Sep 2024 16:21:02 +1000
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
Cc: openbmc@lists.ozlabs.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, =?UTF-8?q?Andreas=20K=C3=BChn?= <andreas.kuehn@diekuehnen.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Fixed coding style issue: added missing space.

Signed-off-by: Andreas Kühn <andreas.kuehn@diekuehnen.com>
---
 drivers/usb/chipidea/ci_hdrc_npcm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/chipidea/ci_hdrc_npcm.c b/drivers/usb/chipidea/ci_hdrc_npcm.c
index b14127873c55..c89c68f41ccc 100644
--- a/drivers/usb/chipidea/ci_hdrc_npcm.c
+++ b/drivers/usb/chipidea/ci_hdrc_npcm.c
@@ -28,7 +28,7 @@ static int npcm_udc_notify_event(struct ci_hdrc *ci, unsigned event)
 		hw_write(ci, OP_USBMODE, 0xffffffff, 0x0);
 		break;
 	default:
-		dev_dbg(dev, "unknown ci_hdrc event (%d)\n",event);
+		dev_dbg(dev, "unknown ci_hdrc event (%d)\n", event);
 		break;
 	}
 
-- 
2.43.0

