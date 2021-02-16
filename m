Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E5E8431D001
	for <lists+openbmc@lfdr.de>; Tue, 16 Feb 2021 19:16:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dg8Lj0FrXz30Lw
	for <lists+openbmc@lfdr.de>; Wed, 17 Feb 2021 05:16:45 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.126; helo=mga18.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
X-Greylist: delayed 64 seconds by postgrey-1.36 at boromir;
 Wed, 17 Feb 2021 05:16:34 AEDT
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dg8LV1MQDz30KN;
 Wed, 17 Feb 2021 05:16:34 +1100 (AEDT)
IronPort-SDR: T7OgI7rXK8KQLtLqzK1jh3qwxVz0ol2Lmdkk4LwrIAiOnoVQyJTuogokqL2l0mj81Fh3yPxtFO
 +GcSPZ5KWgEQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9897"; a="170634243"
X-IronPort-AV: E=Sophos;i="5.81,184,1610438400"; d="scan'208";a="170634243"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2021 10:15:24 -0800
IronPort-SDR: 6pXYhCqPaIaxYtx0EOvaa965LEVjcd9ChuE5ozGOVd9YHcYUTUo89x5JgR4Yw+JjW759Ra+Xl5
 tvtzLGj8ukpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,184,1610438400"; d="scan'208";a="493375887"
Received: from maru.jf.intel.com ([10.54.51.77])
 by fmsmga001.fm.intel.com with ESMTP; 16 Feb 2021 10:15:23 -0800
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
To: Brendan Higgins <brendanhiggins@google.com>,
 Wolfram Sang <wsa@the-dreams.de>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Joel Stanley <joel@jms.id.au>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Andrew Jeffery <andrew@aj.id.au>,
 Tao Ren <taoren@fb.com>, Cedric Le Goater <clg@kaod.org>
Subject: [PATCH v3 0/4] i2c: aspeed: Add buffer and DMA modes support
Date: Tue, 16 Feb 2021 10:27:31 -0800
Message-Id: <20210216182735.11639-1-jae.hyun.yoo@linux.intel.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org,
 Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>, linux-i2c@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This patch series adds buffer mode and DMA mode transfer support for the
Aspeed I2C driver. With this change, buffer mode and DMA mode can be
selectively used depend on platform configuration.

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

  AST2600:
    It has 32 Bytes of individual I2C SRAM buffer per each bus and its
    range is from 0x1e78ac00 to 0x1e78adff. Works just like AST2500
    does.

* DMA mode
  Only AST2500 and later versions support DMA mode under some limitations
  in case of AST2500:
    I2C is sharing the DMA H/W with UHCI host controller and MCTP
    controller. Since those controllers operate with DMA mode only, I2C
    has to use buffer mode or byte mode instead if one of those
    controllers is enabled. Also make sure that if SD/eMMC or Port80
    snoop uses DMA mode instead of PIO or FIFO respectively, I2C can't
    use DMA mode.

Please review it.

Changes since v2:
- Added SRAM resources back to default dtsi and added a mode selection
  property.
- Refined SoC family dependent xfer mode configuration functions.

Changes since v1:
V1: https://lore.kernel.org/linux-arm-kernel/20191007231313.4700-1-jae.hyun.yoo@linux.intel.com/
- Removed a bug fix patch which was merged already from this patch series. 
- Removed buffer reg settings from default device tree and added the settings
  into bindings document to show the predefined buffer range per each bus.
- Updated commit message and comments.
- Refined driver code using abstract functions.

Jae Hyun Yoo (4):
  dt-bindings: i2c: aspeed: add transfer mode support
  ARM: dts: aspeed: modify I2C node to support buffer mode
  i2c: aspeed: add buffer mode transfer support
  i2c: aspeed: add DMA mode transfer support

 .../devicetree/bindings/i2c/i2c-aspeed.txt    |  37 +-
 arch/arm/boot/dts/aspeed-g4.dtsi              |  47 +-
 arch/arm/boot/dts/aspeed-g5.dtsi              |  47 +-
 arch/arm/boot/dts/aspeed-g6.dtsi              |  32 +-
 drivers/i2c/busses/i2c-aspeed.c               | 637 ++++++++++++++++--
 5 files changed, 684 insertions(+), 116 deletions(-)

-- 
2.17.1

