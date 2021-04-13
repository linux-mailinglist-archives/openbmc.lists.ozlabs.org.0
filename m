Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B845235D9B6
	for <lists+openbmc@lfdr.de>; Tue, 13 Apr 2021 10:12:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FKJH84NDYz3c4n
	for <lists+openbmc@lfdr.de>; Tue, 13 Apr 2021 18:12:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=WBx2BhSB;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1029;
 helo=mail-pj1-x1029.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=WBx2BhSB; dkim-atps=neutral
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FKJCB44jMz3027
 for <openbmc@lists.ozlabs.org>; Tue, 13 Apr 2021 18:08:38 +1000 (AEST)
Received: by mail-pj1-x1029.google.com with SMTP id i4so8060580pjk.1
 for <openbmc@lists.ozlabs.org>; Tue, 13 Apr 2021 01:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=j7DyWUFOo4Hr7J01R8HPsquudOYHEEnrEthLV7/n3Sg=;
 b=WBx2BhSBEa730lL1yJL0jsJ3zO/8huiA+/D4VR75K8wcKO+/Rns5ExPSpJuKQSNs/L
 LObpJ0DalWNmh1G37t+L9ZNqGmbC27MkEMPy0LIBIWFeSouDz6nEgW6cJ34pN9clpv+j
 D3SoQS+LekiJFQRp9FBWf3pDAfIYQ/DZUh+LBZygZ8JTYU1IBay/ntnASo605rD2+0qt
 ph+YPqzn+zYjfRR9ko/ueLi2yI8w4QicbfAjrH04hhEptdvsyLIl+kMSiGwmBWa9KzGi
 BAku0IZ6ZeSXAuVkPzmPbnUKGY20x3LY3Th/XTWsD8HwthxaMyFdwJsOFKW+C6SgrtzV
 GACA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=j7DyWUFOo4Hr7J01R8HPsquudOYHEEnrEthLV7/n3Sg=;
 b=KA6wh4CE96XrG16xQfWUpRMm4q8WTDHTegyAEFOMMupiBRhA2r5jcCiyrCIk4e6RYj
 ZGkvxeEAtmrnp5yYAiJMCBuaIZHbZyZ6gTHkUUgkQg5TN1Gd/xzNM+RG7rpqMsfTWuiD
 dockfoL8O4WBu7RfZwsi7knt5+/pKWmQj6RbjGyfrExDjQGesdllzEwZ8BP01SV7ah8p
 PKrbPqJlFAWnrN6omSVLCh4f6XPsI9aKwBMYfwjD3VfhpU3BDjCuB8H7gzK/J3MTGbSw
 xdgrcC4O57cKA55px9KYR+28iXnQPTFxMu81lUWq7YL1iDqL35wKCFuDUbWanM1/U7lb
 7PBw==
X-Gm-Message-State: AOAM530ctoQ6TtOpManJA5Mo5Ewslfzov7o2UFaOHuTShUQF2INxL8Sm
 6ZoxwE0i2+PUAsqdyqS/6ldrvxc2oCk=
X-Google-Smtp-Source: ABdhPJxhEuvqHt1k3TKp9crOfA24x8wiMCU+dHgEQsNCB6WyMUsi8cAs8yoiMwIRZmgzUK9rQQ+OLg==
X-Received: by 2002:a17:90a:94c4:: with SMTP id
 j4mr3438457pjw.14.1618301315948; 
 Tue, 13 Apr 2021 01:08:35 -0700 (PDT)
Received: from voyager.lan ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id nh24sm1443507pjb.38.2021.04.13.01.08.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Apr 2021 01:08:35 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org, Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>,
 Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH u-boot v2019.04-aspeed-openbmc 09/11] clk: aspeed: Add HACE
 yclk to ast2600
Date: Tue, 13 Apr 2021 17:37:53 +0930
Message-Id: <20210413080755.73572-10-joel@jms.id.au>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210413080755.73572-1-joel@jms.id.au>
References: <20210413080755.73572-1-joel@jms.id.au>
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
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 drivers/clk/aspeed/clk_ast2600.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/clk/aspeed/clk_ast2600.c b/drivers/clk/aspeed/clk_ast2600.c
index 4c00008a5dfd..ba9a0a0a9a5a 100644
--- a/drivers/clk/aspeed/clk_ast2600.c
+++ b/drivers/clk/aspeed/clk_ast2600.c
@@ -1066,6 +1066,25 @@ static ulong ast2600_enable_usbbhclk(struct ast2600_scu *scu)
 	return 0;
 }
 
+/* also known as yclk */
+static ulong ast2600_enable_haceclk(struct ast2600_scu *scu)
+{
+	u32 reset_bit;
+	u32 clkstop_bit;
+
+	reset_bit = BIT(ASPEED_RESET_HACE);
+	clkstop_bit = BIT(13);
+
+	writel(reset_bit, &scu->sysreset_ctrl1);
+	udelay(100);
+	writel(clkstop_bit, &scu->clk_stop_clr_ctrl1);
+	mdelay(20);
+
+	writel(reset_bit, &scu->sysreset_clr_ctrl1);
+
+	return 0;
+}
+
 static int ast2600_clk_enable(struct clk *clk)
 {
 	struct ast2600_clk_priv *priv = dev_get_priv(clk->dev);
@@ -1104,6 +1123,9 @@ static int ast2600_clk_enable(struct clk *clk)
 		case ASPEED_CLK_GATE_USBPORT2CLK:
 			ast2600_enable_usbbhclk(priv->scu);
 			break;
+		case ASPEED_CLK_GATE_YCLK:
+			ast2600_enable_haceclk(priv->scu);
+			break;
 		default:
 			pr_debug("can't enable clk \n");
 			return -ENOENT;
-- 
2.30.2

