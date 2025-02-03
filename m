Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CD94DA26897
	for <lists+openbmc@lfdr.de>; Tue,  4 Feb 2025 01:32:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yn47P66JSz3bNm
	for <lists+openbmc@lfdr.de>; Tue,  4 Feb 2025 11:32:01 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738561427;
	cv=none; b=Z78CKLs6YJMTXTwOQwuRlP15ElsjAWP6NQpNDuh8yfTjQ6XK/CjvhIzY9Ulg2DlGQhYv1dt+0QQmhGD5N8hiczTqFY3V9WTuqzVM8gfPIwiwqO0PKO8KyWcCTZt61x2UeFFJ2+ENNz8vDaObhUIdwq9ZmGPcq4a8G27bWs4XJnaZxlrm08EToaVwtONE286YhzqoYejrN+ffHIK9G4yVBpdUZ+GZ8z8JfhXakSPMmP3HKT/fdPbm1HrATef79h1YsJpJyRctyxc9jKhaw7FkMPD+bDb8Ki3I8D1m1MEWrElZWedKS5t6cA36QD6Ofl8RF74R7+G+69VaFzOQu7rL7w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738561427; c=relaxed/relaxed;
	bh=4FGOb/kuuSUyymnQVyBkrBupzFYWT4l1pdvKkJ2J+xI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=hI+4x5qXPulJIOQpvHT1aFDmbpoNWPujQndIHQkmeXj18ps4yKgm+v9mbxH0aAG3v4f4tQzM99OFV7lFs9N1yUgMIIVawpR7gWehw4dCwxg5sqaoa7gzusSX7dqXrW6cqs5xq8l2KzEbnzcHAfJAeZ/wdPJSYBq1NOJMe08VTxzDDuVHLD7OYwLBDCAhOg3zEmxxIIGFyFmbZfK2kNCay55NozjqtJjnf2sMjdxJ6Vhpf69C3/4XdBJLXm3EY2ERkc9JY6vjMFTzB11DsI9+Ru+LfIIJrK03WEZt1oRflqZ7TFDAn9bXhZMdiv7ScoHP7k+bspbgzYfZgz3uUxY0/w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=d4WOXpMK; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62f; helo=mail-pl1-x62f.google.com; envelope-from=a0987203069@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=d4WOXpMK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62f; helo=mail-pl1-x62f.google.com; envelope-from=a0987203069@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ymb5Z2jJPz2xKd
	for <openbmc@lists.ozlabs.org>; Mon,  3 Feb 2025 16:43:46 +1100 (AEDT)
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-21661be2c2dso64807695ad.1
        for <openbmc@lists.ozlabs.org>; Sun, 02 Feb 2025 21:43:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738561424; x=1739166224; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4FGOb/kuuSUyymnQVyBkrBupzFYWT4l1pdvKkJ2J+xI=;
        b=d4WOXpMKytZkVB4Ofxb44G2OjUqADGE9m6UFKb7DFu7e+6JVZJ7vvKKpvlPByUHufC
         25Gg2jyjolYLhlnsUf7p6R3aT25KTS3U67BkzqV6+Fpfyh2LS5+Wy02lZk085gI1mBIb
         rsRYWxWgD+9mulff+1y5Xpk0214sqeMqtE+axiaVTCrSKWcB/hlRO06j5QBNAhnDu5dW
         5+0tVFu1Yttom4VIvH2X/7dr0Qe9lYOqGT+1mo6/g0QMmobofhPNYNKv9udhGCE9g7m5
         LLKbUmNfObItNzGILm63uzFVl9zXbPIX8ykCehUzycxxDCGV0d2z3egGr8vao+t7qaJ+
         vItg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738561424; x=1739166224;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4FGOb/kuuSUyymnQVyBkrBupzFYWT4l1pdvKkJ2J+xI=;
        b=tog6Cjy79X1HizUHWR1OPjUi3awM8DvyHfD0KfFfNcnENNLuyKuQoiGacKiFboxeNs
         QqXfRL1WFTquB7x4Rv6iH+N4t3K+7JYw+Wn9OxyJlnSVk7C4ppvx7JButxpm+P9W8JsF
         3qdSozzTtXc+InST1VrfaSwpg3kTVKQIl/T6i4sYfFYZU9N/iCDc/qHXH9mYUaXi+/tp
         5b8P+95yaB+r5oX7BMccEeZ+wgHi8R4c8+fweqvHOHNMRsT9IoOjrjAIE2CKbHbOK7vU
         sFrnMSAzxAfR4+dPo5Z4xYRkFflXd/OQzzIQK9Wso8V0ozY/oXvrELzuiBNq/5hKGnlf
         Sb7w==
