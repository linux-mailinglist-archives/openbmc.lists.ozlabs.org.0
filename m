Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F3DC33D999E
	for <lists+openbmc@lfdr.de>; Thu, 29 Jul 2021 01:39:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GZqr05xDFz3bj8
	for <lists+openbmc@lfdr.de>; Thu, 29 Jul 2021 09:39:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=L3XkxYls;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1032;
 helo=mail-pj1-x1032.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=L3XkxYls; dkim-atps=neutral
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GZqpq28xvz3068;
 Thu, 29 Jul 2021 09:38:11 +1000 (AEST)
Received: by mail-pj1-x1032.google.com with SMTP id
 mz5-20020a17090b3785b0290176ecf64922so12657518pjb.3; 
 Wed, 28 Jul 2021 16:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=BFHHs7fv3jc5YudTzgw5MtexrsriZl7knh1DB5cRAes=;
 b=L3XkxYlsyD9aFePA5FTxjxIxslqcS0nAZPewYHSE3yXv3njr4Q0WGYVoFzfoLjnIdy
 JzD6jWxJ9mVOn7G2drqpJdBgy1QDVkwOTO6dcs6l7Yk1FZYgR9qTm0d5KziCoTdBeyXE
 yDtM+lkOOKxKPzMR3etzoHJgcXjPuQrr9N3YvZpUBUo/vMV7x4Uc+XyzznJqiV/xU23p
 Ke+nVhfGmDxMjgDriBvBRsngyPW2PTzu8CnyzfSBwVXKZPwbad55gzWPd1YU+G2pqiYS
 sX0hKtjuHfAbpMwzEgLX6dNi48Qb5hKLhaokkNids73NJsKzKZ4906qI9Ot6ZFHBC2JH
 v2kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=BFHHs7fv3jc5YudTzgw5MtexrsriZl7knh1DB5cRAes=;
 b=szOXpJ3YsD1X9Uo4MrjSoUGdVeMiQFr5HPuiwR2/yGMcXxVLuQewBvUqpYwSnFHHfE
 9wqWVnJZ/PLqPagQq/WDKT1+l67x//BriYTQKAP2Lx7FlBStmDjbZY6IviM8VwRxFp1X
 PvJBp/Sz/xFZ6rK2gWt65rEJQyz7M4j48bXlCZeOJTTp0djTWCjqaJEKpBoJlO6qYkHY
 axKVuCLtM4Er3wcmX2d4nTuE2pNqXZrHv+z2CRUe+mcpkvCa39FmG6IOmd2fNlN0PFWj
 3SKXJg7CENUTB/Gi6NQq7OJv4NwEJtosky8MTfPHzOjbUYw4FRBWCAtK32Tyuhf77AER
 JZEw==
X-Gm-Message-State: AOAM532DzL44QQwIMtp7/cXgmWo/NSM8GYHGAc+puhbs+KBs2xyyBJat
 G821a/fJz19XQ7JM0YQ7GeI=
X-Google-Smtp-Source: ABdhPJzMdHRqs88mpqu1mG+TTxmvFqc63yR50LFdh3E0MRQmKTa48ri7hpO06GmpQSA3zkuvyc6lOg==
X-Received: by 2002:a17:902:7884:b029:12a:efa7:18d8 with SMTP id
 q4-20020a1709027884b029012aefa718d8mr1997882pll.85.1627515488270; 
 Wed, 28 Jul 2021 16:38:08 -0700 (PDT)
Received: from taoren-ubuntu-R90MNF91.thefacebook.com
 (c-73-252-146-110.hsd1.ca.comcast.net. [73.252.146.110])
 by smtp.gmail.com with ESMTPSA id k37sm1038671pgm.84.2021.07.28.16.38.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jul 2021 16:38:07 -0700 (PDT)
From: rentao.bupt@gmail.com
To: Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, taoren@fb.com
Subject: [PATCH 2/6] ARM: dts: aspeed: wedge400: Use common flash layout
Date: Wed, 28 Jul 2021 16:37:51 -0700
Message-Id: <20210728233755.17963-3-rentao.bupt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210728233755.17963-1-rentao.bupt@gmail.com>
References: <20210728233755.17963-1-rentao.bupt@gmail.com>
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
Cc: Tao Ren <rentao.bupt@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Tao Ren <rentao.bupt@gmail.com>

Simplify wedge400 flash layout by using the common layout defined in
"facebook-bmc-flash-layout-128.dtsi".

Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
---
 .../boot/dts/aspeed-bmc-facebook-wedge400.dts | 48 +------------------
 1 file changed, 1 insertion(+), 47 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-wedge400.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-wedge400.dts
index 63a3dd548f30..a901c8be49b9 100644
--- a/arch/arm/boot/dts/aspeed-bmc-facebook-wedge400.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-facebook-wedge400.dts
@@ -91,53 +91,7 @@
  * Both firmware flashes are 128MB on Wedge400 BMC.
  */
 &fmc_flash0 {
-	partitions {
-		compatible = "fixed-partitions";
-		#address-cells = <1>;
-		#size-cells = <1>;
-
-		/*
-		 * u-boot partition: 384KB.
-		 */
-		u-boot@0 {
-			reg = <0x0 0x60000>;
-			label = "u-boot";
-		};
-
-		/*
-		 * u-boot environment variables: 128KB.
-		 */
-		u-boot-env@60000 {
-			reg = <0x60000 0x20000>;
-			label = "env";
-		};
-
-		/*
-		 * FIT image: 123.5 MB.
-		 */
-		fit@80000 {
-			reg = <0x80000 0x7b80000>;
-			label = "fit";
-		};
-
-		/*
-		 * "data0" partition (4MB) is reserved for persistent
-		 * data store.
-		 */
-		data0@7c00000 {
-			reg = <0x7c00000 0x400000>;
-			label = "data0";
-		};
-
-		/*
-		 * "flash0" partition (covering the entire flash) is
-		 * explicitly created to avoid breaking legacy applications.
-		 */
-		flash0@0 {
-			reg = <0x0 0x8000000>;
-			label = "flash0";
-		};
-	};
+#include "facebook-bmc-flash-layout-128.dtsi"
 };
 
 &fmc_flash1 {
-- 
2.17.1

