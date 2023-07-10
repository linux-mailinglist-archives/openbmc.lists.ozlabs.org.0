Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E6DB755DF1
	for <lists+openbmc@lfdr.de>; Mon, 17 Jul 2023 10:09:57 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256 header.s=google header.b=Bnwq/Qi/;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R4F9v0f8mz2yF8
	for <lists+openbmc@lfdr.de>; Mon, 17 Jul 2023 18:09:55 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256 header.s=google header.b=Bnwq/Qi/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=9elements.com (client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com; envelope-from=naresh.solanki@9elements.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R08YS0vz0z2yxK
	for <openbmc@lists.ozlabs.org>; Tue, 11 Jul 2023 02:27:39 +1000 (AEST)
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-313e742a787so3470015f8f.1
        for <openbmc@lists.ozlabs.org>; Mon, 10 Jul 2023 09:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1689006453; x=1691598453;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WVlZJd24DRUTRrQURnZ7yN63fxP+eJTyjrLPGCN3yY4=;
        b=Bnwq/Qi/JmJjvgrXJcJ4mxBmPQeRQvv390HGFGyUuTvK+3qjIUcYFRnHUurd+gHv3i
         USKmOQi84077zEMtO7p2FhECnBcE9G7vjQgZ19Kds60m7VHN0MpNvyJc4V5XavGlJpQm
         tjZrqL2UC/kdcEONl+g1Uc+2eRQ7ftePacgIlBr5xUWoDde/to5RoEqMdvh8dD0JioYY
         Z79ws2GNv5acVnlc8DqjGQE8i58IFkKYB/YyLALneu1RcQGXdztWFuVVlVueOY/+fE7A
         6tajkBjIlsf57ytcpElDPl7q4gUgmS5UOyD7x10Y4Kew82jwdMv5HIQAswHYrbSUZ1md
         X7Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689006453; x=1691598453;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WVlZJd24DRUTRrQURnZ7yN63fxP+eJTyjrLPGCN3yY4=;
        b=Tpqc6HDuIw+w40VcEF60JL3ksYbij3vyRfIj5LbYIolVB1zanNaRVqsx1EhIJsahPx
         eTmz72M2taSNRs4Kh0zMofqHokxvYFlSoVi1T4qqNwqu1vm2WyByfDcpZIQHqTAZ6IIv
         KKWQPGADqtWRaDpqrHc19CIG0zKdD/ArOAFAt0X1RiuUT5dS+1oieoE4tkGR1GLsB5H6
         IOkqIi4b6St1ztADPBHmlWhTuITYykN8WLTziBbRUfQKoHmQ7mSiFswNiaGAyTvVTKL4
         hv/c7KG5ULjUSk2/1aMGJ9qao+Y78LcOtcFcFGH3FjPqglwuRzNNQ7LYdHqnink4fjJU
         Nvkw==
X-Gm-Message-State: ABy/qLbf1H/029FDFLIjidzVNbQtyVcqYiR2h/AEAUB2piTXrGcMe9ZO
	XvZTh08mJY9MjcTqRhA9/noBmA==
X-Google-Smtp-Source: APBJJlFhwyy6ydGp2WjaMZUpUK1JbYJNqOtWi+1SPoy1P4WD5lmV5bX0C2TlnZFlc4ZK4sKA1DrIFQ==
X-Received: by 2002:a5d:65ce:0:b0:315:7f1d:7790 with SMTP id e14-20020a5d65ce000000b003157f1d7790mr6145269wrw.6.1689006453352;
        Mon, 10 Jul 2023 09:27:33 -0700 (PDT)
Received: from stroh80.sec.9e.network (ip-078-094-000-051.um19.pools.vodafone-ip.de. [78.94.0.51])
        by smtp.gmail.com with ESMTPSA id h16-20020adff190000000b003144b95e1ecsm12029064wro.93.2023.07.10.09.27.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jul 2023 09:27:33 -0700 (PDT)
From: Naresh Solanki <naresh.solanki@9elements.com>
X-Google-Original-From: Naresh Solanki <Naresh.Solanki@9elements.com>
To: devicetree@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>,
	Jean Delvare <jdelvare@suse.com>,
	Iwona Winiarska <iwona.winiarska@intel.com>
Subject: [PATCH] hwmon: (peci/cputemp) Add Intel Sapphire Rapids support
Date: Mon, 10 Jul 2023 18:27:23 +0200
Message-ID: <20230710162724.827833-1-Naresh.Solanki@9elements.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 17 Jul 2023 18:09:26 +1000
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
Cc: linux-hwmon@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Patrick Rudolph <patrick.rudolph@9elements.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Patrick Rudolph <patrick.rudolph@9elements.com>

Add support to read DTS for reading Intel Sapphire Rapids platform.

Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
---
 drivers/hwmon/peci/cputemp.c | 18 ++++++++++++++++++
 drivers/peci/cpu.c           |  5 +++++
 2 files changed, 23 insertions(+)

diff --git a/drivers/hwmon/peci/cputemp.c b/drivers/hwmon/peci/cputemp.c
index e5b65a382772..a812c15948d9 100644
--- a/drivers/hwmon/peci/cputemp.c
+++ b/drivers/hwmon/peci/cputemp.c
@@ -363,6 +363,7 @@ static int init_core_mask(struct peci_cputemp *priv)
 	switch (peci_dev->info.model) {
 	case INTEL_FAM6_ICELAKE_X:
 	case INTEL_FAM6_ICELAKE_D:
+	case INTEL_FAM6_SAPPHIRERAPIDS_X:
 		ret = peci_ep_pci_local_read(peci_dev, 0, reg->bus, reg->dev,
 					     reg->func, reg->offset + 4, &data);
 		if (ret)
@@ -531,6 +532,13 @@ static struct resolved_cores_reg resolved_cores_reg_icx = {
 	.offset = 0xd0,
 };
 
+static struct resolved_cores_reg resolved_cores_reg_spr = {
+	.bus = 31,
+	.dev = 30,
+	.func = 6,
+	.offset = 0x80,
+};
+
 static const struct cpu_info cpu_hsx = {
 	.reg		= &resolved_cores_reg_hsx,
 	.min_peci_revision = 0x33,
@@ -549,6 +557,12 @@ static const struct cpu_info cpu_icx = {
 	.thermal_margin_to_millidegree = &dts_ten_dot_six_to_millidegree,
 };
 
+static const struct cpu_info cpu_spr = {
+	.reg		= &resolved_cores_reg_spr,
+	.min_peci_revision = 0x40,
+	.thermal_margin_to_millidegree = &dts_ten_dot_six_to_millidegree,
+};
+
 static const struct auxiliary_device_id peci_cputemp_ids[] = {
 	{
 		.name = "peci_cpu.cputemp.hsx",
@@ -574,6 +588,10 @@ static const struct auxiliary_device_id peci_cputemp_ids[] = {
 		.name = "peci_cpu.cputemp.icxd",
 		.driver_data = (kernel_ulong_t)&cpu_icx,
 	},
+	{
+		.name = "peci_cpu.cputemp.spr",
+		.driver_data = (kernel_ulong_t)&cpu_spr,
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(auxiliary, peci_cputemp_ids);
diff --git a/drivers/peci/cpu.c b/drivers/peci/cpu.c
index de4a7b3e5966..3668a908d259 100644
--- a/drivers/peci/cpu.c
+++ b/drivers/peci/cpu.c
@@ -318,6 +318,11 @@ static const struct peci_device_id peci_cpu_device_ids[] = {
 		.model	= INTEL_FAM6_ICELAKE_X,
 		.data	= "icx",
 	},
+	{ /* Sapphire Rapids Xeon */
+		.family	= 6,
+		.model	= INTEL_FAM6_SAPPHIRERAPIDS_X,
+		.data	= "spr",
+	},
 	{ /* Icelake Xeon D */
 		.family	= 6,
 		.model	= INTEL_FAM6_ICELAKE_D,

base-commit: 4dbbaf8fbdbd13adc80731b2452257857e4c2d8b
-- 
2.41.0

