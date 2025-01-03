Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 409AFA01C6D
	for <lists+openbmc@lfdr.de>; Mon,  6 Jan 2025 00:14:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YRCm330Nkz88VC
	for <lists+openbmc@lfdr.de>; Mon,  6 Jan 2025 10:13:23 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1035"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735885995;
	cv=none; b=EGsgNJPLphETJ3cxTkgeqnYzdp8sLmyTI+37evFf+BEDbfMG0qewZQG0G3yflmwXJgA1N3e/IlQ2CYcbsxATNxgZzZd049QTWwGmkaAZ+AAy2neyFtcJpSYW4tAp/DJLaLN2aKdslkt/k0VvYae0WMFl9JY8Bo4PHNyvi9mMpSNaoGJE2lbk5Zz+q9YJ5J/CsdhzFAbIEH5XuraEQ+FvRs97wnWXOyV22NTftM5rsJFrjFPDlo0gHJ6INg0ulZZuUQvug8mAXuLK7g6W7DmB397CV4cWGsUrfcHornkPPq9N7nWYoYhYJG0A2g+WLcqf7GqORQg7tm1+mHdrIxXvbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735885995; c=relaxed/relaxed;
	bh=9JYhGYLehzzVS4jEYnaJXjDH6Mz/6G3WSbJlmci9/3A=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=LJF4259t0l6ATAfX85mVCOgHT0+7C5Fs0pYAdzrSYS4lIuvoA1p9klJWqOY8lhkMS0THs0w80zPNaXPrLZo6th+g1CYWBi6ClVSDdtjyKdhk8hWag+U190b+zZIY0Jwf0GN/LgHpcd7H1yGEo96kXtRkiEPVP/fN9k6+i7N90L2oYQ1q+2fr0wgN0N2fk6r26YVdU8GG4VAhju1TClxHR+3WQdwp21VicRSTVYjr8m8QCRvPBisfBX6Yh60kX2VwrvZrQHPzC0KJND4rII6fWbXRXYQbB++5q8sgvIXjdorBX1voSiCVqWn2CB3bjurx2uyyOdfdNqkvkFYjbiJaIg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=WZrQgmJH; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1035; helo=mail-pj1-x1035.google.com; envelope-from=a0987203069@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=WZrQgmJH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1035; helo=mail-pj1-x1035.google.com; envelope-from=a0987203069@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YPYfx6sXHz305S
	for <openbmc@lists.ozlabs.org>; Fri,  3 Jan 2025 17:33:12 +1100 (AEDT)
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-2ef6c56032eso12356453a91.2
        for <openbmc@lists.ozlabs.org>; Thu, 02 Jan 2025 22:33:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735885988; x=1736490788; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9JYhGYLehzzVS4jEYnaJXjDH6Mz/6G3WSbJlmci9/3A=;
        b=WZrQgmJHw8MiiVggKb0WDEZc28H3irG6OOgvlDVOG6lIMMIfSiL1k7IBAU6VSJiEod
         QFjI8Zg5Sh2tz1UCOLh1TGmpSdXoat6YlDl2EDuXs02584FAlgdDxoFadBSF7X3C+Eg6
         H4bnJ16rljn0tZuSfbomyLUvuXxc2+hMkTU/F3VSxPBxFjcj1VK1HC7Nnl7JenCn2DwJ
         WueU3ZZ1a8ScR/7vrCgoYy/2HVs9ohxSEtzZHP5/IjRD6KL/upKP2gA3jk++fPiW12S2
         CJBDg8yqPbddNMndDmM5cV81O3sT574QDaJ+2YL9003vpsUmeYdCU1ye6nhdkdYuySCs
         9Hlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735885988; x=1736490788;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9JYhGYLehzzVS4jEYnaJXjDH6Mz/6G3WSbJlmci9/3A=;
        b=PIXd3ULQBNCUzDQaC7iF8cIqnA6aBIv+KZVNbAFLWwC4H8+oMr9rX496zpqgh5rngj
         k7U40ZeQaaStbv9ploC5SJU1EiYRCzesbGMMHrkuv6PFlhK1Xp3kXokucVpIhd06Iu08
         mzjK+jAAv6yN7KkB8v/JcMUlxfyiX25fmyba+Bjxq5AUzkG3Qs+lxLII1XQ9pkUxjFJZ
         PRxnmDgMY/fbipB97ThjA7TzKoglnJ3dBfr3dGjVeESR0Z7MUwRfi9gbqiKGt3TnWQFv
         OYgwcr5edZINaJVHuO7qfCWN8IEzDRcN+3a6oudUPiqEh6Q3cwTxYTQzYW6GxJ+wcpS0
         CWwg==
X-Forwarded-Encrypted: i=1; AJvYcCV75uHQm8g8vSJZLM0K1xIRFsh2khwnQWFQjmCsi4fI+Y2GKMXjA/Vb2ncyHIdgb/XL6WJQY6Oq@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yyq/D0Fm8bWdXCh9Pefz+B7TEIFgt/ZDuga8LYr9kn1DbLY1S7d
	JsBs1qK/hjnCOcv5NbAgQ26DfUBJEJKwVQeJTTI8b8eULHkPpumk
X-Gm-Gg: ASbGnctsbLERmrIgcffKJAixEgiBsI+uDln3R1iOZf/rNtDrtB7OCNDdCAsqk144qI5
	yMNyjxlH8bjXvx6SDw55m40rmae1MLJla0b0Fdt4wgNCEzUkTWo6JcaBtJnYusuowjKSkqynPjL
	e8OSBmLpEaMtlXjeigB8LCxUaiUnc5/HsJ80Gj5WEHVaedcHq4LMZmEqamJQIyaHPbr7rTXf/n1
	x8SxczIBDIDTHBSQ7Gn57cGcZSdneMvQqJo7ROTmKmYuselhBRJhoHVpuRtQDHZE+tGJQ1bZ1Z7
	YbckIU81RGXOmONJMIqujA==
X-Google-Smtp-Source: AGHT+IEg9FrZ5YUufYh0MJJtCtJUyPbNJMmGsbwn8DtZhoDwMHr36/JHl3HeB9+5mO4uV2/PACAAPA==
X-Received: by 2002:a17:90b:2e10:b0:2ea:8fee:508d with SMTP id 98e67ed59e1d1-2f452ec2e82mr73280088a91.30.1735885987768;
        Thu, 02 Jan 2025 22:33:07 -0800 (PST)
Received: from yclu-ubuntu.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f2ee26d89asm29427805a91.46.2025.01.02.22.33.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jan 2025 22:33:07 -0800 (PST)
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
Subject: [PATCH net-next v6 0/3] Add support for Nuvoton MA35D1 GMAC
Date: Fri,  3 Jan 2025 14:32:38 +0800
Message-Id: <20250103063241.2306312-1-a0987203069@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	FROM_LOCAL_HEX,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailman-Approved-At: Mon, 06 Jan 2025 10:12:37 +1100
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
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |  11 ++
 drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
 .../ethernet/stmicro/stmmac/dwmac-nuvoton.c   | 179 ++++++++++++++++++
 8 files changed, 394 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-nuvoton.c

-- 
2.34.1

