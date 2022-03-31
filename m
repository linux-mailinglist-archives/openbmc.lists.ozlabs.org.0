Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DBCC54ED1A8
	for <lists+openbmc@lfdr.de>; Thu, 31 Mar 2022 04:25:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KTRwN56XBz2yY1
	for <lists+openbmc@lfdr.de>; Thu, 31 Mar 2022 13:25:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=eEMlKdY4;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bewilderbeest.net (client-ip=71.19.156.171;
 helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net
 header.a=rsa-sha256 header.s=thorn header.b=eEMlKdY4; 
 dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [71.19.156.171])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KTRw05nwNz2xsM
 for <openbmc@lists.ozlabs.org>; Thu, 31 Mar 2022 13:24:48 +1100 (AEDT)
Received: from hatter.bewilderbeest.net (174-21-187-98.tukw.qwest.net
 [174.21.187.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 07639344;
 Wed, 30 Mar 2022 19:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1648693484;
 bh=bMcoVs3nhjHyOgmm8gLc8GpXgJBxwpp5jR+k4xMvJMI=;
 h=From:To:Cc:Subject:Date:From;
 b=eEMlKdY4XjrgYx2SZWFxeZO9Oa9S6H8XKkwks6qi+KwJwVmf46CYZP6dLPMYA4UKz
 uTvfoCSucWrL+KZn47iUdgbnIXYXfplCcYXHdcZgDVglqNunABuodXYHV+z+T2cA/9
 ngTjohhKtvG00ajJlMAHizSihObmWpjOpmqiG4J8=
From: Zev Weiss <zev@bewilderbeest.net>
To: Joel Stanley <joel@jms.id.au>
Subject: [PATCH 1/2] ARM: dts: aspeed: romed8hm3: Add lm25066 sense resistor
 values
Date: Wed, 30 Mar 2022 19:24:24 -0700
Message-Id: <20220331022425.28606-1-zev@bewilderbeest.net>
X-Mailer: git-send-email 2.35.1
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 Zev Weiss <zev@bewilderbeest.net>, Andrew Jeffery <andrew@aj.id.au>,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

With this property set the sensor readings from these devices can now
be calibrated properly.

Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
---
 arch/arm/boot/dts/aspeed-bmc-asrock-romed8hm3.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-asrock-romed8hm3.dts b/arch/arm/boot/dts/aspeed-bmc-asrock-romed8hm3.dts
index e71ccfd1df63..572a43e57cac 100644
--- a/arch/arm/boot/dts/aspeed-bmc-asrock-romed8hm3.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-asrock-romed8hm3.dts
@@ -100,12 +100,14 @@ w83773g@4c {
 	lm25066@40 {
 		compatible = "lm25066";
 		reg = <0x40>;
+		shunt-resistor-micro-ohms = <1000>;
 	};
 
 	/* 12VSB PMIC */
 	lm25066@41 {
 		compatible = "lm25066";
 		reg = <0x41>;
+		shunt-resistor-micro-ohms = <10000>;
 	};
 };
 
-- 
2.35.1

