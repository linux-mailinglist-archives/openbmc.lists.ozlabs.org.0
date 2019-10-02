Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E41CC4B5F
	for <lists+openbmc@lfdr.de>; Wed,  2 Oct 2019 12:26:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46jskJ3NwrzDqXl
	for <lists+openbmc@lfdr.de>; Wed,  2 Oct 2019 20:26:32 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::643; helo=mail-pl1-x643.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="f8l/Gxtr"; 
 dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46jsg92vDvzDqL9
 for <openbmc@lists.ozlabs.org>; Wed,  2 Oct 2019 20:23:49 +1000 (AEST)
Received: by mail-pl1-x643.google.com with SMTP id u12so6872567pls.12
 for <openbmc@lists.ozlabs.org>; Wed, 02 Oct 2019 03:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hrGM1E++6oLyl3yAiDJhBUDqWmd7ju6PFAFImdD9FTo=;
 b=f8l/GxtrxU77bNhR3u6S7z+4XcCqe1gG2o5UtNsyQ4wsT1bG+O9vqWj4pmaANmn8TB
 9r9vBlkuL9rULoA1/nTXszDoXfkn4RRw6sbqYaCxyaDndhGuMavDLoXqVFz6aY+me4WN
 Y3rNR8YuyMom+hFLf+Lkj/wvRqoTZrsPmnT50K5ha7OjtK0Hkbx4UpAoalPpEC9LV3hZ
 bNfffzxezl4Rja9lYBE+DVvT3lXbnpTPXH54QgMrhU5S1KMVIlOcVBLksxs9CCbWIC/D
 YbMLusT6s/H/NVfxkRqHK7Y5GJ5ZVNrqpOQQbcvCUGxLuZMQY4LDAVhlabQ05GBneK7j
 GJoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=hrGM1E++6oLyl3yAiDJhBUDqWmd7ju6PFAFImdD9FTo=;
 b=V1WjqZKKR0pf58bGWoZ7HY8vhAZLl8nBZrCB2T00Ga6ZwtUR9l9UT4Mvyls7vuqW4T
 2PYTOHy+5Yhb/TOZH+GVn4SY1Go1h9hYRsdONpUDtgnOl4VX9vz713ScSYIdcqJYm57M
 UsqhLVj5ROFgcNLGIP1Lq+0zLKnAGklBGV5xPnX+FQIwwRJEcXj8s3DTF/yVD2FEMAM0
 G1zeAlNmx3Mm4rcEIjkwkgXnoeaWPFCKLthd9ynHWNm05LCMupC5s2YKlkAA88ZtZn3s
 81v1pcMgO3aqtdg2uvM390XFAUjGwDmciLGBNhnhphiydvBD9b6affivL3cebxGQBXdJ
 sgSg==
X-Gm-Message-State: APjAAAWBuo/pdG7tAw5qtIuti/hWqno9IxE4bqGoVpTTCs+tLIaG1d7S
 gzLicABNpP6iVtBRowHFt1SqqxsgeOE=
X-Google-Smtp-Source: APXvYqzjgwnhri7AvggbDrS9TUNIZ8vwPYzEfUNEcerejjpDrASMKwE+Zs6VM6wwnG1b6yCeRIR6fw==
X-Received: by 2002:a17:902:9a85:: with SMTP id
 w5mr2795295plp.316.1570011826628; 
 Wed, 02 Oct 2019 03:23:46 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.15])
 by smtp.gmail.com with ESMTPSA id i74sm24187091pfe.28.2019.10.02.03.23.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Oct 2019 03:23:46 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.3 2/4] ARM: dts: aspeed: tacoma: Enable VUART1
Date: Wed,  2 Oct 2019 19:53:26 +0930
Message-Id: <20191002102328.5196-3-joel@jms.id.au>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191002102328.5196-1-joel@jms.id.au>
References: <20191002102328.5196-1-joel@jms.id.au>
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Brad Bishop <bradleyb@fuzziesquirrel.com>,
 Eddie James <eajames@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Like most OpenPower machines the VUART is expected to be at /dev/ttyS5
for communication with the host over LPC.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts b/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
index 02e55c7102bd..183a8349e181 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
@@ -459,3 +459,7 @@
 &ibt {
 	status = "okay";
 };
+
+&vuart1 {
+	status = "okay";
+};
-- 
2.23.0

