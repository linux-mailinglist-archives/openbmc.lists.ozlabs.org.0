Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C496CE9668
	for <lists+openbmc@lfdr.de>; Wed, 30 Oct 2019 07:33:16 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 472zD92xDYzF3l7
	for <lists+openbmc@lfdr.de>; Wed, 30 Oct 2019 17:33:13 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::434;
 helo=mail-pf1-x434.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="bdQ2ZHu6"; 
 dkim-atps=neutral
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 472zCW4l3LzF3V9
 for <openbmc@lists.ozlabs.org>; Wed, 30 Oct 2019 17:32:38 +1100 (AEDT)
Received: by mail-pf1-x434.google.com with SMTP id b25so829794pfi.13
 for <openbmc@lists.ozlabs.org>; Tue, 29 Oct 2019 23:32:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dLRxYrd8OZQn6msCJJYhGXbEGnyruPOi30WNbEHoPp0=;
 b=bdQ2ZHu6mwC7dxbr+u3WsTCInhk9y3iZ/5+1rwrC1gtcfXD9zHZHey+kRCIdDtCzar
 mX/q7NXWGKpm/O51hYFSmnugCVOL/tIeyrwiXzKwwUeOXKxAYZO6zDGNTuvB7qPN2UKE
 2pBw+uQJdMh9KWnzAbgByO+AJpxSVO8IqeNP/g1EHMObBjBRTGUhygfg8Oxk/m5RQbdY
 QLlkhFw1bZVMaOj6Mg3dBHvlDEL79Ys9VeHmko41TSfEf9+kpJkZlDbVu3elF87GsH7L
 e9Wu9tUJGNyWlBgxik4E3Yb5ID4MH6vOaq2jgICpSEwE2kwZA9gH4Uu4E7u3G3w6TYEa
 UhUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=dLRxYrd8OZQn6msCJJYhGXbEGnyruPOi30WNbEHoPp0=;
 b=Q6JNPDxHR7iF8TNmiOAsYx7iNUTjKfGsDNkVdcNqeWSbz5YSKFXGIP37Cu11EoX1zF
 6cZsNPOTo0M/eG8w/PRlwLrBMp8NtRSGoutqvDVY6gYk7BUaTX0iAz7wF51fi0LqDY6v
 nsAJidlzmB1c7gBjoqHbU0XYILPECNMFckDgCJDDRHvuz91kFZ3j4wVI4pus2tnet/Ef
 Rsbl7ZgfG2uD24BCyXYrC1UqBgfwqS1bizQS2nvMgQyMZtvYdMe0zCDwXS7LYhc7HbrZ
 McC3VSoRmZ+vbsEhxCGns4TvRNGUYd3e8h2k0qxHD4sYxipaYfI0oFdJ5wMi1dXu6N5k
 4YYA==
X-Gm-Message-State: APjAAAWnUlMTcUZ9jFZUj8s2LzeC9lmOZPMyvHEdhz8lvyDBBmf1qhuX
 n6NW1uOgChRWrhA+kuz0sds=
X-Google-Smtp-Source: APXvYqwT4iAwzvca94AOtDdmK8hOfekAi3D8tieLXmDMlfRsDTaZWTC754ihCy8vAj6Hj1ZAAu6xYA==
X-Received: by 2002:a17:90a:7f06:: with SMTP id
 k6mr11761099pjl.10.1572417156179; 
 Tue, 29 Oct 2019 23:32:36 -0700 (PDT)
Received: from voyager.ibm.com ([36.255.48.244])
 by smtp.gmail.com with ESMTPSA id i102sm1028018pje.17.2019.10.29.23.32.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Oct 2019 23:32:35 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Ryan Chen <ryan_chen@aspeedtech.com>, Jeremy Kerr <jk@ozlabs.org>,
 Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH u-boot aspeed-dev-v2019.04 1/7] dt-bindings: Add FSI clock
Date: Wed, 30 Oct 2019 17:02:19 +1030
Message-Id: <20191030063225.11319-2-joel@jms.id.au>
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
 include/dt-bindings/clock/ast2600-clock.h | 39 ++++++++++++-----------
 1 file changed, 20 insertions(+), 19 deletions(-)

diff --git a/include/dt-bindings/clock/ast2600-clock.h b/include/dt-bindings/clock/ast2600-clock.h
index 4956fa196d39..7e07cbda37c4 100644
--- a/include/dt-bindings/clock/ast2600-clock.h
+++ b/include/dt-bindings/clock/ast2600-clock.h
@@ -41,23 +41,24 @@
 #define ASPEED_CLK_GATE_USBUHCICLK	33
 #define ASPEED_CLK_GATE_USBPORT1CLK	34
 #define ASPEED_CLK_GATE_USBPORT2CLK	35
+#define ASPEED_CLK_GATE_FSICLK		36
 
-#define ASPEED_CLK_APLL			36
-#define ASPEED_CLK_EPLL			37
-#define ASPEED_CLK_DPLL			38
-#define ASPEED_CLK_HPLL			39
-#define ASPEED_CLK_AHB			40
-#define ASPEED_CLK_APB1			41
-#define ASPEED_CLK_APB2			42
-#define ASPEED_CLK_UART			43
-#define ASPEED_CLK_SDIO			44
-#define ASPEED_CLK_ECLK			45
-#define ASPEED_CLK_ECLK_MUX		46
-#define ASPEED_CLK_LHCLK		47
-#define ASPEED_CLK_MAC			48
-#define ASPEED_CLK_BCLK			49
-#define ASPEED_CLK_MPLL			50
-#define ASPEED_CLK_24M			51
-#define ASPEED_CLK_EMMC			52
-#define ASPEED_CLK_UARTX		53
-#define ASPEED_CLK_UARTUX		54
+#define ASPEED_CLK_APLL			37
+#define ASPEED_CLK_EPLL			38
+#define ASPEED_CLK_DPLL			39
+#define ASPEED_CLK_HPLL			40
+#define ASPEED_CLK_AHB			41
+#define ASPEED_CLK_APB1			42
+#define ASPEED_CLK_APB2			43
+#define ASPEED_CLK_UART			44
+#define ASPEED_CLK_SDIO			45
+#define ASPEED_CLK_ECLK			46
+#define ASPEED_CLK_ECLK_MUX		47
+#define ASPEED_CLK_LHCLK		48
+#define ASPEED_CLK_MAC			49
+#define ASPEED_CLK_BCLK			50
+#define ASPEED_CLK_MPLL			51
+#define ASPEED_CLK_24M			52
+#define ASPEED_CLK_EMMC			53
+#define ASPEED_CLK_UARTX		54
+#define ASPEED_CLK_UARTUX		55
-- 
2.23.0

