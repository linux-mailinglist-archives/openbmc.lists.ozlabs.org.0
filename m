Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CBAE9761123
	for <lists+openbmc@lfdr.de>; Tue, 25 Jul 2023 12:44:43 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256 header.s=google header.b=QRAUr/fN;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R9DDn57xmz3bd6
	for <lists+openbmc@lfdr.de>; Tue, 25 Jul 2023 20:44:41 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256 header.s=google header.b=QRAUr/fN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=9elements.com (client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com; envelope-from=naresh.solanki@9elements.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R9DD834p1z30hC
	for <openbmc@lists.ozlabs.org>; Tue, 25 Jul 2023 20:44:06 +1000 (AEST)
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-3fbc5d5742eso52618205e9.3
        for <openbmc@lists.ozlabs.org>; Tue, 25 Jul 2023 03:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1690281837; x=1690886637;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Y2+LOkmbRzocNLGHFc65c1vCZRpwTkaqodGNOPSIAJU=;
        b=QRAUr/fNWYjB0sOxrI8MMRk87D1j2LMRs7ByIWGHV02Y+iFcHv5AnkKaJ4jo/3WkQQ
         gTIpW4yMlpTKWW00bLhLpD9HCS08121iceRfhHIFqs4FQoAxpigzlblcApJfliU0DLu1
         Fww/vuWbs/HhGvYYWb0vhdVa2Ygo7nbMcT200KrrjHVYquOhuDxB6vu0knKLJaamkmLp
         ToUTTPiG5CFN1T18MkEQofHAuNUr9aUIqLf7fmmDz8GMJKr0Rfb3QZvr8yZDcaRveY3u
         mIaZBorI1JvKm28Eb+aGIMu9mZCvSisgna8BS0deWIhMMwlk4OuZgBewSalsTvHtKZ8n
         Qt+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690281837; x=1690886637;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y2+LOkmbRzocNLGHFc65c1vCZRpwTkaqodGNOPSIAJU=;
        b=FM4vaT20dLOy4nIvtYjSoVWHAP71RBrS397x7v0AR74r+nBpDbdWM4gjBz0sr5KOmF
         tV8S4RgFtlaBR9KeC/Ohj9EVEA9EqX1yYhiSZmrwLmKc59X4XvYm9DT89irM6EH1UKME
         3rQFu8UeoZDhTGcTb8BRA0cPhKIBGxp5DJ0sZr5OazcQWnN0FjTr9B7ZuS5asc96zpjN
         Eq1BWETH5OH4JXZeYcOAzo5j+I9WPoAKd1jzYy5iLUn877aI4ZdzbGjCfxbttBIFG/w1
         t7EIFbarz+Et8+nuvlXAoY5FsP7AV0ziYUQddkeN8JhhupMs8uijD2thpvnjpZNTzUub
         wnsw==
X-Gm-Message-State: ABy/qLYpoUysHR4hBTn9XjKCg4y766NKebPsAW/g7YmGowxr/LMpRdjX
	IC2ntaLlY2bFsGu0iDZ5Qbt73w==
X-Google-Smtp-Source: APBJJlFgnYys6xLwEPqvMSaNFLz0aaGFAQiC1lUMCbKi1QUfpXLwHlZMzXcC3NjQhAM4FS+FHyhNCQ==
X-Received: by 2002:a05:600c:2a54:b0:3fb:a917:b769 with SMTP id x20-20020a05600c2a5400b003fba917b769mr9567467wme.21.1690281837646;
        Tue, 25 Jul 2023 03:43:57 -0700 (PDT)
Received: from stroh80.sec.9e.network (ip-078-094-000-051.um19.pools.vodafone-ip.de. [78.94.0.51])
        by smtp.gmail.com with ESMTPSA id n12-20020a5d6b8c000000b003143c6e09ccsm15793723wrx.16.2023.07.25.03.43.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jul 2023 03:43:57 -0700 (PDT)
From: Naresh Solanki <naresh.solanki@9elements.com>
X-Google-Original-From: Naresh Solanki <Naresh.Solanki@9elements.com>
To: linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	iwona.winiarska@intel.com,
	linux@roeck-us.net,
	jdelvare@suse.com
Subject: [PATCH v4 1/3] peci: cpu: Add Intel Sapphire Rapids support
Date: Tue, 25 Jul 2023 12:43:51 +0200
Message-ID: <20230725104354.33920-1-Naresh.Solanki@9elements.com>
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
Reviewed-by: Iwona Winiarska <iwona.winiarska@intel.com>
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

base-commit: 55612007f16b5d7b1fb83a7b0f5bb686829db7c7
-- 
2.41.0

