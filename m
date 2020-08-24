Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 283D8250AC1
	for <lists+openbmc@lfdr.de>; Mon, 24 Aug 2020 23:23:01 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bb4pp0ll2zDq9b
	for <lists+openbmc@lfdr.de>; Tue, 25 Aug 2020 07:22:58 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1029;
 helo=mail-pj1-x1029.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=AwN+lBp5; dkim-atps=neutral
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bb4lM3mJ5zDqRf;
 Tue, 25 Aug 2020 07:19:59 +1000 (AEST)
Received: by mail-pj1-x1029.google.com with SMTP id g6so105714pjl.0;
 Mon, 24 Aug 2020 14:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=W2l7UoscXIifQg354sjUGWVyjUs++4hJIZtN+5bO26Q=;
 b=AwN+lBp5YsUpDBOj31SIlycJw84KHGr7mdo/Y986K37htcjz1W1pNYqd4FkAM/MbpH
 MtvOoY/0GnAOkEU7Zsl9gDBQ7kGqmLa1J2mKRzZGqQHIP8D+ksG3H2JEV+dMUYBCD40U
 FlSxRfJbcjPJAbu9/Q31bdslC4UeN5dK++u7e5Qi43TPMw2w+WoE38oF3OmVi99eop4r
 P6PjAfjh3bTnr70mmJmnt+Non7eZVn72rbu0UYg+9kz7PT1/p6vUanDuQAw0qwEzwdn6
 jGecwSdsQz6rP4kzFp4CYBdmG6HvPI2by51PA82/noVUSVcC3opX0z/CWTpMypj9HtVB
 EZjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=W2l7UoscXIifQg354sjUGWVyjUs++4hJIZtN+5bO26Q=;
 b=Qh/VaifwBmDHR94jZ6LnINZS4af5ofGBCUGjhJzzrc4uyHVA3piVXMDVfsZWcyHAMm
 xaRYl+wHilyH0zYLNeARja0NYw2isFpaTG6CO91UVt4u5CpKLgnKIgcIr0w7qkgyFjzu
 dywcNRKtodSrcti+QVsIqhrk3cTo16KQFFLAVV1o+7rbQxu9xPk0JM/pRk3GRlGqHtEF
 71MZxYVKjfeEzZ9fTQCtmrnS1j7wsGOCMwm/lQCkya6Cy/j4ubl5r9lRvZKFUxzvi/wy
 9lqyL9PsqM/aerPY3imd6sUA4liGdxz+oh7XUB0xCS455fFjymKIAxCYmj5knUs5RD2f
 ywYQ==
X-Gm-Message-State: AOAM532Zpzy/q/DGdsXwupkBMyzskVe1do91pQIfUurhe+T5Z7xpdfOV
 y97sBc3+E0YjCGf999kD7GY=
X-Google-Smtp-Source: ABdhPJwo8WNCDBMzCSUOKapnFrQwwyMyGv6jhXvAm/1kcZJwzHCe3jnqJGLxwQhx1P/DBPwu9DILsQ==
X-Received: by 2002:a17:90b:3509:: with SMTP id
 ls9mr923847pjb.230.1598303996962; 
 Mon, 24 Aug 2020 14:19:56 -0700 (PDT)
Received: from taoren-ubuntu-R90MNF91.thefacebook.com
 (c-73-252-146-110.hsd1.ca.comcast.net. [73.252.146.110])
 by smtp.gmail.com with ESMTPSA id t10sm97788pfq.77.2020.08.24.14.19.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Aug 2020 14:19:56 -0700 (PDT)
From: rentao.bupt@gmail.com
To: Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, taoren@fb.com
Subject: [PATCH 1/5] ARM: dts: aspeed: Remove flash layout from Facebook
 AST2500 Common dtsi
Date: Mon, 24 Aug 2020 14:19:44 -0700
Message-Id: <20200824211948.12852-2-rentao.bupt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200824211948.12852-1-rentao.bupt@gmail.com>
References: <20200824211948.12852-1-rentao.bupt@gmail.com>
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

Remove FMC flash layout from ast2500-facebook-netbmc-common.dtsi because
flash size and layout varies across different Facebook AST2500 OpenBMC
platforms.

Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
---
 .../boot/dts/ast2500-facebook-netbmc-common.dtsi    | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/arch/arm/boot/dts/ast2500-facebook-netbmc-common.dtsi b/arch/arm/boot/dts/ast2500-facebook-netbmc-common.dtsi
index 7468f102bd76..c0c43b8644ee 100644
--- a/arch/arm/boot/dts/ast2500-facebook-netbmc-common.dtsi
+++ b/arch/arm/boot/dts/ast2500-facebook-netbmc-common.dtsi
@@ -47,25 +47,12 @@
 		status = "okay";
 		m25p,fast-read;
 		label = "spi0.0";
-
-#include "facebook-bmc-flash-layout.dtsi"
 	};
 
 	fmc_flash1: flash@1 {
 		status = "okay";
 		m25p,fast-read;
 		label = "spi0.1";
-
-		partitions {
-			compatible = "fixed-partitions";
-			#address-cells = <1>;
-			#size-cells = <1>;
-
-			flash1@0 {
-				reg = <0x0 0x2000000>;
-				label = "flash1";
-			};
-		};
 	};
 };
 
-- 
2.17.1

