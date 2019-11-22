Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C7EF105DB9
	for <lists+openbmc@lfdr.de>; Fri, 22 Nov 2019 01:34:29 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Jy9Z4V4SzDrBB
	for <lists+openbmc@lfdr.de>; Fri, 22 Nov 2019 11:34:26 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d44;
 helo=mail-io1-xd44.google.com; envelope-from=bjwyman@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="o9ZY1NNc"; 
 dkim-atps=neutral
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Jy8v3LD8zDr7H
 for <openbmc@lists.ozlabs.org>; Fri, 22 Nov 2019 11:33:50 +1100 (AEDT)
Received: by mail-io1-xd44.google.com with SMTP id r2so5877563iot.10
 for <openbmc@lists.ozlabs.org>; Thu, 21 Nov 2019 16:33:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=L+S8lvKWs7yRukokDJk2+qYNAf1AD2NG/FZIcoqtLNo=;
 b=o9ZY1NNcu637T2Qv8E6tU4ZjOjZXxOSQ75BVSYgX4ExNkPKSdrfwo5G0gufgsJaJvg
 3hNEu+dyND40bhTT9Xkd0Qx2lePmxtejIoTtY7z8BeJ6YElrYE129PmDO1hCSs5NPqzB
 BU9lP1dYTgkQIwzjiWfNw1mOzZo6lg9HbrVB3TcVgPDZQpDyeBGJ2crDboiN6b/y/hh4
 o7dY6ilmgQ6TI93YL4T4vPYizmuW7whSEKaus9x7ExUDVMedKJweJNbsdqr+DR+TrcfO
 7QmT/qf6/QwxzCQFVdXcc41Y1Z0CIaLaqV28gAZFpOWUQljyRBCtb+NoqmrQcXgQouT2
 cBnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=L+S8lvKWs7yRukokDJk2+qYNAf1AD2NG/FZIcoqtLNo=;
 b=OVsIm0BxOYxzxfe/mn8IMG3JcY/TOp4w33CP6v2ItS+4ySf/+glbJGusMG8lqReFo9
 QEZGnFF1Ml3BkgqqJjrDVbxVCOCwxx9oNwPLfvGzTiBpvVCQEJpZwMTbbJSyGvJBcwnV
 RwNuALu3d7D52hKX9Q3pDC1v9+B3dsITtVZRP/2B35kQAXL+ynvlAetljY5Ob/SO0hJ6
 6mxueTxz1EMROAYnUN2/oHTVO0U8BuOi7y8ZxQjSspY4SVPJiMgFxLAohc+Y6fG1ExOj
 NO2eiOP0GdlNQ/erhhB3AdFWvyU2JKVdoqSLKF5FMQ+zkjJIjBmJrPdeANRXxsxxaOWK
 rEZA==
X-Gm-Message-State: APjAAAUtCsQNOqS3LXoxt+Fz+2U3nWDTSWzgYlmsLAAdxt00HvMS6WdD
 /BWyNvUbXhB0FLe3iVWGJyU=
X-Google-Smtp-Source: APXvYqxFzIr+i3T3pXAg1kB/jAY8pU1MQVp3GYDk7aCyo+I3Th9MI9lcND+izufdxVXmL2sX5q1HlQ==
X-Received: by 2002:a5d:9602:: with SMTP id w2mr9797940iol.34.1574382827122;
 Thu, 21 Nov 2019 16:33:47 -0800 (PST)
Received: from gfwr610.rchland.ibm.com ([129.41.86.1])
 by smtp.gmail.com with ESMTPSA id r17sm2031973ill.19.2019.11.21.16.33.46
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 21 Nov 2019 16:33:46 -0800 (PST)
From: Brandon Wyman <bjwyman@gmail.com>
To: Joel Stanley <joel@jms.id.au>, openbmc@lists.ozlabs.org,
 Eddie James <eajames@linux.ibm.com>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>,
 Matthew Barth <msbarth@linux.ibm.com>
Subject: [PATCH linux dev-5.3] ARM: dts: aspeed: rainier: Fix fan fault and
 presence
Date: Thu, 21 Nov 2019 18:33:33 -0600
Message-Id: <20191122003333.22391-1-bjwyman@gmail.com>
X-Mailer: git-send-email 2.24.0
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
Cc: Brandon Wyman <bjwyman@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The PCA9552 used for fan fault and presence information is at 7-bit
address 61h, not 60h.

Signed-off-by: Brandon Wyman <bjwyman@gmail.com>
---
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
index 08e1db0ac672..d6e38d30d846 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
@@ -262,9 +262,9 @@
 		};
 	};
 
-	pca0: pca9552@60 {
+	pca0: pca9552@61 {
 		compatible = "nxp,pca9552";
-		reg = <0x60>;
+		reg = <0x61>;
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-- 
2.24.0

