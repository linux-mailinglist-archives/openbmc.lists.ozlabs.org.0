Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E6098B465
	for <lists+openbmc@lfdr.de>; Tue,  1 Oct 2024 08:30:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XHp2l2yRWz3g4l
	for <lists+openbmc@lfdr.de>; Tue,  1 Oct 2024 16:30:07 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::429"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727764199;
	cv=none; b=Z+60oOIVJ81s5rRTtd8J6s6KOUSKK42TJSFSbroKY2mo/nUYzUyh5VgOfpbyt/s1dCUbf0aOioxnCN6VvTvBUicjfpWpTFbVAD4GPWj4W1B0hXIspimej3N4l4sB/0yrSuvUU1xxnZ6wAeJoPojc0l0DP50oaKTKxV1f6jXg0cRHcF17Xv0khVOkCFNcVlX5PPhnL6NS9PL6TbmzpL421eI99EVjEinyp3pBcIxseT4GZp9IhFKpk86V3EyRfnSxAa7pa5nzgP5KpAmwEGELMk/rZOD2u9Xo/nluMKd5dOZuc1n3ZtKsZ9ao9z/vGWaE2DcjS8uDrNXwkcZVfKLGWg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727764199; c=relaxed/relaxed;
	bh=vCToa1pjp5BirUNjWfkXpacYwQOG9xkkvltlLzTKSjY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=TA6zRtJ7Hq+JAlyEDXVgjeQwEIoZjUVjbGOqR5eSy3nD+0oDVGPeEr3ejcSWK1hKPdWHRk3rETuq/thhyZelu+vZPIrhKIBMkH6OAth/9g1OkUSdTJj3I4a8igRU604R6hBWQYFNAIaD1kwXOvHhpZHmEgqYHuR6TTIz0HK76PuTiF6xBwNReMDrg3P4Ddv6zYp7VjAygeXq4XC3DXd349Ucw+9QoKJ6qanZFzoFXqQEms2CRf+aDZnPMmUw4Sn2FKAeqeSLy1zl31MNm2EaJIDcBXJbw53xqVjKpsq1R1G1xJikTM90QhByeme6O7A0/GSW8uQbOglgE9x0NwdRaA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=O1Y0ig3k; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::429; helo=mail-pf1-x429.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=O1Y0ig3k;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::429; helo=mail-pf1-x429.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XHp2Z64Zhz3fVp
	for <openbmc@lists.ozlabs.org>; Tue,  1 Oct 2024 16:29:58 +1000 (AEST)
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-71b070ff24dso4582100b3a.2
        for <openbmc@lists.ozlabs.org>; Mon, 30 Sep 2024 23:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727764197; x=1728368997; darn=lists.ozlabs.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vCToa1pjp5BirUNjWfkXpacYwQOG9xkkvltlLzTKSjY=;
        b=O1Y0ig3ko3YTFEw30UgqJSwDnDjieQKK2RIJG9MgEAkbaEJx2JvsYJnRCx9zt+H3M+
         TD0kkBG3naNLFir9wSlMOcaqsyKCtzR2+E0w3QkvgoMHQ4g4HjJpPs9WAe+OyhwUiRDm
         0jw1Ctru40la+jQewa7jQ9ab/Esw7i2SuiiDdaUI3arlORq0huRxd1/Y3vj9d8TeRuEi
         ZkNGFQCoipW8rEAFxaZnhxQBGjWRbVHXU2GRkRgCFevUKCuw0DYKcWFQTj1l/rmEy9HX
         bK9yePvZYIs344fcLsEVAbixTCxBw+54CwaA8b5ea9U4rupy2haDmemhV7165tf1qGP8
         NZ4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727764197; x=1728368997;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vCToa1pjp5BirUNjWfkXpacYwQOG9xkkvltlLzTKSjY=;
        b=NvmsQ3EPttltw72tCQSED4pVhSadnJvsjWtpXWypos9FGNs4Bu6ZQN0TjzHQ8KDi7T
         uB4nZnG0iVqAuWdSuI3Gd8fL5Lx+gDBRHjqkwoMOIsx3trlnvmxkrIJt0cJ9uS3z/a+S
         wHMqXrUMqqXVfk8pXIZ7J01sCzr6vQqfPp3S3uTKIzKYXJlUXMD2skwsO1OpZ2qt9NPj
         JoOL2xItfb1MxV+EEZGEEoAvO/ywmenNdwnXlKPl/eLZtDe6Uquqq4WFRMVAEKCWnhdr
         +kkM1vmVFA46prB4LkEarveqM4kdX6gV4SpHOPtCCeSKzD9NZL/UEFMP/oXQ4YYwG4EC
         HymA==
