Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D509C47DB8
	for <lists+openbmc@lfdr.de>; Mon, 17 Jun 2019 11:00:36 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45S4tV2NgWzDqXG
	for <lists+openbmc@lfdr.de>; Mon, 17 Jun 2019 19:00:34 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=inspur.com
 (client-ip=210.51.26.146; helo=unicom146.biz-email.net;
 envelope-from=wangzqbj@inspur.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=inspur.com
Received: from unicom146.biz-email.net (unicom146.biz-email.net
 [210.51.26.146])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45S4sn0BBVzDqVJ
 for <openbmc@lists.ozlabs.org>; Mon, 17 Jun 2019 18:59:49 +1000 (AEST)
Received: from ([60.208.111.195])
 by unicom146.biz-email.net (Antispam) with ASMTP (SSL) id IOY15627
 for <openbmc@lists.ozlabs.org>; Mon, 17 Jun 2019 16:59:27 +0800
Received: from Jtjnmail201618.home.langchao.com (10.100.2.18) by
 jtjnmail201603.home.langchao.com (10.100.2.3) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1591.10; Mon, 17 Jun 2019 16:59:34 +0800
Received: from localhost (10.100.1.52) by Jtjnmail201618.home.langchao.com
 (10.100.2.18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Mon, 17 Jun
 2019 16:59:33 +0800
From: John Wang <wangzqbj@inspur.com>
To: <openbmc@lists.ozlabs.org>
Subject: [PATCH dev-5.1] ARM: dts: aspeed: fp5280g2: Fix gpio-keys key code
Date: Mon, 17 Jun 2019 16:59:33 +0800
Message-ID: <1560761973-26544-1-git-send-email-wangzqbj@inspur.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.100.1.52]
X-ClientProxiedBy: jtjnmail201603.home.langchao.com (10.100.2.3) To
 Jtjnmail201618.home.langchao.com (10.100.2.18)
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

KEY_RESERVED is defined as 0 and is not supposed
to be transmitted to userspace,so the key code in fan0-presence
should not be 0.
This changes fan-presence's key codes 0-7 to 1-8.

Signed-off-by: John Wang <wangzqbj@inspur.com>
---
 arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts b/arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts
index c822f49..c762c02 100644
--- a/arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts
@@ -101,49 +101,49 @@
 		fan0-presence {
 			label = "fan0-presence";
 			gpios = <&pca1 0 GPIO_ACTIVE_LOW>;
-			linux,code = <0>;
+			linux,code = <1>;
 		};
 
 		fan1-presence {
 			label = "fan1-presence";
 			gpios = <&pca1 1 GPIO_ACTIVE_LOW>;
-			linux,code = <1>;
+			linux,code = <2>;
 		};
 
 		fan2-presence {
 			label = "fan2-presence";
 			gpios = <&pca1 2 GPIO_ACTIVE_LOW>;
-			linux,code = <2>;
+			linux,code = <3>;
 		};
 
 		fan3-presence {
 			label = "fan3-presence";
 			gpios = <&pca1 3 GPIO_ACTIVE_LOW>;
-			linux,code = <3>;
+			linux,code = <4>;
 		};
 
 		fan4-presence {
 			label = "fan4-presence";
 			gpios = <&pca1 4 GPIO_ACTIVE_LOW>;
-			linux,code = <4>;
+			linux,code = <5>;
 		};
 
 		fan5-presence {
 			label = "fan5-presence";
 			gpios = <&pca1 5 GPIO_ACTIVE_LOW>;
-			linux,code = <5>;
+			linux,code = <6>;
 		};
 
 		fan6-presence {
 			label = "fan6-presence";
 			gpios = <&pca1 6 GPIO_ACTIVE_LOW>;
-			linux,code = <6>;
+			linux,code = <7>;
 		};
 
 		fan7-presence {
 			label = "fan7-presence";
 			gpios = <&pca1 7 GPIO_ACTIVE_LOW>;
-			linux,code = <7>;
+			linux,code = <8>;
 		};
 	};
 
-- 
2.7.4

