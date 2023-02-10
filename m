Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 37DA469192F
	for <lists+openbmc@lfdr.de>; Fri, 10 Feb 2023 08:28:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PClhw0VVDz3f5D
	for <lists+openbmc@lfdr.de>; Fri, 10 Feb 2023 18:28:48 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.71; helo=twspam01.aspeedtech.com; envelope-from=chiawei_wang@aspeedtech.com; receiver=<UNKNOWN>)
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com [211.20.114.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PClgm5Mckz3cd9;
	Fri, 10 Feb 2023 18:27:45 +1100 (AEDT)
Received: from mail.aspeedtech.com ([192.168.0.24])
	by twspam01.aspeedtech.com with ESMTP id 31A7EW2B068844;
	Fri, 10 Feb 2023 15:14:32 +0800 (GMT-8)
	(envelope-from chiawei_wang@aspeedtech.com)
Received: from Chiawei-PC03.aspeed.com (192.168.2.66) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 10 Feb
 2023 15:26:47 +0800
From: Chia-Wei Wang <chiawei_wang@aspeedtech.com>
To: <gregkh@linuxfoundation.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <joel@jms.id.au>,
        <andrew@aj.id.au>, <jirislaby@kernel.org>,
        <linux-serial@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
        <openbmc@lists.ozlabs.org>
Subject: [PATCH 0/4] arm: aspeed: Add UART with DMA support
Date: Fri, 10 Feb 2023 15:26:39 +0800
Message-ID: <20230210072643.2772-1-chiawei_wang@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [192.168.2.66]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 31A7EW2B068844
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

This patch series add the serial driver with DMA support for
AST26xx UART and VUART devices.

Chia-Wei Wang (4):
  dt-bindings: aspeed: Add UART controller
  soc: aspeed: Add UART DMA support
  serial: 8250: Add Aspeed UART driver
  ARM: dts: aspeed-g6: Add UDMA node

 .../bindings/serial/aspeed,uart.yaml          |  81 +++
 arch/arm/boot/dts/aspeed-g6.dtsi              |   7 +
 drivers/soc/aspeed/Kconfig                    |   9 +
 drivers/soc/aspeed/Makefile                   |   1 +
 drivers/soc/aspeed/aspeed-udma.c              | 447 ++++++++++++++++
 drivers/tty/serial/8250/8250_aspeed.c         | 502 ++++++++++++++++++
 drivers/tty/serial/8250/Kconfig               |   8 +
 drivers/tty/serial/8250/Makefile              |   1 +
 include/linux/soc/aspeed/aspeed-udma.h        |  34 ++
 9 files changed, 1090 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/serial/aspeed,uart.yaml
 create mode 100644 drivers/soc/aspeed/aspeed-udma.c
 create mode 100644 drivers/tty/serial/8250/8250_aspeed.c
 create mode 100644 include/linux/soc/aspeed/aspeed-udma.h

-- 
2.25.1

