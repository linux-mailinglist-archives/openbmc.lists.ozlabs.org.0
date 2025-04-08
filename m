Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E8FBDA8191D
	for <lists+openbmc@lfdr.de>; Wed,  9 Apr 2025 01:04:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZXM8l4KWfz3fRj
	for <lists+openbmc@lfdr.de>; Wed,  9 Apr 2025 09:04:23 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::630"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744091779;
	cv=none; b=CkjJvDktOa71lgSvOzwpdp7aosH3F8MVLKHUBqFhJutc9cilrmmiCZWM+GkdsV9h+Pl8IXzsPw0KZ2pxQuzQLLIWDzCYlAZo7yOSFgg5/zm0nargFeDIXbBLfBZQYrOk1DzHU4ZhpSCIWIN+jvVny0xI2EW8bOG7mNNOk0EnffNLg0s58PSfYMGE30ooWZYW5AvajPyBcrdOUljYxKVmVYrAnojeIeBo5XrpxOpux6BEzTxI+13bRjUAsDdipUVCIBfLhkn9j+Ogm16JcHrWc5pNRywSl5pYpKvN43TkPadPvQ9CB9rxHnHR83sWLbON8F5/aIbDAuiNC36W/cIdzA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744091779; c=relaxed/relaxed;
	bh=Rqpz8NuFEKxlJYYhCortmvxtTD3Iriop0nreRrYWvRM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=EJNMeLOaV/PywwyAddy7IT6VNNAQSU6zM1eHRIWzUN+UFkUW093dxo8Uu5jHAgYU4m8URKTRS7I6XYxtVWSJoysJYHn/JX57vAQVolVpjCjovFVWYTu/Utw40g7kWoK1LNeLdRs3q2ElhJL0QMx09L3iWWtaqFp6XjPZLpAmFzUVDeVweSScQgKnkky/PQsfOXCgv4sxrxNAeoxLyWnlaqC0p37tj89gUEs2xwE/antDdVhkjiXZVk0SFsSbu0QtuhPnOglgU2U9mWJ1F3qdFVrJGiT7IAa+W46xl8ayKAlqdOVzoJFP8YDVj+c1HXEMlJeFGpwKewI7/Ds5CKBy2Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=SW3aUT6p; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com; envelope-from=zhang971090220@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=SW3aUT6p;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com; envelope-from=zhang971090220@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZWwLW0zrFz2yST
	for <openbmc@lists.ozlabs.org>; Tue,  8 Apr 2025 15:56:18 +1000 (AEST)
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-22409077c06so63083675ad.1
        for <openbmc@lists.ozlabs.org>; Mon, 07 Apr 2025 22:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744091776; x=1744696576; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Rqpz8NuFEKxlJYYhCortmvxtTD3Iriop0nreRrYWvRM=;
        b=SW3aUT6pv4GkD1FNYqaLUTlPxeHU3DFab3G9xnO2SUZMP6RCa1SELh+sxVTNpMrWsx
         r6MW2h3JSa22lCg6WJPd2ijGr7frAZSs/ArDFSEeQOjTBRmDf5z5/sBikqbagSAq1j6H
         I/V3xQyd3cYt4SfW9DmrDBjAC6eFsqefqddsy6np9a2drCneuvK0e1XsDMKV7Q7KXNto
         xVFecMUNeiER8GRVn7dRJQL3Y5vBe3K1+LDjJ+ehFXwrHU2pR+Pd30b20GmELIzinMRZ
         XdRHdLZ9huUUUHzu4qIE3+B7eDY3s8hiAR/tso1cIYenDR7e/httowBywrc4XWIwQIm3
         WTgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744091776; x=1744696576;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rqpz8NuFEKxlJYYhCortmvxtTD3Iriop0nreRrYWvRM=;
        b=MWI6MTagMgtHmolxm8DY6kxBQjOoyuaBrweWc3+xnGH4nxsHmeUyzigYL+vHH0EmSr
         VyBLUj0X2LfIxSRYOHmygrmLGQCnK2j7la8/5cMpl2BuOO69VxheoYfON5QlANMpm64G
         Gqp3noDIJTu/gY3QNd1+mauX1MtHVgNDovDlxpDp9Oo8e3lJ2IKJLRzRDmQ2EsCI2Miu
         uh4tRjAhZJrum2EJKArz+v2DY/723s4V3REtHcH8rrlauEjwNEkgWyKt9JZUgYpmLOhk
         C2U2+QzM9+t+jGrxiMopXdWkLa0kB1vl/xv+TAGCqqDlYz8Hz3PhQBOq1azMXex2Hu6Z
         53nw==
