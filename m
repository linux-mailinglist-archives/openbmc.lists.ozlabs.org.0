Return-Path: <openbmc+bounces-1026-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 81CE8CBC3DA
	for <lists+openbmc@lfdr.de>; Mon, 15 Dec 2025 03:16:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dV3Zf2c31z2yFk;
	Mon, 15 Dec 2025 13:16:10 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765280550;
	cv=none; b=bVXMpJ54bX5bITh5+GfNJv7PpKiMpa7BdJUEqt0+k0NTydB5Nq1GXVa7kLV13JKA9DI2JrJYBREgAXBl9bsIY1cEm+fIGv0IB+92RTR+YmQbpbKZcnvU5vEvIM5OT85iCaGwSc9o65wEcSUxGDjcugPYVV5Ztg1narbT06f/M+rC2tHhVl5Kk40D9g29P2epoVZXL+6HSF5CXavmfuez5WSEiD7kUWhyXsg7/JK9Z60s+g/qkQbEq4/dZRDHY4vsADV8b1OR/WyfbDg2ihX3v3g9xJJGvIi0yDWTDgVrH/Ho4DPyTeuYY6Dl5vGeye0uXvuC6TC5bzH7etRLvJwRhg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765280550; c=relaxed/relaxed;
	bh=Wd3Z4KYvF0dD65L7DPvviKR5Z1NQM0iwjwdQuL1cHwg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EGdmCHbp5oFVBo/DaFS3dqB46CsY1L7VqLL2VJ+aneJ2lLwmdhv2j/PekJKOk0XQF1y6Pn+We4cN2s0jnakMeKo6Z9B3YIndFeuvwjjUgMNgRPdOlDLtnEtato8tz0CCHQam63BL9zGJ1L9q8bx4+XT+yZjIZYz5vCDjYTR1qj5GwKihIBeNL8RsrYx80aqWdUQEtwv0+lwBu/G0cjObv9bt39avvtSn/L1p8isFcYjbS4C1E7YH7VkhetBS0NbNHwXBPdB6EblpLdJG9+wKQ4CbxYhavT0A2podLmywzmzpZ0Nvlt8SPS35R74qPAQsJTbAdsazYrgMYKd/B7AbiA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=baylibre.com; dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=GfeXAiJE; dkim-atps=neutral; spf=pass (client-ip=209.85.128.46; helo=mail-wm1-f46.google.com; envelope-from=ukleinek@baylibre.com; receiver=lists.ozlabs.org) smtp.mailfrom=baylibre.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=GfeXAiJE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=baylibre.com (client-ip=209.85.128.46; helo=mail-wm1-f46.google.com; envelope-from=ukleinek@baylibre.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dQcQs4KSLz2y5T
	for <openbmc@lists.ozlabs.org>; Tue, 09 Dec 2025 22:42:29 +1100 (AEDT)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-477b198f4bcso47913285e9.3
        for <openbmc@lists.ozlabs.org>; Tue, 09 Dec 2025 03:42:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1765280487; x=1765885287; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wd3Z4KYvF0dD65L7DPvviKR5Z1NQM0iwjwdQuL1cHwg=;
        b=GfeXAiJE9LvZM2Z3U+Mw7OeLl0jd15b+AaE32VzfV0aRLKT/LRwCZI39RoCCyS2J+7
         zKRAOKTqlsRZxh4eXix3byiz/DQP7hop0xbRZKhQPvrQJ4Cijyjke7WDPGjWNd4fvr/A
         xwGIuGjsF+evZqnsOqKQ+q7BBNLwQ8vZP4DU0PdeAQbV+kt6wm2zKFaf3Tj/F/zsRfFm
         w0w7A5kEfWO+XaYSCAnUHIxtPej03OTL+p7y9ijsVDNzoD73gedonndtI0jFEwdPL/8e
         GuqxVWyys7Go3e74Ydad3FN2pavk65p+kuuF184+sWt/nXwQlXHQnC9Po6SLJndk/jJs
         4Y1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765280487; x=1765885287;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Wd3Z4KYvF0dD65L7DPvviKR5Z1NQM0iwjwdQuL1cHwg=;
        b=MgYROHDA3OfphaqChq1Y7UAODafIVN3wB5EKDw7RjlbTiAlZ27C3rcY6xX9BU/eJy/
         bk2AzWkU+HHv8ci72q9v0HB083O8UCu1bv1r3g/9m9rO9uBs7yieMHI5MFw2JtrLJueQ
         R0aHubllVvrTxQN7X6mMg6o2LFsQnPm2ru9/vj+22DraZjwrPNoaliUO0Q5e7+45X1Ti
         P6uXsQLJRaU0niyU/A7298BenTx4P+XZClMLrYg/hqYqlLls0drbjiYxWZTnIG6XNHmu
         QLMMMCWm6KIOZmV/3rsAIzE+TWnfuoiUp6fo8RhGC9wWErCdXg5db5DD9BQPYJwjO1KG
         Q2uw==
X-Forwarded-Encrypted: i=1; AJvYcCUyIXVX0oAddAbu1dCDK7L3rv7zR7N8udXPWn2ezEAcy790CFmp+WcoPiR5UcHvEahP9kVclUwz@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yy27duT1FdmKfD2qxZtx2hJBqpXQeGpx/wrUm8He7wobXQX+h+f
	CMPR1vr7RTBrDdwTyjY2F5+ewHbJXKnWncp4wNtTYOr4lqOs2aGYPEasyI6Uh9/hRmU=
X-Gm-Gg: ASbGnctWeq1+n7pSURT4bxcTtPL6qXXNAly6qz1Hr/V1qyqEe5E7R5OnhuzcMUGEAO/
	UpBq+vCF6L0npxksHCYJ0FdKPMxLKk3cSlivefJ4mPuW+q8rcCbyHwMFz1OFZjo+uX29gZY55ay
	rezPt1R+NVq198WXLU+LRsnnYpU+SW6mT5IYkloQt98r4GiYNztUOI6n7OGLqWSaWRG73y9qQWZ
	KonHxT72+faokEAxhhIo5egnQ5gf0Izdra5VRcxhQxoezbzp2UFFdIH3vM5afg2PSx+n/mlX5FN
	Xx0VXYqv6JqDC3begaBkjmH4QBuFMJEmHFf6FMo4y9j2pv38mol1I9qLXiumnqJzLRpEMxsg1fO
	DoGteDpIo3u3nXcXhWkHM1U4TDQJuihCl5IYFu6MKIFzlUP3nLni7vy9HmH4/8zrKk60Gpy+AeX
	XLGEusIPYmffax1PH6zd4FHkpDVcq/qpylPmp09ZLjry5D6GPu4bLyQIMqP+d369zRT/dsqOIPy
	SA=
X-Google-Smtp-Source: AGHT+IHHuEvpcoKORlw30IlhcBh1e4pcDw71sf4iDJdmgzkWvf/FjxDAXF+Ko3/c/puYTdhF2sl9Aw==
X-Received: by 2002:a7b:cc17:0:b0:47a:7fbf:d5c8 with SMTP id 5b1f17b1804b1-47a7fcf1a0bmr9909865e9.26.1765280486547;
        Tue, 09 Dec 2025 03:41:26 -0800 (PST)
Received: from localhost (p200300f65f00660846b2ba6e435ad603.dip0.t-ipconnect.de. [2003:f6:5f00:6608:46b2:ba6e:435a:d603])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-42f7d331a4fsm34712660f8f.33.2025.12.09.03.41.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 03:41:26 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Eddie James <eajames@linux.ibm.com>
Cc: Ninad Palsule <ninad@linux.ibm.com>,
	linux-fsi@lists.ozlabs.org,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 04/13] i2c: fsi: Drop assigning fsi bus
