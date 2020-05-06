Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 11A211C7D98
	for <lists+openbmc@lfdr.de>; Thu,  7 May 2020 00:49:20 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49HWx80pL6zDqvK
	for <lists+openbmc@lfdr.de>; Thu,  7 May 2020 08:49:16 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::641;
 helo=mail-pl1-x641.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=vPbZqjUe; dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49HWwD1Qh0zDqmJ
 for <openbmc@lists.ozlabs.org>; Thu,  7 May 2020 08:48:24 +1000 (AEST)
Received: by mail-pl1-x641.google.com with SMTP id k19so1235874pll.9
 for <openbmc@lists.ozlabs.org>; Wed, 06 May 2020 15:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dm9D7FOou+gWwuquDWOcwX7EsR2qZelZRnAUHjilBlM=;
 b=vPbZqjUe6UVBbGawetxUni4jWqtbEi2HULXK7xLFNTf7MYvKePJoFn//QOeNuRFV8T
 FSKQA/tdg0NWmtswRCNkFdSudXwK5zUVwITfAtpHTl+lGRvim4FBlsn/l7YNAElZoHTI
 dUyvA1lrmgHi85ffvMgg9b2P0N0i1+1VEjlz33ebsh6Kt2dg+An/cjQP8vgXWSDeuUoo
 8nUCXJrezX1lg75cwoIOEzSiDnCcINbzlwL0FF5W6qW33qgKd+IiYaIRZQhz/+2khG7t
 SNGSCW1jaAg0/C7TS7ulbQFuTP+DSpxcdB0F0kbHOx26CBlxbdHHBWssD/jQH7slimtt
 vL7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=dm9D7FOou+gWwuquDWOcwX7EsR2qZelZRnAUHjilBlM=;
 b=DyN0gY2+/aisXLiD0t/Ka7lT5jfZXIgvSJnRu5lrEdO+r16AZMA7IEhW4RW2CIy3W0
 uIHfX4kiIlQmbSq93HJfO8+lMURL04JOKG9bh8866BritOjG8d5UO1HK6rWrBUS+Ajv0
 70KqwPJwcZ5bv1Wb1DXvsApwVThv1l8Z+vvP90FsccLIStMDbLtZjCSZSqa/3NjVqRKi
 IVrsE5zNlL6KJh1qMwM7glsgevXNC/+Wmym8KPje/zAzMr7gXYzFHLVuzb7Yld+zUyVC
 /JbQlo8R7FD+iYINXmc72UklExmCb+WLLvK4aAwlF04fXc3NW595c15HnUIP86YiKf2c
 vq8g==
X-Gm-Message-State: AGi0PuYbHG1xttsB1s2OGrGW4TnDiqVlwXTgeeUaKf3b7ET7ncxGd0B5
 mSinvIVhVYmKmn+sErnsA0xibbDf
X-Google-Smtp-Source: APiQypK/WPhH9KuiNx3QGhImj4sgFADfCY16kbUcfuGtPrYJi6RtjOYqUhLX7zsrVeGMtv3sRiDN6w==
X-Received: by 2002:a17:90a:589:: with SMTP id
 i9mr11800006pji.156.1588805300272; 
 Wed, 06 May 2020 15:48:20 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.15])
 by smtp.gmail.com with ESMTPSA id u3sm2818454pfb.105.2020.05.06.15.48.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 May 2020 15:48:19 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org, Eddie James <eajames@linux.ibm.com>,
 Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH linux dev-5.4] ARM: dts: aspeed: rainier: System has one SPI
 NOR
Date: Thu,  7 May 2020 08:18:12 +0930
Message-Id: <20200506224812.745931-1-joel@jms.id.au>
X-Mailer: git-send-email 2.26.2
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

Remove the second as it doesn't exist.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
index 794af5517313..528080ec7585 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
@@ -671,13 +671,6 @@
 		spi-max-frequency = <50000000>;
 #include "openbmc-flash-layout-128.dtsi"
 	};
-
-	flash@1 {
-		status = "okay";
-		m25p,fast-read;
-		label = "alt-bmc";
-		spi-max-frequency = <50000000>;
-	};
 };
 
 &spi1 {
-- 
2.26.2

