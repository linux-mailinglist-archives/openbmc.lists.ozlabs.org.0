Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 82D70989BA
	for <lists+openbmc@lfdr.de>; Thu, 22 Aug 2019 05:12:31 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46DV2P0BVnzDqwY
	for <lists+openbmc@lfdr.de>; Thu, 22 Aug 2019 13:12:29 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=inspur.com
 (client-ip=210.51.26.145; helo=unicom145.biz-email.net;
 envelope-from=wangzqbj@inspur.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=inspur.com
Received: from unicom145.biz-email.net (unicom145.biz-email.net
 [210.51.26.145])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46DV1l64MPzDqQv
 for <openbmc@lists.ozlabs.org>; Thu, 22 Aug 2019 13:11:50 +1000 (AEST)
Received: from ([60.208.111.195])
 by unicom145.biz-email.net (Antispam) with ASMTP (SSL) id NLH19335
 for <openbmc@lists.ozlabs.org>; Thu, 22 Aug 2019 11:11:35 +0800
Received: from localhost (10.100.1.52) by Jtjnmail201617.home.langchao.com
 (10.100.2.17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Thu, 22 Aug
 2019 11:11:34 +0800
From: John Wang <wangzqbj@inspur.com>
To: <openbmc@lists.ozlabs.org>
Subject: [PATCH dev-5.2] ARM: dts: aspeed: fp5280g2: Remove cold-fire
Date: Thu, 22 Aug 2019 11:11:33 +0800
Message-ID: <20190822031133.16389-1-wangzqbj@inspur.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.100.1.52]
X-ClientProxiedBy: jtjnmail201607.home.langchao.com (10.100.2.7) To
 Jtjnmail201617.home.langchao.com (10.100.2.17)
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

Cold-fire for fsi needs a dedicated gpio bank.
There should be no other pins in the bank in use.

But cold-fire is a new thing after the system is
designed. There is a conflict in the pins, so use
the fsi-master-gpio driver instead of the cf one

Signed-off-by: John Wang <wangzqbj@inspur.com>
---
 arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts b/arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts
index e9d714a46a60..52c28f2fed6c 100644
--- a/arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts
@@ -32,11 +32,6 @@
 			reg = <0x98000000 0x04000000>; /* 64M */
 		};
 
-		coldfire_memory: codefire_memory@9ef00000 {
-			reg = <0x9ef00000 0x00100000>;
-			no-map;
-		};
-
 		gfx_memory: framebuffer {
 			size = <0x01000000>;
 			alignment = <0x01000000>;
@@ -53,15 +48,11 @@
 	};
 
 	fsi: gpio-fsi {
-		compatible = "aspeed,ast2500-cf-fsi-master", "fsi-master";
+		compatible = "fsi-master-gpio", "fsi-master";
 		#address-cells = <2>;
 		#size-cells = <0>;
 		no-gpio-delays;
 
-		memory-region = <&coldfire_memory>;
-		aspeed,sram = <&sram>;
-		aspeed,cvic = <&cvic>;
-
 		clock-gpios = <&gpio ASPEED_GPIO(AA, 0) GPIO_ACTIVE_HIGH>;
 		data-gpios = <&gpio ASPEED_GPIO(AA, 2) GPIO_ACTIVE_HIGH>;
 		mux-gpios = <&gpio ASPEED_GPIO(I, 2) GPIO_ACTIVE_HIGH>;
-- 
2.17.1

