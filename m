Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64470A75D4E
	for <lists+openbmc@lfdr.de>; Mon, 31 Mar 2025 01:24:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZQr2342YSz3btT
	for <lists+openbmc@lfdr.de>; Mon, 31 Mar 2025 10:24:27 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1743190387;
	cv=none; b=iDY7IqGfpe3tDxmAQl/tEVtrYQbzn9vv/Zg7YLwzyMUCtucThcqSGDuvV99VPbRmsgi0A3DTG/bu3a+W+MY1PeRvul8JTih8TuQOgJ+e0BmH0duCEueYuS6/vfZDWbH5rZf7+7k2ItY7nLPRBcBRhcC1JDKokJseujnU9libUadCYzfsVwcSg9lyDCNYR8TXe9r40fP2cRFwqdKavrlZ0Fv/HGsaKAiNLX0Dd+5ZwhWgD8PTWnbPWIMcZ72f/9vyKYOIEgFg9neQZIv4YexyMxrJyI3tBqYuo1MIEpShBbohgCt3G3LzvVifKBl31AszTYXQu17Q5yWIBvmbiFPU8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1743190387; c=relaxed/relaxed;
	bh=wmzzK5wrB1TwLnmdvaDnS9IoMKPVneQIzyzg2Urwedk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VJtUeYmvU9PEZ5SPvZS55PxCKeYa23lTTzfeAvVEDSD52kY3YXWDSY2zBJExCuyM1+0+ttki0DWf/9nFQxkkHJz3/mg1R9CTAfmZnUbpEdQQ+sW87kYfMASbPL9cjsaiPppZ3WW5BLMgMfd36vAlcQL4t5Yz1ZqvHd1/C12y32+nIeYVwmAW2Sm2PkJMCqt6++P8Hp1GFPq7HRSkOvJfJee45Dww21Q8wBTvlK1WZoFYgR//ZoedtngEQkXP9/Ts70OwKl2skH6HQM8mB0REXn5Hw18EynCQ6wQu4qjbB8+iZiga/SRo62v3/pnZ7Hn5/llm3aBf+epopWNY4SWeKA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=kc+URW+u; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62e; helo=mail-pl1-x62e.google.com; envelope-from=mohammed.0.elbadry@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=kc+URW+u;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62e; helo=mail-pl1-x62e.google.com; envelope-from=mohammed.0.elbadry@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZPW0150Hqz2xjK
	for <openbmc@lists.ozlabs.org>; Sat, 29 Mar 2025 06:33:05 +1100 (AEDT)
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2260c91576aso44920365ad.3
        for <openbmc@lists.ozlabs.org>; Fri, 28 Mar 2025 12:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743190383; x=1743795183; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wmzzK5wrB1TwLnmdvaDnS9IoMKPVneQIzyzg2Urwedk=;
        b=kc+URW+ul07GKBSo185csZ5bja9O/BziXZloUmMy3r3v4n0ZZ9fx7OlGeZWI+0HT38
         D8K1wx4B2pa43VaprOz5ahme71/ic1GULJ0tXivPBLiEz3GDttZ75QRLirUSNn4l+dYR
         FIbzPKMylWZejgMOukJyuavaf1JZwCoQx/8BhEPH+uwh/rOUAbgB68IsYJiHUfG7d4yu
         FpbYIUW9pwp74BgvwqxgKeb0M03bwQLgjGzsRzNQDy76t/7I+PyctOVc9/xDCEabFeWR
         BY/IevEYSqlrr3VMP24ZZ+5lF8SznJaLc5yoeRK1giXBsZbNQehMSrvgPRBtt8t4y7I6
         OTdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743190383; x=1743795183;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wmzzK5wrB1TwLnmdvaDnS9IoMKPVneQIzyzg2Urwedk=;
        b=J5Oj68FXxhxugBrO3bDhXDSZ1GgIdWc1txb71CfFzXo3RqJmktB8yw7yF5rsNzOfh/
         UNMVwXSSER15LT7YZP944AdvYf0GYc3hvfEOfKqwga82CqLhqKrwF8cJdsj5208r1Yfo
         xKUWC0Fhp8Q5+B+BAN+Td1KZF97KzP2JR/62qgqXcCkvxjPAbREIxCKKRzvtOVX64+np
         nhvGLenDVjmZUzN6/a9GN13ZEyZivn2BxfL0JiynRgoAaM9GcfFHFcl/Ikcbg2kKyQJt
         VHE2DVUHL/LbRemxMxxwadnDae/1d5rSqWcd6XKjw0PBifoQhWQGVC6qIbi0WWn8SmOL
         2cBw==
