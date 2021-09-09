Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E5E31404878
	for <lists+openbmc@lfdr.de>; Thu,  9 Sep 2021 12:30:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H4wJ45Wz5z2ynG
	for <lists+openbmc@lfdr.de>; Thu,  9 Sep 2021 20:30:28 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.71;
 helo=twspam01.aspeedtech.com; envelope-from=chiawei_wang@aspeedtech.com;
 receiver=<UNKNOWN>)
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com
 [211.20.114.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H4wHJ5hKZz2xv2;
 Thu,  9 Sep 2021 20:29:47 +1000 (AEST)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 189A9ikH075150;
 Thu, 9 Sep 2021 18:09:44 +0800 (GMT-8)
 (envelope-from chiawei_wang@aspeedtech.com)
Received: from ChiaWeiWang-PC.aspeed.com (192.168.2.66) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 9 Sep 2021 18:29:14 +0800
From: Chia-Wei Wang <chiawei_wang@aspeedtech.com>
To: <joel@jms.id.au>, <andrew@aj.id.au>, <robh+dt@kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <openbmc@lists.ozlabs.org>
Subject: [PATCH v3 0/3] arm: aspeed: Add UART routing support
Date: Thu, 9 Sep 2021 18:29:04 +0800
Message-ID: <20210909102907.32037-1-chiawei_wang@aspeedtech.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [192.168.2.66]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 189A9ikH075150
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
Cc: yulei.sh@bytedance.com, osk@google.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add UART routing driver and the device tree nodes.

v3:
 - Add individual bindings in YAML
 - Add support for AST24xx (AST25xx shares the same design)
 - Add more explanation for the sysfs ABI

v2:
 - Add dt-bindings
 - Add ABI documents for the exported sysfs interface
 - Revise driver implementation suggested by Joel

Chia-Wei Wang (3):
  dt-bindings: aspeed: Add UART routing controller
  soc: aspeed: Add UART routing support
  ARM: dts: aspeed: Add uart routing to device tree

 .../testing/sysfs-driver-aspeed-uart-routing  |  15 +
 .../bindings/soc/aspeed/uart-routing.yaml     |  70 ++
 arch/arm/boot/dts/aspeed-g4.dtsi              |   6 +
 arch/arm/boot/dts/aspeed-g5.dtsi              |   6 +
 arch/arm/boot/dts/aspeed-g6.dtsi              |   6 +
 drivers/soc/aspeed/Kconfig                    |  10 +
 drivers/soc/aspeed/Makefile                   |   9 +-
 drivers/soc/aspeed/aspeed-uart-routing.c      | 603 ++++++++++++++++++
 8 files changed, 721 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-aspeed-uart-routing
 create mode 100644 Documentation/devicetree/bindings/soc/aspeed/uart-routing.yaml
 create mode 100644 drivers/soc/aspeed/aspeed-uart-routing.c

-- 
2.17.1

