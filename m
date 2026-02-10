Return-Path: <openbmc+bounces-1357-lists+openbmc=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+openbmc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WNyxLZO3i2kKZAAAu9opvQ
	(envelope-from <openbmc+bounces-1357-lists+openbmc=lfdr.de@lists.ozlabs.org>)
	for <lists+openbmc@lfdr.de>; Tue, 10 Feb 2026 23:56:19 +0100
X-Original-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C526811FDB3
	for <lists+openbmc@lfdr.de>; Tue, 10 Feb 2026 23:56:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f9cPC6pmzz2xlj;
	Wed, 11 Feb 2026 09:56:15 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::533"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770700963;
	cv=none; b=e1MLNicKAkK4c4zfpppeMOgBrFpy7s3HSDXccgaSMdvVJx477O7jk4aWSCzgj4v2YnksBa2zCYgsR/yF9Q4UKgO0kpDkzECzpc+qC7N6kxe7mPE9fNBc6U5jDSTY2DEZgkBoiPbriq/c5JUpLEH1vm6QQgxNaK7766tzXAybIeVP2uIgHJjZ6C9tfEZ3Bayu8tj/ahsq5fSLJBivOf2+iRvBhu01ECnxqsjLTY5pBHTVtHp0/6xxR4dPZTcAGJFwGDm1ihLFVtea7z9g9C7sR8NTufhZh34Sl5RexDIrgDDiLfaxJd9DbPF2I8zidcNhngM3NBakk4F0CQlV2u8UlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770700963; c=relaxed/relaxed;
	bh=slGvVNRI6DMwxYRFHCioIZD1AV/VPFPU5qKmLSzslyY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CrfKUV49ZEyYLuIK/kXp5zXWgeelXxF/00prYroMOSF8og1gQSn0E3oBQvq7O31CGk7TAsUFyJ/TKH3M9kcq4JlTKoZNO76ZPZIWDb6K9+hTXpgUvHdZ+ZFwGb0EbfPsQ/Hu8URwVr4yXWNU5sKJl4ZKx0nB50VOuc9ZTE9+EKgJxjLnuq31cFDEovdG47lz8+l9Q6d1eUR1lzv5SsKR8oAAF30v126heDx+W9J5YxyMxm8alPjzOT34yg8dfHtx41oLWh7R424HXmTI2LkQ197jyY6jY35NyG8OvHWgqOL5w2gI2uipIqay4GErKHz/izLNbaJ/YF58oLtsPGl3fg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=gOucE6n0; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::533; helo=mail-pg1-x533.google.com; envelope-from=a0987203069@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=gOucE6n0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::533; helo=mail-pg1-x533.google.com; envelope-from=a0987203069@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f991Z2pTnz2xN5
	for <openbmc@lists.ozlabs.org>; Tue, 10 Feb 2026 16:22:41 +1100 (AEDT)
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-c551edc745eso188983a12.2
        for <openbmc@lists.ozlabs.org>; Mon, 09 Feb 2026 21:22:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770700958; x=1771305758; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=slGvVNRI6DMwxYRFHCioIZD1AV/VPFPU5qKmLSzslyY=;
        b=gOucE6n0tRxyDSGuyOpSNlnfnI/wEgwPmwf/yTCSO/OBt+5U233PJ+Ah7jCGkFlx0r
         j199ADK8aKvfPhOZ4D/mpZAsqyWRftxafOyw2ees1P65rzXMJT8f2TZofGh45h8UqKeg
         D9HppshSQ6XhYRxmUQ5B2MjVtM9USQ8vMZwR+1qw1cW3rbfJOsCx4/9PP7ig5CqM6jui
         FC9qLQ9mXZ4kyv5p60L+La7y6LmcJ7Z6SoLzWM1yWDoGZEYK5gg0FC72R/ATizL3hxvr
         U9VI16MsQyh3+C5sO7piXJCdmvBf9eVCJnIom3uzCZVL9wIh0rLPUzuzc4e46o3i2F0t
         RLWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770700958; x=1771305758;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=slGvVNRI6DMwxYRFHCioIZD1AV/VPFPU5qKmLSzslyY=;
        b=g3a8FzP2w5Hd6TRo03DTxuE9AOnbSbLf+X6hOsarGtGGdw2q9s8cH5jVhIxijAM0hL
         OxQZAuIxYJQVcYyBXyYW60cFM4yd8d+5rzpgpSdMFEB3kwqCBQMyE8YYX85dvNkoYwLk
         rjFIRux343Cmh749EmxasLaKo32mIMM4ePvHZRHfCayxb+FQ76o4C0QeAFZ0xnoF6h2O
         1uF4K5vyt3hSmepmn2u1LUv5RQF8kZ1zvwDIAfSydcAktJXlADH9xVa6h1mdU7bJ0wu1
         qXqB3JYO7f/xa+3khTXkB3EwldUm3+alYlF+KfDSiMC0fDd+qdT8cz4/w2ScQPGGad8L
         +o9Q==
