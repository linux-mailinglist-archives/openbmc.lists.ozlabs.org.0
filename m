Return-Path: <openbmc+bounces-1321-lists+openbmc=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+openbmc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4OjZKpIShGkTyAMAu9opvQ
	(envelope-from <openbmc+bounces-1321-lists+openbmc=lfdr.de@lists.ozlabs.org>)
	for <lists+openbmc@lfdr.de>; Thu, 05 Feb 2026 04:46:26 +0100
X-Original-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BF3BFEE616
	for <lists+openbmc@lfdr.de>; Thu, 05 Feb 2026 04:46:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f636C0YBdz3bTf;
	Thu, 05 Feb 2026 14:45:55 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1034"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770255617;
	cv=none; b=O8iu+s9BRz2y2IXa6nJH0OhlhbY1pgvJGHKCo38i4hBM+PbQQA1oBok8IZg967kGufh4YvtIG11tHtR2sBYKUaFVowmqYnHcTMQklYcP5oKgQ9io/X63Ly6wUxrjLNsoXMaRP6tJThGBKZpdFPLAGMbPOKjqcVRJ00ICX2thAlDoLdVcQOnpxUkdyCTosnCPDq6pu5om5uwirL+KtRhOebvgwErUCqPHBILwz7YEtf/3cGN/TmN2Zx5UavNHX38KPIsWW4Ypr6eKGARo+8oOI+Vdw8I144v/9C+NnNGqoFq0d3ESLFJncR0m8Zs9SGN6edF3uiV3zEmH6/8CyHPttw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770255617; c=relaxed/relaxed;
	bh=1OiYqbF7y0kWC3l5ZGq7AIg+QHWt4yVe6CopFDBbu9A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lR9yHAg6uokUOntcGqZuBmidGWOJStLjYS13grcL/p7U9wYF04SLUT84z70ZTy/I1tqZi9QSWT4jxbArMHkILVQYQyI9aunL+Bm6RLNuGYiMwIUu20hRFDZ9U55uJrN/9yZP2bm2dtL1XzTIavyAMiTVsg9VU737uBPORVIQA4vI91s1BNUUQFq/eU85o4Nl5tmIK1FbXvOFU62+yaecYjwOxMFpsnK6Jzsh5QHt3iOl4q6SjJqbxA7DqzXWFo6Zf/3RZepGcZgr1pNeuy0KU/bza2+OT3KWG6YJ95D1mvFew7gQ6+Q0rPP9LFRqG+5LyEvxVIDswCtYCD/RK6FYSQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=UH6eqZh2; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1034; helo=mail-pj1-x1034.google.com; envelope-from=a0987203069@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=UH6eqZh2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1034; helo=mail-pj1-x1034.google.com; envelope-from=a0987203069@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f60KD4RFgz2xHt
	for <openbmc@lists.ozlabs.org>; Thu, 05 Feb 2026 12:40:15 +1100 (AEDT)
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-352e2156450so134755a91.3
        for <openbmc@lists.ozlabs.org>; Wed, 04 Feb 2026 17:40:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770255613; x=1770860413; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1OiYqbF7y0kWC3l5ZGq7AIg+QHWt4yVe6CopFDBbu9A=;
        b=UH6eqZh24fbAX/xAV/6bxnqmtdq4RnEMPhpfO8OcfBvzWs62qrwRSjGBtESlKgtbk8
         gq0dFHpwpGU3dcVluligFDyItVujsj10dQlQHnUKVIoRrZgdWDdU487gW7DVmQwwG/uv
         FKZscO7kfG4wkHy5yta2YXjo0owI4MLbHVN1a0xRsNk2Emw6gAFQyiTLd6oluW9qBw0m
         MiFKgU5GJCN2gKw/q3w6iE42ktCa99hb27NaiK/l7MKePaB8PFDlTfKlBgzj3miXk9Bz
         5cm+/zFQnjk0/Q3OdISyp/18NSBgXvD9GbTaPgBw2w8ccEcFg0l8GpoituJD7vsmryUG
         2GtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770255613; x=1770860413;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1OiYqbF7y0kWC3l5ZGq7AIg+QHWt4yVe6CopFDBbu9A=;
        b=TTTPYv/vnV7UnMF4tr0yoTq8shIzs5Od66uaSGkzvqt1hZJeNLyznxefBFtWkQYQ5x
         II9WARnChtX+9GO/ZCsaBs/LrsnvbHAjqcpKjUWngkbPdx8BcB6FbN8fUZvUvyU6vo+B
         BFKJRIrc9mRYvzYdNbljQPrOVH9PEAox0Ert9IJ7Ofigc7xjPszwzyCPt8HNvBH4Orhy
         0hnJVami6/raVMyfw513zfpI260Bv3L8v/M77HVN5l61uVZVqgbd/QFkb4pMGt0xhrlL
         sgZ93EW/pghEawR2xfDE8ECAavV9ou/gV/urzrWHUS8JLwuldc808otnEJyaDI+G5UJW
         Jvgw==
