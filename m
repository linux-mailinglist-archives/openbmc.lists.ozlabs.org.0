Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D8064DAAB
	for <lists+openbmc@lfdr.de>; Thu, 20 Jun 2019 21:50:19 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45VC8m0DTtzDrMT
	for <lists+openbmc@lfdr.de>; Fri, 21 Jun 2019 05:50:16 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.31; helo=mga06.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45VC7t6rNdzDrJt
 for <openbmc@lists.ozlabs.org>; Fri, 21 Jun 2019 05:49:29 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Jun 2019 12:49:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,398,1557212400"; d="scan'208";a="154232451"
Received: from maru.jf.intel.com ([10.54.51.75])
 by orsmga008.jf.intel.com with ESMTP; 20 Jun 2019 12:49:24 -0700
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
To: Brendan Higgins <brendanhiggins@google.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 C?ric Le Goater <clg@kaod.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>
Subject: [RFC PATCH dev-5.1 0/6] Aspeed I2C buffer/DMA mode support
Date: Thu, 20 Jun 2019 12:49:16 -0700
Message-Id: <20190620194922.15093-1-jae.hyun.yoo@linux.intel.com>
X-Mailer: git-send-email 2.22.0
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
Cc: openbmc@lists.ozlabs.org, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This patch series adds buffer mode and DMA mode transfer support for the
Aspeed I2C driver. With this change, default transfer mode will be set to
buffer mode for better performance, and DMA mode can be selectively used
depends on platform configuration.

* Buffer mode
  AST2400:
    It has 2 KBytes (256 Bytes x 8 pages) of I2C SRAM buffer pool from
    0x1e78a800 to 0x1e78afff that can be used for all busses with
    buffer pool manipulation. To simplify implementation for supporting
    both AST2400 and AST2500, it assigns each 128 Bytes per bus without
    using buffer pool manipulation so total 1792 Bytes of I2C SRAM
    buffer will be used.

  AST2500:
    It has 16 Bytes of individual I2C SRAM buffer per each bus and its
    range is from 0x1e78a200 to 0x1e78a2df, so it doesn't have 'buffer
    page selection' bit field in the Function control register, and
    neither 'base address pointer' bit field in the Pool buffer control
    register it has. To simplify implementation for supporting both
    AST2400 and AST2500, it writes zeros on those register bit fields
    but it's okay because it does nothing in AST2500.

* DMA mode
  Only AST2500 supports DMA mode under some limitations:
    I2C is sharing the DMA H/W with UHCI host controller and MCTP
    controller. Since those controllers operate with DMA mode only, I2C
    has to use buffer mode or byte mode instead if one of those
    controllers is enabled. Also make sure that if SD/eMMC or Port80
    snoop uses DMA mode instead of PIO or FIFO respectively, I2C can't
    use DMA mode..

I'm submitting this series as an RFC because it needs more test on real
AST2400 BMC mahines, also it needs to check if QEMU can handle this change
so please review and test it.

Jae Hyun Yoo (6):
  dt-bindings: i2c: aspeed: add buffer and DMA mode transfer support
  ARM: dts: aspeed: add I2C buffer mode support
  irqchip/aspeed-i2c-ic: add I2C SRAM enabling control
  i2c: aspeed: fix master pending state handling
  i2c: aspeed: add buffer mode transfer support
  i2c: aspeed: add DMA mode transfer support

 .../devicetree/bindings/i2c/i2c-aspeed.txt    |  52 +-
 arch/arm/boot/dts/aspeed-g4.dtsi              |  42 +-
 arch/arm/boot/dts/aspeed-g5.dtsi              |  42 +-
 drivers/i2c/busses/i2c-aspeed.c               | 469 ++++++++++++++++--
 drivers/irqchip/irq-aspeed-i2c-ic.c           |   8 +
 5 files changed, 548 insertions(+), 65 deletions(-)

-- 
2.22.0

