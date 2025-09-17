Return-Path: <openbmc+bounces-655-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A8CAB7F015
	for <lists+openbmc@lfdr.de>; Wed, 17 Sep 2025 15:10:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cRSp71ShKz3cdV;
	Wed, 17 Sep 2025 16:01:51 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::635"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758088911;
	cv=none; b=gh4vJBFt95hcqBhzev/qZWcBB6FTcVYQT0PQ2Ai0vmtm2gk8dQ6wiOCOE9ZLEPbgfTpKe95+pbkzoeLs+MWBnkV1aTDmAyUXSkBRkUhkmFvVPrbNn7t/r/M3dYQAg1VVOMfqB39fJftU9FV8NEqw6+K4ZIf+owkfAC741tbR4K+rO4RjyvEHLBkHUm+lPYG1eCL3+7MQYsnCe8q9ZRm4q5JEAEgqO8Gbo2G4h2K4qCGE0LGCHRnBY7OKi2diwd36Z+DZVq4Vk2K7WwWOhzFvB6M/gYxfEM/KNgq+s/iF17IMKB3AT+9Zm0agkKmHM4yBrp4VMKvIUBU09wS/WPOSGg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758088911; c=relaxed/relaxed;
	bh=6aEYFEAEsmxw+iGGYTIse2SNJyRNzXgFF7gYzfiAjOM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H6butOtYdmtg08lHHWYbRSg/X8WhS9VgCgdb2BZZbrYhR5T5MSr54S5U3scJFdeIi9jzPvrZWcSTxSPV7Amq/6Lk/EgS4Wrg33PEfpqmQhXOfK6fKrvWnqanQDTTSa6uDsfyWj1sU/hSlrWLgG8qf0FPsK5Ja65BveVgx+W2dv/3pkutC5QqgBjMXTDaUGb6oURg0fEEftmDKEoluem/vYuXQBcntYM7h0kqPrbVHIJpcFiJusnp/G8ePKnegTgf2EsZTfO5/7TeKce0WCGGL/oFNZF25sqdMWaVNDzm3Q2EpeoGO3/tpWHSIpRPU75YNuVsfRnSKXiKkblBoT/Lew==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=RKF3gAIo; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=RKF3gAIo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cRSp63Wb4z3ccV
	for <openbmc@lists.ozlabs.org>; Wed, 17 Sep 2025 16:01:50 +1000 (AEST)
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2445805aa2eso56214905ad.1
        for <openbmc@lists.ozlabs.org>; Tue, 16 Sep 2025 23:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758088909; x=1758693709; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6aEYFEAEsmxw+iGGYTIse2SNJyRNzXgFF7gYzfiAjOM=;
        b=RKF3gAIoX6Nn/l/7AEjJikHBbgEPs5dVho0SqbzM/XRHGm5klmTh+0GiBNIoc3f19I
         qXvUaTuSE7kc5i80LtLq59HxwQTxfXCDBBnCxzjt+nO0wHPXkEv+Y3QjOjKgB/iWWiGj
         ORCniIq83k0nvPstUdyqb7mn6FW4xHEdguAavTYW4m+E+GRiQyylOzfFujQSqwOxuRy/
         rJMWb/ZKlqNhnlm0otSIKxcHlG41qjGM1rk1kzhCzT7KJPtwJadApGb6gj0HHMvgxWIk
         NEHm3qm6ePb6qz3L8LGzbopX9J7TeB+8lqQLVPZgzZUaOU6O57fjsRlTJWKSfZIBoK+X
         uxfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758088909; x=1758693709;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6aEYFEAEsmxw+iGGYTIse2SNJyRNzXgFF7gYzfiAjOM=;
        b=pIR1G8plGQVhLgu3+/iDXZFR1YhN+t64jn9lWoyMOmRyI/SMK5oEWH5aQD8e4cZYfI
         r0vRWSJZDh2nH+IrC0Zap7A/VFpucjB+tbADoRyNSuBul5VFLMWrJeJyZ3OJOSAh3Q3L
         VFKdqZ+23zwAaa0FLlwd8YOhAZxcJONPpz/WLgw1nStp81N16uwsgmNMf+AkQZEjp0hU
         RAlwiCFPB+TxHgMQdZkRjSNjgXa255wwCWDIKlZEuhpCLMltJtSH36mvsSdKTHnWgHci
         cIZ+PPjBKXR3UsXox8nnxS2J+VYDTBRaVBAwlSC2je7S+ZRD1S49ETSB3WRdPskveIM8
         WFAQ==