X-Forwarded-Encrypted: i=1; AJvYcCUTiF8T2gk7uB5s65M70HZqM/tjvuk4HoGWXMTqRo7+VSHE4nB2rakEfxY16Gkg2y+EXlB/GbW6@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyLaEBhXlNNVnqbiriUGyqB+rfKrxbmKNNX/XOzNVxducPx1oOe
	MM9DDZo2T6U9eB7HBogAicco89C6HG7vuqJpmZ/BWgmKFwZ2imosmN1f
X-Gm-Gg: AZuq6aJMyqActnRPROrDJp0ME4fY7dIyzuZuppjTIZY26xI0XVjhTrrXOdOqaUzyVj4
	/9o9rjJbyjAC8gVQxBiF5KyqhmKCmb2hDGPWcL4tJnjltj/0VG+rxNiRT4XkCU042e1RMlqQA0p
	0Vd3tx2o5j0FU5NnY8JqNwcotNXsjtpS/xBntPqP+VW+HynBVBav0PJssa6mWAx20xHMvfsk9PJ
	Gh9XPIqjBpL5MqUcjZkFpjM4GgI1t8imQzd0fJeOrfNjTaumptiEUHzUZ9ZdPklcJ3yArrAf2Ql
	GVQtpfzw7mZkQ7Io/XVaCU3GmhjUCpVduWLiy9jiCme2LNkPN3jVsPVHlhznaMcpugO2NUw4dAm
	a87QJHlJkFghe5VTcqAsduiDop2BDYOUchz0wdPPU6u7NBKN6gtQTxFUHSssS8G6kMU5qHy3m0d
	Riok2WsvuZqqpraMoywiuBvp0OanjCjpXPEDSvy5yl5XeudsXtSFyMNoaZtAbOJ2iD+e8wfKDN
X-Received: by 2002:a17:90b:3e48:b0:32e:64ca:e84e with SMTP id 98e67ed59e1d1-3548712209fmr4771036a91.15.1770255612635;
        Wed, 04 Feb 2026 17:40:12 -0800 (PST)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3549c487a7bsm673571a91.16.2026.02.04.17.40.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 17:40:12 -0800 (PST)
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
Subject: [PATCH net-next v11 0/3] Add support for Nuvoton MA35D1 GMAC
Date: Thu,  5 Feb 2026 09:40:02 +0800
Message-ID: <20260205014006.735408-1-a0987203069@gmail.com>
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
	FORGED_RECIPIENTS(0.00)[m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mcoquelin.stm32@gmail.com,m:richardcochran@gmail.com,m:alexandre.torgue@foss.st.com,m:joabreu@synopsys.com,m:ychuang3@nuvoton.com,m:schung@nuvoton.com,m:yclu4@nuvoton.com,m:peppe.cavallaro@st.com,m:linux-arm-kernel@lists.infradead.org,m:netdev@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:openbmc@lists.ozlabs.org,m:linux-stm32@st-md-mailman.stormreply.com,m:a0987203069@gmail.com,m:andrew@lunn.ch,m:krzk@kernel.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	PREVIOUSLY_DELIVERED(0.00)[openbmc@lists.ozlabs.org];
	FREEMAIL_TO(0.00)[lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[a0987203069@gmail.com,openbmc@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[openbmc@lists.ozlabs.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-1321-lists,openbmc=lfdr.de];
	FREEMAIL_CC(0.00)[foss.st.com,synopsys.com,nuvoton.com,st.com,lists.infradead.org,vger.kernel.org,lists.ozlabs.org,st-md-mailman.stormreply.com,gmail.com];
	FROM_NEQ_ENVFROM(0.00)[a0987203069@gmail.com,openbmc@lists.ozlabs.org];
	TAGGED_RCPT(0.00)[openbmc,netdev,dt];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: BF3BFEE616
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

 .../bindings/net/nuvoton,ma35d1-dwmac.yaml    | 126 +++++++++++++
 .../devicetree/bindings/net/snps,dwmac.yaml   |   1 +
 .../boot/dts/nuvoton/ma35d1-iot-512m.dts      |  25 +++
 .../boot/dts/nuvoton/ma35d1-som-256m.dts      |  24 +++
 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi       |  44 +++++
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |  12 ++
 drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
 .../ethernet/stmicro/stmmac/dwmac-nuvoton.c   | 173 ++++++++++++++++++
 8 files changed, 406 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-nuvoton.c

-- 
2.43.0


