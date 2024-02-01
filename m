Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 987D1845326
	for <lists+openbmc@lfdr.de>; Thu,  1 Feb 2024 09:52:45 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=VjmSXDgT;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TQXjR3lqyz3cRD
	for <lists+openbmc@lfdr.de>; Thu,  1 Feb 2024 19:52:43 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=VjmSXDgT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::441; helo=mail-pf1-x441.google.com; envelope-from=liuxiwei1013@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TQXht1xPWz3bn8
	for <openbmc@lists.ozlabs.org>; Thu,  1 Feb 2024 19:52:12 +1100 (AEDT)
Received: by mail-pf1-x441.google.com with SMTP id d2e1a72fcca58-6ddc0c02593so487591b3a.3
        for <openbmc@lists.ozlabs.org>; Thu, 01 Feb 2024 00:52:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706777529; x=1707382329; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=CE/wHMHQBSHUw75u6BBUlaKmCN2PfzR5QOdeiVGcyxE=;
        b=VjmSXDgT0qXpTr37TNxBrakiMPzr5groQLQseja+cnvtMQCQ9OD5GzsRrF81D8g4HK
         8Ya8pSpUPvnwryhB4UzAK1ppPLsyj5UvoQUK92OHTomVEW2E9eUmq61riblfyV/FfCPk
         O+fKQjrlIbqfabPYkGEv0YJqa26q4xO2l6oQsiQvXWCTEp/u1NUdbfqjfOZfcJEJ48Ha
         wIab5f1vWGF0uGEcreXX8OzJCnNpHz7WKOGXBZnT1J9oSONABpupeQzicIth7ZitU1uU
         FG9DOhXRNwm5s+q9NykkSBEq8Dx2F3qO5LE2n5JvWsVw9kFVl5uHvN7CsAG9ApipIZD4
         QSjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706777529; x=1707382329;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CE/wHMHQBSHUw75u6BBUlaKmCN2PfzR5QOdeiVGcyxE=;
        b=b9piKjGp1WV/AxL5iIAeXm7etD96YPz0lOQlve4Gj/NT3Qf3l1ANWbaUkJSxRoRQkS
         ZdQ+bnNh8kFamTSPK6DiLgoLveI1KvhfkPXTH6TVkF0CCGXxlr1pkZYYdBX/Nw8Hucs5
         ZT50Fy+GEFZ0Oc3gc+E9yY5lin3AIk0QKSfm5db/gjouOIGLkqbpqg92d7IJBKs/sBx7
         nwWQDQ3gKtqAFu7xEz/uK1CmvUKpkAFnwnkEWuHAf2P59rcR2S02cGV9KAZ1XKni+SoN
         xpFZlL1LifbluRglkAgYYi1RimjSbSlt+fcT+ZbpSRrAlZvYuMmLaX3QM9nrW47P+T09
         5pCQ==
X-Gm-Message-State: AOJu0YxXYTFlNrTEGmxJQHbAoIlg749H9RKpTk676MHfgjJ2hZil8Ypy
	xC6pKkxbMNwE/vdNaOVt8Bjrn9V4y8msb2eMUv3GwtP/EDlhuzcEz1cShgMbx5CIvA==
X-Google-Smtp-Source: AGHT+IHlY10whlqpzDts5Vd09mL4GjxmgTyfTbTxQAbd/HicXXNkAx7+pjclvbaUw5j9zinuhrhZYA==
X-Received: by 2002:a62:ce86:0:b0:6de:ccd:c88b with SMTP id y128-20020a62ce86000000b006de0ccdc88bmr1434054pfg.14.1706777528526;
        Thu, 01 Feb 2024 00:52:08 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCU312TmfALXf6sZUTxRBctKWAIFbWhwgoSbiNt0qe2uElIcLugbYKwtRpa/FxAN8kX7MhRdtBvsTa+3NQ2C4w==
Received: from georgeliu.. ([182.45.253.61])
        by smtp.gmail.com with ESMTPSA id t31-20020a056a00139f00b006de02dbdccdsm11392148pfg.12.2024.02.01.00.52.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Feb 2024 00:52:08 -0800 (PST)
From: George Liu <liuxiwei1013@gmail.com>
X-Google-Original-From: George Liu <liuxiwei@ieisystem.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au
Subject: [PATCH] drivers: iio: pressure: dps310: Fix failure to read negative numbers
Date: Thu,  1 Feb 2024 16:52:04 +0800
Message-Id: <20240201085204.202822-1-liuxiwei@ieisystem.com>
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

The dps310_calculate_temp method will return the current temperature
(rc). If the temperature drops to 0 degrees, then rc < 0, it will
return directly without assigning a value to `val`.

Tested: When the temperature reaches below 0 degrees
1. without this patch:
```
cat /sys/bus/i2c/drivers/dps310/7-0076/iio\:device2/in_temp_input
cat: read error: Unknown error 2370
```

2. with this patch:
```
cat /sys/bus/i2c/drivers/dps310/7-0076/iio\:device2/in_temp_input
cat: read error: Unknown error -3370
```

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