X-Forwarded-Encrypted: i=1; AJvYcCWp55sKIikEhWSq1/G19S3Cx4MJi1pGosIcvw4GW2t8/3WJlcIDJR85I56swFkZAK1YeIWgfZ8T@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwmiVjL63nJfUZ1rZlDnF5tbg2ujq6/iwuiCeq6MKCapA2Pa/E3
	+7I42sPg3qyiVGE2TBRJxrNk/E0zyhTuTP79VKXsy6EV2sY9t+vc+8hY
X-Gm-Gg: ASbGncu17tGLyAtFXEOoFjt/JNOLx4cvvmtBc3giFr8jkHnAjSTgm8s66GYHaV2ng11
	boim/Wc6qXNnTqKSjme9dMxpXjTZMfeerxCwGqtiFGmbw2EaW398EeWipPKBy2XJq7v/y+nvqtM
	cpwxdfBOwpTPECAIMH2PDLfaGixc9wpCmExDmOCc/vKcsEmq1MkSocHDBVnWIwE+h2Y9XvSmfbu
	EEUUlZSTvK2p7OZyweiOqGTsTb4OPRHLbO3aH89p5JzB3o0OZKdnHNlHtmOPGHGsTaqISLvYsH5
	VptQBnqAI3J7sQxKcFkkyVtPUh7jL+dDY+WnKS/GTFTJQd+eKTKnE6xUc+7Gf+JX2jhcOIhMKDz
	W3SjghGDH1vDxzJn62zg3Vx43tWhMrq9nKVqBiXjt4M11kteQx85EF5159ZReJUzKoi8jgVRr4e
	pcO0dEsyjCIdcYDAIDv79nFlqWOw==
X-Google-Smtp-Source: AGHT+IGbJI6/uowbMnhdWFxqfK33iaomTrGlOgkZ8dmFysRGXwCN+emOZ0+dyPNLGARWYlIOuirVkQ==
X-Received: by 2002:a17:902:e882:b0:267:95ad:8cb8 with SMTP id d9443c01a7336-26813be8412mr11629665ad.44.1758088908551;
        Tue, 16 Sep 2025 23:01:48 -0700 (PDT)
Received: from eric-eric0420.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2645b8a6357sm92235525ad.130.2025.09.16.23.01.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 23:01:48 -0700 (PDT)
From: Peter Yin <peteryin.openbmc@gmail.com>
To: andrew@codeconstruct.com.au,
	openbmc@lists.ozlabs.org
Cc: peteryin.openbmc@gmail.com
Subject: [linux,dev-6.12,v1 8/9] hwmon: (ina238) Correctly clamp shunt voltage limit
Date: Wed, 17 Sep 2025 14:01:33 +0800
Message-ID: <20250917060134.2383005-9-peteryin.openbmc@gmail.com>
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

When clamping a register value, the result needs to be masked against the
register size. This was missing, resulting in errors when trying to write
negative limits. Fix by masking the clamping result against the register
size.

Fixes: eacb52f010a80 ("hwmon: Driver for Texas Instruments INA238")
Cc: Nathan Rossi <nathan.rossi@digi.com>
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
(cherry picked from commit bd7e7bc2cc2024035dfbc8239c9f4d8675793445)
---
 drivers/hwmon/ina238.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/ina238.c b/drivers/hwmon/ina238.c
index 4d3dc018ead9..c6b2734898d0 100644
--- a/drivers/hwmon/ina238.c
+++ b/drivers/hwmon/ina238.c
@@ -379,7 +379,7 @@ static int ina238_write_in(struct device *dev, u32 attr, int channel,
 		regval = clamp_val(val, -163, 163);
 		regval = (regval * 1000 * 4) /
 			 (INA238_SHUNT_VOLTAGE_LSB * data->gain);
-		regval = clamp_val(regval, S16_MIN, S16_MAX);
+		regval = clamp_val(regval, S16_MIN, S16_MAX) & 0xffff;
 
 		switch (attr) {
 		case hwmon_in_max:
-- 
2.43.0