X-Forwarded-Encrypted: i=1; AJvYcCU4Q1WdYS4mHzMqOsL+Ch9cIB0hFgfk9Un2DQf6wqZVN8mXK3CFoxuPOE97a91BYVqlQ8n/O5Ih@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyvP35YbDHOVoMrC7FmsmnJfXC8frCOpu6thkzNnVfp8ZewCXy8
	WKk8PF9g4mOA3gtKEViqSTBes1M4cVZd1COW0c6SCwTmMLvJNivE0IaK
X-Gm-Gg: AZuq6aJfGGNhKcTG3BiaJzGsEaPfB5/N7mU/yZmf7drmtLzJS3Hz6YTymqydpd5Vygz
	d3rmL7CJLuSVxfV0mk9iTlX0uKydfeWsUFWbjeWzj1xaozQbBq1II36cx45Fm/6nOdMueuImqmo
	mr2gg6PBPA915B69IJbji1eIy1oGPkTrD81oSqDukHIU/lmjjioH8glRPIkJBXU6ZJdtPFG+15R
	0pScnJ3vBd0rGRpm7N3VqZl9eIuAsSCgn3KsvWZe0rCe7SN862kYeYLdH+d80s6W3iotiWfAmeC
	oV/cZnxczXlsfpSkLBiCpKonMCaluhdXOc98EL1pxlgTHtmXOt/on4v9yLOgDipEZoxH5eBuaKh
	HMXnUVwpeQ0KduvdQg2uI3HEtnEyAuKpaf6QTyvXFyqh2sr9nNaBUxZm3n8gcgQRNdRTBL53kUO
	+mWkGDeSgLEvmLLeudyWwyl4HsSiqkrAvUK+Iu/APKeAiQ9qg11vmqqI7A64IWyffutlXimK0+h
	LfJBuMGrIn/
X-Received: by 2002:a17:903:1a0e:b0:2a9:4450:abb7 with SMTP id d9443c01a7336-2a9516fcf6amr158575295ad.39.1770700958109;
        Mon, 09 Feb 2026 21:22:38 -0800 (PST)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a951ca59f4sm122114275ad.43.2026.02.09.21.22.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 21:22:37 -0800 (PST)
From: Joey Lu <a0987203069@gmail.com>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mcoquelin.stm32@gmail.com,
	richardcochran@gmail.com
Cc: alexandre.torgue@foss.st.com,
	joabreu@synopsys.com,
	ychuang3@nuvoton.com,
	schung@nuvoton.com,
	yclu4@nuvoton.com,
	peppe.cavallaro@st.com,
	linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Joey Lu <a0987203069@gmail.com>
