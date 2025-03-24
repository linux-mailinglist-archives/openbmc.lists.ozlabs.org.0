Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C218A6E6C9
	for <lists+openbmc@lfdr.de>; Mon, 24 Mar 2025 23:49:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZM7Wj3v9Lz3c5q
	for <lists+openbmc@lfdr.de>; Tue, 25 Mar 2025 09:48:49 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742848210;
	cv=none; b=GPX0S0/nj4Hcz1k6KJpg+LsXaY9MdnJOYf5gZca62nS7XWkilrRuVuMQuUa0i+boZVXolUMotTFCmFR3HFuFyhcPLqqfzl3CeHoxatkqtxRbdG+McQt+Zs2vz1vqW9fvFdGHzTVbNoPCyqOZGU7wHwNWb85ahP1ebrhw7+zg0+oOv0Jf5tREnsYFeO0I9pJWsfhf354wt1O2ni86uhuFQnpYvlOorRxaHYwMdIt9g+9AWLO1sGrkHnPAHJlKWurRSZbJ61f8lUFuQ6riBDbfAipsEiKqMzaPQ/a809RCMy+9JkJ9iJiiujBeeYmUvc+0snP8TOKxLl+fbEE59U5dMg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742848210; c=relaxed/relaxed;
	bh=kElO5D7Zqv8+xK19MHfo4Wrl9/d4L4ea0wa2HkxO4SI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B00+v6N59DaEyuq0QzuZS7NqJfhKCks9YhXUim0O4EWEHgQPcQtXUKUuaZZXdSvkQ2oqJynnkxPXAU5CexX0w2eEyPyM8f11aMqIZkLD/SlAuyhDNO6JPOzGCkguRf4yOS9cbe7HoKZ/3UDFSasR8xNBmPk8wy3K7IYU6WXTKL/kKkFXFDYd3/NkR6b7BKR2kQLHor9+4eLG8ImZiblCWBD+RRzEPEPr4uhKxjtQHpT2kk2Mfhh2OmCw4TwBBiB/hCifTVTwXMPCWJAH6NPmTty2adQQ62CheM5u0ELSPdVjK4IckSAdCuSxV8JOBN34AkQQzTgjfvcCX0zJ/62UQg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=l2BLPUXf; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com; envelope-from=mohammed.0.elbadry@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=l2BLPUXf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com; envelope-from=mohammed.0.elbadry@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZM4Rj2TLyz2yKq
	for <openbmc@lists.ozlabs.org>; Tue, 25 Mar 2025 07:30:09 +1100 (AEDT)
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-22435603572so87903575ad.1
        for <openbmc@lists.ozlabs.org>; Mon, 24 Mar 2025 13:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742848207; x=1743453007; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kElO5D7Zqv8+xK19MHfo4Wrl9/d4L4ea0wa2HkxO4SI=;
        b=l2BLPUXfyve+TiX9XMcYtB7oTNMLGDBsC6OMSBKffKpSP1dYX50D/o5z1zMMdBCouX
         L7EAtknryu0vufGjrpVZ2ha2nAhZjHGXFnKeVCxdGNjRqNvz/3rKqcKYD0n9xFAWyF7T
         h7tvIaygr6rEjeD3m3oSa/T2XBCqDfxIlCiNGaHISrrour23NPdMegG5QFgOEChaBJgu
         3B43oraAHp0c/Zy6ewFW44VUUGcNmZX9Tc/0Dv7petUp4JUOKgM24jVXFNPCMUjb4WTV
         xnjlRtMhMslUVIfxqFSbWNzxfWCOYYoISZlpEm2e7D4e5g3Y4RdKx5mfnkILC8mACzO0
         j5oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742848207; x=1743453007;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kElO5D7Zqv8+xK19MHfo4Wrl9/d4L4ea0wa2HkxO4SI=;
        b=eXDwWRxSYvLTwDu41PszGiEsrmTLRu6fRKd9+ZIKaLLerEPqijwAuzGDlfN9r/Z05C
         irq8hA+R47Mtp//50qKipo4LTU8OUcQTWjZ/eRxRYIhl7G/0WMi1qWykdcDpX+B0nuYJ
         15SgLwgBrsV1CBGtBYJK/Lnmi0GPW4oq4I/ctYjkaBMyHyxby0MKuPOCvVRDocEO57Rg
         UizEk8BhIFTgUUNdGsyhf8nh1ikcq6klJLs48/YNBho072YBbO+TEJ/2h6La1H/1L9Nn
         k/n3kZabX8POviQ0LFy5mrXtRUbj1JEgSIqpsRlyur/w5W0IowRAkwDas6xVWsdxbCWC
         wCTw==
