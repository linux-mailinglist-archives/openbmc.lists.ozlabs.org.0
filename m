Return-Path: <openbmc+bounces-1242-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E3A75D3BA5C
	for <lists+openbmc@lfdr.de>; Mon, 19 Jan 2026 23:06:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dw4Kd2hvTz30M0;
	Tue, 20 Jan 2026 09:06:13 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768808032;
	cv=none; b=VOLoAH+N8Q9XrHKwgprfHSVr8Mf9yc3pOe+zADwyXqsOrakLwmfC83H5Z3nPAxAFhFzze6bUFYLD+y3dQQTn2swMwLxLiukaR7AoV5RQ1vuD6+fwjbHlwxewpPhTujF9/hysNEY/zrHyR5k8aKt2Po7dK6kpeyk5cnXri0TThckIX+DDkmqqFlPTKbCwCALYaYzjE6/4juoi5LDPxF6EbkY33mAZPXd2jmCfbQp3VcWoxOx8bL447hj4s1lU8MloVw/p0gfRQ/+cJpIuH8DxFy1Vpd/h+7biD1ZSmKpUFozPxjjJBUkjT4pXGuJAquCThW3KhGmk+JtA+z+gE18Zsw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768808032; c=relaxed/relaxed;
	bh=T+Mp2cAzIjQk/XVhc3r0i+qdUMWj/sYGX5LNPwYnZpE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XSHbKatWj8aF+/3QxPgOfbNm8+VEgAsNnUeCEXF0GCxI043odEKImlILOlN94GpcQH2JY334zgldiI+8s9KDBTCgNpxJIjO6qRxhHiNwilHWP589vyxn/KBgQZ4YLTjMLdhmc8E7idTJty+F+AeJO8pLnq6pEqq8Rn4YkpXi8ZQsZ3W55mJ0UfdYyW1A0bnCwczvtYj3zbaENQGJlLX9gQsBrr1Ci7FxsL0vIQ67ZNRtjPFbHVF7HUeFuxljTKDMGg/h8/Dc6o1frLnB0Bi2any7TF2rVKcOV4Eg8x0EoSOnf3PXg5mJZPgvEw2nkbpzV0X2bhG2y7E2hx+Ug2/NlQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=FPaQs/Y8; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com; envelope-from=a0987203069@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=FPaQs/Y8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com; envelope-from=a0987203069@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dvhz35WLYz2xHW
	for <openbmc@lists.ozlabs.org>; Mon, 19 Jan 2026 18:33:51 +1100 (AEDT)
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2a0fe77d141so26346015ad.1
        for <openbmc@lists.ozlabs.org>; Sun, 18 Jan 2026 23:33:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768808030; x=1769412830; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=T+Mp2cAzIjQk/XVhc3r0i+qdUMWj/sYGX5LNPwYnZpE=;
        b=FPaQs/Y8G1tWfQvFMjdsC9MozBMLjMFCTRzLFirj5Qqr8mwoIAZfn1VYse0Vyf2Dkk
         V6QunK33TkZWQHunUXvDE9JqX8zG5JqPuu+e7m8/ARdpt71ptgJ9eK7DKP4cVrNsCWlb
         AGSCPDY1mxr6h5pYZZcdfZ4ZktIKdq2H4ZFENEjXU+LnMWU7jg9oZg1vPeJQ+axNBhjR
         VcwMjmL5TxfeKIGD6oxAnz/1cEGWuWK4Qs9t5r3vzcHBhbvqWHT3oMNPFo12ZZLgVTcs
         8BGyrj1HytQDdDpZKxomryA2BUA2qd8/sayQBSXblI4w/KvVwe1zZJrAFQhUU5EAI9Rp
         Vz1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768808030; x=1769412830;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T+Mp2cAzIjQk/XVhc3r0i+qdUMWj/sYGX5LNPwYnZpE=;
        b=jIN51NsRf4aRD1vDlrEpvIGBJgxv24vQ2zHrMv/IHSWJHfBZ6iSt35dgOnk1zeetG7
         3W8QSA/vVj9KSj8jxzcS9HkOYaXCRmktOCfijzk9OKkp46vwzF+6jr6X3L3PfKmIUuX3
         ZVOKDuxUu5oILtufYw0nEFTNTaHrsEII+qFgE5/w05ec6v5HH6EELAGkpzlaMhA7Am4U
         zzjKxz8WzkgjIntSkvRcijqJD43viUUtw946b80KkpTg7V8yp+yUaVjLe315SFYSR4Ms
         4OWDzrs73uRXRxt3bfjl2V0B2zf9QQ9pVIo4ZAHpGjnCrIxhELcctP+r+EWd8nRlw0M8
         REbg==
