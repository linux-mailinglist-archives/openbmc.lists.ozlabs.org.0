Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 825098452A3
	for <lists+openbmc@lfdr.de>; Thu,  1 Feb 2024 09:26:22 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Yz6dWmct;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TQX6w3nngz3cSY
	for <lists+openbmc@lfdr.de>; Thu,  1 Feb 2024 19:26:16 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Yz6dWmct;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::243; helo=mail-oi1-x243.google.com; envelope-from=liuxiwei1013@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com [IPv6:2607:f8b0:4864:20::243])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TQX6L1XG6z3bn8
	for <openbmc@lists.ozlabs.org>; Thu,  1 Feb 2024 19:25:44 +1100 (AEDT)
Received: by mail-oi1-x243.google.com with SMTP id 5614622812f47-3bb9b28acb4so456472b6e.2
        for <openbmc@lists.ozlabs.org>; Thu, 01 Feb 2024 00:25:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706775941; x=1707380741; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=R9PNvpS/IxXsqMSYyL/y3qMmkm7bOGxEGJypu31KUxk=;
        b=Yz6dWmctEnkbApg58XnO6CrpNDL5sf2YA88Hx+CheZpF2ynPbRxB56dYWX5HaCjnsC
         rpBqW/EDPjuEdz+pZbQEJ8osxNY+y+3dh34aZXomCXHcQ4rcylt/zb9MTLgLAJ/irxlk
         TKdFLV/fvJYIMhkYeM3eNfKNRm3ci9GYcYss0k1UyVydpC0e8SsPhdPEZyEKxf/MCeK6
         LZzGic9H0AWBA6v+z53Kjkuox3+0jwtpKWYW67b5lMW5nJ85+CkZGQ1H76xNn8DmEVuf
         jiydp8177AwFgBHC6cv7qegafNdnJ8BZi/oPYUAV8l+Bkk8ZwQTBZdHvrXN8kNy3MVbr
         PNxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706775941; x=1707380741;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R9PNvpS/IxXsqMSYyL/y3qMmkm7bOGxEGJypu31KUxk=;
        b=ia8GVIXoFuEFFtBd1dafxI+rwsrDJEMwT17R/oPNH3Jdo+Xi0DQpPJWEuo4HNkLDLf
         Zoy6mMuCJTv9WaadS7RK2XX2GRvwJLSqZ0PxLZAxzMvybFsJ3wTkWhFkFYeBP2OJ8CXl
         M0wZvA9O4cAUeUmunSdFl3lSV58cz5FTuPWS4JXmiogeLTD7c25839mqKOFv2bVpXn8a
         FwohfTRfx8IFq1lGabkw4T34LRcAQNm+5FNQ8Z2uIbyJF5qjAl6jnlgcS+natFXDLu4k
         hG1AdX0+lxdOW4f3ualjmeC3llAf3Hhb42Pqr6UJfrv6fsHUY8CeRqIMZmtqGPH4endO
         +jXg==
X-Gm-Message-State: AOJu0Yy8D1WZKHmwLLfQWPP+YIezDMJKF/0/cQ2G1e5TPvZTHb3Z0uKw
	v8rJzpTO9GENxx6haUMNUi3j5qLpDDmrn4XRIVrwPNZSIk2lmVN2z0iRpQGhYYo=
X-Google-Smtp-Source: AGHT+IE1H3qtMEqTqci2Fk1CaBuwuxRAwP7kjpglQjXKQVLczkO08j52i5FjKJIyWsU9zwQ+J1ywGQ==
X-Received: by 2002:a05:6808:17a2:b0:3be:abd3:cbaa with SMTP id bg34-20020a05680817a200b003beabd3cbaamr4838315oib.53.1706775940239;
        Thu, 01 Feb 2024 00:25:40 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUHIdO8tVEa+edg+hcYlUea2hUGv47WW16VVjrFKC+oxGIFwL40z4A7ik5HOuxAcsc5HCS8Wm4+RdtRKvp7fg==
Received: from georgeliu.. ([182.45.253.59])
        by smtp.gmail.com with ESMTPSA id k1-20020a634b41000000b005b7dd356f75sm11988069pgl.32.2024.02.01.00.25.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Feb 2024 00:25:39 -0800 (PST)
From: George Liu <liuxiwei1013@gmail.com>
X-Google-Original-From: George Liu <liuxiwei@ieisystem.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au
Subject: [PATCH] drivers: iio: pressure: dps310: Fix failure to read negative numbers
Date: Thu,  1 Feb 2024 16:25:19 +0800
Message-Id: <20240201082519.192861-1-liuxiwei@ieisystem.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The dps310 chip driver fails to read the temperature when the
temperature reaches below zero.

Signed-off-by: George Liu <liuxiwei@ieisystem.com>
---
 drivers/iio/pressure/dps310.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/iio/pressure/dps310.c b/drivers/iio/pressure/dps310.c
index 1ff091b2f764..fcbfdc5e85b7 100644
--- a/drivers/iio/pressure/dps310.c
+++ b/drivers/iio/pressure/dps310.c
@@ -730,7 +730,7 @@ static int dps310_read_pressure(struct dps310_data *data, int *val, int *val2,
 	}
 }
 
-static int dps310_calculate_temp(struct dps310_data *data)
+static int dps310_calculate_temp(struct dps310_data *data, int *val)
 {
 	s64 c0;
 	s64 t;
@@ -746,7 +746,9 @@ static int dps310_calculate_temp(struct dps310_data *data)
 	t = c0 + ((s64)data->temp_raw * (s64)data->c1);
 
 	/* Convert to milliCelsius and scale the temperature */
-	return (int)div_s64(t * 1000LL, kt);
+	*val = (int)div_s64(t * 1000LL, kt);
+
+	return 0;
 }
 
 static int dps310_read_temp(struct dps310_data *data, int *val, int *val2,
@@ -768,11 +770,10 @@ static int dps310_read_temp(struct dps310_data *data, int *val, int *val2,
 		if (rc)
 			return rc;
 
-		rc = dps310_calculate_temp(data);
+		rc = dps310_calculate_temp(data, val);
 		if (rc < 0)
 			return rc;
 
-		*val = rc;
 		return IIO_VAL_INT;
 
 	case IIO_CHAN_INFO_OVERSAMPLING_RATIO:
-- 
2.34.1

