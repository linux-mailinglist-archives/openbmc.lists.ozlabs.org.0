Return-Path: <openbmc+bounces-67-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B9268AC5DE1
	for <lists+openbmc@lfdr.de>; Wed, 28 May 2025 01:52:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b6Ttr46Kxz2xHv;
	Wed, 28 May 2025 09:51:48 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::435"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748315131;
	cv=none; b=iNc2whVPeP7/OQuqKftD3awGSR+LGAG1/OCPIN0w7DISsEp86JY1FgFMHrP7MEkkh+Wf5PDG144hB1a0Url4dRohuvmOzsZcsZb/vEhrHaWRUjMwCMSCUy5emYXek2lpEo2cyfWHBRz95kgBH2XUHQKZWFj6byfxBAORI85dP8BN07s9ztsH+WGg/T/ok/UuZ3EIMIBWa9DZT/VPSZt7bmFrZW57YEKu45niZJBpWUHW1K3AYAnz0s96ND9ZIc9BGdmHNnHJ9jblEmWb7dLJX0eNj4TnzZZx75qcGBbMvp9WuD7ejUgXmPGSi0iISvt9gRevMsrSzFoPrZiZmi3z9A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748315131; c=relaxed/relaxed;
	bh=px18dyVutpW04jql0iY32hxuCKS/qRCICcni9mYoXKc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=F1b3GGkPORSFb6DhwWQZU5X+OItYZ4FVVsRX8u+ZnRotRhNjw4vpwZYksBltA65Giq813kmESYZO+/34dSXPHA8ep4mGG23X24x9lDHoctbPSCplgijTP5XDgVumE4Q9HFoe6Ly64UMaEBAcWIK+3ItEeTdZjszSTJMT3aJMK6IDL/BzKjHGSgZwXxcZXtBoJC27B6u5g3Oz+hg3TDWD8Lcsu2ufa3FYhROvuIqRjOl/WfJjpPYZi3ktPqfOpHWD6/GyAzaGeKw58MPWYiCXs6TvGZWx+c4eeU6Q5t1cLlhI9H66Uee3wco2oZ24igzVQZ7d2OCRpxNsxUUQbbS/lg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Y873sIt2; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::435; helo=mail-pf1-x435.google.com; envelope-from=mohammed.0.elbadry@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Y873sIt2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::435; helo=mail-pf1-x435.google.com; envelope-from=mohammed.0.elbadry@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b5yDp175yz2xPc
	for <openbmc@lists.ozlabs.org>; Tue, 27 May 2025 13:05:28 +1000 (AEST)
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-742af84818cso1625592b3a.1
        for <openbmc@lists.ozlabs.org>; Mon, 26 May 2025 20:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748315127; x=1748919927; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=px18dyVutpW04jql0iY32hxuCKS/qRCICcni9mYoXKc=;
        b=Y873sIt2EUQxUa1O1BrzGS1ayu+U+xMajz4U3S65XbJBFt9E1uI88ZrIs7R21MiOUP
         RWHRRZ+E5MJRHRY3inYoFmHJ2tcusArTJHS7R8FhvQMYewfn8OuWxScd45RR75QutRbW
         ESDRFac2/lyh/78m8kvn3Qyh3lXvhXzycfgMnQx0G/mdC759j0IDavp4aoVRSbqTgqt/
         4eiw2AYDMgH4Jw2XsDBYznxwD/+UfOV/v8Ipa9ei3ubSYJKUxM8/c8iUnKJiFjvhAlT8
         tLLlLaSbF2mkE9banugavRbgr2dRYv0RYNi8ZVUkhUIcjYhTmhWWvkvQP5dHPKamxmSa
         2DAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748315127; x=1748919927;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=px18dyVutpW04jql0iY32hxuCKS/qRCICcni9mYoXKc=;
        b=W4xqla4TqgU9xDmfPkdjdADrc/qL0RB73qf+jnGy48/noK1lZrMo/Jjk4SzONm/RyD
         cy1T7XdiSRo7Das5l6zIAJd4L4UAFZF3SzdX8myJIlIxVYipzoQgTcxLHjrLg1Rd2JEg
         z05AS5jK4RrMuXZhhHwOWtmuqLDrnPG/lCU7bym7XkIeDV9doCkHWr7pbgQKUY5vBacl
         VscNtZf1qFLpuiB1HKAkvs6uA2aRJ//vMMK32i6p1lXHWPMYqP82exw8j5oWYCbdyHZe
         AJFJeG6BFioqdfkNHP7ypHTdh0emN1m726lvZezI6YP/Xv7If8DULt2Bognt4hPuRpGn
         UN/w==
