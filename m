Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FB36742685
	for <lists+openbmc@lfdr.de>; Thu, 29 Jun 2023 14:36:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QsHxN00Ngz3cWF
	for <lists+openbmc@lfdr.de>; Thu, 29 Jun 2023 22:36:08 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=fail (SPF fail - not authorized) smtp.mailfrom=nuvoton.com (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il; envelope-from=tomer.maimon@nuvoton.com; receiver=lists.ozlabs.org)
Received: from herzl.nuvoton.co.il (unknown [212.199.177.27])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QsHrH0m29z3bnk
	for <openbmc@lists.ozlabs.org>; Thu, 29 Jun 2023 22:31:40 +1000 (AEST)
Received: from NTILML01.nuvoton.com (212.199.177.18.static.012.net.il [212.199.177.18])
	by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id 35TCVUF9009259
	for <openbmc@lists.ozlabs.org>; Thu, 29 Jun 2023 15:31:30 +0300
Received: from NTHCML01A.nuvoton.com (10.1.8.177) by NTILML01.nuvoton.com
 (10.190.1.56) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Thu, 29 Jun
 2023 15:31:29 +0300
Received: from NTHCCAS04.nuvoton.com (10.1.8.29) by NTHCML01A.nuvoton.com
 (10.1.8.177) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2176.2; Thu, 29 Jun
 2023 20:31:27 +0800
Received: from taln60.nuvoton.co.il (10.191.1.180) by NTHCCAS04.nuvoton.com
 (10.1.8.29) with Microsoft SMTP Server id 15.1.2176.2 via Frontend Transport;
 Thu, 29 Jun 2023 20:31:27 +0800
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
	id C52056473E; Thu, 29 Jun 2023 15:31:26 +0300 (IDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: <openbmc@lists.ozlabs.org>
Subject: [PATCH linux dev-6.1 v1 0/2] Add modules to device tree NPCM8XX
Date: Thu, 29 Jun 2023 15:31:22 +0300
Message-ID: <20230629123124.227478-1-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NotSetDelaration: True
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
Cc: Joel Stanley <joel@jms.id.au>, Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add Nuvoton BMC NPCM8XX nodes support:
	- EHCI
        - OHCI
        - PCIe
        - eMMC
        - FIU
        - PSPI
        - KCS
        - BPC
        - JTAG Master
        - RNG
        - ADC
        - SGPIO
        - Thermal
        - PWM and FAN
        - I2C
        - I3C
        - Pin controller
        - GPIO
        - GMAC
        - EDAC
        - OPTEE

Tomer Maimon (2):
  arm64: dts: nuvoton: add nodes to NPCM8XX
  arm64: dts: nuvoton: Enable nodes NPCM845 EVB DTS

 .../dts/nuvoton/nuvoton-common-npcm8xx.dtsi   | 1495 ++++++++++++++++-
 .../boot/dts/nuvoton/nuvoton-npcm845-evb.dts  |  568 +++++++
 .../nuvoton/nuvoton-npcm845-pincfg-evb.dtsi   |   79 +
 .../boot/dts/nuvoton/nuvoton-npcm845.dtsi     |   95 ++
 4 files changed, 2235 insertions(+), 2 deletions(-)
 create mode 100644 arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-pincfg-evb.dtsi

-- 
2.33.0

