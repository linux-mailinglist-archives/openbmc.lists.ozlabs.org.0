Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AD8BCA16684
	for <lists+openbmc@lfdr.de>; Mon, 20 Jan 2025 07:00:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yc05d6j4qz89KW
	for <lists+openbmc@lfdr.de>; Mon, 20 Jan 2025 16:59:01 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a01:4f8:d0a:203a::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737125431;
	cv=none; b=BbZc8Eeel/55dlSeWiYmM3zhenm8peYZ/oeIHNzrucfMS8ezLlZIP1GRoPIcYl6OqafU/yme0p1Fze6SmghwXmQZm/cM7c1LKkf6KRxtSD1sxhh6rmiWN8xmNQ7GOmeLKehC9cXdUjy0tboSfFNV8HYUGnRbuAYcFOOxqrY7hxq6MDhs43ajmcxcgrAMw5wCflIjPHRj178ntYUrCgCVUp1jX0Um7flIYyDJyCQdtIrKcuyI9BcSceNBSpytA4uCvrlKhM8ifCw7XMWWkvnKqVGE/xFhmrJXHNbpFtf+iK7+L6AXwvMa0Ci0Gjy1JgEC0oZUfPIFgKvhUFOXUmV7pA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737125431; c=relaxed/relaxed;
	bh=x1Ph4IowC9mzw29WS0Ha77dbTQwL5wGcl1HFWDLXcas=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Gzx8QXD8C3F+Wlf9l2T1ipJFLk7QpqxDL1zdFJcPjfyoLNqFYhPHne143OHVagf5UjH8MxZBl8yHEvhLhgFs97J4fu92OvWIyaCdECoihO0hikl0Dl8X0THa3RSMJ5QmFTIzNopIh6z+mCxe6yox64TMkzjN03/yjtex/v+yISlkq3PwBWW6H47sqknXYybcoctwZG+ALrvxhJA4hlfXRe6fr1fjBFQy2+0890j2SFcZ6nWcQmcXCJdV8ECzonLeRu6ulh+WVbJg/RBU6vm3trF9ac/ehzItsIDYHuByNr27BgZWTpqBC1Jdy2J2SK04PZoxRAGiIsdGD/6yoVwdrw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=hetzner.com; dkim=pass (2048-bit key; unprotected) header.d=hetzner.com header.i=@hetzner.com header.a=rsa-sha256 header.s=lms2212 header.b=sEHA11nA; dkim-atps=neutral; spf=pass (client-ip=2a01:4f8:d0a:203a::1; helo=mail.hetzner.company; envelope-from=tan.siewert@hetzner.com; receiver=lists.ozlabs.org) smtp.mailfrom=hetzner.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=hetzner.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=hetzner.com header.i=@hetzner.com header.a=rsa-sha256 header.s=lms2212 header.b=sEHA11nA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=hetzner.com (client-ip=2a01:4f8:d0a:203a::1; helo=mail.hetzner.company; envelope-from=tan.siewert@hetzner.com; receiver=lists.ozlabs.org)
