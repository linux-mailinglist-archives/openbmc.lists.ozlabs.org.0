Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A06282FC3E9
	for <lists+openbmc@lfdr.de>; Tue, 19 Jan 2021 23:41:41 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DL3YG5RcTzDqYP
	for <lists+openbmc@lfdr.de>; Wed, 20 Jan 2021 09:41:38 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=nuvoton.com
 (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il;
 envelope-from=tomer.maimon@nuvoton.com; receiver=<UNKNOWN>)
Received: from herzl.nuvoton.co.il (212.199.177.27.static.012.net.il
 [212.199.177.27])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DL3PD3JGDzDqC9
 for <openbmc@lists.ozlabs.org>; Wed, 20 Jan 2021 09:34:35 +1100 (AEDT)
Received: from taln60.nuvoton.co.il (ntil-fw [212.199.177.25])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id 10JMYIcb008277;
 Wed, 20 Jan 2021 00:34:18 +0200
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
 id 6304363A17; Wed, 20 Jan 2021 00:34:19 +0200 (IST)
From: Tomer Maimon <tmaimon77@gmail.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.8 v1 3/4] arm: dts: Olympus: Enable PECI dimm
 temperature
Date: Wed, 20 Jan 2021 00:34:11 +0200
Message-Id: <20210119223412.223492-4-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20210119223412.223492-1-tmaimon77@gmail.com>
References: <20210119223412.223492-1-tmaimon77@gmail.com>
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Tomer Maimon <tmaimon77@gmail.com>,
 benjaminfair@google.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Enable PECI dimm temperature nodes in Olympus
Quanta machine.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 arch/arm/boot/dts/nuvoton-npcm750-runbmc-olympus.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/nuvoton-npcm750-runbmc-olympus.dts b/arch/arm/boot/dts/nuvoton-npcm750-runbmc-olympus.dts
index 1692bb7314c5..de34c9b2ff2c 100644
--- a/arch/arm/boot/dts/nuvoton-npcm750-runbmc-olympus.dts
+++ b/arch/arm/boot/dts/nuvoton-npcm750-runbmc-olympus.dts
@@ -910,10 +910,12 @@
 	intel-peci-dimmtemp@30 {
 		compatible = "intel,peci-client";
 		reg = <0x30>;
+		status = "okay";
 	};
 	intel-peci-dimmtemp@31 {
 		compatible = "intel,peci-client";
 		reg = <0x31>;
+		status = "okay";
 	};
 };
 
-- 
2.22.0

