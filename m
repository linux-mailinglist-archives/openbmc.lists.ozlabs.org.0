Return-Path: <openbmc+bounces-1024-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 45C2ACBC3CB
	for <lists+openbmc@lfdr.de>; Mon, 15 Dec 2025 03:16:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dV3Zd4YtXz2yFK;
	Mon, 15 Dec 2025 13:16:09 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765280565;
	cv=none; b=gSgcxaNPNhS/Jv1gMvGz7h9D2dPmCVpTx6t11M7UAZTrQKxAa0F1PEIzSQyHgY0NY9eSfbECFG856wDwG3qy4Ot85L5DARRZZvglQbJHLeu2uxvY7OnuJ57yJwTiJHMumQcXNk+PLwYtjYr9BAbdMjm6txvrcW4mxplVSrEdyGpK/4dk7wSfQ1A478FrbjIo6zPqINOw7quFA1Rq7l6t6KeuzXJq8cAA/nOkNDac8/V4wudHQViAi/bGtIg43WJpggdfuYpIuo0qd42t1WmZ0pFzeDC2udm5DuwVXjaBjXRySPiMERC8MrDj1KDoW490Si9SFibpcZ7prcF2jyJe7A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765280565; c=relaxed/relaxed;
	bh=iNVZpPWstq6UQ7hNmWtjUM9pqjmls6FXKaYoayGkq+0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XPFgFaK/nymYwj4wBjOPvACnp9HAORqbkNZwknyBEIlJP3DFkn9hXwSGZwA36otGb+jJr/enuYh9sE+krrc/KI8Rcdo7NkNBRUsjIJxOnr+YZ1H89883d2BYW3m+5KkdbP8Rc4P+jO72pqU06NEejcfyp0w8mjH7fPmXVtCXqncDSTgt4wTJDsUL3eMbIxOzVj8OC57F/fC+FppmLKqpTnKUg5vQPW6uykBS0RJbkBL8nYcl6euB6N80R90GTJAiT2sjS1ur0STMffpNgtmkmPPlkKe+kX93ywmgjvAqWebjgw+LfsZA87Aqa7mtgH5UM6tcf5uD0IOyTJ46EbgrpA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=baylibre.com; dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=a3P/klhN; dkim-atps=neutral; spf=pass (client-ip=209.85.128.52; helo=mail-wm1-f52.google.com; envelope-from=ukleinek@baylibre.com; receiver=lists.ozlabs.org) smtp.mailfrom=baylibre.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=a3P/klhN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=baylibre.com (client-ip=209.85.128.52; helo=mail-wm1-f52.google.com; envelope-from=ukleinek@baylibre.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dQcR83MpCz2yDy
	for <openbmc@lists.ozlabs.org>; Tue, 09 Dec 2025 22:42:44 +1100 (AEDT)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-47796a837c7so49180095e9.0
        for <openbmc@lists.ozlabs.org>; Tue, 09 Dec 2025 03:42:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1765280501; x=1765885301; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iNVZpPWstq6UQ7hNmWtjUM9pqjmls6FXKaYoayGkq+0=;
        b=a3P/klhNcrBCy4Zo7Bf5OAh8z5iLGtk43/xe3n7r6kxpNB6TJhGpSWLg7Qv7YPZ8ZK
         cAGs7SfufaTIcOo1dftBM/fimhRPrK3SEfMq9k1JVT3cIbWRdf2zqaFdROj0KTG+CHHk
         eq8sXashtgpBT0Cmyxjq+Dq9g9K6WjOwCYCQmiNcOlV0WWoXIxiu+ix8kMZUo/AIHgwR
         TJxjbBjI2gE847i9mBkSocF+Bc/zrNMXfFdK24P14BmCNiSr3P9txkxkuTq6T+j+sBqI
         x221V4ruBqS8eDW0B5Uq4v2pdy9+geLCtFUggdJwQIL788jHw/RDLCDAM+Lg2UqitSXW
         nJYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765280501; x=1765885301;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iNVZpPWstq6UQ7hNmWtjUM9pqjmls6FXKaYoayGkq+0=;
        b=a77Ct75Pop33lQsBj5trlFmFkXNnXCZsTqFHQwXl5kNzhKwUg7/b6Lw403CW5hlQ5r
         ktXeeQkXjyLEbEPCX9bsajQJyekLrSdoPBgjMPDbkTCvnhmzvks8ehO861Fb1fbKpsnt
         LHIgpzOZCU9SoWIZBe+r0UD1+NnYvoqOpXs6cv2vvX5kA2pP8FsSrFdz85feF2AeQCly
         NcYV3sLICm1kDaDfJZoYXL0r2zDJ/1EpeulQyqZz0Q2RQxl8TT9qxx1ReUYBF5zTm6i7
         Sw9qR7a1iAGardqM4hVHmJldyDRKzIKCdysekfCr6iRaHRdxLO51r0gc70XbEw7rUOz1
         20iw==
X-Forwarded-Encrypted: i=1; AJvYcCUorpM7FGYD1oaFiC+gcMoog5JLSoOnjUEu07zWUPqgHFOrJMk0dIKBhnAqwuMLFi4hWHWAt15q@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yy7SF9WAMV8LWDobJFUnZn4eeY6Bxa8Xb99fxwWLWd3Z+yKjR9J
	iC+sszrQYlhQS3AuEvHGctrqOhmoHQb6adhjoSliCC1PKJuX452eyyL1WwCTbzwjuLw=
X-Gm-Gg: ASbGncvUchUYEcYV4FyTOxBSIXIihijk4UFiLbT+WFHBMd3FsZKIjCBOKvpqIqUZ/l6
	fuSumaqjFdDVgt9jSGt/SoN5wG84VfGa1h+Hl9uuXMLsL1eJA9yil8kzMNH5yP/Dvh2kwjSCQZK
	es5vo70JunA+v8EGNreL9teTybWZIIWdSsdxSRsAJ7f3wZqyb0zlq57lrIzPsiiahkaikdars4J
	ZZ/BnVcQkDTOBYBpDHJ1gCmzjm+eWthiAUsZ6t2rAJ5UnsUCrnvQ9oKg3raSK4YtV1Qhmkw0nUs
	FvJIyB9vBToYYsuXCAuXPmVXiw2BoaQobGld2WCAJkcPz6U7UfNSLrxYtxVXGpRNB7b8NqJYmFw
	3OAU+00ZahB9/bwsKWsnicSxxlBhp15NwixfVnGn9ghOxBPys5kDKK4ec3if0Lfyb1IGvDoXh7Q
	jsgVvlvxwyzcVDHoowe8FZ1G4GdPNM7RBUowvpc+RNRH2DRCqzsa+cY/4MnqnKu+dKsZaJ/5OB5
	RJ7WmVMVlKT4A==
X-Google-Smtp-Source: AGHT+IFqjeFtTWyJo7Yt1w2zgHCCsE/PgpgUbX7INlU2Fq5tEzzIvyp2oysXTDSIJZ6c1m1oL5+SVw==
X-Received: by 2002:a05:600c:6014:b0:479:3a2a:94e7 with SMTP id 5b1f17b1804b1-4793a2a952fmr81397435e9.10.1765280501553;
        Tue, 09 Dec 2025 03:41:41 -0800 (PST)
Received: from localhost (p200300f65f00660846b2ba6e435ad603.dip0.t-ipconnect.de. [2003:f6:5f00:6608:46b2:ba6e:435a:d603])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-47a7d70fae2sm34084825e9.12.2025.12.09.03.41.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 03:41:41 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Eddie James <eajames@linux.ibm.com>
Cc: Ninad Palsule <ninad@linux.ibm.com>,
	linux-fsi@lists.ozlabs.org,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 12/13] i2c: fsi: Convert to fsi bus probe mechanism