X-Forwarded-Encrypted: i=1; AJvYcCWnq9K5JzHMzpAuAL88oei8bgIS5Zk1XDIKpZnnNyXYPls7z6SxEaMqcm/g3+iN1MLcGlRmBXLh@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yz9IIpMkH03PlCBTrLZApzhArTUJAagP5caB4xNYJQzD0njrSh1
	f+AokjK2cL3256OeVvIXqTMo8v+oE/6mrkVo8M1rTH8MYf00FMDw
X-Gm-Gg: ASbGncvP1hAATKYFCLVdJWZX54wRxzf7mnZULy+ciFJGeh8IBm0SAEVxuZTVRLLdEbs
	KiywJuqH+/phsg7+OZGdNHz4yBWC+hIZeT6gChZ0PoxAUYq+5es8N+ANIqfubUwJ0kjzOlTrRqz
	JFBAio9EBBEZ6rGq18+EGKpGug7UHFQEXnQHnrHgAeRDyBnieuHtdb2EEMGE+lCPaDO46rl7fTf
	VHJId0EiYzAMo1lKnu/OtD/9MDvKo9I51SvHlM3L2TMW3m0jfMK0l2nQ1mE2mWckobGZrvKZLNx
	9cHPHC0dOa4yvk2jLowvtx6B9Ukq9ohaDk7wnmqhjt3HiPJcDof34dQX
X-Google-Smtp-Source: AGHT+IFZo0ftKSRImunKlJXQj0l7sQfkYC+YNDQdjmv/qB1QLAW3j7xBuAzdPaBhuWUb5WL8D9R29g==
X-Received: by 2002:a17:902:f546:b0:215:8d49:e2a7 with SMTP id d9443c01a7336-21dd7df98f8mr329030855ad.50.1738561424238;
        Sun, 02 Feb 2025 21:43:44 -0800 (PST)
Received: from yclu-ubuntu.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de32ea5fesm66894555ad.132.2025.02.02.21.43.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Feb 2025 21:43:43 -0800 (PST)
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
Subject: [PATCH net-next v8 0/3] Add support for Nuvoton MA35D1 GMAC
Date: Mon,  3 Feb 2025 13:41:57 +0800
Message-Id: <20250203054200.21977-1-a0987203069@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	FROM_LOCAL_HEX,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailman-Approved-At: Tue, 04 Feb 2025 11:31:59 +1100
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
Cc: devicetree@vger.kernel.org, ychuang3@nuvoton.com, Joey Lu <a0987203069@gmail.com>, netdev@vger.kernel.org, openbmc@lists.ozlabs.org, alexandre.torgue@foss.st.com, linux-kernel@vger.kernel.org, joabreu@synopsys.com, schung@nuvoton.com, peppe.cavallaro@st.com, yclu4@nuvoton.com, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

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
  - Update dwmac-nuvoton driver
    - Improve the driver.
    - Update the license to GPL.
    - Update the description in Kconfig. 

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

 .../bindings/net/nuvoton,ma35d1-dwmac.yaml    | 126 ++++++++++++
 .../devicetree/bindings/net/snps,dwmac.yaml   |   1 +
 .../boot/dts/nuvoton/ma35d1-iot-512m.dts      |  12 ++
 .../boot/dts/nuvoton/ma35d1-som-256m.dts      |  10 +
 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi       |  54 ++++++
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |  12 ++
 drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
 .../ethernet/stmicro/stmmac/dwmac-nuvoton.c   | 182 ++++++++++++++++++
 8 files changed, 398 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-nuvoton.c

-- 
2.34.1

