Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A6E77AA7FB
	for <lists+openbmc@lfdr.de>; Fri, 22 Sep 2023 06:54:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RsKgF6sgjz3cNW
	for <lists+openbmc@lfdr.de>; Fri, 22 Sep 2023 14:54:17 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.72; helo=twmbx03.aspeed.com; envelope-from=joe_wang@aspeedtech.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 83 seconds by postgrey-1.37 at boromir; Wed, 20 Sep 2023 20:35:42 AEST
Received: from TWMBX03.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RrFL66pFsz2yTy;
	Wed, 20 Sep 2023 20:35:42 +1000 (AEST)
Received: from TWMBX02.aspeed.com (192.168.0.24) by TWMBX03.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 20 Sep
 2023 18:33:36 +0800
Received: from twmbx02.aspeed.com (192.168.10.13) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 20 Sep 2023 18:33:36 +0800
From: Joe Wang <joe_wang@aspeedtech.com>
To: <andrew@aj.id.au>, <linus.walleij@linaro.org>, <joel@jms.id.au>
Subject: [PATCH] pinctrl: pinctrl-aspeed-g6: Add more settings for USB2AHP function
Date: Wed, 20 Sep 2023 18:33:32 +0800
Message-ID: <20230920103332.274151-1-joe_wang@aspeedtech.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Mailman-Approved-At: Fri, 22 Sep 2023 14:53:04 +1000
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
Cc: linux-gpio@vger.kernel.org, openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

AST2600 USB2AHP (USB PortA: PCIe EHCI to PHY) function needs to set the
register SCUC20[16]. Set it to enable the PCIe EHCI device on PCIe bus.
Besides, also add USB2AHP signal expressions into pin declarations.

Signed-off-by: Joe Wang <joe_wang@aspeedtech.com>
---
 drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
index 80838dc54b3a..d376fa7114d1 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
@@ -1592,9 +1592,10 @@ SIG_EXPR_LIST_DECL_SEMG(A4, USB2ADPDP, USBA, USB2ADP, USB2ADP_DESC,
 			SIG_DESC_SET(SCUC20, 16));
 SIG_EXPR_LIST_DECL_SEMG(A4, USB2ADDP, USBA, USB2AD, USB2AD_DESC);
 SIG_EXPR_LIST_DECL_SEMG(A4, USB2AHDP, USBA, USB2AH, USB2AH_DESC);
-SIG_EXPR_LIST_DECL_SEMG(A4, USB2AHPDP, USBA, USB2AHP, USB2AHP_DESC);
+SIG_EXPR_LIST_DECL_SEMG(A4, USB2AHPDP, USBA, USB2AHP, USB2AHP_DESC,
+			SIG_DESC_SET(SCUC20, 16));
 PIN_DECL_(A4, SIG_EXPR_LIST_PTR(A4, USB2ADPDP), SIG_EXPR_LIST_PTR(A4, USB2ADDP),
-	  SIG_EXPR_LIST_PTR(A4, USB2AHDP));
+	  SIG_EXPR_LIST_PTR(A4, USB2AHDP), SIG_EXPR_LIST_PTR(A4, USB2AHPDP));
 
 #define B4 253
 SIG_EXPR_LIST_DECL_SEMG(B4, USB2ADPDN, USBA, USB2ADP, USB2ADP_DESC);
@@ -1602,7 +1603,7 @@ SIG_EXPR_LIST_DECL_SEMG(B4, USB2ADDN, USBA, USB2AD, USB2AD_DESC);
 SIG_EXPR_LIST_DECL_SEMG(B4, USB2AHDN, USBA, USB2AH, USB2AH_DESC);
 SIG_EXPR_LIST_DECL_SEMG(B4, USB2AHPDN, USBA, USB2AHP, USB2AHP_DESC);
 PIN_DECL_(B4, SIG_EXPR_LIST_PTR(B4, USB2ADPDN), SIG_EXPR_LIST_PTR(B4, USB2ADDN),
-	  SIG_EXPR_LIST_PTR(B4, USB2AHDN));
+	  SIG_EXPR_LIST_PTR(B4, USB2AHDN), SIG_EXPR_LIST_PTR(B4, USB2AHPDN));
 
 GROUP_DECL(USBA, A4, B4);
 
-- 
2.34.1

