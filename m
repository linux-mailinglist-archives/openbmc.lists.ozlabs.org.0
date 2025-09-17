Return-Path: <openbmc+bounces-656-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AEDFB7F016
	for <lists+openbmc@lfdr.de>; Wed, 17 Sep 2025 15:10:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cRSp84ltLz3cfL;
	Wed, 17 Sep 2025 16:01:52 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758088912;
	cv=none; b=QNhCqWr9fFqnwX8jVdrlyw4la+GhY8WOZ0G+EBSDuNDnvHKv/DwlrDwp1bWST0eb/4KP2dEOLD5bfKAI/1Qp/dpo9dJ6pFJ+rU0JT9vE3TZ7afKvwL80AZCsawYZDhZsQdd2FvfWd+ylIYWUZfZd1ojXGXm9LXZEQhdLC/9Lo5PkjFW9FczEifL4ssR9/g2uCkRFDyhWZ07NYzUvclW40CwAEToWuRwGoYvYi54TlqFla2UsCotePxUQevOhKInHFehTVYnDxS48kTRthgDx8x7+GHdWKikDH4z34qcUzIfkE/+Qxv7NRAWvjblaZwAnoWq3o293va92jZVh5T+Uyw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758088912; c=relaxed/relaxed;
	bh=+s34MIeVIyFtFvzk5SP7Ttd0a9jEm0/BQEZZUVDP/XQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MgSi/PGQpUDLZaGoHUyWXViItvBcXc1NpqAB4tzsoNiRGxncnx6HJ9qRxNpSJ4E/98KGWldcC6PJMWV1uWAoDj21hywGpIepl7b2VrkX4/og1OzMEWEWr0wUfhKsbcYt5CWtGL9OL/OEAPL0b2kqim3c8NQ4i8WpMlyv8emTt29dZjbqf2bpjSu13Eh9rQ6FCfIc4dzQxVZ7Vhzxxrd48B8dpdIuqBypZ4PKLQpXw1evqntN+Q8SjZWZDYRVscPObTrQd7SJ+cyI0NeJqEb8BpLaoGZDqFR/SapwsriUIoLA/FdnjHwUWCWQuC9xxhtwHICjAA/UurnxImOV6glpjQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=hiQeUFLE; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=hiQeUFLE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cRSp7744tz3ccV
	for <openbmc@lists.ozlabs.org>; Wed, 17 Sep 2025 16:01:51 +1000 (AEST)
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-269639879c3so329345ad.2
        for <openbmc@lists.ozlabs.org>; Tue, 16 Sep 2025 23:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758088910; x=1758693710; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+s34MIeVIyFtFvzk5SP7Ttd0a9jEm0/BQEZZUVDP/XQ=;
        b=hiQeUFLE2uDpDQptmrDBU8A1IxFbGjMn+I3mq+OPODCh4PqGEqWNGDZOHgY4yJ/WjO
         MGH5CxYU7zqtvyL/zr2BWyGbiTzUSFVsAhpypt+RMtqPeV9LLC4Yi6nPTpYUdVhmS1in
         ozEg/45xW1xkz56ItCB1F6wwRFWgyXf8i+QCBCc6Lh81VOrvNrOyxzbwo1pePsvokGXc
         iWQkSAQaMKbyX0cyGr0IsUQu5xNgytU8Hr34x8EKqOkOQAIolNesEDjZvdk4da+MhuC8
         jU9AM8qSIkgr742xxVzP4j1UEfwjG33RA3sttBPo1viywuJP7UAGZOxYPtB1udpGbqsl
         9+hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758088910; x=1758693710;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+s34MIeVIyFtFvzk5SP7Ttd0a9jEm0/BQEZZUVDP/XQ=;
        b=rg+w+fHknDt80nhADcy1WBsVow+PFsl65n1dXnkv/0XnI6nVC7wu1Kir40/lNlrW0P
         R98ZUSNF0Q92jFjtCYTGwWyZKPOGfo4Jksar+LnKqWye6JEySefnTMe2I39WmedOW1a/
         j6N7J45TcuY0nBvpGy1Wv0TicK1NiZ/0KXqWvDbVwW/XM8T19nueR3noyYRzaZZiGBn3
         dGBIWkQmdO6hHKi48t3+muOjm75/+aY3KbekXyliVdHga7V5EVmzLZUmd1Jl1C6UjX7/
         N9iqcIooYc9GIU+HQds9YgWbj/tvIl4EkAMkbQxpR0BgwDGeGVE43cbdqZEkVmrwPOst
         Ek8w==