X-Forwarded-Encrypted: i=1; AJvYcCXGoYX+4OVdP1N3I8eGvyDZMyeqoIVz/kmL/qs7UUmVVoY4QWvGwlcO9VOz1W6Ib+dKD/H1HCpd@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxIuDaWMWoPbLTgEsjId51de0W81bNEH5Xx7DV7Zui+UTio1ajQ
	xVItTWenP3SfTF02C/dAQouyuzD1MBlkNt0W9imNfAVidiiIckY8
X-Gm-Gg: ASbGncszDB9M1gOdm8pF1qX/MTiuIFD0UqH1Vl/XT3p2SQqeBiIkhMdoXK70prfwtNu
	RAAT4z10cU5RtREYUUtSDXIo7m36pfGh7C33IMhfkmU+3DsMG+yy0x8vBdmq6lqIui8EJ+RtBGH
	9DM0fW1iDSsUQJx0qLmfBJEOm7FtD6ZTfHoBNsaagoyRfCdpvcgS4sb4d0YQpbwE9kLKt+Fq5XT
	avyD6VGfcILd1lbQCpp/d4V267sBDOlML0twDAQrLyyaYm3YqnPgRlTxJV5DgdLNeWpXX9E+sdJ
	HOZQP9Wf4WW/iZQKrAgkoJLgz53Oyt5VgKNuWrkgWAjEGYefIZfBPHOSAYvADHteJ8UZJZmq7kX
	0E5DAwfY9w46nHgWP
X-Google-Smtp-Source: AGHT+IE05u9t9NFEBw+rXVTuN3JQshXllOgy7pnk00Je9nTx82e8AXGF/YtAVc4GIGc7M22Lq5mp8A==
X-Received: by 2002:a17:903:1b0c:b0:223:5a6e:b16 with SMTP id d9443c01a7336-22a8a84ae50mr231161415ad.5.1744091775946;
        Mon, 07 Apr 2025 22:56:15 -0700 (PDT)
Received: from hcdev-d520mt2.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2297877656bsm91127335ad.246.2025.04.07.22.56.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 22:56:15 -0700 (PDT)
From: Michael Chang <zhang971090220@gmail.com>
To: kwliu@nuvoton.com,
	kflin@nuvoton.com,
	mchehab@kernel.org,
	zhang971090220@gmail.com
Subject: [RESEND] media: nuvoton: npcm-video: Prevent returning unsupported resolutions
Date: Tue,  8 Apr 2025 13:54:54 +0800
Message-Id: <20250408055454.3421083-1-zhang971090220@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Mailman-Approved-At: Wed, 09 Apr 2025 09:04:16 +1000
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
Cc: openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

To restrict the returned resolution due to Nuvoton SoC hardware
limitations.

Signed-off-by: Michael Chang <zhang971090220@gmail.com>
---
 drivers/media/platform/nuvoton/npcm-video.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/nuvoton/npcm-video.c b/drivers/media/platform/nuvoton/npcm-video.c
index 234fdec04f74..8d6d51a674a3 100644
--- a/drivers/media/platform/nuvoton/npcm-video.c
+++ b/drivers/media/platform/nuvoton/npcm-video.c
@@ -578,7 +578,7 @@ static unsigned int npcm_video_hres(struct npcm_video *video)
 	regmap_read(gfxi, HVCNTL, &hvcntl);
 	apb_hor_res = (((hvcnth & HVCNTH_MASK) << 8) + (hvcntl & HVCNTL_MASK) + 1);
 
-	return apb_hor_res;
+	return (apb_hor_res > MAX_WIDTH) ? MAX_WIDTH : apb_hor_res;
 }
 
 static unsigned int npcm_video_vres(struct npcm_video *video)
@@ -591,7 +591,7 @@ static unsigned int npcm_video_vres(struct npcm_video *video)
 
 	apb_ver_res = (((vvcnth & VVCNTH_MASK) << 8) + (vvcntl & VVCNTL_MASK));
 
-	return apb_ver_res;
+	return (apb_ver_res > MAX_HEIGHT) ? MAX_HEIGHT : apb_ver_res;
 }
 
 static int npcm_video_capres(struct npcm_video *video, unsigned int hor_res,
-- 
2.34.1