X-Forwarded-Encrypted: i=1; AJvYcCWMs/Xh30bgrr/gYti0SuSi5AHQ7B9ksEZhbBtxd8skL/fHQB9ChbN8rnZznpMOpoUxxRLzXQBL@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yy+IzHQk9PjH3Id7DS59dlonjnhughFoMYDPLF3mrCVoZfCGjO9
	yRxH9Fkt/wkCl9byA/fYzdBPUv94gMJQH2boNE+U9PkZ40Ih+0yjJHJh
X-Gm-Gg: ASbGncslgmlNUOBCaUI08kejL1F/obyWnuEYsphHy/TXYxKLOgr1u5+H/FHoO1hcd3m
	dQxFIWlxDC+QM422Kin44qvND3bv17vPWJ+7iwkjYM0066HenepR4ZwCYB3SpfLvLh1N/Sqq2y2
	PERR4Hn0HPcMqY6a2RA5qz4P4RMcRJt9Gt9KFXs+kiCCegmbQMsLv1Ia+3flgVSqmgXopJvB3Yd
	li3fB8HuIlAsyw9uB8KQQXLGInblZ/wfT5xQctLXut2gCFW1xXsM4/PnIF1o7Fr60fnwUpVB1gD
	Fy+66IZvzi0RgKk8CvTvSAPdILDenjTcKY94o/0QNNQq1wnAsXud0zajVxRZfjyjZdgbLY9uFTP
	D1uEth7jHSzES54oUgWJGypIoH9p3lbAY/zaC2WiL13wF9w==
X-Google-Smtp-Source: AGHT+IHmDWSNgOWD3RT3qzb5/6qFfdTgixyLmXH8JgP9ZhrNAHtazORpFUC9JcRw5L/IBtc0xjYmGw==
X-Received: by 2002:a05:6a00:1383:b0:742:da7c:3f27 with SMTP id d2e1a72fcca58-745fdb4c492mr16827503b3a.0.1748315126741;
        Mon, 26 May 2025 20:05:26 -0700 (PDT)
Received: from localhost.localdomain (c-98-42-219-30.hsd1.ca.comcast.net. [98.42.219.30])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-746029d0b57sm4532201b3a.19.2025.05.26.20.05.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 26 May 2025 20:05:25 -0700 (PDT)
From: Mohammed Elbadry <mohammed.0.elbadry@gmail.com>
To: andi.shyti@kernel.org
Cc: avifishman70@gmail.com,
	tmaimon77@gmail.com,
	tali.perry1@gmail.com,
	venture@google.com,
	yuenn@google.com,
	benjaminfair@google.com,
	openbmc@lists.ozlabs.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Subject: [PATCH v5] i2c: npcm: Add clock toggle recovery
Date: Mon, 26 May 2025 20:05:06 -0700
Message-Id: <20250527030506.79191-1-mohammed.0.elbadry@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250328193252.1570811-1-mohammed.0.elbadry@gmail.com>
References: <20250328193252.1570811-1-mohammed.0.elbadry@gmail.com>
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Tali Perry <tali.perry1@gmail.com>

During init of the bus, the module checks that the bus is idle.
If one of the lines are stuck try to recover them first before failing.
Sometimes SDA and SCL are low if improper reset occurs (e.g., reboot).

Signed-off-by: Tali Perry <tali.perry1@gmail.com>
Signed-off-by: Mohammed Elbadry <mohammed.0.elbadry@gmail.com>
Reviewed-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
---
 drivers/i2c/busses/i2c-npcm7xx.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
index de713b5747fe..4738fc450a6b 100644
--- a/drivers/i2c/busses/i2c-npcm7xx.c
+++ b/drivers/i2c/busses/i2c-npcm7xx.c
@@ -2178,10 +2178,15 @@ static int npcm_i2c_init_module(struct npcm_i2c *bus, enum i2c_mode mode,
 
 	/* Check HW is OK: SDA and SCL should be high at this point. */
 	if ((npcm_i2c_get_SDA(&bus->adap) == 0) || (npcm_i2c_get_SCL(&bus->adap) == 0)) {
-		dev_err(bus->dev, "I2C%d init fail: lines are low\n", bus->num);
-		dev_err(bus->dev, "SDA=%d SCL=%d\n", npcm_i2c_get_SDA(&bus->adap),
-			npcm_i2c_get_SCL(&bus->adap));
-		return -ENXIO;
+		dev_warn(bus->dev, " I2C%d SDA=%d SCL=%d, attempting to recover\n", bus->num,
+				 npcm_i2c_get_SDA(&bus->adap), npcm_i2c_get_SCL(&bus->adap));
+		ret = npcm_i2c_recovery_tgclk(&bus->adap);
+		if (ret) {
+			dev_err(bus->dev, "I2C%d init fail: SDA=%d SCL=%d\n",
+				bus->num, npcm_i2c_get_SDA(&bus->adap),
+				npcm_i2c_get_SCL(&bus->adap));
+			return ret;
+		}
 	}
 
 	npcm_i2c_int_enable(bus, true);
-- 
2.39.5 (Apple Git-154)


