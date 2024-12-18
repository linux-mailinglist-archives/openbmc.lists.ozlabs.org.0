Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ECB79F6FA6
	for <lists+openbmc@lfdr.de>; Wed, 18 Dec 2024 22:42:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YD6bp0dwcz3cF6
	for <lists+openbmc@lfdr.de>; Thu, 19 Dec 2024 08:42:46 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::530"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734522298;
	cv=none; b=NA3UK/RdE4YYBzNrgp6jWIIJRlKPSueQ4bF7JnUzr5LpDnROVWsFVfsu7Ij1uio2H7Xl7kq772M6TICP+NFwTcINZw+f40OZPSCq2mJNaqlZFw5qWRQ/BVfgi3w6F786h80pi7Du0G9RJdotfAsZcZ6nCQQaAO8Qr57Rw0RIPyfo4mF7Tdy7M0lKXwb9M3PMdCtEChE0xNnTTJF08Lk56cVK9QvdR3Ks5WtngbPbBIfhkz5xXwmZBZssfU8li8gaIxh5A94KNIraijqbBlnjkifxzF9SaZlIF0TDW74ZFh+gYLsM62AT4Boy5KH13A8uu+nIZAwwtsOJmw5Xcy503g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734522298; c=relaxed/relaxed;
	bh=cyj8Ap7K1BZAQuE1yfehu91/jP7Zjmb2nNdeir2Wyz8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=fhTzUqquyiJmxbh1JBPPLagAs42Mh0KBoyMcGbx4ee8DFHAYuyHhxL+ZcLVqzFiYwTMIT6Yg02Q2Ods40eLALLf2PQy7jHvPfZY3o3lJTSR1sQOA3AF7M2fr58/tJqPDwKYLZ7YKleg5FBly85oIK6L2i8uQeL/pw6pXFyGeeZrpbo6Amjgi5iCA/CgtQ97BW6aukG5NV5W1b0gVe9/gBkZFYR5Ptd6An0frcUsnw4fAhDUUn/zCiUe/HI0HOUZwJdZcOTglEV2s5K7u7kTjX/px4D8JH3q+F4bUD6ypwrKbhdwRPap/eGC1vfeFOo+50R2rSLlPj/PAgDGMyickCQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Byn11Quh; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::530; helo=mail-pg1-x530.google.com; envelope-from=a0987203069@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Byn11Quh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::530; helo=mail-pg1-x530.google.com; envelope-from=a0987203069@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YCsL041zZz2xHF
	for <openbmc@lists.ozlabs.org>; Wed, 18 Dec 2024 22:44:55 +1100 (AEDT)
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-7ea8de14848so3497730a12.2
        for <openbmc@lists.ozlabs.org>; Wed, 18 Dec 2024 03:44:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734522292; x=1735127092; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cyj8Ap7K1BZAQuE1yfehu91/jP7Zjmb2nNdeir2Wyz8=;
        b=Byn11Quhf3boOdUOpzF3RrFQpFLSrFhRA4f6sHnvuUnUd/gD0wbe/GyyIIC5M20uKw
         1LvhQ1zAK5JoyI7iuJJdUaPrHUUSRSy9xA8/wP7mHe9hWlzeNXzVj5EgnDC6NjbyWpWe
         DRhlLLCO9HCwHMqjgRHq4SRBvuLgE5jkaUpPQGe+gtecXolAqoyZKHYQxlz09FmnUH65
         nRMNTXTGRg+PiLLdROL7sbSoBSoLCRs44zgQo3kO9ndEQWYoyonDYoWoxqL0Wrafvs1a
         CfakYmyUsLTrCvpwG6oZwrV9viWCC0fqZgQz2ZhD0eKJMVE7eYM0EQAHuXIi4SGb73s8
         7A0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734522292; x=1735127092;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cyj8Ap7K1BZAQuE1yfehu91/jP7Zjmb2nNdeir2Wyz8=;
        b=aWypiVwdsdoGkuIyfpXSO4k/gINDQpxw2PWczOag0lCX4EghB8hyaW54O2b4nK3k9o
         4UQx28zc4IWKd2PT6PcRqRuewssU5ZNTlwp8/PhDb0Z/XctVUXlvv+hrqn+o1AegqOu7
         6o8RuP0N1BGWaZHYAgVpdkl5JgEFfKxZvonJblmcJM8865dx6cHmjcqbONc+uc0Si14e
         sbTFUUpOucdnW773kAuvsBDx73btgPP4pAlwQ5a7hTPybv1OBN/SrYjSwmiJCXrsHSWp
         eQA2c/Iv7PYTpgN1pNxs7sJz2KWBMh4aAgll9ypK2PAu0O/xBXxXGlzapqnu1x5NuAtP
         oQoQ==