X-Forwarded-Encrypted: i=1; AJvYcCWo3U41J5p0LS1ByTYtiz3AVK7STGKLuQuS2HyoxGTCh4miHwYkSfHxAFoZlqQyNKILVNd5/QKf@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwW49x+eFd1fwQhZcH05DTm9qBzlbrYnd4FNWc+nNf/JGBD99Yl
	TYCBHQS6kFmUYxS3gts7i8V4/DO5Fpx4ENYhGSK0slDYbsT+LiumE0mo
X-Gm-Gg: AZuq6aIuMLSQIdNCTNg9UUT9QoSXzJx47us3c1mVQt1rzEGauM/AWXxgX3YuCkvldVC
	FM1IYx5RzDk9ManYu2/iUuQqYyxW5qWCEJyZSYwqgLS5SjAHWN4J/fWIkGBZR+fuxkoLrOwlAi/
	Zow3YqoQSHnLxG5m5W3cmLq1Ov0xF6rQcRRx4uPXRvsmi1YOX5iTHTDC7owXLGWE/wYCBdEZTA6
	cVTyDi6ouXpKCm9PBEiqnVOHM3PVf0DTS8dIEoZw00Xn3p5dnfftsP6YuXomoZFRTSp14OGjOXv
	skYjT6ezPdLLHSM59OC5JfUuVzU2rmJLxihE2qHutdxaFAhnnSZ4NTF3tVI+0GcuWofJrFB/RTu
	X+ACR3GPepRg04S86evgRO4UPchDHIrzF6SBt+iQtdizruFkpk1WegSckKgkeFQMoXnCw9mLwpk
	0aSHV3u/5KdL3GN3DEVs/6uj/Mi+6wUyXWBwqL+DX1OEPs39IzKxmk1E9chp2DkCMH0+44xZPr
X-Received: by 2002:a17:903:350c:b0:29e:9c82:a918 with SMTP id d9443c01a7336-2a717535134mr90244535ad.22.1768808029614;
        Sun, 18 Jan 2026 23:33:49 -0800 (PST)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a71941e3cdsm84863325ad.100.2026.01.18.23.33.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 23:33:49 -0800 (PST)
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
Subject: [PATCH net-next v8 0/3] Add support for Nuvoton MA35D1 GMAC
Date: Mon, 19 Jan 2026 15:33:38 +0800
Message-ID: <20260119073342.3132502-1-a0987203069@gmail.com>
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

yclu4 (3):
  dt-bindings: net: nuvoton: Add schema for Nuvoton MA35 family GMAC
  arm64: dts: nuvoton: Add Ethernet nodes
  net: stmmac: dwmac-nuvoton: Add dwmac glue for Nuvoton  MA35 family

 .../bindings/net/nuvoton,ma35d1-dwmac.yaml    | 126 +++++++++++++
 .../devicetree/bindings/net/snps,dwmac.yaml   |   1 +
 .../boot/dts/nuvoton/ma35d1-iot-512m.dts      |  12 ++
 .../boot/dts/nuvoton/ma35d1-som-256m.dts      |  10 +
 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi       |  54 ++++++
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |  12 ++
 drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
 .../ethernet/stmicro/stmmac/dwmac-nuvoton.c   | 174 ++++++++++++++++++
 8 files changed, 390 insertions(+)
 create mode 100755 Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml
 mode change 100644 => 100755 arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts
 mode change 100644 => 100755 arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
 mode change 100644 => 100755 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
 create mode 100755 drivers/net/ethernet/stmicro/stmmac/dwmac-nuvoton.c

-- 
2.43.0


