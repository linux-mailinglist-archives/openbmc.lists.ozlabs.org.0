Return-Path: <openbmc+bounces-719-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 89C84BBF9CC
	for <lists+openbmc@lfdr.de>; Mon, 06 Oct 2025 23:54:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cgY2V0t5mz2yrR;
	Tue,  7 Oct 2025 08:54:26 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::82f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1759787666;
	cv=none; b=cVJuBr9675SJ1wEFMtB9SWOTmShUNtseY3Fd9EgHCaGbBC9IjMjx5yHBOv4T5S9zgyGqi3rZ82YyFujNsEoYj2fxj6GWTG4E3JxeFDdNrQy8mSfq3DzUDlbj9O2InJ7FgD//hP5Gbn0omqgzBOSc5VY8hrA6DNjMpbfHGxIi6/m0cbqHD4QvoeIvVebqg3faBgORu3r7TW5Z1FOQOLFcmrpWNXSiWw83nMBmLTM8J5Iynf/sBM+dV0pOClN7Ft0r6uCYDvySByoBHI6ZX0UffXIoEiuKs03IcEisb8IiIHspAEXUrEkaTNbYeWSEpScnU4CkriW7KV4mioFYbQsKbw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1759787666; c=relaxed/relaxed;
	bh=3Q6YwOnteWkXrFVfwwt3UMJd59Tc05yv6Qyt+3nvVpc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IU6REZxHeSlsPCKWbuKKKFaMab+iF3mOAQ1odwD5092RFsi7+MCpABwVPyX7P4uieP5LNpA/hF9IiUOF9t3Yj9pEWzK7qwCJ+D7+K5XHj+87H8ERo+CT47Wu9uEYn9RTtKL7D4+hE4tot/KxmEJ7pXSD8QsfbrVzGkOtj469xFsxpikwrskiHzns2B6FrEbpYMIZ2LJvrZbE92ddvUM0Hax5bcQ7V1o30WloGXGESF+MVhKdbMqJw+kCTl1Ab4Z118xmjbpWv8/t5Am+KYfg0zhksxeKTkjahEBHqIPf7Rw4ZZYqI3w1GC7JBJ3fyUih6f7cP2tR6iXomiCkuzQ5Xg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=IveLQmfm; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::82f; helo=mail-qt1-x82f.google.com; envelope-from=fr0st61te@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=IveLQmfm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::82f; helo=mail-qt1-x82f.google.com; envelope-from=fr0st61te@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com [IPv6:2607:f8b0:4864:20::82f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cgY2T1r2Fz2xgp
	for <openbmc@lists.ozlabs.org>; Tue,  7 Oct 2025 08:54:25 +1100 (AEDT)
Received: by mail-qt1-x82f.google.com with SMTP id d75a77b69052e-4da7a3d0402so59986181cf.0
        for <openbmc@lists.ozlabs.org>; Mon, 06 Oct 2025 14:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759787662; x=1760392462; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Q6YwOnteWkXrFVfwwt3UMJd59Tc05yv6Qyt+3nvVpc=;
        b=IveLQmfmCjqPogBL1ISHabCsISJ6upb3y5/WGWhMeCUc/ZxekhUlz9lj1Wz0w4Esc8
         LNwM6oxKEC7k6I4KcF9cyR+qVjdm6xpcbhYmfuqccLauupvNHxK1+e5IvTKMJuwjpwjb
         JH3sFOoBt1i+ouepyGWMZzjFjc4s7juSza6Uhkj6zNwVamex9HtRZf50Zl3wfTSRohjd
         BlUKd4LbMPzXLCX4xbCWhCBJq9DSFRy2wFjxvBaMbW84ptI9k4R1Rd8PCXENCHhj/9Q1
         zczg8WDGarnZQnMcW8cFEcA7NPPtLS6nIh5/EH7H3YUcYRknIRhSFsnZeSe7idJ7rYng
         AV7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759787662; x=1760392462;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3Q6YwOnteWkXrFVfwwt3UMJd59Tc05yv6Qyt+3nvVpc=;
        b=FqINPKSqgnQk5XzVW1YGyzQjb8LyI6YMsM70aMX88KcbyTHiHqQ7FbH0tm4wcm1se7
         kXyXcHmZ6VGGiWa/QvA7E53DA/KD4S/poLTOwVbiBd3WTLswHyPxUkDPYgCklPNE85Sn
         59f3KNIkmff/c3qIwHTc7DfodlaybzPYOAmRLwX2DgL6LrW/cLCwIwqjUtYqBbZRWL+2
         cOKhacNvVtQJRT2KFKVgCr6N/HhknhvNGmUqUs1aeaW3jgd5lFWPMkemnAsTyNNKE7Eg
         dVz3rXs5vncj7UZqeO3CS+Gu8GrC/YxifKn7flsTUUAFvOhnMXg7Eq4SHpH1dULevSlv
         Jg4A==
X-Forwarded-Encrypted: i=1; AJvYcCU16BIAT3OliKXxnQSmQcHM6CgDjg2sixjhGRHSsf6sQavIYvnqzguw13zDBQx52V13rS70KWjF@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxQyEugwSi2BWA0MLXfgTHPPA6jdFdXfKQ2YckhPBkO4VdWL4J7
	itKZqbaZNcxw+MMO1Y3miy7PEKBytxjHv1gchpJRW53if5yAxYfVR6FV
X-Gm-Gg: ASbGncujDiWOwXJJJybhiDsX91W0F6IKShSpIN0ptWFPO3ArPyfapULOX1I8ccaLHGP
	jhzuAmrjdUylGosmH7zy19pHWSnHFGxVIWr2XVMW8RFxVZretrANMRYQwNq9lpWXvaS9feGrynv
	3h40K9X6R8AOlFy8ExKFG2a92VIOlk1OlWNvB9AFDsIQPQCdkakW6mJ3+YL0gVKybyhCoxvRVYF
	m/bEjUXYJHS3Ni1IQ2e666jNDk4QIcu3IUEHUBMHNIy4366UQ14k3HmBs9QLkQ4+Q0gAUglO6Ye
	D+xYll3qEhn5Frf9W0nqTPmmu8icDpdxYUfmr2xqhUx/sbeQ/5Tpl3otB/HcPlPB2DRjP+0NVrb
	xBFPPqiKkT1wddq37bd6+1Tyo9c9hHbTQYYDEyQ==
X-Google-Smtp-Source: AGHT+IHchaEbDnZ8Ri0i8FvX4Rk3xyBgP25U5vpYrxC0Nu/hB8ro4Sxja78hVg7UibwtHsPynnNHWQ==
X-Received: by 2002:ac8:5f0e:0:b0:4cf:1eba:f30d with SMTP id d75a77b69052e-4e6de86ab3dmr16256151cf.23.1759787662397;
        Mon, 06 Oct 2025 14:54:22 -0700 (PDT)
Received: from fr.lan ([81.200.23.195])
        by smtp.googlemail.com with ESMTPSA id af79cd13be357-87771129478sm1314168585a.1.2025.10.06.14.54.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 14:54:22 -0700 (PDT)
From: Ivan Mikhaylov <fr0st61te@gmail.com>
To: Iwona Winiarska <iwona.winiarska@intel.com>,
	Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	Ivan Mikhaylov <fr0st61te@gmail.com>
Subject: [PATCH 2/3] hwmon: (peci/dimmtemp) add Intel Emerald Rapids platform support
Date: Tue,  7 Oct 2025 00:53:20 +0300
Message-ID: <20251006215321.5036-3-fr0st61te@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251006215321.5036-1-fr0st61te@gmail.com>
References: <20251006215321.5036-1-fr0st61te@gmail.com>
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

Extend the functionality of hwmon (peci/dimmtemp) for Emerald Rapids
platform.

The patch has been tested on a 5S system with 16 DIMMs installed.
Verified read of DIMM temperature thresholds & temperature.

Using Sapphire's callbacks about getting thresholds because it's same
platform/socket.

Signed-off-by: Ivan Mikhaylov <fr0st61te@gmail.com>
---
 drivers/hwmon/peci/dimmtemp.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/hwmon/peci/dimmtemp.c b/drivers/hwmon/peci/dimmtemp.c
index fbe82d9852e0..a281476c7a31 100644
--- a/drivers/hwmon/peci/dimmtemp.c
+++ b/drivers/hwmon/peci/dimmtemp.c
@@ -32,6 +32,8 @@
 #define DIMM_IDX_MAX_ON_ICXD	2
 #define CHAN_RANK_MAX_ON_SPR	8
 #define DIMM_IDX_MAX_ON_SPR	2
+#define CHAN_RANK_MAX_ON_EMR	8
+#define DIMM_IDX_MAX_ON_EMR	2
 
 #define CHAN_RANK_MAX		CHAN_RANK_MAX_ON_HSX
 #define DIMM_IDX_MAX		DIMM_IDX_MAX_ON_HSX
@@ -571,6 +573,12 @@ read_thresholds_spr(struct peci_dimmtemp *priv, int dimm_order, int chan_rank, u
 	return 0;
 }
 
+static int read_thresholds_emr(struct peci_dimmtemp *priv, int dimm_order,
+			       int chan_rank, u32 *data)
+{
+	return read_thresholds_spr(priv, dimm_order, chan_rank, data);
+}
+
 static const struct dimm_info dimm_hsx = {
 	.chan_rank_max	= CHAN_RANK_MAX_ON_HSX,
 	.dimm_idx_max	= DIMM_IDX_MAX_ON_HSX,
@@ -620,6 +628,13 @@ static const struct dimm_info dimm_spr = {
 	.read_thresholds = &read_thresholds_spr,
 };
 
+static const struct dimm_info dimm_emr = {
+	.chan_rank_max  = CHAN_RANK_MAX_ON_EMR,
+	.dimm_idx_max  = DIMM_IDX_MAX_ON_EMR,
+	.min_peci_revision = 0x40,
+	.read_thresholds = &read_thresholds_emr,
+};
+
 static const struct auxiliary_device_id peci_dimmtemp_ids[] = {
 	{
 		.name = "peci_cpu.dimmtemp.hsx",
@@ -649,6 +664,10 @@ static const struct auxiliary_device_id peci_dimmtemp_ids[] = {
 		.name = "peci_cpu.dimmtemp.spr",
 		.driver_data = (kernel_ulong_t)&dimm_spr,
 	},
+	{
+		.name = "peci_cpu.dimmtemp.emr",
+		.driver_data = (kernel_ulong_t)&dimm_emr,
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(auxiliary, peci_dimmtemp_ids);
-- 
2.49.0


