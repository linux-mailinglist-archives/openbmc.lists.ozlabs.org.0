Return-Path: <openbmc+bounces-690-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 294F2BA14C8
	for <lists+openbmc@lfdr.de>; Thu, 25 Sep 2025 22:06:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cXl98566kz2yrm;
	Fri, 26 Sep 2025 06:06:36 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::435"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758830796;
	cv=none; b=RPkNcMuw+lU5LDgjVBMj2W+XjQFViUQI+fUIFYjsJEBNajv5Gq1MOPiqKkDRZ+jgTnlR99JqT4efnwed53pHLYUMuP8PT6WvMddlQ/UAEAax903hokKd/kHxxghU11FbnaB17B6tS652a1nbpu1RIy4Ah+APLgrv+XFnl8XVlBOZBJXDTHi3Q5oT52AUAahEvmFZcKq+Q7gsOaFR6u3I/7ixfApcIBbxmTxia3S76Z2PE9AWlJI+USAMicKk6C4JPYCTPpugelKYs9JmKRv0oTrgIJRlP5EtOfXCdSQzXNrMNt7qrkghp+1PhLFBTgJkM3bzmLoTmdmklizWnkMr7g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758830796; c=relaxed/relaxed;
	bh=0bkqtjlf9n6TLED2N6uTdBB8WnIl90DnUC/z2JWcNCs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=jfMopIDToYv/zt2xR2ggGIo1kAZaRpbSUCiS6nR1c05NO9d9kFbAQr56AAtZ1GHYcb1zFRX2M+Y/7o7+0uwzaBlJ2vYsF8SoD4YrpQqXsNOEjAZEgUpvWTjSfptOYzvZ8VwvK8rmohD67Q/TVUQcFnjzkf3rzg/GpPr4Pn+F7hHJ96Er0RMsTNhXhMEHhPm0MfsCpGPfBlvABb7kR0rGpVAumrL2t5r+meBRyJOiJove4qzOn23upDItC281kLpRqpW427RcNAX+6rwcpFWk2NLsVv9ArH3QZ5gTQnS9XRwy+JRfkSI5DLOEZq90Zbf16CLB/7hBCqcpBUCTbA0CMw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Ly37BmQU; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Ly37BmQU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cXl971x7yz2yCK
	for <openbmc@lists.ozlabs.org>; Fri, 26 Sep 2025 06:06:34 +1000 (AEST)
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-3ee64bc6b85so1293939f8f.3
        for <openbmc@lists.ozlabs.org>; Thu, 25 Sep 2025 13:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758830789; x=1759435589; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0bkqtjlf9n6TLED2N6uTdBB8WnIl90DnUC/z2JWcNCs=;
        b=Ly37BmQUMzZi774vpv1UcBx9q99E8rvZ4VEa8mZg3Vvdw/zImnH/wemTuVm/K80RTF
         LVFdwi9+I76Hqy6kfteMQBgX68IVjm3hx3jMYbq/RNE15rVJM4mxHskaeuv5MUFUMZjh
         bU/8wXCUuR2i1nvIxg7/y2FurdPyCFE1ulgGl8To3tFaFQbqLWjdqJe4ca/PG0IjSetj
         OyzcJwt2JP7GavI/Zh+EwFQBWM+CknmFvZRS1c5IyKUwhvClUujAQ8cWFNfKOnwcqluL
         1C7BbKRUQjLQHtCg0JtnCtl+vE+zYBFUVSubkH/rDvkM+a7+u5ryBnxM2uBF2CMqbI+3
         xTdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758830789; x=1759435589;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0bkqtjlf9n6TLED2N6uTdBB8WnIl90DnUC/z2JWcNCs=;
        b=fxAWenGr1ryUM4uMtiaIeCWYyVRcCMvSU5fNB2cyZvuqzmthb0moF1SR9+gHQgueEG
         XVZl1anbOxZTN0UD0KKE17bnuhKeqB9GzuvfinrLbb1MipqBEbqnHVMUSb/lCcNW1kR4
         1eu2jFidTic/wNc1xyw7ORKdpF5JrYDk+uumGprmEbiKKzZ6XkVbw5OwQCjWUkdB8uAL
         Zdg8X9d3JlVr1A6QxqbsRtOw+UvwW+Eovt33xysURA5euR+AisozGVO/C3nmeqGe1e7x
         XbldmNBvBrNYZEH8V4b/kPIFqxAXEF4L7TKlXKYiILvrkZMJ2uxLjf1JfbNXw41LreD0
         CJVA==
