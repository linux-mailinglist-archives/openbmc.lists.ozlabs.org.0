Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7125AEAA72
	for <lists+openbmc@lfdr.de>; Thu, 31 Oct 2019 06:44:56 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 473Z5x5GqFzF58Q
	for <lists+openbmc@lfdr.de>; Thu, 31 Oct 2019 16:44:53 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::643;
 helo=mail-pl1-x643.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="RsyEJHax"; 
 dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 473Ywm1CFKzF47s
 for <openbmc@lists.ozlabs.org>; Thu, 31 Oct 2019 16:36:56 +1100 (AEDT)
Received: by mail-pl1-x643.google.com with SMTP id j12so196405plt.9
 for <openbmc@lists.ozlabs.org>; Wed, 30 Oct 2019 22:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=X/V2RqyaP+s2Fe/Rx7WYERrpgJu1TAuY5YJxbD2tz8A=;
 b=RsyEJHax6KZlQ5IGuPk4RmS8AZwYs1owUL+P5Fio+r8xeupPITauM3WZsTro4asH1A
 j7NGIcyIGy6e00FhJ9ePFMm95fs4UjQAeQECIsPpDWUQ65gjm6eLauaVbpDteY4tWmot
 VnW1ykZ8MoDAMO/w9fou7t3zbpBlAyC4LyHUeps/NmfpCowr3+IUTexe+5l9MW9kXFsR
 MusuYHk+pkiHVAwQ/bMuKsrDsdwD5BXzcjdpTbMiMhyfGddkNIJ6tivJwxQ1vZlhvm9v
 84aL/R3hUQ1QX96Xh9ShEFiNWpL932dT07aV4Y7pchmdNWzh7z8GwSYUiSZGKW9KCKvB
 RZ1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=X/V2RqyaP+s2Fe/Rx7WYERrpgJu1TAuY5YJxbD2tz8A=;
 b=mNso28sUKgiy9sChhgoeHKTe35KmzFO1OoUPb90SNXv6BFxlJYvdyjrrUOb10M4aeA
 75sKnzlK4jx47RqSH84D2cp079WLkjPAl/BH8FOsKZD/auhjzr/2yveRbPVnAligxs0r
 gzn9b6B1GGY6gWBldS6WeA4QU076FGeuqjhryLJNzqmVySWxY7/rn92Imb/Wb2GZybro
 cLGftzX1tHITQ6Ps0hzduvLg1SdWbN5i2jLhYCQ9XMEO8UZZdo9MN/aBuo3XEXLKyZyN
 3nlOVhU/ygbD2n+Tdy/iQL/yEG1dWk44ti/LuEo3xh0ve/XRaHq5D4JF4N9uddAV3zzu
 l8aQ==
X-Gm-Message-State: APjAAAUOmX6fxYMtIYF+P1fTF66ZUioh4NNGjkkYj08XiGYnQyNwhWCe
 uI21n3XQYZ8t5JjiFvHM/XTRzPnf04s=
X-Google-Smtp-Source: APXvYqyLHmc3socq1ULxYBuRuXUiBEYURQ4F0XL+NZ8SPf6tZdz8lg+Au6tyvS8beOAcEjA/F3odKQ==
X-Received: by 2002:a17:902:9008:: with SMTP id
 a8mr4310733plp.218.1572500212835; 
 Wed, 30 Oct 2019 22:36:52 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id l72sm5337829pjb.18.2019.10.30.22.36.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Oct 2019 22:36:52 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Jeremy Kerr <jk@ozlabs.org>,
	Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH linux dev-5.3 v2 5/8] fsi: aspeed: Fix types in debugfs
Date: Thu, 31 Oct 2019 16:06:22 +1030
Message-Id: <20191031053625.422-6-joel@jms.id.au>
X-Mailer: git-send-email 2.24.0.rc1
In-Reply-To: <20191031053625.422-1-joel@jms.id.au>
References: <20191031053625.422-1-joel@jms.id.au>
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 drivers/fsi/fsi-master-aspeed.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/fsi/fsi-master-aspeed.c b/drivers/fsi/fsi-master-aspeed.c
index e38e1c2c4f15..8f757eaa6a55 100644
--- a/drivers/fsi/fsi-master-aspeed.c
+++ b/drivers/fsi/fsi-master-aspeed.c
@@ -469,9 +469,9 @@ static int aspeed_master_init(struct fsi_master_aspeed *aspeed)
 
 static int fsi_master_aspeed_debugfs_get(void *data, u64 *val)
 {
-	int rc;
-	u32 out;
 	struct fsi_master_aspeed_debugfs_entry *entry = data;
+	__be32 out;
+	int rc;
 
 	rc = opb_readl(entry->aspeed, ctrl_base + entry->addr, &out);
 	if (rc)
@@ -482,11 +482,11 @@ static int fsi_master_aspeed_debugfs_get(void *data, u64 *val)
 }
 static int fsi_master_aspeed_debugfs_set(void *data, u64 val)
 {
-	u32 rc;
-	u32 in = cpu_to_be32((u32)(val & 0xFFFFFFFFULL));
 	struct fsi_master_aspeed_debugfs_entry *entry = data;
+	int rc;
 
-	rc = opb_writel(entry->aspeed, ctrl_base + entry->addr, in);
+	rc = opb_writel(entry->aspeed, ctrl_base + entry->addr,
+			cpu_to_be32(val));
 	if (rc)
 		return rc;
 
@@ -499,14 +499,14 @@ DEFINE_DEBUGFS_ATTRIBUTE(fsi_master_aspeed_debugfs_ops,
 static int fsi_master_aspeed_clock_debugfs_get(void *data, u64 *val)
 {
 	struct fsi_master_aspeed *aspeed = data;
-	u32 out;
+	__be32 out;
 	int rc;
 
 	rc = opb_readl(aspeed, ctrl_base, &out);
 	if (rc)
 		return rc;
 
-	*val = (u64)((be32_to_cpu(out) >> 18) & 0x3ff);
+	*val = (be32_to_cpu(out) >> FSI_MMODE_CRS0SHFT) & FSI_MMODE_CRS0MASK;
 
 	return 0;
 }
@@ -526,8 +526,9 @@ static int fsi_master_aspeed_clock_debugfs_set(void *data, u64 val)
 
 	reg = be32_to_cpu(raw);
 
-	reg &= ~(0x3ff << 18);
-	reg |= (val & 0x3ff) << 18;
+
+	reg &= ~(FSI_MMODE_CRS0MASK << FSI_MMODE_CRS0SHFT);
+	reg |= fsi_mmode_crs0(val);
 
 	rc = opb_writel(aspeed, ctrl_base, cpu_to_be32(reg));
 	if (rc)
-- 
2.24.0.rc1