X-Forwarded-Encrypted: i=1; AJvYcCUTSqTjNZWJjzlqllVoj3ylnAdXhu4dPJdkg+B3MmAfDxwHFlbABtGgVlRxaBZy+CekJTVaAQep@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yxu5dcOaIjSBFSJUU61zF6DtbvTN6uy2FFd5vlZifmai6ZM+7ij
	dfsMOvevcFMrS6SG7OkBwC6aMRiqqVBpXLBwbkFxv0QCJ9VQ1zii
X-Gm-Gg: ASbGncuEwp+C+5NJD4Rqa2sXFOzPsCDJIR7/rTaLwlCbI2jNOG3wUWKVMFBYrNGbywa
	4Fpel22i7WLQqYr5HJCECv02l8A7sP7v5gdwtabLXjZjqwzSDIc8r6dyupC4pdpFeW0hHjJDdZT
	S5xSnO0dZqwX1GNbQPzSXLSUJq4g49kgPbcobsJXnJjnwABWQI/FmtF/btc2ETjMI679AMp7kRi
	Ci2BdqWBHEagZMtUQGNGP37FuLxDpsTIae4AZg5FWX0xiA8aX5i+4AkLsewy6LTxVnRtsXqkmXT
	Q6ZDr4QTz5bs4nOmoMK+r22jWOpgYAWrPO9ginOSvjS13U7/EaB7d/QMIXbfdUb1pAaBdLaCXKZ
	eyPBByhDPxAK26y2yCx1AtSDYPuD5r3BHUQCLGM5thA==
X-Google-Smtp-Source: AGHT+IEAwgqjiuXz9FuLi799X51Qq+5hLQo/k1P1Mp5I5BJ5OT75oDBzsl1hH9SjLgr3KKLNdley9Q==
X-Received: by 2002:a05:6a00:18aa:b0:736:3c77:31fd with SMTP id d2e1a72fcca58-73980473887mr498675b3a.23.1743190383020;
        Fri, 28 Mar 2025 12:33:03 -0700 (PDT)
Received: from elbadrym.c.googlers.com.com (34.125.168.34.bc.googleusercontent.com. [34.168.125.34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739710da6b9sm2258882b3a.174.2025.03.28.12.33.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 12:33:02 -0700 (PDT)
From: mohammed.0.elbadry@gmail.com
To: 
Subject: [PATCH v4] i2c: npcm: Add clock toggle recovery
Date: Fri, 28 Mar 2025 19:32:50 +0000
Message-ID: <20250328193252.1570811-1-mohammed.0.elbadry@gmail.com>
X-Mailer: git-send-email 2.49.0.472.ge94155a9ec-goog
In-Reply-To: <20250327193816.670658-1-mohammed.0.elbadry@gmail.com>
References: <20250327193816.670658-1-mohammed.0.elbadry@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Mailman-Approved-At: Mon, 31 Mar 2025 10:24:24 +1100
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

During init of the bus, the module checks that the bus is idle.
If one of the lines are stuck try to recover them first before failing.
Sometimes SDA and SCL are low if improper reset occurs (e.g., reboot).

Signed-off-by: Tali Perry <tali.perry1@gmail.com>
Signed-off-by: Mohammed Elbadry <mohammed.0.elbadry@gmail.com>
---
 drivers/i2c/busses/i2c-npcm7xx.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
index 2fe68615942e..caf9aa1e6319 100644
--- a/drivers/i2c/busses/i2c-npcm7xx.c
+++ b/drivers/i2c/busses/i2c-npcm7xx.c
@@ -1967,10 +1967,14 @@ static int npcm_i2c_init_module(struct npcm_i2c *bus, enum i2c_mode mode,
 
 	/* Check HW is OK: SDA and SCL should be high at this point. */
 	if ((npcm_i2c_get_SDA(&bus->adap) == 0) || (npcm_i2c_get_SCL(&bus->adap) == 0)) {
-		dev_err(bus->dev, "I2C%d init fail: lines are low\n", bus->num);
-		dev_err(bus->dev, "SDA=%d SCL=%d\n", npcm_i2c_get_SDA(&bus->adap),
-			npcm_i2c_get_SCL(&bus->adap));
-		return -ENXIO;
+		dev_warn(bus->dev, " I2C%d SDA=%d SCL=%d, attempting to recover\n", bus->num,
+				 npcm_i2c_get_SDA(&bus->adap), npcm_i2c_get_SCL(&bus->adap));
+		if (npcm_i2c_recovery_tgclk(&bus->adap)) {
+			dev_err(bus->dev, "I2C%d init fail: SDA=%d SCL=%d\n",
+				bus->num, npcm_i2c_get_SDA(&bus->adap),
+				npcm_i2c_get_SCL(&bus->adap));
+			return -ENXIO;
+		}
 	}
 
 	npcm_i2c_int_enable(bus, true);
-- 
2.49.0.472.ge94155a9ec-goog

