Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B7713A6E6CF
	for <lists+openbmc@lfdr.de>; Mon, 24 Mar 2025 23:49:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZM7Wx2J5dz3g0P
	for <lists+openbmc@lfdr.de>; Tue, 25 Mar 2025 09:49:01 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::630"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742848362;
	cv=none; b=NNlHZ0G9OsBygvO0GmMFiNkavmHsK6P/DokftBZ986oDR88FT5GSBaMC4Z9VpPiC+K+y/DGnok2cdheYI6uAdY9XbIj9os661dw1IFzWKFaGJHoYI3LnNOXCNeBP6eioHj9BLxeTT9EoXsnOh04o1B5wh8o/hFmdZaYKraC3ZIFxEUvu0+DhoDhorI1dhmK+JQRWWzHULeKpVcBZLQz7pAqeuXJKYxbf6T81WbbVvgFqo9cYwWM5Wzf/ZRq6spQ6eQUbMFhQq5IcYZwyKdf4cFOzXWtMd3foxg/64a1Vug3MvUVn6jo3SFpIRLdgsdYC+gLqHGxS7IJzylmmLlI+YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742848362; c=relaxed/relaxed;
	bh=jj5y725C6U/JdWVBPtUFbjlsM0gGbVGWPvReveqEWoM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DlAGce4GSpadypSERkV3bNGwNI6SbmkwCv/K0gv8KUNxcIbcrRne1KdbqEeC5h2C4quXU4rMWnNwrpMFkny4ZxG304X3W7gvbST4ISXnipFvDYPH+2ulq4kUosD7nXEC1Lyi4pJhEVGIbahElx0Xii6wGkhytEVZa1xpo56VhN+YrymHKRU2Y1CF9ADXKMkHcA2pL0Qo4kmLcsph6j8PWIXOhdgdJIXeakim2SRGmUAaUM/WhT/hh2AxWCinvHczP9sdoJP0yR9KWSXUwQi8MBSP0WmeET/PjP8wCtajCzPgiGrdTGG8MheHQPZYx5QQvfUG65v3iTQoytfy8NVwLg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=gSAGLoid; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com; envelope-from=mohammed.0.elbadry@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=gSAGLoid;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com; envelope-from=mohammed.0.elbadry@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZM4Vd5mBgz2ydv
	for <openbmc@lists.ozlabs.org>; Tue, 25 Mar 2025 07:32:41 +1100 (AEDT)
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-223f4c06e9fso79970015ad.1
        for <openbmc@lists.ozlabs.org>; Mon, 24 Mar 2025 13:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742848360; x=1743453160; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jj5y725C6U/JdWVBPtUFbjlsM0gGbVGWPvReveqEWoM=;
        b=gSAGLoidtwmn39J8c3KgAMKza/wLVqlXAijqOy5A3XBbXTzK8PaWG6aVVehzPHeDf8
         96tg9zfj6dO1LETWWTkFgKn9vHbsZ1CsBWZGK72dqGM3VktHt2HrhHnO3HUxFW30Xycl
         SJNKvxUwwp2mPBcKjdoyiIvwijJCTWyLbECixoMj8KfoN3aCyf9TdnxXqJpbmIzmZWig
         gcE3efHTZafH+rKOd5EJOX3RmKo6rFepCnlhUmOpzoh4pA4VwMQu2D4+847XM6fP22xY
         mpv1Q39l9VK6pNkhrCC423LtryMWNDaYDD1F8ZTfiNtnnLlOXYKfO+73tENIq5kUJxdl
         Z5/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742848360; x=1743453160;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jj5y725C6U/JdWVBPtUFbjlsM0gGbVGWPvReveqEWoM=;
        b=WZtrDvosRpOJnPoEVhXjWhow5EDgfMABDM0uyXN+5Ddvy8SSZLqxLpU0PxXMWCHAuD
         S5TUOQg/wwU9eRWf4Vs4b1KFfMRubvn1zkxGvIXu1nhcK6YwgoC2SpKNBoeGXyk9YZAd
         a2Zrsmig0PTHHiZkdO8OG2wzNU36IAJqiQo4UWXFWBgMvNs9ErPrbqRadY2QYMPLTTtb
         GXBGOTpM7xzJv81qa7IIV0KvSagpScXOlaBwc3st9EPI+WsK0vy5NW5dwe4yBLZhLPum
         FvbIJ4rYQzeAYyDosETRRH+wwFZs8Gayk/qUkW9RkyiBWuiYuIftUyB6AYzhb/NXB+/s
         S2Rw==
X-Forwarded-Encrypted: i=1; AJvYcCXXOcEqkN3A327u48OzZ9kmPJDqPJ46V/ELIO0I1URehiwF2qkzarKTBtNrTLl+/TstfBdeE33c@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yywz/4YducT0YMXZpHlhTDsupy7xTm8Z2XlhOmNgtQu2vSgqBRX
	y6ak5t0lrWLXeWbE8/YjNKPA5yeI6RbQdJ1dHrDnojKQAiWj74E8