Subject: [PATCH net-next v12 0/3] Add support for Nuvoton MA35D1 GMAC
Date: Tue, 10 Feb 2026 13:22:23 +0800
Message-ID: <20260210052226.3005666-1-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	FROM_LOCAL_HEX,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.80 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MAILLIST(-0.19)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	PREVIOUSLY_DELIVERED(0.00)[openbmc@lists.ozlabs.org];
	FORGED_RECIPIENTS(0.00)[m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mcoquelin.stm32@gmail.com,m:richardcochran@gmail.com,m:alexandre.torgue@foss.st.com,m:joabreu@synopsys.com,m:ychuang3@nuvoton.com,m:schung@nuvoton.com,m:yclu4@nuvoton.com,m:peppe.cavallaro@st.com,m:linux-arm-kernel@lists.infradead.org,m:netdev@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:openbmc@lists.ozlabs.org,m:linux-stm32@st-md-mailman.stormreply.com,m:a0987203069@gmail.com,m:andrew@lunn.ch,m:krzk@kernel.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,gmail.com];
	FORGED_SENDER(0.00)[a0987203069@gmail.com,openbmc@lists.ozlabs.org];
	FORWARDED(0.00)[openbmc@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[23];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[foss.st.com,synopsys.com,nuvoton.com,st.com,lists.infradead.org,vger.kernel.org,lists.ozlabs.org,st-md-mailman.stormreply.com,gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[openbmc,netdev,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_FROM(0.00)[bounces-1357-lists,openbmc=lfdr.de];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[a0987203069@gmail.com,openbmc@lists.ozlabs.org];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: C526811FDB3
X-Rspamd-Action: no action

This patch series is submitted to add GMAC support for Nuvoton MA35D1
SoC platform. This work involves implementing a GMAC driver glue layer
based on Synopsys DWMAC driver framework to leverage MA35D1's dual GMAC
interface capabilities.

Overview:
  1. Added a GMAC driver glue layer for MA35D1 SoC, providing support for
  the platform's two GMAC interfaces.
  2. Added device tree settings, with specific configurations for our
  development boards:
    a. SOM board: Configured for two RGMII interfaces.
    b. IoT board: Configured with one RGMII and one RMII interface.
  3. Added dt-bindings for the GMAC interfaces.

v12:
  - Drop private structure nvt_priv_data
  - Fix error propagation to preserve probe deferral
  - Refactor internal delay handling into a dedicated helper
  - Move FIFO and filter configuration from driver to Device Tree
  - Update DT binding to include "snps,dwmac-3.70a" compatible

v11:
  - Propagate syscon lookup errors to allow proper probe deferral.

v10:
  - Update DTS/DTSI files to follow proper hierarchy and port modeling

v9:
  - Fixed file permissions. (YAML, driver, DTS)
  - Moved phy-handle and PHY-related properties from SoC dtsi to board dts.

v8:
  Changes since v7:
  - Rebased onto the latest net-next.
  - Removed unused symbol.
  - stmmac parent driver now reads hardware features directly to support
    Wake-on-LAN via magic packet, so PMT-related overrides in this driver
    have been removed.
  - Update dwmac-nuvoton driver:
      - Update the license to GPL.
      - Improve the description in Kconfig.

v7:
  - Update dwmac-nuvoton driver
    - Update probe function to use stmmac_pltfr_probe instead.

v6:
  - Update dwmac-nuvoton driver
    - Use NVT as the previx for all functions, structs, and defines.
    - Remove unnecessary comments.

v5:
  - Update yaml
    - Remove the properties already defined in snps dwmac.
  - Update dwmac-nuvoton driver
    - Add a comment to explain the override of PMT flag.

v4:
  - Update yaml
    - Remove unnecessary property 'select'.
    - Remove unnecessary compatible entries and fix items.
    - Specify number of entries for 'reg'.
    - Remove already defined property 'phy-handle'.
    - Update example.
    - Modify the property internal path delay to match the driver.
  - Update dtsi
    - Move 'status' to be the last property.
  - Update dwmac-nuvoton driver
    - Use remove instead of remove_new.
    - Use dev_err_probe instead.

v3:
  - Update yaml
    - Fix for dt_binding_check warnings & errors.
    - Add compatible in snps dwmac.
  - Update dtsi
    - Update dtsi to follow examples in yaml.
  - Update dwmac-nuvoton driver
    - Fix for auto build test warnings.
    - Invalid path delay arguments will be returned.

v2:
  - Update yaml
    - Rename file to align with the compatible property.
    - Add an argument to syscon to replace mac-id,
      with corresponding descriptions.
    - Use tx-internal-delay-ps and rx-internal-delay-ps properties for
      configurable path delay with corresponding descriptions,
      allowing selection between GMAC internal and PHY.
    - Add all supported phy-mode options.
    - Remove unused properties.
  - Update dtsi
    - Modify syscon configuration to include an argument for
      GMAC interface selection.
  - Update dwmac-nuvoton driver
    - Remove redundant device information print statements.
    - Remove non-global parameters.
    - Retrieve GMAC interface selection from the syscon argument.
    - Parse Tx and Rx path delays by correct properties.
    - Update configurations to support Wake-on-LAN.

Joey Lu (3):
  dt-bindings: net: nuvoton: Add schema for Nuvoton MA35 family GMAC
  arm64: dts: nuvoton: Add Ethernet nodes
  net: stmmac: dwmac-nuvoton: Add dwmac glue for Nuvoton MA35 family

 .../bindings/net/nuvoton,ma35d1-dwmac.yaml    | 133 +++++++++++++++++
 .../devicetree/bindings/net/snps,dwmac.yaml   |   1 +
 .../boot/dts/nuvoton/ma35d1-iot-512m.dts      |  25 ++++
 .../boot/dts/nuvoton/ma35d1-som-256m.dts      |  24 +++
 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi       |  52 +++++++
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |  12 ++
 drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
 .../ethernet/stmicro/stmmac/dwmac-nuvoton.c   | 139 ++++++++++++++++++
 8 files changed, 387 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-nuvoton.c

-- 
2.43.0


