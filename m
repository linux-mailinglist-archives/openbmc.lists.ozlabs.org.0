Return-Path: <openbmc+bounces-720-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ECC3CBBF9D2
	for <lists+openbmc@lfdr.de>; Mon, 06 Oct 2025 23:54:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cgY2X343wz2yyd;
	Tue,  7 Oct 2025 08:54:28 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::72b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1759787668;
	cv=none; b=iA+x60TAbxqNml3pNiO4vlOeOF2yF3RuvK68Q4qZdqQTOEfpHsoDzOgJ055HHr+m+9GJCp7FGfvnB+WXeCJ/3BiLBZZ94B0/SKvsDG2xiWsy9fTtlkPeVua7NYwyCCHuFyn/Ab5p9xxFa429bJbdkzU4gFeh/bSU9dLmYuEiXuvjgKnJFqLj3apx5sQb0sJGXR8d3+jjBau/6ixm7SrKESZlgimgoq5wubSNDy6Xc4LZsfqqN/joH1XGF18YGIWupXhCqtIiUtALlVqI0CmTP48NKdMKTC+ERTeDrRtKGgAJ7mOysom5+CjLK0dQLTbrGLfzWzvEq7GJO8CptnPw2A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1759787668; c=relaxed/relaxed;
	bh=JHzE09hpsw0lAJL0J8v7uFjrU395EJVLjHASm1HYY4s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fObxBYKV06Jtgg1tHvIA6AJSba8lexU1OF5FtkIXv6rEg/uxYEIjfXJfPJ48gkNulI8uQnFWYs8J1YAiWoyNYsyZlCdapgw1lfJ71sGX47mA5/ze0Gf54rIztxQkWcvMIhEwSrjgqzJ685d8uydBJdY3FbY6zofzBCwDb/tMnKhHJJkwauNon1U0BxVGaQQ9n00LO+HQLKwIF5q4sxZlWpe5gLZIjBu/X1R4e0gdqdWZRhKC90nDQgCiLwo5UMsAytYLz4o8TmzrP4vLm26pOWCHaYGpQL8tNsLHhveEDG1n+Lf0B9Bhk8hN61P3MMsqAqYDzY9HrDrU2v9Yho4cjg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=mJijOjJt; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::72b; helo=mail-qk1-x72b.google.com; envelope-from=fr0st61te@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=mJijOjJt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72b; helo=mail-qk1-x72b.google.com; envelope-from=fr0st61te@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com [IPv6:2607:f8b0:4864:20::72b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cgY2W58TKz2xgp
	for <openbmc@lists.ozlabs.org>; Tue,  7 Oct 2025 08:54:27 +1100 (AEDT)
Received: by mail-qk1-x72b.google.com with SMTP id af79cd13be357-85cee530df9so470715185a.3
        for <openbmc@lists.ozlabs.org>; Mon, 06 Oct 2025 14:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759787665; x=1760392465; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JHzE09hpsw0lAJL0J8v7uFjrU395EJVLjHASm1HYY4s=;
        b=mJijOjJthXRaBzRctmzHWhvWzHIG19YcVywJ+yBYddX96l5o6iB50TXnPJY5PDm46q
         qA8vhD/Cd/ETALoHUpBtYxcE2D/OJvGVoYgVuwm07LZdi4zKGvsxfyI2jkrSVMAUlNyr
         LRq4isEdU4hGZWEiQ5z/PaVThujt1JVhQ2yGx/Zy/sm81VWu/O3zuW+lIriQzBgYIB4F
         6hty1645AFfOImI+74zbsUcIE1lk05ohdWmgrYAfvHnkWkBaxW5NeVzdGIpVPH2E50wQ
         0Sl5q4H13RPdksxjhkAYw0AK340/t23YDbSHAJYVPrdQtCNzDBPLLCIqU5cU9vCzyDr8
         eXdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759787665; x=1760392465;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JHzE09hpsw0lAJL0J8v7uFjrU395EJVLjHASm1HYY4s=;
        b=msUgMnQeJEgRH+M8MkkjhZl+O8m+EBPvTI+k7cE/pQ+pZ+YrTpu9PwdwvaNa45Bo4G
         oO2uaK5talR2BWIclD4NKmAW6fQOjc+N8g6mvYVNbTvcbgBEZDPRtxRU7I/g01pgNNvJ
         L1afe4WEMgewyddSbxMg9fS54ukOB0YFbPd4NaHwHVaI+i/rQBTSEw6q0WC35C3josBS
         RfLse5HM8LNZ15rVXdA4170wPNrcXZ5WRIfL32DxcyiPuRYpnal19tGp1ZvusntIRK9r
         RyUHBhbHabvxNyyf70a9Vj6fCs7q1FG+GbuRXd/lUKb5unih9UVAFrFn1pWOSkTYddk6
         feng==
X-Forwarded-Encrypted: i=1; AJvYcCXEVuERWrIh6UxjQZOJiFkB4kkQhPkjMoJ/jWAAbaVuMebgve4vomMJupDNUZiYVx9c/JCc4/XO@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwsXDMJYwrvremmBCwGquRpKbbGA0I/ApUgxx48FZ5LB6cukhvV
	v9uOX/I2zbB9iszvn4y34BXkPUR9PYaPG/qE/m48lnzrrtSStQFppy4+
X-Gm-Gg: ASbGnctP2pjvtG5dcv3c64wEtiicrvn6UxumS5KK31kHYqYhJql804/MGsQkfpcnBi+
	2DaV550+aY/SZGt+0kvfXFhTxmsfHhmL8MbR3ZU4fT0e7BafufvTPX7jp4IKf7s54Xd49kQdCkh
	x11iAAyyuemUgLX/fXbjbN8vngKF89hwCH6tKTueDC4ddPnO6jb8Yz6QCHLWpEDlAwRX9zX5rAF
	ypaXIqiLK34vEQ09Gb2AxATYJd/Bsg3uCLpShW6WlfVHQeRSGOjLle7ttVgDXwh5R9wJxuHedwg
	Be8tEg/Mx9+XqE7OKwIbXhW5hfNsdRDtCt7vHV3hVb8FUyI24PNTZiQGndcDTeEwaAOsRC8kyQt
	DRf990CxkQP8KkmoMvwQ8jj3ipRQd5eVLpd5SeaJeRj8qVMgx4hJmNAltOLU=
X-Google-Smtp-Source: AGHT+IG2LvrD5cGaVRdPojLb3sWgPRcj64j9A2zviwnX8ynP3ZNTQ1PYKRgkchhEsVFBNjv83jnmsQ==
X-Received: by 2002:a05:620a:3950:b0:817:4e4a:6969 with SMTP id af79cd13be357-87a3b891276mr1586802785a.78.1759787664836;
        Mon, 06 Oct 2025 14:54:24 -0700 (PDT)
Received: from fr.lan ([81.200.23.195])
        by smtp.googlemail.com with ESMTPSA id af79cd13be357-87771129478sm1314168585a.1.2025.10.06.14.54.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 14:54:24 -0700 (PDT)
From: Ivan Mikhaylov <fr0st61te@gmail.com>
To: Iwona Winiarska <iwona.winiarska@intel.com>,
	Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	Ivan Mikhaylov <fr0st61te@gmail.com>
Subject: [PATCH 3/3] hwmon: (peci/cputemp) add Intel Emerald Rapids support
Date: Tue,  7 Oct 2025 00:53:21 +0300
Message-ID: <20251006215321.5036-4-fr0st61te@gmail.com>
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

Add support to read DTS for reading Intel Emerald Rapids platform.

Signed-off-by: Ivan Mikhaylov <fr0st61te@gmail.com>
---
 drivers/hwmon/peci/cputemp.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/hwmon/peci/cputemp.c b/drivers/hwmon/peci/cputemp.c
index c7112dbf008b..b350c9a76894 100644
--- a/drivers/hwmon/peci/cputemp.c
+++ b/drivers/hwmon/peci/cputemp.c
@@ -364,6 +364,7 @@ static int init_core_mask(struct peci_cputemp *priv)
 	case INTEL_ICELAKE_X:
 	case INTEL_ICELAKE_D:
 	case INTEL_SAPPHIRERAPIDS_X:
+	case INTEL_EMERALDRAPIDS_X:
 		ret = peci_ep_pci_local_read(peci_dev, 0, reg->bus, reg->dev,
 					     reg->func, reg->offset + 4, &data);
 		if (ret)
@@ -539,6 +540,13 @@ static struct resolved_cores_reg resolved_cores_reg_spr = {
 	.offset = 0x80,
 };
 
+static struct resolved_cores_reg resolved_cores_reg_emr = {
+	.bus = 31,
+	.dev = 30,
+	.func = 6,
+	.offset = 0x80,
+};
+
 static const struct cpu_info cpu_hsx = {
 	.reg		= &resolved_cores_reg_hsx,
 	.min_peci_revision = 0x33,
@@ -563,6 +571,12 @@ static const struct cpu_info cpu_spr = {
 	.thermal_margin_to_millidegree = &dts_ten_dot_six_to_millidegree,
 };
 
+static const struct cpu_info cpu_emr = {
+	.reg    = &resolved_cores_reg_emr,
+	.min_peci_revision = 0x40,
+	.thermal_margin_to_millidegree = &dts_ten_dot_six_to_millidegree,
+};
+
 static const struct auxiliary_device_id peci_cputemp_ids[] = {
 	{
 		.name = "peci_cpu.cputemp.hsx",
@@ -592,6 +606,10 @@ static const struct auxiliary_device_id peci_cputemp_ids[] = {
 		.name = "peci_cpu.cputemp.spr",
 		.driver_data = (kernel_ulong_t)&cpu_spr,
 	},
+	{
+		.name = "peci_cpu.cputemp.emr",
+		.driver_data = (kernel_ulong_t)&cpu_emr,
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(auxiliary, peci_cputemp_ids);
-- 
2.49.0


