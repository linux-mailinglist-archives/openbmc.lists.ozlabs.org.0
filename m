Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A1BB491B281
	for <lists+openbmc@lfdr.de>; Fri, 28 Jun 2024 01:06:37 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=HEiLSGAx;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W9Dhp0ZGjz3cyb
	for <lists+openbmc@lfdr.de>; Fri, 28 Jun 2024 09:06:34 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=HEiLSGAx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::429; helo=mail-pf1-x429.google.com; envelope-from=yangchen.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W8pdH4Dt3z2ygY
	for <openbmc@lists.ozlabs.org>; Thu, 27 Jun 2024 16:32:02 +1000 (AEST)
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-706a1711ee5so1610538b3a.0
        for <openbmc@lists.ozlabs.org>; Wed, 26 Jun 2024 23:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719469918; x=1720074718; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SyqW/YPcUcSECKMKEcpbBGmhotZwVjBgiijoMXMXMs0=;
        b=HEiLSGAx25bVQWf1vi3RQx7GtcnDvywQrlOLWyhSrtnMv8Lc6zUiQqSfGz/cUGAape
         dgj8c68AJ+O6Dpjuqre+t+ZVq5zCtGN3H+TVN6hsOXh9ypB5rU6eZTvCavY+HU2p392A
         nYHdKihDyeHVSV9G/CxSyGHM6Rv6FT0wR92kzbhfXjzm+aLYefKI3Om3eRcG7IexzaS4
         atgyEQRCjb84up5V1/WZEx8qN4I82i779vMVYNRMLHAkx37uWJsazZONTUjL85hI5KWu
         h24rv/tw3pMeAtuYm79Ia4Wsg4il938yPcgaPOrg5CT3F1p4IQ3dbjrJXtCUMxIA9xB/
         evUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719469918; x=1720074718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SyqW/YPcUcSECKMKEcpbBGmhotZwVjBgiijoMXMXMs0=;
        b=IYlHoLOTfQiiG73JAp01h619cYNOVqLhyJ+TQfoJN0NNuxEKVsYGM312fQvNMjuHWa
         8d1/VP63ni0vw77LMteBcXEUaDvqMXXgu6d5XBgYZbd4mlbw6pLjb8js3xf0pxMBhhaI
         wPbq/b8H4vtqdKFT4wUBTWdeoKiMZguHXqn2nBSpUr1EHwflwbtM8oSWISMVfJtZpqbe
         ke3989JbF47cOLnvvaIF0NoR/bxurvtrOsbNCQeW9NTGfaz0zYAHvpQriAeJiIj0R6cN
         cbhkCpIwdOqCMukxcLPdeRs2pbsZmm0KD60oZWt8KP1dq5Az6pd3N0gDGotnlr2fVGK6
         mG0g==
X-Gm-Message-State: AOJu0YyUqMr26/rjC5UUnXzYS8SqSx0pNKqqlNmaD4TWnQh7jEZiNQD2
	KyMyI3pZ1baowiR0pgduLvp+mXFaR207RbDLme78jwbvnYs1SukRVEaYrqb8
X-Google-Smtp-Source: AGHT+IGLlYJIWPQgXRP1R7fkUvS8GsjExoL+2DNQa3zDqwLqv7wdjKUsNvL/hQUdUs9jB10Z0kH8sQ==
X-Received: by 2002:a05:6a20:1594:b0:1be:d1f7:e91d with SMTP id adf61e73a8af0-1bed1f7eb7fmr738506637.29.1719469917721;
        Wed, 26 Jun 2024 23:31:57 -0700 (PDT)
Received: from obliging-System-Product-Name.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1faac97a122sm5403235ad.176.2024.06.26.23.31.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 23:31:57 -0700 (PDT)
From: Yang Chen <yangchen.openbmc@gmail.com>
To: openbmc@lists.ozlabs.org,
	andrew@codeconstruct.com.au,
	patrick@stwcx.xyz,
	joel@jms.id.au
Subject: [PATCH linux dev-6.6 01/17] ARM: dts: aspeed: minerva: change the address of tmp75
Date: Thu, 27 Jun 2024 14:29:35 +0800
Message-Id: <20240627062951.936256-2-yangchen.openbmc@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240627062951.936256-1-yangchen.openbmc@gmail.com>
References: <20240627062951.936256-1-yangchen.openbmc@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 28 Jun 2024 09:03:24 +1000
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
Cc: Jerry.Lin@quantatw.com, yang.chen@quantatw.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Yang Chen <yang.chen@quantatw.com>

Revise the address of tmp75 on I2C bus 1 from 0x48 to 0x4f due to design
change.

Signed-off-by: Yang Chen <yang.chen@quantatw.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
index 942e53d5c714..e20e31917d6c 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
@@ -145,9 +145,9 @@ temperature-sensor@4b {
 		reg = <0x4b>;
 	};
 
-	temperature-sensor@48 {
+	temperature-sensor@4f {
 		compatible = "ti,tmp75";
-		reg = <0x48>;
+		reg = <0x4f>;
 	};
 
 	eeprom@54 {
-- 
2.34.1

