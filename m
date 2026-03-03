Return-Path: <openbmc+bounces-1431-lists+openbmc=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+openbmc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OHptK3a+qGmXwwAAu9opvQ
	(envelope-from <openbmc+bounces-1431-lists+openbmc=lfdr.de@lists.ozlabs.org>)
	for <lists+openbmc@lfdr.de>; Thu, 05 Mar 2026 00:21:26 +0100
X-Original-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CDD51208F14
	for <lists+openbmc@lfdr.de>; Thu, 05 Mar 2026 00:21:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fR7vy10vFz3btS;
	Thu, 05 Mar 2026 10:21:18 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772529620;
	cv=none; b=Me7Q2puReo7NjPIqKDODY8kX3vJ3RDEIPuQn6rwWXjM6qzRs+Djvj7u99IWyZueYYBYnvUtIb9oYkl4spun8XHC2137FeaP2IP1Z/0WdCntERoRs490NBrJLaHEHjRl23y/3JUtk47wyDDM17gzlD3Y31SDlFxw9ev3Sh9UMev3FbHJ8z6ytwcPrnlZxYcGa2SGttukSxxXmlnCvM1E3/jsjUpVcV7ZPcblf9mqbkc/hDFGa9+hG2NVO4FPlpgiip4BsJztl2/F+Jmv54vOQIl2mYtdkNv0XOOqOr9MVlNPoZWFjb/V7AD7O1N9XtF92CzcgiUQfLNYlNodFSUOsug==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772529620; c=relaxed/relaxed;
	bh=hrr8Af/aGKB61i0C6ukavupGQsufCcEMWOAgZ+sFvK0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jS5JA31yxchDPyNRN/Ve9SihIugnkNnDKedwvaWEy8Z9ROpD52R2lCgmlPDJ/F4LgKlRLgEte1OIG4IIZvQFOfLbi/aFOzJ/YwDndD/smROfIpGqmaSmQzj+pw7AiaD3nSuFxikgcFlwlkboNwrt+ZX/NgcYqUDFfX48GQnp33FuyP/t9Lw//xen8QXgkEvt1pQE1gWCEPu5YEj/I13b7xKQ8kZGArIvn9Za7wAg3cUp0q/00D+hQcsfrBWbjaaNAnJkQ7n/anPClDhO5we6aHnEiLvBFenVlFPuoaRPoVpk7dW2Kz+Pzf+1uQEELBswrWKJKCK5nwbdKpCqr22f5g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=LTru6qQY; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62d; helo=mail-pl1-x62d.google.com; envelope-from=a0987203069@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=LTru6qQY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62d; helo=mail-pl1-x62d.google.com; envelope-from=a0987203069@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fQ9J36Nqzz30Lw
	for <openbmc@lists.ozlabs.org>; Tue, 03 Mar 2026 20:20:19 +1100 (AEDT)
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2ae4988e039so14720615ad.1
        for <openbmc@lists.ozlabs.org>; Tue, 03 Mar 2026 01:20:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772529618; x=1773134418; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hrr8Af/aGKB61i0C6ukavupGQsufCcEMWOAgZ+sFvK0=;
        b=LTru6qQYaXPyVOrMoMudnG+x3UkEniAQUrBKdy3da3rKOutZC/FS2iSow7VhZjfHvW
         KiKPvVqAo1gxDHQd7sPh9O4LwZnZJtaBEi7tsLoKIwzjhyGVHz6qmp80Pl66TwcbrZxR
         z/4a9FDPFPBdZkrJhRIAB8YtkMwMlc2YxcJEiiaFOA6QMjHsOCsxx8a9JMYljt2Nl/Qr
         q81Sxj98L3rO6g1JslYBzLCHoBWzfycQNeX9SOV5uCpdLanGyK1WPPMUFu9JcFMlFaje
         x7laKmHfDlsFAPTTU8nqvgvY8e+76RUSEM4+rj1zAnU/RfQwRdPG07rk7UR1LoN7ecl/
         PUoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772529618; x=1773134418;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hrr8Af/aGKB61i0C6ukavupGQsufCcEMWOAgZ+sFvK0=;
        b=rXCgoKRYhvHQFEKsHjgv0wsXiW8LQPmigUOqXJEdXrpuoqQiGyhmCq1DBH6nvwLjzO
         iQ7JTUPuxd6pQYaLXTnc/F+XgfVGv5vEv2Rk1hifVjWks9LQhwE1uOKtN+4zMHdsN3Rf
         3txu6t2cmLoRKlzJ8utiB8df39miO+CtamkTSHW0HVmx6cImlLuvXQAOiyYl9H9F37wf
         AB9dtoNY588wEzYxLKnS4T8U8K85Ey6gy6GJWNWGygYHxf2pe3RvS76tzkMB3NZ8lFyJ
         WW8iElmuAw3UGTVpH1R3kivqlwOymT9d5O20P85dRPN5u4ggXjBPKy+0OLGuYiqT/ATN
         bIGQ==
