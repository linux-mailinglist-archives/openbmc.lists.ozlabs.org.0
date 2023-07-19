Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B630759DA8
	for <lists+openbmc@lfdr.de>; Wed, 19 Jul 2023 20:42:44 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256 header.s=google header.b=TckggQyz;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R5l762sPcz30gy
	for <lists+openbmc@lfdr.de>; Thu, 20 Jul 2023 04:42:42 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256 header.s=google header.b=TckggQyz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=9elements.com (client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com; envelope-from=naresh.solanki@9elements.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R5l6V0wqMz2ytr
	for <openbmc@lists.ozlabs.org>; Thu, 20 Jul 2023 04:42:08 +1000 (AEST)
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-3172144c084so158092f8f.1
        for <openbmc@lists.ozlabs.org>; Wed, 19 Jul 2023 11:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1689792125; x=1692384125;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HrjkymWQEytm3ZEsWHkhp23Z4KQxMO3ORXG0AjMGsDw=;
        b=TckggQyziPAn3xmiAQXv2PciXO8X0PSzmy1GiTSSOloJ7PmzNRhVBvXIi+OhxGxCOt
         V1WYDpZ63YvfAhahRBeXrP/iloLgg+25SIJTIhmNG2J8MvnsroBwF+jgYI9wtWAzwfaQ
         BM4ZD6Ti9JGApvDzpH9eRgomPW6sjk0GEvRQRsSh8tCPs+symP4f95Fseaqp1vFEAGgT
         jEEeMuH+Hm4ORkGTHZ1C0n2ESPtJRIZsm1sPTInc2Ej+mN1VcxuOAbaCM9VaDoQnvP5A
         ATVIwPoHgYMF/aYMu27RntJ17ZmOaqkccb5GfY8l+0P7Ve7MMHydJg8sjrpmc59lCHOc
         PvDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689792125; x=1692384125;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HrjkymWQEytm3ZEsWHkhp23Z4KQxMO3ORXG0AjMGsDw=;
        b=hnxqyJkjqndZeMakdia2YgyVCwKbMU1PR+tNKWBkEgNgAAXpckAbSfdqZR08QEh2mZ
         wUMJlGOYWfcN7vKVcpv1LjZjebo6JZ/R6+NzT/yGnMa+OYH7vO83yNBGGN4H9nq2yxAf
         6UzE9hIS9TzFvBipRxp1JJrew4etjUvboPDGhsH7id0+z2tqYI7fz/1zWLX/ThGEKRHV
         grEXJ65O6hURvqawFCSl2k0+Nx+RZUcNG1H6EM+duoEd8EoWcGPGsrF6qKSM+v4xlD+R
         8s3n+rcBhnDs1/YMqlpfK8YB91/QuD3nZoOPT74J4FzyuDQ9zronnMHnN7Q4IZbMH/3C
         yofQ==
X-Gm-Message-State: ABy/qLbuNkuAdgXlbdEXkL9oH6d9GcKQEqNq8II4IG1Y6tlgtOM+O/O5
	DvaG22hUbRK6uAv90z/uv4Wq6w==
X-Google-Smtp-Source: APBJJlHbdMsb7I2HjGqQtfegpmV8gfoG0PItgVLH8qX6gTM3nRUo4n++u3Rie849H2AllpORTMgs0Q==
X-Received: by 2002:a5d:4561:0:b0:316:e325:fd92 with SMTP id a1-20020a5d4561000000b00316e325fd92mr531092wrc.55.1689792124801;
        Wed, 19 Jul 2023 11:42:04 -0700 (PDT)
Received: from stroh80.sec.9e.network (ip-078-094-000-051.um19.pools.vodafone-ip.de. [78.94.0.51])
        by smtp.gmail.com with ESMTPSA id n18-20020adffe12000000b003143be36d99sm5948877wrr.58.2023.07.19.11.42.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jul 2023 11:42:04 -0700 (PDT)
From: Naresh Solanki <naresh.solanki@9elements.com>
X-Google-Original-From: Naresh Solanki <Naresh.Solanki@9elements.com>
To: linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	iwona.winiarska@intel.com,
	linux@roeck-us.net,
	jdelvare@suse.com
Subject: [PATCH v3 1/3] peci: cpu: Add Intel Sapphire Rapids support
Date: Wed, 19 Jul 2023 20:41:52 +0200
Message-ID: <20230719184155.59375-1-Naresh.Solanki@9elements.com>
X-Mailer: git-send-email 2.41.0
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
Cc: openbmc@lists.ozlabs.org, Patrick Rudolph <patrick.rudolph@9elements.com>, Naresh Solanki <Naresh.Solanki@9elements.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add support for detection of Intel Sapphire Rapids processor based on
CPU family & model.

Sapphire Rapids Xeon processors with the family set to 6 and the
model set to INTEL_FAM6_SAPPHIRERAPIDS_X. The data field for this entry
is "spr".

Tested the patch series with AST2600 BMC with 4S Intel Sapphire Rapids
processors & verified by reading cpu & dimm temperature.

Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
Signed-off-by: Naresh Solanki <Naresh.Solanki@9elements.com>
---
Changes in V3:
- Move spr entry at end of struct peci_cpu_device_ids
- Mention test with the patch.
Changes in V2:
- Refactored from previous patchset as seperate patch based on subsystem.
---
 drivers/peci/cpu.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/peci/cpu.c b/drivers/peci/cpu.c
index de4a7b3e5966..bd990acd92b8 100644
--- a/drivers/peci/cpu.c
+++ b/drivers/peci/cpu.c
@@ -323,6 +323,11 @@ static const struct peci_device_id peci_cpu_device_ids[] = {
 		.model	= INTEL_FAM6_ICELAKE_D,
 		.data	= "icxd",
 	},
+	{ /* Sapphire Rapids Xeon */
+		.family	= 6,
+		.model	= INTEL_FAM6_SAPPHIRERAPIDS_X,
+		.data	= "spr",
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(peci, peci_cpu_device_ids);

base-commit: 4dbbaf8fbdbd13adc80731b2452257857e4c2d8b
-- 
2.41.0

