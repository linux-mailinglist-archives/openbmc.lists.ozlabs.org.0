Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BCF53C97CA
	for <lists+openbmc@lfdr.de>; Thu, 15 Jul 2021 06:53:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GQMT34YG8z2yyv
	for <lists+openbmc@lfdr.de>; Thu, 15 Jul 2021 14:53:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=ihLExhTz;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::429;
 helo=mail-pf1-x429.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ihLExhTz; dkim-atps=neutral
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GQMSk4dt6z2yLZ
 for <openbmc@lists.ozlabs.org>; Thu, 15 Jul 2021 14:53:09 +1000 (AEST)
Received: by mail-pf1-x429.google.com with SMTP id m83so4014083pfd.0
 for <openbmc@lists.ozlabs.org>; Wed, 14 Jul 2021 21:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=k22hBKYlnIMKDedOnGwh/GHM33U7oWrChfZREv5xryg=;
 b=ihLExhTzbm06nE3xkXVAXp04i+65KHs0/7bNfrBBIaDc86EWWbflfDo6f2arq5VStW
 PlzhBKb2q/13ikMS07KsdukjwBxhxL0LjCcr58kAfOEDTEmwzx1InvvuMszkyGqOGemw
 rPITVpnKR7M+Ibx1VIH1bPWd5uAA4H3GQj9jCM7eZboGuM0pN63nQgzvVSJ0lJODj1tB
 3pU2VDS5wM3LFD66CiGB8Q0Hrr9MyBTlx4p9VelXyifMWxowaswLVOa47b5SCiFb2n9/
 D4rQWuqW1v4mo9zdjchgSHowmKTnvT0kRF+mxNF7qPvNCCE6SVHsXxD9CHGHaoJ0Z4hk
 7Llw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=k22hBKYlnIMKDedOnGwh/GHM33U7oWrChfZREv5xryg=;
 b=qbn7g+QFD9BOFT9J6A686ti4xwxCMNEh2b9b0FF9qw6l+2IYiJRzpj7mI+ffMB2fgK
 hY7mTgIb0/wg2H5DEL0gMPTVaBRpljTs4BDMSXtWIgAl/Sie9RutMffl2z2wPEZ/mXY8
 WjTmzWeIGrOyLPzXOi2oRXuh3foEs4FljbFoukc7sau3RbbYtkKCqDzBN/MoCDJ+q44S
 p6iLuF/3zpa/+tJ8cXuUSrgRIS3Da2XseMkawSmNA319w8aGg8hVNF7p2XCmPswtvxvz
 AUMan9NgWgQg+5lNfHJHEDHrBRraPFd/s0csll3mNTai+2Zlc9GUmcWq7hK2jE9uIYxQ
 aWAQ==
X-Gm-Message-State: AOAM530R1d/d0Xm2FqgM6Me+rxapVx+Z97l8NCoaRlUX2+26OOsLugd5
 1TJ7ZS9VjePY0720uQhMIH6HLcrjV2s=
X-Google-Smtp-Source: ABdhPJzEce/YygIisvi6YB15YP+yZi72zWFucup+H3E1vcv8Ibd2uve+5WsPFi/nDZG95yhXqORDJA==
X-Received: by 2002:a62:8209:0:b029:32e:54d4:7e27 with SMTP id
 w9-20020a6282090000b029032e54d47e27mr2221976pfd.10.1626324785351; 
 Wed, 14 Jul 2021 21:53:05 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id g18sm4437990pfi.199.2021.07.14.21.53.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 21:53:04 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org
Subject: [PATCH u-boot v2019.04-aspeed-openbmc] aspeed/hace: Reset when error
 occurs
Date: Thu, 15 Jul 2021 14:22:58 +0930
Message-Id: <20210715045258.13912-1-joel@jms.id.au>
X-Mailer: git-send-email 2.32.0
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Adriana Kobylak <anoo@us.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Some hasing operations have been triggering an error state.

This can be reproduced on the u-boot command line:

hash sha512 83000128 3762a8

This completes, and the hash is correct. However HACE1C, the status
register, shows an error bit is set 0x00800000.

$ bitfield HACE1C 0x00800000 |grep 0x1
                 Hash input data buffer overflow: 0x1

The next operation is queued, and this never completes. The status
register shows 0x00c00001

$ bitfield HACE1C 0x00c00001 |grep 0x1
                 Hash input data buffer overflow: 0x1
                 Hash input rorate data overflow: 0x1
                                Hash engine busy: 0x1

A HACE reset will clear this state:

mw.l 0x1e6e2040 0x10
mw.l 0x1e6e2044 0x10

Adding code to do this if any error bits are set in the status register
is a workaround for the issue while further debugging is done.

Another workaround is to do an operation before running the problematic
operation. This sequence succeeds:

hash sha512 83000000 10
hash sha512 83000128 3762a8

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 drivers/crypto/aspeed_hace.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/crypto/aspeed_hace.c b/drivers/crypto/aspeed_hace.c
index a99fb7c249be..f40779c08816 100644
--- a/drivers/crypto/aspeed_hace.c
+++ b/drivers/crypto/aspeed_hace.c
@@ -100,9 +100,18 @@ static int digest_object(const void *src, unsigned int length, void *digest,
 	writel(HACE_SHA_BE_EN | method, base + ASPEED_HACE_HASH_CMD);
 
 	/* SHA512 hashing appears to have a througput of about 12MB/s */
-	return aspeed_hace_wait_completion(base + ASPEED_HACE_STS,
-			HACE_HASH_ISR,
-			1000 + (length >> 3));
+	aspeed_hace_wait_completion(base + ASPEED_HACE_STS, HACE_HASH_ISR,
+				    1000 + (length >> 3));
+
+	if (readl(base + ASPEED_HACE_STS)) {
+		debug("\nHACE error 0x%08x, resetting\n", readl(base + 0x1c));
+
+		writel(0x10, 0x1e6e2040);
+		mdelay(5);
+		writel(0x10, 0x1e6e2044);
+	}
+
+	return 0;
 }
 
 void hw_sha1(const unsigned char *pbuf, unsigned int buf_len,
-- 
2.32.0

