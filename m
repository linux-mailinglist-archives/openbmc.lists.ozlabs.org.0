Return-Path: <openbmc+bounces-66-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E96E0AC5DDE
	for <lists+openbmc@lfdr.de>; Wed, 28 May 2025 01:51:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b6Ttp549Lz2yNG;
	Wed, 28 May 2025 09:51:46 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::42a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748312553;
	cv=none; b=SzT3lSdnk3e3evW/4nXHk6qjkL1j2psO+wGWoE4o8AmYBiZuL08+gHdHNMW6JcNq82vh92gywxxmp0p5Mv49rFvwWnvXrJWrmfkd+OrK9qlRia5rKOYxc9gEKL63tstvw0q61KWqUlhwTbr5W3+MA4FAFjd9y1FTaUz97o6A3O/Wbg8nxE5XQBqWuR/R8IQ8538hfJgoPbXHpVDOEzWEyRJlVOWVJUIvqrte4M7JRrSQdwvSM5OPUc9Y4z5vDKVXpamxDL5LcAeLbNZQ1G6hqh0jm887urdUIcxtXS/ewLBDHNOHDP88eLPjQFMARZ73iF/084o7amYNNVAwggxxkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748312553; c=relaxed/relaxed;
	bh=zZFVvRJY1fTqIBxgYmrtUDDZUclFNtpBJuPYEOpKE84=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QDbn70jlmjSmSb6gFptILTEQtL6E5NeaGBIvpyReqzcQn5RQautvTV+UrnUIDnnemRPTDx4PLEcxD4HvebF1RnDXFQefWVb6liOsTn/KwfnnQJUT3XQ+zE4Z0PC3wV3SCXxCpVzUBI9jV90sxvpLGR+aP1oERLSjM8nhSEUr/xzRWwTyoh8MtRHicRHfNbH/A0rsSiPYPGzCCXckKYQwSjj5xYoJJ/BsX7hpcTIp9lmWq7cegLRvbGNCyPzqOyik7pDTc0cYC/QLFjWEksbAisAsOJoRg8ByyID+lfsecjSlvTEIG9BioYqX3nL2HIpVE79EV2kbLfqRef6LnT5sPw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=MMVUGooC; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::42a; helo=mail-pf1-x42a.google.com; envelope-from=mohammed.0.elbadry@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=MMVUGooC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42a; helo=mail-pf1-x42a.google.com; envelope-from=mohammed.0.elbadry@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b5xHC69Z9z2xPc
	for <openbmc@lists.ozlabs.org>; Tue, 27 May 2025 12:22:30 +1000 (AEST)
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-74019695377so1706175b3a.3
        for <openbmc@lists.ozlabs.org>; Mon, 26 May 2025 19:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748312547; x=1748917347; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zZFVvRJY1fTqIBxgYmrtUDDZUclFNtpBJuPYEOpKE84=;
        b=MMVUGooCbywEGGTbiWGqoHc2ukYFHs2wjDtwqh4Fv3p00mlKZjtkf12wFjLYx8oaXw
         172bA9yFD7hDoNfH/bkt2ZtemIeNdkYRpKvHNWVh/KsgPYwnhrT5L6EB2TNelKttdtnX
         Rz26r6ggFbyKTcgz/cMit5TKcpjxd2iHJKQrq+unUZq3JJuWLnK0C9R0cjYYI0J1aVoT
         qOJyyG21NmE7RoQcRFRwxFkh4DUTNVnNQeTEjKNBakFHrMsXKKbUq5RGr/1s6iNcZrLS
         kTXJkgBrAOLbE9fcgu3mkDNK3kVG/eNBFwLJ4FfHHzhp7CLBX2CJFP1pIIgv1EEkWLDk
         UG9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748312547; x=1748917347;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zZFVvRJY1fTqIBxgYmrtUDDZUclFNtpBJuPYEOpKE84=;
        b=D/J4NSC8EfZUAq8MMIgjQSQDXmTMlW2A4yE39X1St9KZHykC3zZ7NlfVHJl1bmyNnT
         3oARDAYC7DBgGi9qqttZgVZ46KsgtCdwqBgKWUWveIMQhQzRp3Ox6uYxGCKXea4RFDYp
         d4MAowkp16uRWwoj5EaghqUTqPJr7dY85FsV7XHVuqtc4XqOJq4PCWaL+GSiJUEiXsBd
         SbxOqM0gtQ+OCyB7Ud4qSkb80+80EN/sw4UgRjVRbikUkXQV0FCAfRWvfj4Zxfd/Zjdx
         xn+LSeA/eibkuPtSdaov/svUYlM4gExUzxfLi9+K2wZ/GVUkXwoUd8eHD1/tl4KLUmUv
         /ZEw==
X-Forwarded-Encrypted: i=1; AJvYcCUzM7dg6M4zPpfBW9JgZtg6UFLW1Odh1WIu06D9uQCHwDFXIupLp0qTumKASsskkWMSJ8SmHpeC@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yz1OgXEQXQfmGC2zcfc2KJSxaMl6VLH0RT1v5C4XP/ZilntCvZv
	U87oc1zhWpHafJQAqpCnjBha5Pl67zSLyfF493L/KjoiOcMRJ4aDoPWY
X-Gm-Gg: ASbGnctHcV26KTrSCA74Bn93T/ubEv1eHWoUqMw0uBYf8CIcx78NhGWO3Eb73r9Xveo
	IT5QuPTIHG+4SwnvYDoPdX+xdPNqw5LGBsu4jS0Ncg5DhKluPU6+4rdVyCK7dMee1GCIVm3oZCE
	Z3EI2a2hR9Wwmwk4JVtyw7XTcan2E8NAhhH+eJ8YI6nanpZMRK/XQ8K+bYpVci8PXH4x6yaIQQf
	oE/0RwQYDvc2KA/jTNXKfjbOcqyYApwFj8cFv8rSFUc43d7feYM3Ig+9KlPTgBRxhZsiJASEXCH
	P+eN9bN3w4830ZK1mZd/6E2/Q9GcuIHVsJUxoM8UUqoInkcXt4h1ZJuB7xzWOhKeY2VJahmDm8l
	ZdPVlILgeClZVuHuFgp/u/x7L4Is/1oebn9ckSQLFjjl6sA==
X-Google-Smtp-Source: AGHT+IFiuntnsnK15d+0mwYVXj7s4P44ohb8smQc2OgNgWwbXnwz5k1zyE7Ux7qber3BmRexfWOpAQ==
X-Received: by 2002:a05:6a00:4646:b0:742:ae7e:7da8 with SMTP id d2e1a72fcca58-745fdfcc5e9mr16452708b3a.8.1748312547237;
        Mon, 26 May 2025 19:22:27 -0700 (PDT)
Received: from localhost.localdomain (c-98-42-219-30.hsd1.ca.comcast.net. [98.42.219.30])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a982a08esm17664706b3a.112.2025.05.26.19.22.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 26 May 2025 19:22:26 -0700 (PDT)
From: Mohammed Elbadry <mohammed.0.elbadry@gmail.com>
To: 
Cc: avifishman70@gmail.com,
	tmaimon77@gmail.com,
	tali.perry1@gmail.com,
	venture@google.com,
	yuenn@google.com,
	benjaminfair@google.com,
	andi.shyti@kernel.org,
	openbmc@lists.ozlabs.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Subject: [PATCH v5] i2c: npcm: Add clock toggle recovery
Date: Mon, 26 May 2025 19:22:23 -0700
Message-Id: <20250527022223.78371-1-mohammed.0.elbadry@gmail.com>
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
index de713b5747fe..0757a23dc1cd 100644
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