Date: Tue,  9 Dec 2025 12:40:36 +0100
Message-ID:  <d8c27aed45bf3119c08c9772768d675ae2ccc0c3.1765279318.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1975; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=5HX3OW285ekofJr+ZMAtH3Qgn6AjwhMDtCWinCjqMKk=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBpOArStEL5Ys2R2thb6Z/34Sl59kUwOR6aGpFPS ZCbRTq8ETqJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaTgK0gAKCRCPgPtYfRL+ Tvf0B/92vabNFUU6s1pdd/h9ixnoGht1iEP8dpZA3iUTxQVwQ1HSizaycKJdQ8uF6xKNCjVH+yg ZURYCCI3ni8m5mLq6G56KkKc+hZQKgfCANtjXOZT9kUzVe0SrOVl6F0bJt/E5YPOq3/Cs0mPQLd pzOH8RgvinIylj8TXpA0bZkFiGRSTKUYyhg8pUGvIW7o1hzc3JvlX1fyygBjM8eJENvw+XAJ828 FH0rpp4dxaY7CzJ/PUEoBudHXnWxfEM2UW9muqHSu/KV5ksn5eLYl+hE4gogRhYzLAv+2lEeQp2 RKtHM62FUtNwhkVZbNr5cvI5Uz6NpQVkU4gV5/hTHJiFxvOb
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The fsi bus got a dedicated probe function. Make use of that. This fixes
a runtime warning about the driver needing to be converted to the bus
probe method.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
---
 drivers/i2c/busses/i2c-fsi.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/busses/i2c-fsi.c b/drivers/i2c/busses/i2c-fsi.c