X-Gm-Message-State: AOJu0Yw24P6PZTukdokCWbk8PKVrTaGCn0HWCOCYxuyNTnIYf3iFe6+6
	pULJoEu0B+m7hl2SUt4M7F6izLqDIODsg+uHOtF4JDK9PUlIDpE=
X-Google-Smtp-Source: AGHT+IFYXUPQMked64r/OKkWQ4ip1SeDQ9qqr8pVe+NEbLmATxtjewrRe7p5N32WGEjBTzYrpoL6rg==
X-Received: by 2002:a05:6a21:e85:b0:1cf:37f8:7a1f with SMTP id adf61e73a8af0-1d4fa6358b3mr21680011637.6.1727764197089;
        Mon, 30 Sep 2024 23:29:57 -0700 (PDT)
Received: from localhost (2001-b400-e30e-7f15-c94a-d42b-025a-8ff3.emome-ip6.hinet.net. [2001:b400:e30e:7f15:c94a:d42b:25a:8ff3])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71b264bb694sm7313243b3a.65.2024.09.30.23.29.56
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Sep 2024 23:29:56 -0700 (PDT)
From: Tyrone Ting <warp5tw@gmail.com>
X-Google-Original-From: Tyrone Ting <kfting@nuvoton.com>
To: avifishman70@gmail.com,
	tmaimon77@gmail.com,
	tali.perry1@gmail.com,
	venture@google.com,
	yuenn@google.com,
	benjaminfair@google.com,
	andi.shyti@kernel.org,
	andriy.shevchenko@linux.intel.com,
	wsa@kernel.org,
	rand.sec96@gmail.com,
	wsa+renesas@sang-engineering.com,
	warp5tw@gmail.com,
	tali.perry@nuvoton.com,
	Avi.Fishman@nuvoton.com,
	tomer.maimon@nuvoton.com,
	KWLIU@nuvoton.com,
	JJLIU0@nuvoton.com,
	kfting@nuvoton.com
Subject: [PATCH v5 6/6] i2c: npcm: Enable slave in eob interrupt
Date: Tue,  1 Oct 2024 14:28:55 +0800
Message-Id: <20241001062855.6928-7-kfting@nuvoton.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20241001062855.6928-1-kfting@nuvoton.com>
References: <20241001062855.6928-1-kfting@nuvoton.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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
Cc: openbmc@lists.ozlabs.org, Charles Boyer <Charles.Boyer@fii-usa.com>, Vivekanand Veeracholan <vveerach@google.com>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Charles Boyer <Charles.Boyer@fii-usa.com>

Nuvoton slave enable was in user space API call master_xfer, so it is
subject to delays from the OS scheduler. If the BMC is not enabled for
slave mode in time for master to send response, then it will NAK the
address match. Then the PLDM request timeout occurs.

If the slave enable is moved to the EOB interrupt service routine, then
the BMC can be ready in slave mode by the time it needs to receive a
response.

Signed-off-by: Charles Boyer <Charles.Boyer@fii-usa.com>
Signed-off-by: Vivekanand Veeracholan <vveerach@google.com>
Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
Reviewed-by: Tali Perry <tali.perry1@gmail.com>
---
 drivers/i2c/busses/i2c-npcm7xx.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
index 2ed69e92edf6..90a6e6842c6b 100644
--- a/drivers/i2c/busses/i2c-npcm7xx.c
+++ b/drivers/i2c/busses/i2c-npcm7xx.c
@@ -1925,6 +1925,12 @@ static int npcm_i2c_int_master_handler(struct npcm_i2c *bus)
 	    (FIELD_GET(NPCM_I2CCST3_EO_BUSY,
 		       ioread8(bus->reg + NPCM_I2CCST3)))) {
 		npcm_i2c_irq_handle_eob(bus);
+#if IS_ENABLED(CONFIG_I2C_SLAVE)
+		/* reenable slave if it was enabled */
+		if (bus->slave)
+			iowrite8((bus->slave->addr & 0x7F) | NPCM_I2CADDR_SAEN,
+				 bus->reg + NPCM_I2CADDR1);
+#endif
 		return 0;
 	}
 
-- 
2.34.1

