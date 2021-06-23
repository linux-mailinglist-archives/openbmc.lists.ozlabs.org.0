Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8247E3B23BC
	for <lists+openbmc@lfdr.de>; Thu, 24 Jun 2021 01:04:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G9JkC27TBz3bsm
	for <lists+openbmc@lfdr.de>; Thu, 24 Jun 2021 09:04:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=g6krjK+G;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::331;
 helo=mail-ot1-x331.google.com; envelope-from=bjwyman@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=g6krjK+G; dkim-atps=neutral
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [IPv6:2607:f8b0:4864:20::331])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G9Jjr3Yptz3033;
 Thu, 24 Jun 2021 09:04:15 +1000 (AEST)
Received: by mail-ot1-x331.google.com with SMTP id
 f3-20020a0568301c23b029044ce5da4794so3627793ote.11; 
 Wed, 23 Jun 2021 16:04:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9MOIWDiHCGw0MlpdwsyPDp15XTp6RxhfknqF8roXbH8=;
 b=g6krjK+Gse/zMlSbIxULJRAsjDH3SSaQscAACxTb57x9klIIqQ3cBpVHyTUYBQVoEY
 /8Pu8cvMbOkc7QZZqqoBh0CVJF1hSzxFQFOdv+JsY6MLrQ0agYPhBnxKjf8Y/eyq2BUq
 VUT2V8OGvgTLOpEkvJCUUja8GIJlAImxf5UWnJuCcDprJEv2agvEGuxcPA6lgOSFI5ey
 ur0gOwcr5mzUP0IXunECVg27tklb9CFwgqRsw3IGrwncqnyrRHsJkx7a/SZz2chDv9vx
 SkYhyyp02FeSZAztYIyFZuQUCvusBanXr9QB5ZiTssrc2WzkLoN7suQvY8X6WY3ZeTaF
 HaQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9MOIWDiHCGw0MlpdwsyPDp15XTp6RxhfknqF8roXbH8=;
 b=F6PIdCZ7vhcN7UBl2lRav6c1eB9TIJviUqPkzw4LlH1ZSgVN0PKfpfVn+fz9K1vzjk
 xoC2W22qtazg48tcai/WuwcJu/t7YHi+fzuZW7gIu5SLDMcEbCBHxMI2YHAQa0WXP61t
 nBcdott66E4XVsuLi0gBJV5nfKZAZn2c3X6jKsI1nS41qGmKHzTOu9DMWPgF/G2fC1bC
 jpvjk62flfbyjmUoxCPf/bu3++KqUfEFX4rWrwZN2vPvfrCvIoyZzBfDZd4QZpeciaNw
 tpTdvTsjeuwzUPABzU8vAtSssmYkAKy6dhWgeDDT1EnfetlcfI35N/uXNLL3GAUQsOBN
 qGww==
X-Gm-Message-State: AOAM532HpoImBwzXuvGsf94lS9ZsEz/Ehomxbw9e22gUtwrCGC1w2XQ+
 WgWDyzKS3rRDuKVstBktyiMlOxzelK4=
X-Google-Smtp-Source: ABdhPJw2fpnKHtKirwVseihbvfqbYSfemwkAFcCP4fDQPuizk8aOOk3aUMhXaK2Zm3eXXbPjM1597A==
X-Received: by 2002:a05:6830:4a:: with SMTP id
 d10mr2017386otp.81.1624489451279; 
 Wed, 23 Jun 2021 16:04:11 -0700 (PDT)
Received: from fstone04p1.aus.stglabs.ibm.com ([129.41.86.7])
 by smtp.gmail.com with ESMTPSA id v8sm278429oth.69.2021.06.23.16.04.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Jun 2021 16:04:10 -0700 (PDT)
From: Brandon Wyman <bjwyman@gmail.com>
To: Joel Stanley <joel@jms.id.au>, openbmc@lists.ozlabs.org,
 linux-aspeed@lists.ozlabs.org
Subject: [PATCH] ARM: dts: aspeed: Rainier remove PSU gpio-keys
Date: Wed, 23 Jun 2021 23:04:01 +0000
Message-Id: <20210623230401.3050076-1-bjwyman@gmail.com>
X-Mailer: git-send-email 2.25.1
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
Cc: "B. J. Wyman" <bjwyman@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: "B. J. Wyman" <bjwyman@gmail.com>

Remove the gpio-keys entries for the power supply presence lines from
the Rainier device tree. The user space applications are going to change
from using libevdev to libgpiod.

Signed-off-by: B. J. Wyman <bjwyman@gmail.com>
---
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 28 --------------------
 1 file changed, 28 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
index 941c0489479a..d6ed583cfb1b 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
@@ -116,34 +116,6 @@ vga_memory: region@bf000000 {
 		};
 	};
 
-	gpio-keys {
-		compatible = "gpio-keys";
-
-		ps0-presence {
-			label = "ps0-presence";
-			gpios = <&gpio0 ASPEED_GPIO(S, 0) GPIO_ACTIVE_LOW>;
-			linux,code = <ASPEED_GPIO(S, 0)>;
-		};
-
-		ps1-presence {
-			label = "ps1-presence";
-			gpios = <&gpio0 ASPEED_GPIO(S, 1) GPIO_ACTIVE_LOW>;
-			linux,code = <ASPEED_GPIO(S, 1)>;
-		};
-
-		ps2-presence {
-			label = "ps2-presence";
-			gpios = <&gpio0 ASPEED_GPIO(S, 2) GPIO_ACTIVE_LOW>;
-			linux,code = <ASPEED_GPIO(S, 2)>;
-		};
-
-		ps3-presence {
-			label = "ps3-presence";
-			gpios = <&gpio0 ASPEED_GPIO(S, 3) GPIO_ACTIVE_LOW>;
-			linux,code = <ASPEED_GPIO(S, 3)>;
-		};
-	};
-
 	i2c2mux: i2cmux {
 		compatible = "i2c-mux-gpio";
 		#address-cells = <1>;
-- 
2.25.1