index e98dd5dcac0f..3a7e577e6eac 100644
--- a/drivers/i2c/busses/i2c-fsi.c
+++ b/drivers/i2c/busses/i2c-fsi.c
@@ -674,8 +674,9 @@ static struct device_node *fsi_i2c_find_port_of_node(struct device_node *fsi,
 	return NULL;
 }
 
-static int fsi_i2c_probe(struct device *dev)
+static int fsi_i2c_probe(struct fsi_device *fsi_dev)
 {
+	struct device *dev = &fsi_dev->dev;
 	struct fsi_i2c_ctrl *i2c;
 	struct fsi_i2c_port *port;
 	struct device_node *np;
@@ -735,14 +736,14 @@ static int fsi_i2c_probe(struct device *dev)
 		list_add(&port->list, &i2c->ports);
 	}
 
-	dev_set_drvdata(dev, i2c);
+	fsi_set_drvdata(fsi_dev, i2c);
 
 	return 0;
 }
 
-static int fsi_i2c_remove(struct device *dev)
+static void fsi_i2c_remove(struct fsi_device *fsi_dev)
 {
-	struct fsi_i2c_ctrl *i2c = dev_get_drvdata(dev);
+	struct fsi_i2c_ctrl *i2c = fsi_get_drvdata(fsi_dev);
 	struct fsi_i2c_port *port, *tmp;
 
 	list_for_each_entry_safe(port, tmp, &i2c->ports, list) {
@@ -750,8 +751,6 @@ static int fsi_i2c_remove(struct device *dev)
 		i2c_del_adapter(&port->adapter);
 		kfree(port);
 	}
-
-	return 0;
 }
 
 static const struct fsi_device_id fsi_i2c_ids[] = {
@@ -761,10 +760,10 @@ static const struct fsi_device_id fsi_i2c_ids[] = {
 
 static struct fsi_driver fsi_i2c_driver = {
 	.id_table = fsi_i2c_ids,
+	.probe = fsi_i2c_probe,
+	.remove = fsi_i2c_remove,
 	.drv = {
 		.name = "i2c-fsi",
-		.probe = fsi_i2c_probe,
-		.remove = fsi_i2c_remove,
 	},
 };
 
-- 
2.47.3


