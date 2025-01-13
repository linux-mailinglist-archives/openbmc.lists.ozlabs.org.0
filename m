Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9503EA0C5DF
	for <lists+openbmc@lfdr.de>; Tue, 14 Jan 2025 00:50:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YX8Bv1MMDz3dTf
	for <lists+openbmc@lfdr.de>; Tue, 14 Jan 2025 10:50:15 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1034"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736747782;
	cv=none; b=DtEpakp7MaPiTHE8QhkMrFfleIHuYid4Ve8/mlVZ5OE+BbQPbU5ONcmJKMoynFI8ximaUgWOZBRBFMWPoRRgDETmjHKcNGReHrapniJaUwc72YC4+9y21HthjpoqLu6evvQuK9oFLfc+xFSzzCQfAJCTVeHVE/SMs9w1Z4IuSk1tjE4BIXRM1EknzpR/nu+SygV7lmTODIKM4rTbMLfNG4oA5F/oqKMsMRm0vVxlh8BMhoZfeOjJmLsgeXNtFUW0dHKjYRcodz/ogLD29YD1gLchuIjyJY6EGsjdZi061ddstZResI3mfwdQoBZdhEmVNlXWZQ2nT/aKEaLMiuNz+A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736747782; c=relaxed/relaxed;
	bh=B5kSRwp/LQmi9TB9FOxDQuTUZ2FNweKukw5dyy4zYRQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=E5gzheD6U5yid1gaiTTPc0X1FrL20P5ge0ooSdw79wuczwsbHGK3TYYT+fKphDWHtGh/nO1Cs45N0K8irC42sced90cckZTz1QTbKEqrVf9iYlcgNnn4O6vBP/ktA6C843ar7MXls2/JeErmFbXVXR2eFCkSFo5PZ9J5BEFVq6rkPjSd5KHkogFYQzg8Mydczb+53dn1D3bCrwSWauuy12GNVPW1MM0+QHjfwSrRkfmT+JUgrxgiub7yu+tblE5EyYCx0aetlOyq+8noBqiG7JB5b1dyApKtwSJgzKYLcfcrr9cQqt9jZJhEKLidJ2Y9poOP7JiB+Jf79vr+ogXMcQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=X3jSauGB; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1034; helo=mail-pj1-x1034.google.com; envelope-from=a0987203069@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=X3jSauGB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1034; helo=mail-pj1-x1034.google.com; envelope-from=a0987203069@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YWhMn0wMJz30NY
	for <openbmc@lists.ozlabs.org>; Mon, 13 Jan 2025 16:56:20 +1100 (AEDT)
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-2efd81c7ca4so5162167a91.2
        for <openbmc@lists.ozlabs.org>; Sun, 12 Jan 2025 21:56:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736747774; x=1737352574; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=B5kSRwp/LQmi9TB9FOxDQuTUZ2FNweKukw5dyy4zYRQ=;
        b=X3jSauGBZQJQWiCegDAju+Xdy0DYFJYuZUY5/f3WOTBaIcmhvDQ4PdApomcm9EiupG
         2bVlBuW+YDTP5ktu/hzyadF2XD9k66mD6BOiyW6m38GueronsnRIg2GEZw030E0LtxRR
         fPLZhk01rGP4f3TYLO5fMQ3VHX4hoUkdM4rv4gNZcWrxKgBbrasYeKHyOmXBsBjGER9C
         70nVX+9N7r4FcBSCvWLLhNrNdyqAbrXxqTdhyBd/tjPoEdgsj69gkH/Za7OOkTUvsusb
         PXewFGmOuqWJKJoR15cPNXH7l2xxNlK3tYPqwi9m9KE8mRGR4cbNG5dBd1G0jjbtRWgf
         OZJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736747774; x=1737352574;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B5kSRwp/LQmi9TB9FOxDQuTUZ2FNweKukw5dyy4zYRQ=;
        b=ZiWwsFZGMSzZxS8eMr6U1lgBEYvZBwjA/Jk5Ne47kGWIvT2w7AVJ0hbKXmwh5aIRNt
         fDBJor8/cPONdq+l99LZPaoUJvb9lWcXFuSdI63Ujisty6z4E0qCFpVwtxhpe/Z9Sl9Q
         8EHtoeda8x6sEwA4CCGd47+g+TshN0WpCptP6wQ9DmlgGZoztvopvVK3QVxXxGgB8Z2z
         dz9AnDsC8mXLNghljlM/J17KCzEGYe8/c1HqvGS08tQRRBRXfkwS779dWsCMcawgXfdi
         p4JWbmDH/y4JpHNPkJgG1HkXYQACgx+YEEPHm2RTFdiOC9IB3Gzd5WszdqgMG/meFL8p
         S4Pg==
X-Forwarded-Encrypted: i=1; AJvYcCXRPkhg4YG6Yye10ieMhfdRsPhSscM2gIPtx5izw6DZrpwiNjj0LOWKEVvBQFCwr0/DQKma8s+h@lists.ozlabs.org
X-Gm-Message-State: AOJu0Ywm2Wqsft10moDDgykoFs0l1/JtAXHp2ZqvCN5c+N0lfrNXpsc2
	r8o0MKnVhE2gXZ8AwT9VgyIbLCi3SQRpFwG8a0uhNISS8nFJMDvv
X-Gm-Gg: ASbGncvJONsMMPWo50nCzukqZLcM0MAyDEGh/xK33TuY92NNfQx+RkZoxFltyfEil/O
	auiIEA9dW/7nJCZMOw8h8ZQfkWto3bO9G8Lt09LUttkmnuIn4vVAhw9mS/8y83VFW9G/7aEBLHH
	e+nXLh2AFDNzAkkx4Er6Zb728bwdHna5uwFk5sRcH3mNmHsrHLNLSS4FNASfTW5mXvkKhT6oOrj
	4fgZIAG2WAJhfHqlRQn/P+29LBAMHcxBarAf4xb3mSif+xuXlZM9hoXiIJqsOjbSqYuX0mQ1WrK
	u8EP1LcANuwRBhdk0Z28UQ==
X-Google-Smtp-Source: AGHT+IFmIR9Ae+L9E2pmOyCcc+X8PWxnJne3SU6MtRQ2xXHY6ezLUBmNIufZB6pkQGPkrrzXMSDgtQ==
X-Received: by 2002:a17:90b:51d1:b0:2ea:7fd8:9dc1 with SMTP id 98e67ed59e1d1-2f548edf181mr30621775a91.18.1736747773860;
        Sun, 12 Jan 2025 21:56:13 -0800 (PST)
Received: from yclu-ubuntu.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f55942188csm7768806a91.23.2025.01.12.21.56.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jan 2025 21:56:13 -0800 (PST)
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
Subject: [PATCH net-next v7 0/3] Add support for Nuvoton MA35D1 GMAC
Date: Mon, 13 Jan 2025 13:54:31 +0800
Message-Id: <20250113055434.3377508-1-a0987203069@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	FROM_LOCAL_HEX,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailman-Approved-At: Tue, 14 Jan 2025 10:50:13 +1100
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
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |  11 ++
 drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
 .../ethernet/stmicro/stmmac/dwmac-nuvoton.c   | 179 ++++++++++++++++++
 8 files changed, 394 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-nuvoton.c

-- 
2.34.1

