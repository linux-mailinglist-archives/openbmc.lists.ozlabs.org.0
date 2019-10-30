Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E9EF9E9674
	for <lists+openbmc@lfdr.de>; Wed, 30 Oct 2019 07:38:06 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 472zKm3LF8zDqMw
	for <lists+openbmc@lfdr.de>; Wed, 30 Oct 2019 17:38:04 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::643;
 helo=mail-pl1-x643.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="klQ1wjf6"; 
 dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 472zCg09cgzF3dq
 for <openbmc@lists.ozlabs.org>; Wed, 30 Oct 2019 17:32:46 +1100 (AEDT)
Received: by mail-pl1-x643.google.com with SMTP id t12so513222plo.6
 for <openbmc@lists.ozlabs.org>; Tue, 29 Oct 2019 23:32:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3Of0auCazJ9loN/dAPyYAyI5a13e9D0x8sOsXEd0Rsg=;
 b=klQ1wjf6oJE3JT8fKXrBtzrHXXG5TtWQBoJtBuGZU9g2W8VDbrI04Vfka8nHqXilA0
 FGP3DrBnSa0Q4MI0A1u7irzElYt+MSrcFE2O4HLq0AEGypPLg1ebviF49PNs9Eo+o7mJ
 ICZWhRxrVkmbcluf6FVYtYgVtvfKL9rnT1N4dshmXPXrqpD8a7ACIMZKVXxDZZBqs0ZV
 NDzwtz4oJ8e7siPcoMyuQTU2HPjGJcssg35aGwy04msBhdtolIFDztvupqQCG8kzuBQK
 Wb/4rQNyuPl/sP5zAY3ePo7tfTEKymSm5lTIFUvFS1j/+8koEHSXgZ7g4BsLf8F9dYRI
 j0Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=3Of0auCazJ9loN/dAPyYAyI5a13e9D0x8sOsXEd0Rsg=;
 b=ZNvehyANC+UAuPVxyzI1wKm1K4JrNEdrCybQLsiO1qQQJy4gAZUBoK70v27K+yHN1b
 RMohmRzARzspbbF77gVt2Y0dUl6wiptMNqWUUUcZvwM3fNOsvzlV22m2uFgyUznP0rep
 aBt794J5AjZ45H/qOshEbAUh50nAYJBzWdMNwqT21S0l/dNKWcAa5tswMzxf7NHbE7TZ
 NAcMPYIuDlP1VglLkw2hcq6oFb8MnjXsE2dDVR1l2bxsULWPVkC8ByDasGQWs1bFt1uV
 ZyGMQ3Yb2bYezRrp/0zE+qKp1O/Cs31wX1Tym9exbeZrsHOw187OPxrb7MBL3Jc3+KiE
 nzmQ==
X-Gm-Message-State: APjAAAVFgScXaqwoArkJEO1iifXnOo2bNZ4L82w4jwIBNjvPs0PHRUvE
 2J5COcW0Vou7S4Fmya0eCfU=
X-Google-Smtp-Source: APXvYqxEoWeb9TvR0UUX3s1T7tW9Lennr9cK7x4gfP88ClS+cHZ/wk2HRKlIc1PLtVwP7V22DEOm+A==
X-Received: by 2002:a17:902:aa43:: with SMTP id
 c3mr2914979plr.145.1572417164298; 
 Tue, 29 Oct 2019 23:32:44 -0700 (PDT)
Received: from voyager.ibm.com ([36.255.48.244])
 by smtp.gmail.com with ESMTPSA id i102sm1028018pje.17.2019.10.29.23.32.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Oct 2019 23:32:43 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Ryan Chen <ryan_chen@aspeedtech.com>, Jeremy Kerr <jk@ozlabs.org>,
 Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH u-boot aspeed-dev-v2019.04 4/7] aspeed: clock: Add FSI clock
Date: Wed, 30 Oct 2019 17:02:22 +1030
Message-Id: <20191030063225.11319-5-joel@jms.id.au>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191030063225.11319-1-joel@jms.id.au>
References: <20191030063225.11319-1-joel@jms.id.au>
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
 drivers/clk/aspeed/clk_ast2600.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/clk/aspeed/clk_ast2600.c b/drivers/clk/aspeed/clk_ast2600.c
index fab605a1428e..480f15e8dba8 100644
--- a/drivers/clk/aspeed/clk_ast2600.c
+++ b/drivers/clk/aspeed/clk_ast2600.c
@@ -969,6 +969,26 @@ static ulong ast2600_enable_extemmcclk(struct ast2600_scu *scu)
 	return 0;
 }
 
+#define SCU_CLKSTOP_FSICLK 30
+
+static ulong ast2600_enable_fsiclk(struct ast2600_scu *scu)
+{
+	u32 reset_bit;
+	u32 clkstop_bit;
+
+	reset_bit = BIT(ASPEED_RESET_FSI % 32);
+	clkstop_bit = BIT(SCU_CLKSTOP_FSICLK);
+
+	writel(reset_bit, &scu->sysreset_ctrl2);
+	udelay(100);
+	//enable clk
+	writel(clkstop_bit, &scu->clk_stop_clr_ctrl2);
+	mdelay(10);
+	writel(reset_bit, &scu->sysreset_clr_ctrl2);
+
+	return 0;
+}
+
 static int ast2600_clk_enable(struct clk *clk)
 {
 	struct ast2600_clk_priv *priv = dev_get_priv(clk->dev);
@@ -998,6 +1018,9 @@ static int ast2600_clk_enable(struct clk *clk)
 		case ASPEED_CLK_GATE_EMMCEXTCLK:
 			ast2600_enable_extemmcclk(priv->scu);
 			break;
+		case ASPEED_CLK_GATE_FSICLK:
+			ast2600_enable_fsiclk(priv->scu);
+			break;
 		default:
 			pr_debug("can't enable clk \n");
 			return -ENOENT;
-- 
2.23.0