X-Gm-Message-State: AOJu0YwtJSQb2N9LLRGA17syqa1zwm0pST4lHyoXqbZ4zA0QrndGdjvb
	jlgQtxxXEvMbrtEi4atrVYASN9ZzOmpIt9siTuZpowDR+jk3RjCkr0y+
X-Gm-Gg: ASbGnctZ8DcNQyUeqwjSWwbflRKIF9Lla4zZDFZxfTzTz02RUM0Cv+BTCoXhFkFWb4Q
	XRU2ziXXnmfFXh3tKz1GNRG7zJC7Ju0E5pJRjNvAobakBF5cwBhpgcu3yICmycTKWmbCEDk9o+9
	aZ4UOANGKlG8qr+AYbebzJBwTXmyAm1VKl3F0jMCks/FsUB2m12dj4bi+Of/gfIC8nbRWt6ZdYq
	lbaFxk/snSUGiu/LZ51GnnyKt4wk/cl4g8WQBeULEon+Ih+lkFeEquKnlmoNzHBajd3KwF5jJCV
	+ZaLAnUaP0lkVJ75Zzc2svP+CkA8H1pcI6NdI5v5YAwLAyrO3KRqiaFA6ret6B9DtzuZHtGgj6V
	95B8aINRspiMBwwBm8FMf6ld5taLCPU7OtA==
X-Google-Smtp-Source: AGHT+IGm5p2OFZYRHMpG1LWIjpAJsc2Ei0YFDZH7Y5FaApdjCSa5UwduVKsthgoMsYChaswBxq5scA==
X-Received: by 2002:a05:6000:24c4:b0:3e7:45c7:828e with SMTP id ffacd0b85a97d-40e481be755mr5162838f8f.33.1758830789339;
        Thu, 25 Sep 2025 13:06:29 -0700 (PDT)
Received: from taln60.nuvoton.co.il ([212.199.177.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e34074983sm43901835e9.10.2025.09.25.13.06.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 13:06:28 -0700 (PDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	avifishman70@gmail.com,
	tali.perry1@gmail.com,
	joel@jms.id.au,
	venture@google.com,
	yuenn@google.com,
	benjaminfair@google.com
Cc: openbmc@lists.ozlabs.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Tomer Maimon <tmaimon77@gmail.com>
Subject: [PATCH v3 0/3] arm64: dts: nuvoton: add NPCM845 SoC and EVB support
Date: Thu, 25 Sep 2025 23:06:22 +0300
Message-Id: <20250925200625.573902-1-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.34.1
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
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

This series fix warnings and adds device tree support for peripherals on 
the Nuvoton NPCM845 SoC and its Evaluation Board (EVB).
The first patch fix warning and arrange node order.
The second patch introduces peripheral nodes for Ethernet, MMC, SPI, USB,
RNG, ADC, PWM-FAN, I2C, and OP-TEE firmware in the NPCM845 SoC device tree.
The third patch enables these peripherals for the NPCM845-EVB, adding
MDIO nodes, reserved memory, aliases, and board-specific configurations
like PHY modes and SPI flash partitions.

The NPCM8XX device tree tested on NPCM845 evaluation board.

Addressed comments from:
	- Andrew Jeffery: https://patchwork.ozlabs.org/project/openbmc/patch/20250908125938.3584927-2-tmaimon77@gmail.com/
					  https://patchwork.ozlabs.org/project/openbmc/patch/20250908125938.3584927-3-tmaimon77@gmail.com/

Changes since version 2:
	- Fix dts warning
	- Arrange node order by ascending unit address.

Changes since version 1:
	- Fix commit message
	- Fix dtbs_check warnings.

Tomer Maimon (3):
  arm64: dts: nuvoton: fix warning and nodes order
  arm64: dts: nuvoton: npcm845: Add peripheral nodes
  arm64: dts: nuvoton: npcm845-evb: Add peripheral nodes

 .../dts/nuvoton/nuvoton-common-npcm8xx.dtsi   | 732 +++++++++++++++++-
 .../boot/dts/nuvoton/nuvoton-npcm845-evb.dts  | 440 +++++++++++
 .../boot/dts/nuvoton/nuvoton-npcm845.dtsi     |   7 +
 3 files changed, 1160 insertions(+), 19 deletions(-)

-- 
2.34.1