Received: from mail.hetzner.company (mail.hetzner.company [IPv6:2a01:4f8:d0a:203a::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YZN2D6pQwz30WX
	for <openbmc@lists.ozlabs.org>; Sat, 18 Jan 2025 01:50:26 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hetzner.com
	; s=lms2212; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject
	:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References; bh=x1Ph4IowC9mzw29WS0Ha77dbTQwL5wGcl1HFWDLXcas=; b=sE
	HA11nAWAreMA9VSsW8owzdP7BB+XzmluMPCVnBKNyPXQm57uXkHH/6xQeoJYmhuRMdy8zNxQnXTHb
	DAdmGU5u0wzQ7r8k6A9tvb4VGVX6nRwQSQhgZpGrS5cEDbUs1UHgj+NR+BWOX1fLrFTiUCRv5+ae7
	zRqLDjUlZIydCfblP8CStYUKEwToXXGTRRSTo9x+UGm4cWcXVPyx4ksoAuleCPMVuz17z8qO2kG+G
	HjPoaUnhUs67lAj2gKvH3gQWuxvoges81jUWWVDsAnYfOG9Td/S+VDlpjRw6KFv72AnP4vK5hck9t
	65ARG7swtEqMu5Bu2Rdw5Xo9qnIWdtqQ==;
Received: from [2a01:4f8:0:a0a7::4c:0] (helo=localhost.localdomain)
	by mail.hetzner.company with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	(Exim 4.94.2)
	(envelope-from <tan.siewert@hetzner.com>)
	id 1tYipW-0008Ze-VG; Fri, 17 Jan 2025 10:39:55 +0100
From: Tan Siewert <tan.siewert@hetzner.com>
To: openbmc@lists.ozlabs.org,
	andrew@aj.id.au
Subject: [PATCH u-boot, v2019.04-aspeed-openbmc 00/12] misc: i2c_eeprom: Backport commits for proper pagesize and partition support
Date: Fri, 17 Jan 2025 10:38:58 +0100
Message-ID: <20250117093915.15256-1-tan.siewert@hetzner.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-Sender: tom.siewert@hetzner.com
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailman-Approved-At: Mon, 20 Jan 2025 16:58:31 +1100
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
Cc: Tan Siewert <tan.siewert@hetzner.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This series adds proper support for pagesizes and partitions on
EEPROMs connected via an I2C bus. All commits were backported from
upstream tag v2021.04.

The original issue arised during debugging a platform that gets its
MAC address from an Atmel 24c128 EEPROM instead of the hardware,
which always failed [1].

With the patches applied, the EEPROM can be read properly.

Before:

 ast# i2c dev 7
 ast# i2c md 0x57 0x3f80 6
 3f80: ff ff ff ff ff ff    ......

After:

 ast# i2c bus
 Bus 3:    i2c-bus@100
 Bus 7:    i2c-bus@300  (active 7)
    57: eeprom@57, offset len 2, flags 0
 ast# i2c md 0x57 0x3f80 6
 3f80: 78 24 35 bb cd 01    x$5...

[1] https://discord.com/channels/775381525260664832/775694683589574659/1329524655752745044

Baruch Siach (3):
  misc: i2c_eeprom: support DT pagesize property
  misc: i2c_eeprom: add eeprom write support
  misc: i2c_eeprom: verify that the chip is functional at probe()

Eugen Hristev (1):
  misc: i2c_eeprom: implement different probe test eeprom offset

Masahiro Yamada (2):
  misc: i2c_eeprom: remove pagewidth field from i2c_eeprom
  misc: i2c_eeprom: store pagesize instead of pagewidth in
    i2c_eeprom_drv_data

Michal Simek (1):
  i2c: eeprom: Use reg property instead of offset and size

Robert Beckett (4):
  i2c: add support for offset overflow in to address
  misc: i2c_eeprom: add fixed partitions support
  misc: i2c_eeprom: add size query
  misc: i2c_eeprom: set offset len and chip addr offset mask

Simon Glass (1):
  common: Move old EEPROM functions into a new header

 arch/sandbox/dts/test.dts                     |  13 +
 board/atmel/common/mac_eeprom.c               |   1 +
 board/compulab/common/eeprom.c                |   1 +
 board/corscience/tricorder/tricorder-eeprom.c |   1 +
 board/dhelectronics/dh_imx6/dh_imx6.c         |   1 +
 board/freescale/mpc8323erdb/mpc8323erdb.c     |   1 +
 board/kosagi/novena/novena.c                  |   1 +
 board/phytec/phycore_rk3288/phycore-rk3288.c  |   1 +
 board/rockchip/tinker_rk3288/tinker-rk3288.c  |   1 +
 board/samtec/vining_fpga/socfpga.c            |   1 +
 board/ti/am43xx/board.c                       |   1 +
 board/ti/ks2_evm/board_k2g.c                  |   1 +
 cmd/eeprom.c                                  |   1 +
 configs/sandbox_defconfig                     |   1 +
 drivers/i2c/i2c-uclass.c                      |  34 +-
 drivers/misc/i2c_eeprom.c                     | 316 ++++++++++++++++--
 drivers/mtd/mw_eeprom.c                       |   1 +
 drivers/rtc/rv3029.c                          |   1 +
 env/eeprom.c                                  |   1 +
 include/common.h                              |  15 -
 include/eeprom.h                              |  24 ++
 include/i2c.h                                 |  33 ++
 include/i2c_eeprom.h                          |  14 +-
 test/dm/bootcount.c                           |   8 +
 24 files changed, 430 insertions(+), 43 deletions(-)
 create mode 100644 include/eeprom.h

-- 
2.47.0

