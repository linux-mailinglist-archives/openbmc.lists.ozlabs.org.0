Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E742E1296AB
	for <lists+openbmc@lfdr.de>; Mon, 23 Dec 2019 14:52:18 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47hLPr3KZBzDqNL
	for <lists+openbmc@lfdr.de>; Tue, 24 Dec 2019 00:52:16 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::644;
 helo=mail-pl1-x644.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="iup+V6FL"; 
 dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47hLJq5LT1zDqFB
 for <openbmc@lists.ozlabs.org>; Tue, 24 Dec 2019 00:47:55 +1100 (AEDT)
Received: by mail-pl1-x644.google.com with SMTP id bd4so7219010plb.8
 for <openbmc@lists.ozlabs.org>; Mon, 23 Dec 2019 05:47:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=90zRCuX1ryzYV7huVA1zyw178BV7WqH1bYZxnk8wgUo=;
 b=iup+V6FL54TKnZUhWvyuxfsbB634pB5GNB+/eP+t9tua+eiLO5ZEK8UiGN0Vkj+WX1
 DcEcCQOi5WonJ+/zoGZN3NPzNQ9Cl+82WDWfD8w0WRsAtHiC0VnUDJ3HP0i2GOT9pfBz
 Qdh64IoW+KIPq+klHKsOeiJRZxrsJN5x/Wvy/+dBeWwFDV0Rgr79yPs35GiBOfofi0OM
 veN2R2mDm1IgeTNCJImb6AUM9XMd2lJDi78W3FNzOWkeUzeN81OFmZxHZs+uCgFHAwxu
 1lhCED+ZY0P3WKuPLuhYpU8C7t0TRk+ACxorW4F22Ot6pBtvKdbwT/H8JDSrucWYRAXG
 af5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=90zRCuX1ryzYV7huVA1zyw178BV7WqH1bYZxnk8wgUo=;
 b=i2+8ln/RLA8nhNPklTPKBQt6ULtamW4qI1WQXMQMbuebndVMB3HpmhrQpTUyWtCini
 E5R81WsmXzWmgpsWqBjCNALhJZK/qXIL3+NsTa6QczOS0OO0QRPgvtN5U8kYDrVo0DeD
 oR2yNx1N+jFMSpzutk22DNY0in8OJN3lZGK/mXsZWBz5934y6HLu7dMM+WryBtc62aBw
 90HrNgmmWGGpRT1vyT1tMvwA5iCQbrojCwPagt2qv2OtLlDlGajPMsqDqtY7n/0diVuK
 YlY5o5g1QRdnxvqeRD5MX5e1k5Mlh5TWNnRbl3bG3cM0DDQsLLTyv/n1VmxHeVMoEUIP
 G67w==
X-Gm-Message-State: APjAAAUNFYZs/GM5J9sWSoYle9Zjblygog7R/Ct0I0jbQubQ7iM6UWpF
 JnktaV8WoRDtMmtu9BLd9JUHkm5a
X-Google-Smtp-Source: APXvYqyDl59Tk8g673adpomWkq+Ic0E5iz0tJ0FI7dCIbUHHunSKV/nE0QbP+s3kXKckNBtM0Y3KJQ==
X-Received: by 2002:a17:902:82cc:: with SMTP id
 u12mr28616942plz.342.1577108872902; 
 Mon, 23 Dec 2019 05:47:52 -0800 (PST)
Received: from localhost.localdomain ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id b65sm22988588pgc.18.2019.12.23.05.47.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Dec 2019 05:47:52 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org,
	Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH linux dev-5.4 3/4] ARM: dts: aspeed: tacoma: Remove duplicate
 flash nodes
Date: Tue, 24 Dec 2019 00:47:34 +1100
Message-Id: <20191223134735.559200-4-joel@jms.id.au>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191223134735.559200-1-joel@jms.id.au>
References: <20191223134735.559200-1-joel@jms.id.au>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This is a revert of "ARM: dts: aspeed: tacoma: Enable FMC and SPI
devices" which was already applied as part of "ARM: dts: aspeed: Add
Tacoma machine".

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts | 31 ---------------------
 1 file changed, 31 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts b/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
index 73aaf58d9f42..ff49ec76fa7c 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
@@ -122,37 +122,6 @@
 	};
 };
 
-&fmc {
-	status = "okay";
-	flash@0 {
-		status = "okay";
-		m25p,fast-read;
-		label = "bmc";
-		spi-max-frequency = <50000000>;
-#include "openbmc-flash-layout-128.dtsi"
-	};
-
-	flash@1 {
-		status = "okay";
-		m25p,fast-read;
-		label = "alt-bmc";
-		spi-max-frequency = <50000000>;
-	};
-};
-
-&spi1 {
-	status = "okay";
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_spi1_default>;
-
-	flash@0 {
-		status = "okay";
-		m25p,fast-read;
-		label = "pnor";
-		spi-max-frequency = <100000000>;
-	};
-};
-
 &mac2 {
 	status = "okay";
 	pinctrl-names = "default";
-- 
2.24.0

