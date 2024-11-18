Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B74FE9D1AEC
	for <lists+openbmc@lfdr.de>; Mon, 18 Nov 2024 23:09:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xshcq0292z3cV5
	for <lists+openbmc@lfdr.de>; Tue, 19 Nov 2024 09:09:47 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731918458;
	cv=none; b=fUQjeM/ZtfyT57If9+489yORNiTOpv12K1VuwINrvZpkC5kXWsVKZLGOcel9dvymL6V1IB0GHwr96rQLMat6yCVyKrZ8U8raFB6Nmb2bR4o1wd01kstX+HtkETWndtPl1b5GiwKDuh9X7uKzzy2WhsFlcZZjX005Df78D98Tza4UloW6ZwXUEEKeMqVjDjjxgXxwPE2kI+FonvkuVjA1Rd2/WbhTabgO9Fr1fuWVXS6rDPCZPVBVUkO/7/fbGPn26M4UWmqcxPzccHc2VHaDonJkA4Uz9qun8Wp1JH2S0gHczy5H4NT8RJREMRQ9ZJoY9ZYSCczpJHb6WMz7/pyKGw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731918458; c=relaxed/relaxed;
	bh=gkSbdNRIUJlQANFk/zwDmvqLsXhMldYS43rY4RRFAzE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=a/GYt1DIvrbtIJpqVYuIgs2k3fbotdxA+EaaM1XkxuxOvPcAAe9p6NI9qBsHAsqt2uSdYk00dfzRaLXSfI5D8yB8+8u2eHkK8MuR1peMdr3SZ1Vl4TpHgry2gMhDL+h16Rti3bhMvjoJT4Yi12356Yzh0aeF2gR27fs5SAEgouf4O42jJKZ86irlvOjm6/V4/G8uXDgENSvGGtW4RB5bOzq0OP/VX1Xw1uAkp/8rPy1OcOIF7qV2if5x9AlPJDdsBjDod5mdaRPqwsoulJ+76Bf6fEmdpmE+9NhKrUQFlbYtw8A+tQX9KJcXsCmlAu6TRPHp7kKIzpdmpEuODsbCRw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=DTXlP7ik; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62f; helo=mail-pl1-x62f.google.com; envelope-from=a0987203069@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=DTXlP7ik;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62f; helo=mail-pl1-x62f.google.com; envelope-from=a0987203069@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XsLN84B9Bz2y65
	for <openbmc@lists.ozlabs.org>; Mon, 18 Nov 2024 19:27:35 +1100 (AEDT)
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-20cbca51687so13458355ad.1
        for <openbmc@lists.ozlabs.org>; Mon, 18 Nov 2024 00:27:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731918451; x=1732523251; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gkSbdNRIUJlQANFk/zwDmvqLsXhMldYS43rY4RRFAzE=;
        b=DTXlP7ikT8GGD8eCQ1CA+aw8dsk5ybvh/UddUWkQ7YKFZqtRAf0lxnu3WtPIts1DaV
         pp/4OdW0lPVjnXioQzPsqsA6v88Sujaq7CurHjdcdUJ08bO82ST4xr2WBkHFVrBpf53g
         BwAElpdR42m69W6/UEq4VcaAeibdIykt/DYTsB9vd1YER1woJvHuIljuXDRc+6RoEoV3
         FR1QQyitOTtp+9suXudPRUk3Z5cA9w66pn104n/IdFdo/7fhtqjbrabpN4Ej88y54/iN
         a87ygHKHSzrLaui2F6Yv/4wVg3kPaJMXJLS6fSdfUCOH1OfXwzW4G7kzG8lG9DqBzTff
         vwGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731918451; x=1732523251;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gkSbdNRIUJlQANFk/zwDmvqLsXhMldYS43rY4RRFAzE=;
        b=r6dxIA5egFE31Oit2vhiXVwVGic+8/rEI0OYwmgI4dnxS40qJaC/TRmfFoqeBaZxET
         cKhEXPWYnA00uUUsFuM28zBcWMv9lY4pcPmTzzYDZ7MmRdrJ/+xGfmmGNZFw4JmfIwGS
         V9GGGfcAa7i7U4lXweGNmuz6tzA/J0b6CLIY7SusNlU6jJY5qgNZuwAfNwzSsaRtICCQ
         mayiCSl4uEhE+KivoFdGtueta7U65ocG8GtCd4yMDkZPaOsfDyr3FdQT384tWzJvWxUl
         JNjecKM4LzsggexJjDTa6xZYlwBRSQx9vEgii6bga335g7Sxirm7/vejD26vgUOpBsb9
         Twjg==
X-Forwarded-Encrypted: i=1; AJvYcCX+a2Z81PdR5UfW4mVRiMvCljjaLB/CCpPDHccont/gtFeIMN3HxmEiufgdh41bU8xj9Izc0GZ5@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzYLTfIxNWRI3aSAEO1oKLO9XgqUlcJQMM1l5s0+Lm0uIp7FTlR
	I9LFGp/mhiaMizNkAcE38zAV8CPOtigmDOKQhijifQlTB7aRYjDh
X-Google-Smtp-Source: AGHT+IEvoyj4wxb7J7Wh84n7jGX2+vtLnvotel8z2KtjVjP3hhCMcqWSJASSXlB0gPXXOqon5nxuTg==
X-Received: by 2002:a17:902:ec8f:b0:20c:a692:cf1e with SMTP id d9443c01a7336-211d0ed9a12mr171662035ad.43.1731918451221;
        Mon, 18 Nov 2024 00:27:31 -0800 (PST)
Received: from yclu-ubuntu.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211d0ebbf9esm51883815ad.45.2024.11.18.00.27.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2024 00:27:30 -0800 (PST)
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
Subject: [PATCH v3 0/3] Add support for Nuvoton MA35D1 GMAC
Date: Mon, 18 Nov 2024 16:27:04 +0800
Message-Id: <20241118082707.8504-1-a0987203069@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	FROM_LOCAL_HEX,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailman-Approved-At: Tue, 19 Nov 2024 09:09:45 +1100
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

 .../bindings/net/nuvoton,ma35d1-dwmac.yaml    | 173 +++++++++++++++++
 .../devicetree/bindings/net/snps,dwmac.yaml   |   1 +
 .../boot/dts/nuvoton/ma35d1-iot-512m.dts      |  12 ++
 .../boot/dts/nuvoton/ma35d1-som-256m.dts      |  10 +
 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi       |  52 +++++
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |  11 ++
 drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
 .../ethernet/stmicro/stmmac/dwmac-nuvoton.c   | 180 ++++++++++++++++++
 8 files changed, 440 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-nuvoton.c

-- 
2.34.1

