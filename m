Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AA85050AAD9
	for <lists+openbmc@lfdr.de>; Thu, 21 Apr 2022 23:37:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KkrVJ4ZLSz3bZZ
	for <lists+openbmc@lfdr.de>; Fri, 22 Apr 2022 07:37:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=IovDd6Zh;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::230;
 helo=mail-oi1-x230.google.com; envelope-from=bjwyman@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=IovDd6Zh; dkim-atps=neutral
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KkrTp5zqHz2yb6;
 Fri, 22 Apr 2022 07:37:01 +1000 (AEST)
Received: by mail-oi1-x230.google.com with SMTP id r85so7010359oie.7;
 Thu, 21 Apr 2022 14:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cUgxKgMIon74FgS8ThsTztXtidaROyVyoTKM0lJdMBY=;
 b=IovDd6Zh7okx91S098LpEDbfV6osBUmc1Ups40tC7h4CV5p3aM5KTusoEj8Ua0RueS
 NfY3lavbNz6esYDw1RY48nAFFogBFVDKzhpjktv/dioK7sZjpqvFd5jhD9nVGl8ns65t
 l4VHCNfb/4yuUBzqTvB8Gt8NNx0pXZBogEZQtUWTDFC7yvFqqTfHwQiadZ1te0+u/6m1
 pj2LhB/Cm5WW/UaeYEKYuHqy6T5XuLtTPPp+0jmiozT2tmmtiEUbcpMzEykbtDWsE3WE
 7a4nL5ZO2FsVkZDEb5nHxCZtM4v6ngZbNKCUEWKwQ6tpg/dsAjx/zXwHbMwuTt/mf3pY
 TRKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cUgxKgMIon74FgS8ThsTztXtidaROyVyoTKM0lJdMBY=;
 b=nRLUzWgKQ8jv+xBEIj6QAHP3SbJqni93Iq/6ra1FRSmmjncTHRd1l/jTF3NVq9ZI5b
 Z01zJ/fBFPsI00muF8penaJ7g0nF8VZsMpG4mGr1Hdaq4yEuoWPYz4lKg2b3Ay814VDq
 lSAygb/SoA9pwmOy6dLycSTIt17laqutAgy31HHGnxY45ZRqLni9ie7UcGuAMRCh+19b
 fRepPJAgTwu6Skez3dPmJnluwoQQ/tTa+k3vzpq6P09Q0xZKjbKh5BbTAgWkcvhvvjq8
 A0pFdHJcYx8B6ycSHGqV8lab3xq1KIq0vLhc+l9k9KgALLafiRTf1JgPqQcFvNNaEbBN
 KAxQ==
X-Gm-Message-State: AOAM531XYhg8zUlxIDamt1EqmSoCe/k6/MMaPcX3PrYXZpXKxpig6zBn
 EWXBuaw95WTPH7rVQZmk3lE=
X-Google-Smtp-Source: ABdhPJwL3mC33NuySTThTtMCGd0apoCnU6B//AN7X5pzrxPCBrNbgGaGZM/UCOe9BiFvtr9noplFiw==
X-Received: by 2002:aca:b505:0:b0:322:a524:8859 with SMTP id
 e5-20020acab505000000b00322a5248859mr4963479oif.2.1650577017387; 
 Thu, 21 Apr 2022 14:36:57 -0700 (PDT)
Received: from fstone04p1.aus.stglabs.ibm.com ([129.41.86.7])
 by smtp.gmail.com with ESMTPSA id
 s14-20020a0568302a8e00b006054e841915sm51010otu.73.2022.04.21.14.36.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 14:36:56 -0700 (PDT)
From: Brandon Wyman <bjwyman@gmail.com>
To: Joel Stanley <joel@jms.id.au>, openbmc@lists.ozlabs.org,
 Eddie James <eajames@linux.ibm.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Andrew Jeffery <andrew@aj.id.au>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: dts: aspeed: Everest and Rainier: Add
 power-ffs-sync-history GPIO
Date: Thu, 21 Apr 2022 21:36:38 +0000
Message-Id: <20220421213638.1151193-1-bjwyman@gmail.com>
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
Cc: Brandon Wyman <bjwyman@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The IBM Everest and Rainier systems have a GPIO line that goes to the
power supplies. It has a dual function: 1) Fans Full Speed, and 2) Sync
input history.

Signed-off-by: Brandon Wyman <bjwyman@gmail.com>
---
 arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts | 2 +-
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
index 578f9e2fc7ed..382da7934eaa 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
@@ -283,7 +283,7 @@ &gpio0 {
 	/*P0-P7*/	"","","","","led-pcieslot-power","","","",
 	/*Q0-Q7*/	"","","regulator-standby-faulted","","","","","",
 	/*R0-R7*/	"bmc-tpm-reset","power-chassis-control","power-chassis-good","","","I2C_FLASH_MICRO_N","","",
-	/*S0-S7*/	"","","","","","","","",
+	/*S0-S7*/	"","","","","power-ffs-sync-history","","","",
 	/*T0-T7*/	"","","","","","","","",
 	/*U0-U7*/	"","","","","","","","",
 	/*V0-V7*/	"","BMC_3RESTART_ATTEMPT_P","","","","","","",
diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
index 528b49e2c0f8..7213434695bf 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
@@ -265,7 +265,7 @@ &gpio0 {
 	/*Q0-Q7*/	"cfam-reset","","regulator-standby-faulted","","","","","",
 	/*R0-R7*/	"bmc-tpm-reset","power-chassis-control","power-chassis-good","","","","","",
 	/*S0-S7*/	"presence-ps0","presence-ps1","presence-ps2","presence-ps3",
-				"","","","",
+	"power-ffs-sync-history","","","",
 	/*T0-T7*/	"","","","","","","","",
 	/*U0-U7*/	"","","","","","","","",
 	/*V0-V7*/	"","","","","","","","",
-- 
2.25.1

