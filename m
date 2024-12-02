Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 087239E0F06
	for <lists+openbmc@lfdr.de>; Mon,  2 Dec 2024 23:49:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y2Jr80DSLz3bVK
	for <lists+openbmc@lfdr.de>; Tue,  3 Dec 2024 09:49:28 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::434"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733107025;
	cv=none; b=hozNpFBg4OcE0bTNHi2Z6+gYJiu9yPq4ozthgRWvE3PhVYTGWZm6A43LkTaf4590jkwwWKdGLDMxaCGF4II/BU1675PCEyTpTqA33O5Wy8hYgh2C1ErwUJMYrIgOPdA1aahg9kcRtr3lzMLFJzmQMOOp2ZGzXrJPl+iRF/eJ5gpKgsX0ACzZe2zGeWTtH/1NSH0h0NEtF/Biqr5SME68Zozi1AftU/LZeO6lrx6YrZf1hNYUDw6sRr2SMcsBOdpfd1a4oFW1q+LgQiirUsLir7kSQzpuMN9vMQG9NLerOC5iLpR2zKZ+8lvjcILiBqK1U+8ze+nI/nk08YB9sM8iMg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733107025; c=relaxed/relaxed;
	bh=bDFs4/7sYxUQAdmK+DmPfpiIkb/3lOGS37ALBYfbAeQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=mlNvOcKaSX6P85t5qEBAVu7yF3sQuOPh3W4sF5Wyl1FyGTprVflIskpOZwBrU+BRPGl5WXC64nfMqW/k/VeO/zZTV8mMbSxVck8LxIFpj+kNexp9doC1sdBoAZ2KAapuITuzd7/eXv6NflbZPYY3c+dJwjsBvAytW/PM5MNFQz5ZO9xKnWbbQJrn0pJS0xnz7isGL4MINu5NkAt40GDJs7OL5fS82R2VfZaFGRjXMGtcIHJnxx6tot93ajnaWJ9VSYS7J2Z6s6jNOSbstHMYDtjdsEFGEp+siTKW5SiGm7w27s8q+/HIWeNRfK1D4+jer2XQzU+1+qO0Hkz9fkuSGA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=O1xoJauY; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::434; helo=mail-pf1-x434.google.com; envelope-from=a0987203069@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=O1xoJauY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::434; helo=mail-pf1-x434.google.com; envelope-from=a0987203069@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y1nxC5wV3z2yVV
	for <openbmc@lists.ozlabs.org>; Mon,  2 Dec 2024 13:37:03 +1100 (AEDT)
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-7252fba4de1so3155912b3a.0
        for <openbmc@lists.ozlabs.org>; Sun, 01 Dec 2024 18:37:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733107021; x=1733711821; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bDFs4/7sYxUQAdmK+DmPfpiIkb/3lOGS37ALBYfbAeQ=;
        b=O1xoJauYTKp9c7JqkpejoaqKtJhELjMABPlpfraBv9j17IC0FDR4zFGBusFYwUQMSY
         Xt9x7OmWmlMu78QGvLpOqfJdLkDqQS/n6P3Lf54bS8dAAOXPDUS2HpZLuQ4VRMJ7E4MD
         Ia0QP/6b67zwmXe5qccOeAW9ZmH1SeRdA351nmMhIi4Sun9x46m5YCwNzL5mLSTbypmR
         4ilQ+DWZa8jKxrTs6WGonQhnlOik29i+zcXbH3lNyJTsli7OP14fuk/fIKTPM1gh13GL
         Qc3jE/tYEwrBXbHATw43im0Vyn+eSCtuk7J3yt0I+OpvvTEDtWLNWyr/zjFkG4Y/IKss
         BYkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733107021; x=1733711821;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bDFs4/7sYxUQAdmK+DmPfpiIkb/3lOGS37ALBYfbAeQ=;
        b=O6KW+bJhuVlbpDlTHv1VEg04eCf8hxHLEFy/SsxaK+kgQK4aRcT/v1hGWpaYl7rRzL
         sfd8fZZ/L8z1Ochf18kXrl3xxUVkePRuzACm9aXJ+AlStAPADjHTxtYZUe5+RpRXAg5c
         +JO4m38xRLRTSR8P0BTBHcBMeYdrSvxH1arMvcHdcpASPPm7oJY1UlEI6semCsxytgQA
         kuP/dBr5x9UVEvzNwX/BT5bw+CeSjRtSlMEzvO0bjWokGxncRnf42bW4ZF3wGRs1pO6d
         oxXiZJh4kAxR1T1qmbTKof84FVh3Clal3m+ZwKcEnXxBpU8gqUCkN5+AQ3xzCza3SU7N
         tMdg==
