Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AAD2D84C2AC
	for <lists+openbmc@lfdr.de>; Wed,  7 Feb 2024 03:48:38 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=SK3eDk2b;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TV4LX4Jd8z3bw2
	for <lists+openbmc@lfdr.de>; Wed,  7 Feb 2024 13:48:36 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=SK3eDk2b;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::130; helo=mail-lf1-x130.google.com; envelope-from=rand.sec96@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TTttz0pZ1z3cB2
	for <openbmc@lists.ozlabs.org>; Wed,  7 Feb 2024 06:42:33 +1100 (AEDT)
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-511612e0c57so1217372e87.2
        for <openbmc@lists.ozlabs.org>; Tue, 06 Feb 2024 11:42:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707248546; x=1707853346; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eWGkE/O3QdNQnmc268O5sKVqO5KYwMpumGh7IlwPz/A=;
        b=SK3eDk2braBm476cc97wJo3qsHGjn1xnKnQ/txJoMkDiymiNz0V33KuvwKBawwXuVz
         VvcsVHhKQ1yEDwBabMyr3MCrUoE+514PIUHMB140aSmsfZrYWOpwpS/6jsYziwwOJh1A
         00RBTrWvVeOrHT6k/salBt8cgi5q43j+8stin7TrPR79V6bDT6wPox2GtqAtjC1KsptD
         nu5OqoVAuFtEbKmfcJG0W33WdDe9HglQgzTk/59B1AAyq3sjdKiNkQ6SsRyRECNsNENX
         ws94wOn5ESPZzN5rVDcJu+DVFK7LLHkk1auZHFTd6K2bQNZXodLMxjZjGoxebb69+T+7
         6Hfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707248546; x=1707853346;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eWGkE/O3QdNQnmc268O5sKVqO5KYwMpumGh7IlwPz/A=;
        b=S7s0B+fM6MvVwfxtWQTFRfLyrbLRP1q/Am1xIVf4pSZOuOee0pc7GWG6WvXhSKa1/Z
         CQ2iMDtP88EAqs96QnjVSY9SjzO/DIMMi7nm53yCTCmvbifVF7f3CnfrUPB9Tw32OjwV
         HVKzLUyBZMNR/si13kKfVqzNkf5TVTCXv7xUWddQDf5Nui4xheYmGPaTtoGtLzzm78Xc
         ozYmbV46vn2NH1BW/yYXv/iFuBhPkHq5a5fOLoOCvkOUZjnnoLQPzhav3fW78vdDYhOk
         DK9ruF6SfwfKERd+i+a+GtAUfuQBWMELIpJojPbKZN048Pp+vYyplOhhOQtdNGAdDKp6
         ljOg==
X-Gm-Message-State: AOJu0Yz97dWeDTjhF/hQc/K93hdiW5CYZ6bvu3cXXuo43fnXOvjhifH0
	vXLg8lWLpPHP8j6WUQLqDsgaNSuwFLJOurU+hnukyww9sN9UQnQN
X-Google-Smtp-Source: AGHT+IE7qevWSjL8dZocgLqsAfOGZXBUdZnhZIDLJrbJ5gp+vAPBcJr9RN8VTY1CGdMesP+xRq4odA==
X-Received: by 2002:ac2:5f8e:0:b0:511:4f00:45b2 with SMTP id r14-20020ac25f8e000000b005114f0045b2mr2029806lfe.25.1707248545910;
        Tue, 06 Feb 2024 11:42:25 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXUVAWc+6q004yovkdqQYOAJoHZ+Kon+sQNc0F1CW4Y65FY5PoMZqCbf5ehtHMwBb7jV/8xV5gfNxiubKHO9FL/z8DhVg7fQnyPrUFGy/YXvEedjYDCo+R1xM1Df392uLlu/mkXHbw7ylZSGciLWTr/5orAigaXGH9Jezut+c/+HcCJEbeGrdHO6cjc7rED9TBZ+PQ+vE4E3bx9/aAzioi/x3j6oDEmM9N7cDJrLXMmOI4JhwEilWmKr3rzqQq9kydblQBtnoJuoEkH3Ebuk/WY8+ENtn0Ur16IHHV3bfM1OUgZYi9qj493KFhjpw1EGNxgTfmv8Ct0lUOQxPDIgc6DEDZn4ByySzKWioyvMjZINerb/leStX7PdNpgZcDdymgeffyFkcfFLcMuBA6I9T1TsjQkcF+zAEAVg2a+61gZhDD17Qy+
Received: from rand-ubuntu-development.dl.local (mail.confident.ru. [85.114.29.218])
        by smtp.gmail.com with ESMTPSA id v20-20020ac25934000000b005115eec02d0sm234324lfi.234.2024.02.06.11.42.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Feb 2024 11:42:25 -0800 (PST)
From: Rand Deeb <rand.sec96@gmail.com>
To: Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>,
	Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	openbmc@lists.ozlabs.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] i2c: Remove redundant comparison in npcm_i2c_reg_slave
Date: Tue,  6 Feb 2024 22:42:01 +0300
Message-Id: <20240206194201.10054-1-rand.sec96@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 07 Feb 2024 13:48:09 +1100
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
Cc: voskresenski.stanislav@confident.ru, deeb.rand@confident.ru, lvc-project@linuxtesting.org, Rand Deeb <rand.sec96@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

In the npcm_i2c_reg_slave() function, there was a redundant
comparison that checked if 'bus->slave' was null immediately after
assigning it the 'client' value. There were concerns about a
potential null dereference because of `client->adapter`, but
according to Wolfram Sang, "we trusted ourselves here" Therefore,
this comparison is unnecessary.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Signed-off-by: Rand Deeb <rand.sec96@gmail.com>
---
 drivers/i2c/busses/i2c-npcm7xx.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
index c1b679737240..bdf35b86e559 100644
--- a/drivers/i2c/busses/i2c-npcm7xx.c
+++ b/drivers/i2c/busses/i2c-npcm7xx.c
@@ -1247,9 +1247,6 @@ static int npcm_i2c_reg_slave(struct i2c_client *client)
 
 	bus->slave = client;
 
-	if (!bus->slave)
-		return -EINVAL;
-
 	if (client->flags & I2C_CLIENT_TEN)
 		return -EAFNOSUPPORT;
 
-- 
2.34.1

