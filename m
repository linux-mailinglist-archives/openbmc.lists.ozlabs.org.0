Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4124694A51F
	for <lists+openbmc@lfdr.de>; Wed,  7 Aug 2024 12:10:00 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=N8dGHlmZ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wf5Wp191Yz3cm7
	for <lists+openbmc@lfdr.de>; Wed,  7 Aug 2024 20:09:58 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=N8dGHlmZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::531; helo=mail-pg1-x531.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wf5P15467z3dFL
	for <openbmc@lists.ozlabs.org>; Wed,  7 Aug 2024 20:04:05 +1000 (AEST)
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-7a92098ec97so1336089a12.2
        for <openbmc@lists.ozlabs.org>; Wed, 07 Aug 2024 03:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723025043; x=1723629843; darn=lists.ozlabs.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1JQZAPTxcfDOXPbIWl9UOyALCV+YMvtNIVhFTIQlcJQ=;
        b=N8dGHlmZgp61AmJWBiXlS09r0z51pd9RpuiLLT+xpQp8BuzlL+AwH1YA+UOD3x0Y6c
         OyImTo7eZwq0wxv+P++22vzRJ3PYwfUu5h5/oumqPeuSC2qgtUtfC2uPT318MmDDHAJ1
         6ky82FqDHUrAbtMjWRdZ9My3Gmrjw0B2xrDrLqWOJnSJ+1q/qEldDf9Pvew5GawfcCJN
         mJHgUe50uF2Dl55XhYpQ8m4s5aNma0bJqG7V9MsI+/O75b0aMdQWHsyjGi0A2Am9k5xt
         39sA//VF7kcPZOW9cVlcLTnrToOCGd8kMpst83tamGROCHytAPD1OiYDWPCfTbicqpSU
         8gcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723025043; x=1723629843;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1JQZAPTxcfDOXPbIWl9UOyALCV+YMvtNIVhFTIQlcJQ=;
        b=IhfIJLoqrYk6Fe1gl56npRyyrDRxbKCpIXf5YGi+ahKcmofpQyDPsFdULf/83x/nrl
         WDcvxMqgs7p6VjwafPlCoe2rcXTFpSe27L668A2aSJC4+VC8u3fFkerZR/DxEv2wGBaP
         h9ch7fZWZOfrLatIqhsHEHouxQ0rM1aS1/SvxXbEzUJ+McuCpE/MY+Z5SMTU6jpV54Q1
         xYR5yEVaBJW5i5bNFtHcE6x7wASk3uo30/qoHs+EItO9+ag7KzMKITlVRhPTyNwBvpNw
         QvM6lD6KDD4u7cXWthYu+CwProeRpmsNl18Ty1M7JoUeGULfRFvOGPXWuzlrsSJ4mfCr
         Vqow==
X-Forwarded-Encrypted: i=1; AJvYcCWiM4I+e3oxLeJdo5cRHz0hXt+Eu17vpa4VdJ2wZ4VIWeB+V2pT1mEPyDuJPY1rskRxvf/bjtDC2MlxyOk8+h6WbiA53nHXQPA=
X-Gm-Message-State: AOJu0YxlyyFbkK2ub923TuptXBLoUKNJwZK2O27V5mkJSCqxZx7MEJuz
	bJQ735kjC9ZUM58znQYptEgQjj3QLvOc8mfRnmgdFdDcXPz/sh0=
X-Google-Smtp-Source: AGHT+IHLo+ice5A1u5x85W8GsjViC9J2LkR5NJKcSzy4BETbX/PdHIGxniL82sI4lZtiaksXi+tBjg==
X-Received: by 2002:a05:6a20:7346:b0:1c4:986a:de71 with SMTP id adf61e73a8af0-1c69960e1a1mr20396150637.35.1723025043040;
        Wed, 07 Aug 2024 03:04:03 -0700 (PDT)
Received: from localhost (2001-b400-e352-b705-880f-4661-e7a1-4abb.emome-ip6.hinet.net. [2001:b400:e352:b705:880f:4661:e7a1:4abb])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7106ed15a42sm8111594b3a.182.2024.08.07.03.04.01
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 07 Aug 2024 03:04:02 -0700 (PDT)
From: warp5tw@gmail.com
X-Google-Original-From: kfting@nuvoton.com
To: tali.perry@nuvoton.com,
	Avi.Fishman@nuvoton.com,
	tomer.maimon@nuvoton.com,
	avifishman70@gmail.com,
	tmaimon77@gmail.com,
	tali.perry1@gmail.com,
	venture@google.com,
	yuenn@google.com,
	benjaminfair@google.com,
	andi.shyti@kernel.org,
	wsa+renesas@sang-engineering.com,
	rand.sec96@gmail.com,
	kwliu@nuvoton.com,
	jjliu0@nuvoton.com,
	kfting@nuvoton.com,
	warp5tw@gmail.com
Subject: [PATCH v1 7/7] i2c: npcm: fix checkpatch
Date: Wed,  7 Aug 2024 18:02:44 +0800
Message-Id: <20240807100244.16872-8-kfting@nuvoton.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240807100244.16872-1-kfting@nuvoton.com>
References: <20240807100244.16872-1-kfting@nuvoton.com>
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
Cc: openbmc@lists.ozlabs.org, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Tyrone Ting <kfting@nuvoton.com>

Fix checkpatch warning.

Fixes: 48acf8292280 ("i2c: Remove redundant comparison in npcm_i2c_reg_slave")
Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
---
 drivers/i2c/busses/i2c-npcm7xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
index 1af6a927b9c1..dbe652d628ee 100644
--- a/drivers/i2c/busses/i2c-npcm7xx.c
+++ b/drivers/i2c/busses/i2c-npcm7xx.c
@@ -1783,7 +1783,7 @@ static int npcm_i2c_int_master_handler(struct npcm_i2c *bus)
 		/* reenable slave if it was enabled */
 		if (bus->slave)
 			iowrite8((bus->slave->addr & 0x7F) | NPCM_I2CADDR_SAEN,
-				bus->reg + NPCM_I2CADDR1);
+				 bus->reg + NPCM_I2CADDR1);
 #endif
 		return 0;
 	}
-- 
2.34.1