X-Forwarded-Encrypted: i=1; AJvYcCV06vXg+mbUz/C1D1xWKJzbeJ96LgGHHYIwjwzj6ZaB23swV5pCOGPi/w/HZk/bm9C3BhsEVqVd@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwMmO6HuORiiF2h1Lw5uAQyTaVzpQ6uePNm96bo3+oFX0HEH2LC
	nUTvau7o97z+YwdzPzBv61emXLgTamuYPDMRkVNwU09BJr823wev
X-Gm-Gg: ASbGncuuejw9GCjNQtrESwADnuP+6fE7hGj8keCtqaiXOudhFvk2wAc8Txk79rMvNmt
	jrLjtqTcNd7qq6ZPTcWspi2YVZ8E/myNkig9AcPYgwQsJvUJ+8+rY+LahPi21HVtjC/d1A3iKsG
	q9+VD6rXBfZmb82ziZyAImH5h/fHyv1vLdjvBMGwlnkGP21TGVuk77SCDEts3C2Y1Z40YuxLzbZ
	ZExC7dtE2M2geK6B7z7tlw1ZhqRgW1ZWznmJuafrgHZdxUZY5qAkJAGRV/Qc6iknpmvHp4HaO6e
	GOttsuTM0kWo9r8gHy3oImc3Q+otKvL3cPn2BsCVwh8O3q5F6SkMKrDgiZnihRVktjJGgzd7L7H
	1zp4jDfDlE8bd1xj9E4+B6PdwFC/h4wX1A45T7CbsjA==
X-Google-Smtp-Source: AGHT+IEyfOvubyKcs/FYRHT1trQZfByq+iQfMNula2Al6lFJPKIE++NRjplQ5cwukg/PxXizviePFA==
X-Received: by 2002:a05:6a00:2c98:b0:739:3f55:b23f with SMTP id d2e1a72fcca58-7393f55b36amr2374072b3a.14.1742848207061;
        Mon, 24 Mar 2025 13:30:07 -0700 (PDT)
Received: from elbadrym.c.googlers.com.com (34.125.168.34.bc.googleusercontent.com. [34.168.125.34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7390611d212sm8771886b3a.95.2025.03.24.13.30.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 13:30:06 -0700 (PDT)
From: mohammed.0.elbadry@gmail.com
To: 
Subject: [PATCH v1 1/1] i2c: npcm: Add clock toggle in case of stuck bus during init in npcm_i2c_init_module
Date: Mon, 24 Mar 2025 20:30:02 +0000
Message-ID: <20250324203005.1266044-2-mohammed.0.elbadry@gmail.com>
X-Mailer: git-send-email 2.49.0.395.g12beb8f557-goog
In-Reply-To: <20250324203005.1266044-1-mohammed.0.elbadry@gmail.com>
References: <mohammed.0.elbadry@gmail.com>
 <20250324203005.1266044-1-mohammed.0.elbadry@gmail.com>
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
Cc: Tomer Maimon <tmaimon77@gmail.com>, Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Tali Perry <tali.perry1@gmail.com>, Andi Shyti <andi.shyti@kernel.org>, Mohammed Elbadry <mohammed.0.elbadry@google.com>, linux-i2c@vger.kernel.org, Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Tali Perry <tali.perry1@gmail.com>

Signed-off-by: Tali Perry <tali.perry1@gmail.com>
Signed-off-by: Mohammed Elbadry <mohammed.0.elbadry@google.com>
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

**Reported-by: Mohammed Elbadry <mohammed.0.elbadry@google.com>**
**Tested-by: Mohammed Elbadry <mohammed.0.elbadry@google.com>**