X-Forwarded-Encrypted: i=1; AJvYcCVkKWAsZg1rDTB99QoHBAmN9SeL5XaVADVYubaN6S63ZukumzRau8wrC+MX4rfPyiRKD+2jLbIv@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxdSqrOaHNd1ntMjwl894l149ofg9L4zrzPEl3wd7pvWKcgXZN/
	xaAJ9qqUr/a43Ks64NvJ3tNA6LedtgWyuSnaPCKrtyzgUf4x4NsV0lIX
X-Gm-Gg: ASbGncsgkKkXJTt+/BvrBnXlRMlHKBMr1xvfrAoabw+U2cIW6PGHAnAkpxQnG2K+ugl
	FaBaf43lD5/JC4rAUe9RqcNqZCeqwVebacyAiukMtdmRdKZ3qJTBsKjLXJX9VCLeNCT/Ad7si4n
	oNAp0ihdgTEZW+SwzOBjnjdR+Di0hueE5KueU/JrkAdZVLIOHIrz1B4YodWGwZxCje0zY1m2WCc
	Sb+r4nMX8kp8OIg7UBPeezfvPCA/3hu+KDk3dCSlJ5TlagA5qvZwBnOr0aiaksb8UsVWUy5wZb0
	gfLZhJMGpP4JyqMyINTqbDus+uKgv1cLqET308bRlTGcU0EHn/AoOV4J9g33MXlkFnT9yHFzyt3
	JEkK6BLEE5dPzEaz5mL0s1+VfpilZwQm0sZZFz68/CvEAFhbXPuhsF7OT/x2IXARLIWw+Ps1ftU
	IZ2Q2O8p6I92eLRrFj+uvUGXvlvQ==
X-Google-Smtp-Source: AGHT+IEdPmryj3l+be8kvf6JFOL+P7ibzdXfL8BrvAyvAFjwr/LNzbfk+XODzr6/14KGEkOMyG/JOQ==
X-Received: by 2002:a17:903:183:b0:24d:64bc:1494 with SMTP id d9443c01a7336-26812169a13mr13829015ad.18.1758088909997;
        Tue, 16 Sep 2025 23:01:49 -0700 (PDT)
Received: from eric-eric0420.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2645b8a6357sm92235525ad.130.2025.09.16.23.01.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 23:01:49 -0700 (PDT)
From: Peter Yin <peteryin.openbmc@gmail.com>
To: andrew@codeconstruct.com.au,
	openbmc@lists.ozlabs.org
Cc: peteryin.openbmc@gmail.com
Subject: [linux,dev-6.12,v1 9/9] hwmon: (ina238) Correctly clamp power limits
Date: Wed, 17 Sep 2025 14:01:34 +0800
Message-ID: <20250917060134.2383005-10-peteryin.openbmc@gmail.com>
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

From: Guenter Roeck <linux@roeck-us.net>

ina238_write_power() was attempting to clamp the user input but was
throwing away the result. Ensure that we clamp the value to the
appropriate range before it is converted into a register value.

Fixes: 0d9f596b1fe34 ("hwmon: (ina238) Modify the calculation formula to adapt to different chips")
Cc: Wenliang Yan <wenliang202407@163.com>
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
(cherry picked from commit c2623573178bab32990695fb729e9b69710ed66d)
---
 drivers/hwmon/ina238.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/ina238.c b/drivers/hwmon/ina238.c
index c6b2734898d0..59a2c8889fa2 100644
--- a/drivers/hwmon/ina238.c
+++ b/drivers/hwmon/ina238.c
@@ -517,9 +517,10 @@ static int ina238_write_power(struct device *dev, u32 attr, long val)
 	 * Unsigned postive values. Compared against the 24-bit power register,
 	 * lower 8-bits are truncated. Same conversion to/from uW as POWER
 	 * register.
+	 * The first clamp_val() is to establish a baseline to avoid overflows.
 	 */
-	regval = clamp_val(val, 0, LONG_MAX);
-	regval = div_u64(val * 4 * 100 * data->rshunt, data->config->power_calculate_factor *
+	regval = clamp_val(val, 0, LONG_MAX / 2);
+	regval = div_u64(regval * 4 * 100 * data->rshunt, data->config->power_calculate_factor *
 			1000ULL * INA238_FIXED_SHUNT * data->gain);
 	regval = clamp_val(regval >> 8, 0, U16_MAX);
 
-- 
2.43.0


