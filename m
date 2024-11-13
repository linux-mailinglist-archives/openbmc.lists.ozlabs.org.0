Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3C5A9C7E11
	for <lists+openbmc@lfdr.de>; Wed, 13 Nov 2024 23:05:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XpcmB3l98z3blg
	for <lists+openbmc@lfdr.de>; Thu, 14 Nov 2024 09:05:30 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::434"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731475202;
	cv=none; b=GlzgSXcUKmGVCGTuuVOdWq495kKBm7Cl+17TsSkAby9yyuu4+rvAVFo7BAXta3LlHxiB2TRriSjqJ9zCeHTXghmfKT7di63lQCb5D59+BUwekZc65fWY0UJ7AL4+RrXInZ8ryw1usuOr5BS0lECVZ8ol6LybJJGNW/rgbnDwD66kgCUwdGgvP4eazFp51fDcXMZOtl5ItW+s3f735Mh9qQofG82jpaZxno0G+YhQxMUtQ1Pj5oa6CbC1VT4ZcPwzGuH1uHG7OagJzxEswc6Yt0v47UsZqp1MTOtSMgCwMry2LMatHjloxz++bakSsQGq0rT07Gq2wfIANSXdazuozg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731475202; c=relaxed/relaxed;
	bh=Iwuqnvj/nbrL3+EwHhwq8mWZzBCYb5TWiIcYxHRcvLE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=jPh5MgOfWdNIl2iLZ3VcehmltUBNqdoZFayIUQiQtDUWIbS++jHIVOKPaQo8AI6IjXb5DxJr5F1o97bT+3BuTGdPRt49n3OV3Y+UbueqkTGegKy8I9qSSh7Wy0knl9vz4ExaotveGrvn9q0O7ZDjSBikbhSIOcQLhksH1xYlAoZ6DzIcHuE+1VQwkGIkWVmWEhMT+ldX3sarwEgVVtUaHmpM7fV8ZyiQwgdTkJWT2jTiXdOdAn3c0SC1Sa/SJdXw5DkVP0WtDn2lihoy8bpAbHwlxw0oPdK3oJVhFJ4OyhZnR+qxBBWs2o68aOQxdGfuCUquu9BvCFwZ3OSfVIgavA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=XUBg/7Kg; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::434; helo=mail-pf1-x434.google.com; envelope-from=a0987203069@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=XUBg/7Kg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::434; helo=mail-pf1-x434.google.com; envelope-from=a0987203069@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XpBS15nMDz2xb3
	for <openbmc@lists.ozlabs.org>; Wed, 13 Nov 2024 16:20:01 +1100 (AEDT)
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-71e79f73aaeso5416643b3a.3
        for <openbmc@lists.ozlabs.org>; Tue, 12 Nov 2024 21:20:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731475199; x=1732079999; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Iwuqnvj/nbrL3+EwHhwq8mWZzBCYb5TWiIcYxHRcvLE=;
        b=XUBg/7KgJRKAkcaQGlvaHZ4fdhYRl8UxdMfJr7POcaCbjYjZpNrAPU4HSDu+GUbmS8
         vSozYkBiAntQaQ2LpQmC5ES2T8qz4p3atWYcf4zMToYOg9YBUlHmeD5b3FhovAJlQ2Nn
         0SLAux+rPz5VDGOuIH+UXdmlhqbMrtRwI4/wlZQLxsh9VPoWhiuhQj7YscYphD5YRxZy
         HWdzhy5Dq+Nb2pNDIjAb+uJF8w704uDUov0NSDAjKXCK9+H7xZstI5Qf4iCXRgDEWkzj
         TXpsSJUzLNqxzVwMIRgEA7yr/4Zn+tmmOdeXMZsfmg9Bx2fQso9B0qJ3JTamSAXNLEsZ
         x1Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731475199; x=1732079999;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Iwuqnvj/nbrL3+EwHhwq8mWZzBCYb5TWiIcYxHRcvLE=;
        b=GNXCFvRniN9SFMC0FTIeYtVqs3i6YSwAlEoczFxe7SyQYbomJTI7Z0a7IHnV186r+Q
         WVPI5/71HmBWFFJdpAfYze0jGB6BlIuPiGp9XmW9Sux9Tt2KjW+WMTn4fhpqefMa6GJA
         M4kVzDSaLnHmhFUzngarcMXldtrXKE7XqbA42GiGSo4989vWSEmV5ww/cgW6cjSFCKj+
         opQBths/2kxGNfmH40YMKazpCjBEoBd9aEGTHtILsueV8JvQVqUh2fEhuZ6CkJ/P+OcV
         /5dbjybdLUUkRuzOaohtaWbU4VJotRBZGcXZ7uYWcPfrKPy2FZQM4E1lV/29lBiLfGOj
         TLCQ==
X-Forwarded-Encrypted: i=1; AJvYcCXS4CKWfKt9ISD9/DZ0ZgpHIABbexTPzl6kmDn4pnVxASh3wka9qkHegxk7IyimMu1ybxChcUp0@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yxw2KCqY7rOVJRRWRueCzjvaMj7Ktuv45+kAiaPMkR6+Cbwtv3T
	LUrC3acZyEFuehi1F6KRlJocuNkeJl2z58KqRb/swwix0xpWmt61
X-Google-Smtp-Source: AGHT+IHHLuQHdAS2u9WN0pIMIXl2KNf3Ujr3Tnj71CU1NlZaH8WrIseMiurWt5EYjyMM3qTV3eIdXA==
X-Received: by 2002:a05:6a00:2385:b0:71e:7887:81ac with SMTP id d2e1a72fcca58-72413349148mr23941105b3a.16.1731475198540;
        Tue, 12 Nov 2024 21:19:58 -0800 (PST)
Received: from yclu-ubuntu.. (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724079aaa01sm12644376b3a.100.2024.11.12.21.19.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2024 21:19:57 -0800 (PST)
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
Subject: [PATCH v2 0/3] Add support for Nuvoton MA35D1 GMAC
Date: Wed, 13 Nov 2024 13:18:54 +0800
Message-Id: <20241113051857.12732-1-a0987203069@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	FROM_LOCAL_HEX,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailman-Approved-At: Thu, 14 Nov 2024 09:05:26 +1100
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
Cc: devicetree@vger.kernel.org, ychuang3@nuvoton.com, Joey Lu <a0987203069@gmail.com>, netdev@vger.kernel.org, openbmc@lists.ozlabs.org, alexandre.torgue@foss.st.com, linux-kernel@vger.kernel.org, joabreu@synopsys.com, schung@nuvoton.com, yclu4@nuvoton.com, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
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
  dt-bindings: net: nuvoton: Add schema for MA35 family GMAC
  arm64: dts: nuvoton: Add Ethernet nodes
  net: stmmac: dwmac-nuvoton: Add dwmac support for MA35 family

 .../bindings/net/nuvoton,ma35d1-dwmac.yaml    | 170 +++++++++++++++++
 .../boot/dts/nuvoton/ma35d1-iot-512m.dts      |  12 ++
 .../boot/dts/nuvoton/ma35d1-som-256m.dts      |  10 +
 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi       |  52 +++++
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |  11 ++
 drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
 .../ethernet/stmicro/stmmac/dwmac-nuvoton.c   | 179 ++++++++++++++++++
 7 files changed, 435 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-nuvoton.c

-- 
2.34.1