Date: Tue,  9 Dec 2025 12:40:28 +0100
Message-ID:  <8a36a0dba809d3bfe225627fd178daece10ff6a5.1765279318.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1765279318.git.u.kleine-koenig@baylibre.com>
References: <cover.1765279318.git.u.kleine-koenig@baylibre.com>
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
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=799; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=YXNtV+Vdnj9V5HmbInqMeie6ojhBt0TgobcWxdMwcl4=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBpOAq9zNegZqa1wjuAOOn4xg/8fl9JG81iUbT8f Tc+6+Zews2JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaTgKvQAKCRCPgPtYfRL+ TiICCACH/a6b/DA0OoKBiD1H/ZF6cgKeZWRn9faoWbhmFszSfpE4w5/CavC/ChSDHOFRrzhykfU M2DU3MbnWz1gk59midovBAEfVIHBUEeW/dBnvyL0DYrEQ0bE9C85cNDIjrtq+4P850X6m8sw2p0 g6rjAIXGhQ+fXkfmh7xg7bwEmNC7F1uxetrtJ5zLjGwWyxCxOz331plNdoArKoiP7JuJw9vMadO lC1tarO9a6AmpZ5qbVR2xZ3XpID0/5On/vj3peRrmZLaIXX+wDYv8I5PS0YWuuiBwBq8gYu+V1T Py8Bsrb5maxD4KeVfAVLstDv92Gs4SWIdOCqmnoYMpKYM9se
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Since commit FIXME ("fsi: Assign driver's bus in fsi_driver_register()")
module_fsi_driver() cares about assigning the driver's bus member. Drop
the explicit driver specific assignment.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
---
 drivers/i2c/busses/i2c-fsi.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-fsi.c b/drivers/i2c/busses/i2c-fsi.c
index ae016a9431da..e98dd5dcac0f 100644
--- a/drivers/i2c/busses/i2c-fsi.c
+++ b/drivers/i2c/busses/i2c-fsi.c
@@ -763,7 +763,6 @@ static struct fsi_driver fsi_i2c_driver = {
 	.id_table = fsi_i2c_ids,
 	.drv = {
 		.name = "i2c-fsi",
-		.bus = &fsi_bus_type,
 		.probe = fsi_i2c_probe,
 		.remove = fsi_i2c_remove,
 	},
-- 
2.47.3