X-Forwarded-Encrypted: i=1; AJvYcCWq++bQRf1B2yG8n1BmuCjvLcykWJTGHhSyvmpqSa1NrepeQW7NOqubqnyGe5hkWIWDZtM7gOxI@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxD6Fl2nLidNgfFsvPXPwUNXEDE5mBPKkJJFhC440f5yq/ax2G6
	ozk8ai5CDD6UCUiSnWHh7C6OGu59iKf1HZNDzgkScIJccT1nvNiQH6hB
X-Gm-Gg: ATEYQzxX3rzPQWLG+zESAgf+Ijl+pIwn1Wt38OfJxTlcZ5kSdogGmaQ7lkU5N7KB9G0
	V5WtvQLJKnCb9ZYbZr6Q4xduLXuADIIszbcZRcKUTjiY+H9HY7pWu5JwZsT2Ku+B5Nu0qLs5DXB
	DXm/RsNq+hi+mRIXTvEZTRm5TyXBtDregvdyIHf8QaH1x4BC6JB4FvQIoquhOy+gNAbtFzH5fkg
	mnqLIPwUwuOfIcMVjP6HPvzOoCW2qHVQu+VfYG5FPhe6atFN0bGFANZmVNOGebTp7P9SEsWYcK0
	8GRY5PUhPH1w6BWH2x2dG3wAkcujXwzRXY+K4je0e8V1GirOcn43J+4cTIcnbz5cJqZfTbbntqd
	zm7XnQJobUL/mO2BWNrMor1c297adWgEKhHGFddSSGtjk1/cFdPMmZxwu77lxPv5n0w4XELi1fD
	Ph5xctg6jEtsjwsRpaM21DV4gejmORFw+0Ijv3YnuvgoMa1ANn43CbpXEQsjJjjYawBc6RizdKR
	1n8sjB1Ir4K
X-Received: by 2002:a17:903:3bc8:b0:2ae:5a70:477e with SMTP id d9443c01a7336-2ae60cb2da4mr14189425ad.12.1772529617675;
        Tue, 03 Mar 2026 01:20:17 -0800 (PST)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb69f996sm158777475ad.50.2026.03.03.01.20.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 01:20:17 -0800 (PST)
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
Subject: [PATCH net-next v13 0/3] Add support for Nuvoton MA35D1 GMAC
Date: Tue,  3 Mar 2026 17:20:03 +0800
Message-ID: <20260303092006.263715-1-a0987203069@gmail.com>
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
X-Rspamd-Queue-Id: CDD51208F14
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.80 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DATE_IN_PAST(1.00)[38];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.19)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mcoquelin.stm32@gmail.com,m:richardcochran@gmail.com,m:alexandre.torgue@foss.st.com,m:joabreu@synopsys.com,m:ychuang3@nuvoton.com,m:schung@nuvoton.com,m:yclu4@nuvoton.com,m:peppe.cavallaro@st.com,m:linux-arm-kernel@lists.infradead.org,m:netdev@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:openbmc@lists.ozlabs.org,m:linux-stm32@st-md-mailman.stormreply.com,m:a0987203069@gmail.com,m:andrew@lunn.ch,m:krzk@kernel.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,gmail.com];
	FORGED_SENDER(0.00)[a0987203069@gmail.com,openbmc@lists.ozlabs.org];
	FORWARDED(0.00)[openbmc@lists.ozlabs.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-1431-lists,openbmc=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[a0987203069@gmail.com,openbmc@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[foss.st.com,synopsys.com,nuvoton.com,st.com,lists.infradead.org,vger.kernel.org,lists.ozlabs.org,st-md-mailman.stormreply.com,gmail.com];
	TAGGED_RCPT(0.00)[openbmc,netdev,dt];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[openbmc@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FROM_HAS_DN(0.00)[]
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

v13:
  - Fixed YAML with dt_binding_check
  - Added callback for plat_dat->phy_interface
  - Updated PHY-related setting helper function
  - Renamed registers and values to avoid misleading names

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

 .../bindings/net/nuvoton,ma35d1-dwmac.yaml    | 131 +++++++++++++++++
 .../devicetree/bindings/net/snps,dwmac.yaml   |   1 +
 .../boot/dts/nuvoton/ma35d1-iot-512m.dts      |  25 ++++
 .../boot/dts/nuvoton/ma35d1-som-256m.dts      |  24 ++++
 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi       |  52 +++++++
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |  12 ++
 drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
 .../ethernet/stmicro/stmmac/dwmac-nuvoton.c   | 136 ++++++++++++++++++
 8 files changed, 382 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-nuvoton.c

-- 
2.43.0


