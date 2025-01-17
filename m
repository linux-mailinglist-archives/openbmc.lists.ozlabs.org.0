Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B3F4A16675
	for <lists+openbmc@lfdr.de>; Mon, 20 Jan 2025 06:58:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yc0583h1kz30JH
	for <lists+openbmc@lfdr.de>; Mon, 20 Jan 2025 16:58:36 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a01:4f8:d0a:203a::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737107081;
	cv=none; b=KstuNKKtSTTT2Ql3a6Vj97FKOaoypF/AUuFxXKNYyBFhe6TaHLemhD/GZklSJFqDaHuiMCSZYGuftY6NyYs78uUMPa6XkgFjGrQOG+dNYPDJ68swazJ8zniWs4RpO4a6Us9laZ5WwwiFBc3ee3ACpquYvUkfCUyl4R4Ha9HxLjhxcrNckNTaaZwuyORs+qdIeM/f6YIixs0zHZuId36ceb8f7yr4p+xAlfmHxo9eCDL/CEMRLhB4PSlVNS9fCN2ne+NaCc8NDQA+X67c2SKLURz+v/prNVzgKpoL0uNEuFdfQEmoWlbn9zdmyKE+YuAHS8pRvP5Q5zxMo1B2jSK/WA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737107081; c=relaxed/relaxed;
	bh=x1Ph4IowC9mzw29WS0Ha77dbTQwL5wGcl1HFWDLXcas=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=J/qbQrGCbWw9U9CaW9IBDaXzpRY6SWOkTMQoWALeqZs4xMLmdrqJwArvWcvT4CGju9crTUgKpKIUba4XMc2ZysawL7kYRHu5x+P6m7ShrkG8T+8bnB8xIsk2kfummD397fh1IIJ3ymOk7t/RVMuSiDJm9d25P/CmjWLIZksEfPH7d1/G2kZ+7IEZV0HmvV8ORPjsJaE+n7jOA7RjHuiP55Ks+j+nqqEuXHcBshQ9GWhZvnorONsvPKjG+QlpYpgkdVZZo/z4CFhxkRqWMeLb/wwvfIfQwWtwezhUguz1YzwwOxmuwu5oXO603VGLwqugyalFRosgnvlYAR8V6fpQnA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=hetzner.com; dkim=pass (2048-bit key; unprotected) header.d=hetzner.com header.i=@hetzner.com header.a=rsa-sha256 header.s=lms2212 header.b=fdDoXzzR; dkim-atps=neutral; spf=pass (client-ip=2a01:4f8:d0a:203a::1; helo=mail.hetzner.company; envelope-from=tan.siewert@hetzner.com; receiver=lists.ozlabs.org) smtp.mailfrom=hetzner.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=hetzner.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=hetzner.com header.i=@hetzner.com header.a=rsa-sha256 header.s=lms2212 header.b=fdDoXzzR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=hetzner.com (client-ip=2a01:4f8:d0a:203a::1; helo=mail.hetzner.company; envelope-from=tan.siewert@hetzner.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 274 seconds by postgrey-1.37 at boromir; Fri, 17 Jan 2025 20:44:38 AEDT
Received: from mail.hetzner.company (mail.hetzner.company [IPv6:2a01:4f8:d0a:203a::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YZFFL2nv3z30TQ
	for <openbmc@lists.ozlabs.org>; Fri, 17 Jan 2025 20:44:37 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hetzner.com
	; s=lms2212; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject
	:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References; bh=x1Ph4IowC9mzw29WS0Ha77dbTQwL5wGcl1HFWDLXcas=; b=fd
	DoXzzRXU17dUrp4e4GfS2jwG+5XxRtA92Wl988T9bfPwBXHmFkCXab5X7E93Q+yiBhBLE/BxyMNJd
	IVs74BORL+v8w/4AvhwkYx6wkbDDA05NZiMvrXef1EuN2ndz4OZPd71tBNhDbUixNUzPPzdHlTlBz
	dTUKWTyDM7gLnQXVlIiqBM69ol+jBnl7gZt+50j82QZO5r+ZFKxNcTarjSlWQx2Z6J54BJZ3GAg2u
	2M1ZUt0MLL+m96YyrBB8fnSyqfAdjDilab9LtDmlwKza/XyZgetV5OgZIOWIb0wrjWm5D6Oo0sBRi
	3eFvZ0fobEA355qBXmW5z6kpRYlzpA8A==;
Received: from [2a01:4f8:0:a0a7::4c:0] (helo=localhost.localdomain)
	by mail.hetzner.company with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	(Exim 4.94.2)
	(envelope-from <tan.siewert@hetzner.com>)
	id 1tYiu2-000A1S-N3; Fri, 17 Jan 2025 10:44:34 +0100
From: Tan Siewert <tan.siewert@hetzner.com>
To: openbmc@lists.ozlabs.org,
	andrew@aj.id.au
Subject: [PATCH u-boot, v2019.04-aspeed-openbmc 00/12] misc: i2c_eeprom: Backport commits for proper pagesize and partition support
Date: Fri, 17 Jan 2025 10:44:19 +0100
Message-ID: <20250117094434.16641-1-tan.siewert@hetzner.com>
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

