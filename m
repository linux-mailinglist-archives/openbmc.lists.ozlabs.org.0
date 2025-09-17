Return-Path: <openbmc+bounces-651-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F38D9B7F013
	for <lists+openbmc@lfdr.de>; Wed, 17 Sep 2025 15:10:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cRSp14vl8z3c7q;
	Wed, 17 Sep 2025 16:01:45 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::529"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758088905;
	cv=none; b=n3MfhBSP9SEwWlxAOZEM7R8LzKkmtFk0km7ezMZMtP7gmRF9tY56rxSf+Lm5/J9M8AJQMKsqaA3vFLwVLqraKMh9ZS6M9c6o73xN8+9KSusr25eUGLZx+gPIGcL2Tq/yRvEYOsrgRKJvqSZ0q+tSwQh5NeLU6WPUc3S7fjIqJKcGUzgoZGA09MrcXGRrh3czbSw2mD95llBaygMJ56U+a41qTZwZuWqkIF3qsSYA1tTtrTOFWiSCP0haJjywJ6LNJKWKtWxQL6bQobg8vssHu2zWTqyl/Jrki8d3e39d1Zagwg4weqWnsAu1pz9IF9ok+aR69GSg+NjxwmSdjFwEkA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758088905; c=relaxed/relaxed;
	bh=rtat1NsCZD6KYPfj9etscPfDI43bDnaM25jw44Y94VY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nJLyDA0hdZJHrQ16ex+VmIO7a6iM4RZiqlXBr2D+nHYs+Z2D+eYHHCgix7dFpyshIcRHdpnfkmANDh4OX1uPpAkEx4XLu0L0zedkndY5x+ORpuq6hF2cW/DZlir2cQlFk5dS0rz2q3QmjgHOsxRApppVLZmjk6cnpICkZ/HAVwxaKgcCzcea1FkDfHs32bnnVxgsI6KYswYWFOnUMYsqZkr4QpVAEUJAOMOnpL5WSOkWfjuJ+IlwlruAXNIm+B7fKQocE53zPzhzMdy6KUZ00Tr9x1RWPzs8Vhkb64AZMESPJB25hmngKnh2pDNjhTdFJKTCtIbs30vUdtyxuNgZyw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=cYWlFR9Z; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::529; helo=mail-pg1-x529.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=cYWlFR9Z;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::529; helo=mail-pg1-x529.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cRSp10c51z3cZ9
	for <openbmc@lists.ozlabs.org>; Wed, 17 Sep 2025 16:01:44 +1000 (AEST)
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-b4d1e7d5036so4150237a12.1
        for <openbmc@lists.ozlabs.org>; Tue, 16 Sep 2025 23:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758088903; x=1758693703; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rtat1NsCZD6KYPfj9etscPfDI43bDnaM25jw44Y94VY=;
        b=cYWlFR9ZPWFTvjF+T5L54ZNg4fjrPtljGUHQbVmiYGXvkcamKHvXiH0aLgDjRTtp5v
         ou4K8wk8UQt5n6ZNdLv7G0Ka2/+xg/swmX16S/R6bdFocI0OsCgHf2XqP8qHoP+AVDwq
         YVDDZflX7DgqxfjkbFDcgBud161RiWehzMJFLXyzgIJckOXLWlAf4FWXjpw3BMXksHkQ
         1t6VzpKvSLscAZcFAptjA9ul3DLAJ3+iOWk3LniYC3p40XhL67wd8R+sMvuWepDGjx51
         AelC9fNtJ7/IikTPfhzDRD0tY8eSFO8ys3pQLfeuKmhieIBrJb883Vtysx4XypkzQRXI
         z3MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758088903; x=1758693703;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rtat1NsCZD6KYPfj9etscPfDI43bDnaM25jw44Y94VY=;
        b=RR90VdkUJd017QLYvhh8IVcATK4DEPpyE9Mb3zeeO9QuZ0D6lcHIxoVfrgiDMzGjZv
         NDlabGUPTO7t9sIxap7TTJBI7c7eABUH92lUkKtatSX1kU9CMG1HDradJ27RohLDF9Qi
         X64Sv+BqCO0BQKti8vSISkg/mG8lkZEVU44eJBYimc8nVlxH1y2GEKoAzOofgV041NUd
         zVpv+8KQdOl1eJV0LVa8MrTxb8p+Sq9Jl4exI2UIMAazSdho8hVbmBu8pr77JiGu/Bvq
         Ktq/e6dFwcZdUVEK+c98LSzKCL3Tmgjb6RjjFFRE48bZcJ8Xl1kPbZETvvRcPSrLwRbM
         1hzg==
X-Forwarded-Encrypted: i=1; AJvYcCWwy6IRjuEW2TknffarefNnc96ulGaKUVnMFIMFIJK4XLFqgvLFEuJ65RHkvXGQoPA/pGtjM20T@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yy/ApyWDsha6H3WOMQXAaMVmzHEFB9czHWP4uP4s//B3DDvJmjw
	tV7R6fYFg9CthZYXESoJKLCurr2y66q4W5PlHXDzqvCJyr/DLf1epyfV