X-Gm-Gg: ASbGncvB+GY7ZNCvqFQ39nWhx52Vu1kmFGO8tTYX3ze0IaZ/KfF6JLxkH8LJLaTxu+2
	rV7N0EFt+Ytxfeq7F8NG6llMqiMN9BIQuZDX4bsLK3cpaDn2FrSD+vIMuAZgcleIJ9mD54Grzfl
	b2y9eMBj3PCMhgwEXxjjgX+eewd3qiNZo4Ajs4eL1iYk7CTLpVhu1IUJbu4mBfrHPrQhvV/ethL
	8fL2XKeWyfnMi5lrRChA4ZVi6kOD89pMguYSJlnxjnOS49xadLDzf+XqU77hIxvHSgLfCnS7Fjr
	RqLPa36FcHfbLHNH6U9XwZ2JEJUg43utQbKHpfiOXTyY7D+9eWPoJHtNiKOQpc80VoA2217+vXp
	tOYzrOik90koeCS3RxY4i06kOo7Vjc+ltSrdGIB7Hhw==
X-Google-Smtp-Source: AGHT+IEkkZwglT7x6V0AyhOCINFRmYgH5G77Wb4O3lcI2Jw9QeTNeTSW9Kfa9CP4TsKw2I2S1Lo4Xg==
X-Received: by 2002:a17:902:da8c:b0:21f:6dcf:fd2b with SMTP id d9443c01a7336-2265e67f76dmr240914285ad.1.1742848359660;
        Mon, 24 Mar 2025 13:32:39 -0700 (PDT)
Received: from elbadrym.c.googlers.com.com (34.125.168.34.bc.googleusercontent.com. [34.168.125.34])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af8a2a23c31sm7593981a12.54.2025.03.24.13.32.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 13:32:39 -0700 (PDT)
From: mohammed.0.elbadry@gmail.com
To: 
Subject: [PATCH v1 1/1] i2c: npcm: Add clock toggle in case of stuck bus during init in npcm_i2c_init_module
Date: Mon, 24 Mar 2025 20:32:03 +0000
Message-ID: <20250324203233.1266772-2-mohammed.0.elbadry@gmail.com>
X-Mailer: git-send-email 2.49.0.395.g12beb8f557-goog
In-Reply-To: <20250324203233.1266772-1-mohammed.0.elbadry@gmail.com>
References: <mohammed.0.elbadry@gmail.com>
 <20250324203233.1266772-1-mohammed.0.elbadry@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Mailman-Approved-At: Tue, 25 Mar 2025 09:48:45 +1100
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
Cc: Tomer Maimon <tmaimon77@gmail.com>, Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Tali Perry <tali.perry1@gmail.com>, Andi Shyti <andi.shyti@kernel.org>, Mohammed Elbadry <mohammed.0.elbadry@gmail.com>, linux-i2c@vger.kernel.org, Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Tali Perry <tali.perry1@gmail.com>

Signed-off-by: Tali Perry <tali.perry1@gmail.com>
Signed-off-by: Mohammed Elbadry <mohammed.0.elbadry@gmail.com>
---
 drivers/i2c/busses/i2c-npcm7xx.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
index 3ad6124be80f..78c85015d955 100644
--- a/drivers/i2c/busses/i2c-npcm7xx.c
+++ b/drivers/i2c/busses/i2c-npcm7xx.c
@@ -2043,10 +2043,14 @@ static int npcm_i2c_init_module(struct npcm_i2c *bus, enum i2c_mode mode,
 
 	/* Check HW is OK: SDA and SCL should be high at this point. */
 	if ((npcm_i2c_get_SDA(&bus->adap) == 0) || (npcm_i2c_get_SCL(&bus->adap) == 0)) {
-		dev_err(bus->dev, "I2C%d init fail: lines are low\n", bus->num);
-		dev_err(bus->dev, "SDA=%d SCL=%d\n", npcm_i2c_get_SDA(&bus->adap),
-			npcm_i2c_get_SCL(&bus->adap));
-		return -ENXIO;
+		dev_warn(bus->dev, " I2C%d SDA=%d SCL=%d, attempt recover\n", bus->num,
+				 npcm_i2c_get_SDA(&bus->adap), npcm_i2c_get_SCL(&bus->adap));
+		if (npcm_i2c_recovery_tgclk(&bus->adap)) {
+			dev_err(bus->dev, "I2C%d init fail: lines are low\n", bus->num);
+			dev_err(bus->dev, "SDA=%d SCL=%d\n", npcm_i2c_get_SDA(&bus->adap),
+				npcm_i2c_get_SCL(&bus->adap));
+			return -ENXIO;
+		}
 	}
 
 	npcm_i2c_int_enable(bus, true);
-- 
2.34.1

**Reported-by: Mohammed Elbadry <mohammed.0.elbadry@gmail.com>**
**Tested-by: Mohammed Elbadry <mohammed.0.elbadry@gmail.com>**
