Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 46ECE54DB48
	for <lists+openbmc@lfdr.de>; Thu, 16 Jun 2022 09:11:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LNtdP1Dynz3bm9
	for <lists+openbmc@lfdr.de>; Thu, 16 Jun 2022 17:11:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=h5LYjvdi;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=h5LYjvdi;
	dkim-atps=neutral
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LNtcx23GKz2xbW
	for <openbmc@lists.ozlabs.org>; Thu, 16 Jun 2022 17:11:12 +1000 (AEST)
Received: by mail-pl1-x632.google.com with SMTP id r1so579343plo.10
        for <openbmc@lists.ozlabs.org>; Thu, 16 Jun 2022 00:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xZs41Ei0niTqoWRpW8u4QbHWaDAR5CkuWJOLLkWex8Q=;
        b=h5LYjvdiZvyts9h6TXJ7M0iqK9z79cU9v4g6jaf5XBUR5I9saBbHI+REcohpx/1vfv
         IQ7JwJPAq/2jrteLVs3Gdm0Hmv8hBBMSLs+mDxDzbmZEMqkCmHy0TPlIzXNhnoF6DOIW
         SXxEGEU6U2srqtwIb4+cbusOXYPm5Vt2y72VSloQnwQ4q7bidaaVMcZrJLWKDucXy8Pj
         2//McRrO8Nox5aHsjbAIYmghJ7kEAc8e1swTQZspHDcBCTAvW7D8lk3qJafdagkKS4a+
         yr8TnLbrPLRynPm9Je24TJG0Z6ZX7SQfUQyYSkWvrlwIdZVeEAc9Q1V/WoAL7+1sa9IX
         SSbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=xZs41Ei0niTqoWRpW8u4QbHWaDAR5CkuWJOLLkWex8Q=;
        b=zqPcrTJ650FY5/H6BFNtF3i9D7uKsW9kj17w9xSkYBqIhMFFnm/gG7KRmYxzW/Zxpa
         YiJXq0WNp6dQRGS3hEw/1Br0oKirmXSRX8Nd2DVuQxQ3/rJsh5po+TcNncO4tFWw2vmn
         cQIQsBixo0jNvoJEoxZLbo88u8mhxBasK+ERldbl3w8x5j29VeGAEyR+oMUmeGuhUDTX
         pPiMMXJCBh89MTo+8lTP8dDUY8Mf1/w8/QsV67wlCjxyjbt3KezF8QoZwtuixFY4xz+P
         uuq6hBkzJN90lCjKN/tv/rpneJxAOPBoxN7WNE52Q4Z9WBM2/SZ7dm/vrBfG1Ng9U96f
         qTHQ==
X-Gm-Message-State: AJIora+we2e0KJlQwHikmRdN+t+x8AwQfrDT7sdHBMoAWfa2RCE/zb4q
	vpjdHyUBIYnSsqdD2zghk2coWWCscfc=
X-Google-Smtp-Source: AGRyM1ulSixbyvjPc0ogXQQQEdLeNivIfBHmSMgpU4ZXiFBg7wiYlAEBk/MqrOdWXLoqhdNxN3T3qQ==
X-Received: by 2002:a17:90b:240e:b0:1e0:775b:f8fc with SMTP id nr14-20020a17090b240e00b001e0775bf8fcmr3580040pjb.132.1655363468438;
        Thu, 16 Jun 2022 00:11:08 -0700 (PDT)
Received: from voyager.lan ([45.124.203.18])
        by smtp.gmail.com with ESMTPSA id bl24-20020a056a00281800b00522c5e40574sm851130pfb.129.2022.06.16.00.11.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jun 2022 00:11:07 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH u-boot v2019.04-aspeed-openbmc] ftgmac100: Remove unnecessary cache flush
Date: Thu, 16 Jun 2022 16:40:59 +0930
Message-Id: <20220616071059.2741449-1-joel@jms.id.au>
X-Mailer: git-send-email 2.35.1
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

On AST2400 (ARM9) platforms this would warn when the d-cache is enabled:

 CACHE: Misaligned operation at range [4d79f8e8, 4d79f928]

The flushing is not required, as we perform a flush of the entire
descriptor after setting txdes0.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 drivers/net/ftgmac100.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/net/ftgmac100.c b/drivers/net/ftgmac100.c
index 92170f52434e..11404c45eb5f 100644
--- a/drivers/net/ftgmac100.c
+++ b/drivers/net/ftgmac100.c
@@ -473,8 +473,6 @@ static int ftgmac100_send(struct udevice *dev, void *packet, int length)
 	ulong des_start = (ulong)curr_des;
 	ulong des_end = des_start +
 		roundup(sizeof(*curr_des), ARCH_DMA_MINALIGN);
-	ulong data_start;
-	ulong data_end;
 	int rc;
 
 	invalidate_dcache_range(des_start, des_end);
@@ -490,11 +488,6 @@ static int ftgmac100_send(struct udevice *dev, void *packet, int length)
 
 	curr_des->txdes3 = (unsigned int)packet;
 
-	/* Flush data to be sent */
-	data_start = curr_des->txdes3;
-	data_end = data_start + roundup(length, ARCH_DMA_MINALIGN);
-	flush_dcache_range(data_start, data_end);
-
 	/* Only one segment on TXBUF */
 	curr_des->txdes0 &= priv->txdes0_edotr_mask;
 	curr_des->txdes0 |= FTGMAC100_TXDES0_FTS |
-- 
2.35.1

