Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 06B6938FA68
	for <lists+openbmc@lfdr.de>; Tue, 25 May 2021 07:54:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fq3Ds74p3z2yxr
	for <lists+openbmc@lfdr.de>; Tue, 25 May 2021 15:54:21 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=fail (SPF fail - not authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.71;
 helo=twspam01.aspeedtech.com; envelope-from=steven_lee@aspeedtech.com;
 receiver=<UNKNOWN>)
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com
 [211.20.114.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fq3DD301mz2yX4;
 Tue, 25 May 2021 15:53:45 +1000 (AEST)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 14P5eFBn028242;
 Tue, 25 May 2021 13:40:15 +0800 (GMT-8)
 (envelope-from steven_lee@aspeedtech.com)
Received: from slee-VirtualBox.localdomain (192.168.100.253) by
 TWMBX02.aspeed.com (192.168.0.24) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 25 May 2021 13:53:12 +0800
From: Steven Lee <steven_lee@aspeedtech.com>
To: Andrew Jeffery <andrew@aj.id.au>, Linus Walleij <linus.walleij@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 "moderated list:ASPEED PINCTRL DRIVERS" <linux-aspeed@lists.ozlabs.org>,
 "moderated list:ASPEED PINCTRL DRIVERS" <openbmc@lists.ozlabs.org>,
 "open list:ASPEED PINCTRL DRIVERS" <linux-gpio@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE
 TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated list:ARM/ASPEED
 MACHINE SUPPORT" <linux-arm-kernel@lists.infradead.org>, open list
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 1/3] dt-bindings: pinctrl: Update enum for adding SGPM2 and
 SGPS2
Date: Tue, 25 May 2021 13:53:05 +0800
Message-ID: <20210525055308.31069-2-steven_lee@aspeedtech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210525055308.31069-1-steven_lee@aspeedtech.com>
References: <20210525055308.31069-1-steven_lee@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [192.168.100.253]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 14P5eFBn028242
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
Cc: billy_tsai@aspeedtech.com, ryan_chen@aspeedtech.com,
 steven_lee@aspeedtech.com, Hongweiz@ami.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

AST2600 has 2 SGPIO master interfaces one with 128 pins and another one
has 80 pins. It also supports 2 SGPIO slave interfaces.
In the current bindings, there are only SGPM1 and SGPS1 defined in enum,
SGPM2 and SGPS2 should also be added in the bindings.

Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
---
 .../bindings/pinctrl/aspeed,ast2600-pinctrl.yaml       | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2600-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2600-pinctrl.yaml
index ad91c0bc54da..ad2866c99738 100644
--- a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2600-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2600-pinctrl.yaml
@@ -46,8 +46,8 @@ patternProperties:
                   PWM9, RGMII1, RGMII2, RGMII3, RGMII4, RMII1, RMII2, RMII3, RMII4,
                   RXD1, RXD2, RXD3, RXD4, SALT1, SALT10, SALT11, SALT12, SALT13, SALT14,
                   SALT15, SALT16, SALT2, SALT3, SALT4, SALT5, SALT6, SALT7, SALT8,
-                  SALT9, SD1, SD2, SGPM1, SGPS1, SIOONCTRL, SIOPBI, SIOPBO, SIOPWREQ,
-                  SIOPWRGD, SIOS3, SIOS5, SIOSCI, SPI1, SPI1ABR, SPI1CS1, SPI1WP, SPI2,
+                  SALT9, SD1, SD2, SGPM1, SGPM2, SGPS1, SGPS2, SIOONCTRL, SIOPBI, SIOPBO,
+                  SIOPWREQ, SIOPWRGD, SIOS3, SIOS5, SIOSCI, SPI1, SPI1ABR, SPI1CS1, SPI1WP, SPI2,
                   SPI2CS1, SPI2CS2, TACH0, TACH1, TACH10, TACH11, TACH12, TACH13, TACH14,
                   TACH15, TACH2, TACH3, TACH4, TACH5, TACH6, TACH7, TACH8, TACH9, THRU0,
                   THRU1, THRU2, THRU3, TXD1, TXD2, TXD3, TXD4, UART10, UART11, UART12,
@@ -74,9 +74,9 @@ patternProperties:
                   RXD1, RXD2, RXD3, RXD4, SALT1, SALT10G0, SALT10G1, SALT11G0, SALT11G1,
                   SALT12G0, SALT12G1, SALT13G0, SALT13G1, SALT14G0, SALT14G1, SALT15G0,
                   SALT15G1, SALT16G0, SALT16G1, SALT2, SALT3, SALT4, SALT5, SALT6,
-                  SALT7, SALT8, SALT9G0, SALT9G1, SD1, SD2, SD3, SGPM1, SGPS1, SIOONCTRL,
-                  SIOPBI, SIOPBO, SIOPWREQ, SIOPWRGD, SIOS3, SIOS5, SIOSCI, SPI1, SPI1ABR,
-                  SPI1CS1, SPI1WP, SPI2, SPI2CS1, SPI2CS2, TACH0, TACH1, TACH10, TACH11,
+                  SALT7, SALT8, SALT9G0, SALT9G1, SD1, SD2, SD3, SGPM1, SGPM2, SGPS1, SGPS2,
+                  SIOONCTRL, SIOPBI, SIOPBO, SIOPWREQ, SIOPWRGD, SIOS3, SIOS5, SIOSCI, SPI1,
+                  SPI1ABR, SPI1CS1, SPI1WP, SPI2, SPI2CS1, SPI2CS2, TACH0, TACH1, TACH10, TACH11,
                   TACH12, TACH13, TACH14, TACH15, TACH2, TACH3, TACH4, TACH5, TACH6,
                   TACH7, TACH8, TACH9, THRU0, THRU1, THRU2, THRU3, TXD1, TXD2, TXD3,
                   TXD4, UART10, UART11, UART12G0, UART12G1, UART13G0, UART13G1, UART6,
-- 
2.17.1