X-Forwarded-Encrypted: i=1; AJvYcCUdrhE1vcfrfmsarfchj7tlGRnRkLZjHaZl8S7EP+1LeNDYfBUo1gE0OEU9i+j4RiZ48/vmjdOJ@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxcryWGUxQXiv9em/kglauWqGGyCQUundsG0jEnUF+yMhYUst3Z
	B5adm+p1luPgelrIQvc95nutX/45PoSd3e12UlEy4Ew7yHvefc+s
X-Gm-Gg: ASbGncvGO0DTA8JtRLjgwyYh7VPpLO6i+74hv9gsnZunudxEb3HQpPJdtp3Om6v3kME
	VjEfqb9f+MTjli9yGlEE8sPD6f10Nh9J6KJRRUhT3pjwfU/0aqWTGbwSVOl/LioW8OENR9hzol9
	j1/lveAH+foeCb7/0LGWJIDEiUTRdcYRrWw9x0KnLiae/jw/Jnh68uiRsPNIqe1er+ZDZsqx0wf
	8S4k/+nbft6N2QO5t8KR99beUb3GTnrhq3/lE+W+gOEqiEmGSvbd0WjSUFElydsztAoMigdc1+F
	QzOyE3MHsglI92xWcRI7GQ==
X-Google-Smtp-Source: AGHT+IFRyIbN8ECWy6DzsuI2osZG7JECHco2/VwojjYl5BcOV/Bt3FlomuUurW8aE5vh8OivSmLSeA==
X-Received: by 2002:a17:90b:5251:b0:2ee:4b8f:a59c with SMTP id 98e67ed59e1d1-2f2e91fe20bmr3243768a91.22.1734522291709;
        Wed, 18 Dec 2024 03:44:51 -0800 (PST)
Received: from yclu-ubuntu.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f2ed62cddbsm1324362a91.15.2024.12.18.03.44.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 03:44:51 -0800 (PST)
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
Subject: [PATCH v5 0/3] Add support for Nuvoton MA35D1 GMAC
Date: Wed, 18 Dec 2024 19:44:39 +0800
Message-Id: <20241218114442.137884-1-a0987203069@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	FROM_LOCAL_HEX,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailman-Approved-At: Thu, 19 Dec 2024 08:42:42 +1100
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

v5:
  - Update nuvoton,ma35d1-dwmac.yaml
    - Remove the properties already defined in snps,dwmac.yaml.
  - Update dwmac-nuvoton driver
    - Add a comment to explain the override of PMT flag.

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

 .../bindings/net/nuvoton,ma35d1-dwmac.yaml    | 126 ++++++++++++
 .../devicetree/bindings/net/snps,dwmac.yaml   |   1 +
 .../boot/dts/nuvoton/ma35d1-iot-512m.dts      |  12 ++
 .../boot/dts/nuvoton/ma35d1-som-256m.dts      |  10 +
 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi       |  54 ++++++
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |  11 ++
 drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
 .../ethernet/stmicro/stmmac/dwmac-nuvoton.c   | 182 ++++++++++++++++++
 8 files changed, 397 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-nuvoton.c

-- 
2.34.1

