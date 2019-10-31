Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 629EBEAA74
	for <lists+openbmc@lfdr.de>; Thu, 31 Oct 2019 06:47:35 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 473Z901PDxzF3Yq
	for <lists+openbmc@lfdr.de>; Thu, 31 Oct 2019 16:47:32 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::642;
 helo=mail-pl1-x642.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="qcavsbIX"; 
 dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 473Ywr35ZLzF4C3
 for <openbmc@lists.ozlabs.org>; Thu, 31 Oct 2019 16:37:00 +1100 (AEDT)
Received: by mail-pl1-x642.google.com with SMTP id j12so196504plt.9
 for <openbmc@lists.ozlabs.org>; Wed, 30 Oct 2019 22:37:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3i0FJ6dku0vdh26Ybh2mqpomCqxL9kpXhs6kkAHq1ek=;
 b=qcavsbIX3N8JifydLPesuDR2LfZTSsEPNqramsEFRmTdN/cuzyaaU5Nb8AzIfn8o5v
 Cuz/I1Bg5SJ6vqNUyt4fmP0g1eEpI9wZ5wTdO+wWJ4Mp3BUkeRdOBzEn1kXV6mEiG4e7
 NQ7w7qXfKIFU/NzAae6AkdmswjT3V9ZGAFoiU0DI9PPiqXR041qZCK/IAQgTMAtbIFpi
 plCYYvyY1EVKrF6yaT0Qr/U9p/m/7XNY/rBlaPLvM0pR1wdA4dWuLMwad3WUvittpPYn
 9IKE9ssfunLoLt7jDMCL7g67AwVsgSIXRlnT1Zp/m0/Bgb8hNFNaXKZbPGIjk23kzjX7
 illg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=3i0FJ6dku0vdh26Ybh2mqpomCqxL9kpXhs6kkAHq1ek=;
 b=RM0KWuAWdq4zXzoAGbf3yPoLPGfNnshbTJX+th0dyaBQBgLgQ7UryHAUpmgXlXkMN1
 NY4tk+y+Fj0C40FvjyTx39PiQcJ3MHPhKqsjmbE6h47knXBf3k20rg6n8gYUYdukbSxP
 7KbB5T3f5Ti1Ejlu+5n78hplnbivKw6edroIzROZGb4gG/nFBxok8Mhcop+WJXfwxYo1
 K7SXs1oXERNicCVhfDsLFV8e78grg32biWTkenM4VOInlmR4XvOHnNnQnk6kS7kRHE9G
 nYoCMueNsX2o92Y5GVxAWg4Pm9q5RauBPeCcLv2mj87REm2mSmMDztATMr4asaXccfJt
 txww==
X-Gm-Message-State: APjAAAUo1tPQtyAlF6B07ijbxoyOvoxaj3/wOSB37ZAF7Enyt7+yWU4Y
 zTTD6kGscz0N53T51/SgmVZct9q0WM8=
X-Google-Smtp-Source: APXvYqxYIyUmOjTD2s06kKjj7xMJxQb8WHuA9NA2YB5r+kX9X+i8pdaLe8AN9C1iLcfiMPctP6DAKQ==
X-Received: by 2002:a17:902:4a:: with SMTP id 68mr4352858pla.158.1572500218450; 
 Wed, 30 Oct 2019 22:36:58 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id l72sm5337829pjb.18.2019.10.30.22.36.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Oct 2019 22:36:57 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Jeremy Kerr <jk@ozlabs.org>,
	Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH linux dev-5.3 v2 7/8] fsi: aspeed: Fix whitespace in
 check_errors
Date: Thu, 31 Oct 2019 16:06:24 +1030
Message-Id: <20191031053625.422-8-joel@jms.id.au>
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
 drivers/fsi/fsi-master-aspeed.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/fsi/fsi-master-aspeed.c b/drivers/fsi/fsi-master-aspeed.c
index ee760e84c576..686380414fba 100644
--- a/drivers/fsi/fsi-master-aspeed.c
+++ b/drivers/fsi/fsi-master-aspeed.c
@@ -239,18 +239,18 @@ static int check_errors(struct fsi_master_aspeed *aspeed, int err)
 {
 	int ret;
 
-	 if (trace_fsi_master_aspeed_opb_error_enabled()) {
-		 __be32 mresp0, mstap0, mesrb0;
-
-		 opb_readl(aspeed, ctrl_base + FSI_MRESP0, &mresp0);
-		 opb_readl(aspeed, ctrl_base + FSI_MSTAP0, &mstap0);
-		 opb_readl(aspeed, ctrl_base + FSI_MESRB0, &mesrb0);
-
-		 trace_fsi_master_aspeed_opb_error(
-				 be32_to_cpu(mresp0),
-				 be32_to_cpu(mstap0),
-				 be32_to_cpu(mesrb0));
-	 };
+	if (trace_fsi_master_aspeed_opb_error_enabled()) {
+		__be32 mresp0, mstap0, mesrb0;
+
+		opb_readl(aspeed, ctrl_base + FSI_MRESP0, &mresp0);
+		opb_readl(aspeed, ctrl_base + FSI_MSTAP0, &mstap0);
+		opb_readl(aspeed, ctrl_base + FSI_MESRB0, &mesrb0);
+
+		trace_fsi_master_aspeed_opb_error(
+				be32_to_cpu(mresp0),
+				be32_to_cpu(mstap0),
+				be32_to_cpu(mesrb0));
+	};
 
 	if (err == -EIO) {
 		/* Check MAEB (0x70) ? */
-- 
2.24.0.rc1