X-Forwarded-Encrypted: i=1; AJvYcCUreR0Gr39dvq8GaaoVjniVxNem+SSUyxzoLT1iUQ6gyJbDKj58vCwDrbM1FDUxSVgK+rSyMWAL@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyUOhpvjw5ePaxCI+/ZNAWzdYpzF4QjBz+8/O83HYCM9jYMkZYN
	WjreNTpbS7BXGR0edSIn03SgAYmS88+u7imdNGUtAtt2D6kSwf/0
X-Gm-Gg: ASbGncu2+mRrx/8evmS8OqjrHKvOAOcJ5TMG9TMFeER3f3vmaOsax4vwQvxqdHWML7J
	u9KWla7L7g9OBVNPi2IYxSegwybJTqFJRVhbv/6Xq3VWlJRTnadyjJ9JYFtEVtTvYQYr7V9ddy0
	klnsITDKf+lJP5wzffCnSQt6xFrvMo/7WsYCaVpz2WWTa1NFcikjaarpWQeoXWawCjhZImuips4
	MD35vqTtL2GvEl/s1UkkhTfvlcgaIdz6bl3wd31fO4CWIwLANHLcLSRXgyJf37b4HjiFc8JqSjs
	G+xTgL9px5In5UU=
X-Google-Smtp-Source: AGHT+IGLWJOBt6A4ZzleNpaTexfFquv9ndvXCA2owoRgs9f4h1shTttjNxjyQrv9s0g8p/Xs1tMZ1A==
X-Received: by 2002:a17:902:d491:b0:215:4e40:e4b0 with SMTP id d9443c01a7336-2154e40e808mr142897375ad.9.1733107021039;
        Sun, 01 Dec 2024 18:37:01 -0800 (PST)
Received: from yclu-ubuntu.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2159ebee334sm2306375ad.67.2024.12.01.18.36.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Dec 2024 18:37:00 -0800 (PST)
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
Subject: [PATCH v4 0/3] Add support for Nuvoton MA35D1 GMAC
Date: Mon,  2 Dec 2024 10:36:40 +0800
Message-Id: <20241202023643.75010-1-a0987203069@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	FROM_LOCAL_HEX,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailman-Approved-At: Tue, 03 Dec 2024 09:49:25 +1100
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

v4:
  - Update nuvoton,ma35d1-dwmac.yaml
    - Remove unnecessary property 'select'.
    - Remove unnecessary compatible entries and fix items.
    - Specify number of entries for 'reg'.
    - Remove already defined property 'phy-handle'.
    - Update example.
    - Modify the property internal path delay to match the driver.
  - Update dtsi
    - Move 'status' to be the last property.
  - Update dwmac-nuvoton driver
    - Use .remove instead of .remove_new.
    - Use dev_err_probe instead.

v3:
  - Update nuvoton,ma35d1-dwmac.yaml
    - Fix for dt_binding_check warnings/errors.
    - Add compatible in snps,dwmac.yaml.
  - Update dtsi
    - Update dtsi to follow examples in yaml.
  - Update dwmac-nuvoton driver
    - Fix for auto build test warnings.
    - Invalid path delay arguments will be returned.

v2:
  - Update nuvoton,ma35d1-dwmac.yaml
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

 .../bindings/net/nuvoton,ma35d1-dwmac.yaml    | 134 +++++++++++++
 .../devicetree/bindings/net/snps,dwmac.yaml   |   1 +
 .../boot/dts/nuvoton/ma35d1-iot-512m.dts      |  12 ++
 .../boot/dts/nuvoton/ma35d1-som-256m.dts      |  10 +
 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi       |  54 ++++++
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |  11 ++
 drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
 .../ethernet/stmicro/stmmac/dwmac-nuvoton.c   | 179 ++++++++++++++++++
 8 files changed, 402 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-nuvoton.c

-- 
2.34.1