X-Gm-Gg: ASbGnctM/z449u0Okh/hC1eUkmcI1sj/5V7XW5VKz0/8rajOECS5Kw6bP/Zj6C1+Fcy
	vKH0eUaypxQDwQF1Lg2GY/ZfHoZjOS9TIABAWB9o3ziKigFrlBQX9Jb5isb8EYHSD8ZyP4C/emm
	DIKACetOaHSNUPDjRRCpS4RnCN6Vj1oE/Bp+IOUA070sAzdtDhVyZxgvfKzibwpOYx2t6Ibvwdw
	VneZ34gOKAZ+PS4ZI8RvNQQbQm7uJOrfqJANBXFTgpP9EYIGJhYxfdM55cEpz/Q4lP662fdAzIj
	Rlh3EItOCjYv4BDJ3IS/nN6F7kMk+BLSlEoFKy/iECcEQLe7XgIAynm+hp4QDicoIrv9ZXVih+m
	R54QhtFhu8l/PKOc04LWdQCuyXh8s1aR0OS8tlx1sTpYyLDWaksxTtcL0pDLiuXcZGHGPR6K0aL
	vxUKXce2HpSsZUEDRpzvMmtf7jbg==
X-Google-Smtp-Source: AGHT+IESixuGKbRP/X/uc6If8fFcddrBLuf2zgFOySXTnb44F81vlfbeP0gOj+tsros01ujqAUqbzg==
X-Received: by 2002:a17:902:ea10:b0:264:a34c:c7f with SMTP id d9443c01a7336-26811ba4d7emr13081825ad.7.1758088903032;
        Tue, 16 Sep 2025 23:01:43 -0700 (PDT)
Received: from eric-eric0420.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2645b8a6357sm92235525ad.130.2025.09.16.23.01.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 23:01:42 -0700 (PDT)
From: Peter Yin <peteryin.openbmc@gmail.com>
To: andrew@codeconstruct.com.au,
	openbmc@lists.ozlabs.org
Cc: peteryin.openbmc@gmail.com
Subject: [linux,dev-6.12,v1 4/9] hwmon: (ina238) Report energy in microjoules
Date: Wed, 17 Sep 2025 14:01:29 +0800
Message-ID: <20250917060134.2383005-5-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250917060134.2383005-1-peteryin.openbmc@gmail.com>
References: <20250917060134.2383005-1-peteryin.openbmc@gmail.com>
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

From: Jonas Rebmann <jre@pengutronix.de>

The hwmon sysfs interface specifies that energy values should be
reported in microjoules. This is also what tools such as lmsensors
expect, reporting wrong values otherwise.

Adjust the driver to scale the output accordingly and adjust ina238
driver documentation.

Fixes: 6daaf15a1173 ("hwmon: (ina238) Add support for SQ52206")
Signed-off-by: Jonas Rebmann <jre@pengutronix.de>
Link: https://lore.kernel.org/r/20250715-hwmon-ina238-microjoules-v1-1-9df678568a41@pengutronix.de
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
(cherry picked from commit 3e8e93cbb8b0fe67661665a3e7e80642a02884a5)
---
 Documentation/hwmon/ina238.rst | 2 +-
 drivers/hwmon/ina238.c         | 8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/hwmon/ina238.rst b/Documentation/hwmon/ina238.rst
index d1b93cf8627f..9a24da4786a4 100644
--- a/Documentation/hwmon/ina238.rst
+++ b/Documentation/hwmon/ina238.rst
@@ -65,7 +65,7 @@ Additional sysfs entries for sq52206
 ------------------------------------
 
 ======================= =======================================================
-energy1_input		Energy measurement (mJ)
+energy1_input		Energy measurement (uJ)
 
 power1_input_highest	Peak Power (uW)
 ======================= =======================================================
diff --git a/drivers/hwmon/ina238.c b/drivers/hwmon/ina238.c
index a4a41742786b..9a5fd16a4ec2 100644
--- a/drivers/hwmon/ina238.c
+++ b/drivers/hwmon/ina238.c
@@ -97,7 +97,7 @@
  *  Power (mW) = 0.2 * register value * 20000 / rshunt / 4 * gain
  *  (Specific for SQ52206)
  *  Power (mW) = 0.24 * register value * 20000 / rshunt / 4 * gain
- *  Energy (mJ) = 16 * 0.24 * register value * 20000 / rshunt / 4 * gain
+ *  Energy (uJ) = 16 * 0.24 * register value * 20000 / rshunt / 4 * gain * 1000
  */
 #define INA238_CALIBRATION_VALUE	16384
 #define INA238_FIXED_SHUNT		20000
@@ -500,9 +500,9 @@ static ssize_t energy1_input_show(struct device *dev,
 	if (ret)
 		return ret;
 
-	/* result in mJ */
-	energy = div_u64(regval * INA238_FIXED_SHUNT *	data->gain * 16 *
-				data->config->power_calculate_factor, 4 * 100 * data->rshunt);
+	/* result in uJ */
+	energy = div_u64(regval * INA238_FIXED_SHUNT *	data->gain * 16 * 10 *
+				data->config->power_calculate_factor, 4 * data->rshunt);
 
 	return sysfs_emit(buf, "%llu\n", energy);
 }
-- 
2.43.0


