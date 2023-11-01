Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A3137DDB2A
	for <lists+openbmc@lfdr.de>; Wed,  1 Nov 2023 03:52:19 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Bc7FUPly;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SKs3y46Dsz3bt2
	for <lists+openbmc@lfdr.de>; Wed,  1 Nov 2023 13:52:14 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Bc7FUPly;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52f; helo=mail-pg1-x52f.google.com; envelope-from=jim.t90615@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SKs3K57shz2yLr
	for <openbmc@lists.ozlabs.org>; Wed,  1 Nov 2023 13:51:39 +1100 (AEDT)
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-5b8f68ba4e5so4733262a12.1
        for <openbmc@lists.ozlabs.org>; Tue, 31 Oct 2023 19:51:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698807093; x=1699411893; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jAvlH2KKSrgrOdp41LsORT+PHUNYgAsuoXWvSfHMDqM=;
        b=Bc7FUPlyvZrRqJ5LBu7lRiVkDFx6pAmY/FThS1yDmsRBUG3arsafV0S4FZKk93PrMi
         mgWf1AMP+4KICFsLqmxvtb5Uw9Y6u7tIyBLD5UBPXSqyvUPd8QaNQ0qS2GJqwW/6C40N
         39uQHNZ2JOl0HPe+wK3hqCULdarmPqFzOzJ+1FXvJEphCARr9TsiSG4uXn/u5hNpcqZs
         rakRWJUzyYa9Q8nCowi7At85QGWg6vabLAqTM35w+Iwe04R57jl0GNKlvfN1nnD/oGn2
         BpHK0XOFm9zK8KHQn/DwcGgRWjoPol+gAcuwJCJLMK16S69S1kLOyku0c9cp9l7/SX71
         PzNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698807093; x=1699411893;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jAvlH2KKSrgrOdp41LsORT+PHUNYgAsuoXWvSfHMDqM=;
        b=Tyb7Un8rqghAsyMQma5JHI1ZSje8BvT/AUuxn5aa6uI7JzAgECN4nrGue4vhPhIX2u
         SqArtbmYRUPYOhU5P0lh0mg1uJfDsujuX9r67EqDIqRdMcXXuFyaFBLg73bmAx1omUQU
         WriVS5mVvSYbSTj1LdvVLvy/7T8VJYl5Sxv7l3GBIzjMULD5uuje6iSPTvmb2e8IAic7
         cAuOQkWQhI7sAtJo6FD3sIYlPPBm3pMeSuy/+/OlEzXjIx70102XPBadxnOHrILBq6Sm
         XiCx0cUDHNGNAySDp9Il4Js9L9912b9N3Dmgvkw90w95zgGHR0/1+CCSHDw5rX9J0X3O
         8qTw==
X-Gm-Message-State: AOJu0YxuUVuio3G3vOixhwIuBPubhSARerKaBJi9s5O6ZDZb3mOxxA2N
	mTo/KgQrGo3f8P4aD1Y79T0=
X-Google-Smtp-Source: AGHT+IHDiK+kZAPBfUWvpNEUmF0l7IRvXNVXjxBE/GV8owTQaN1gy4eztarC4rUfXA6xBi8Z1I8l/w==
X-Received: by 2002:a17:90a:ead7:b0:27d:3073:88fc with SMTP id ev23-20020a17090aead700b0027d307388fcmr11170032pjb.41.1698807092965;
        Tue, 31 Oct 2023 19:51:32 -0700 (PDT)
Received: from cs20-buildserver.lan ([1.200.130.202])
        by smtp.gmail.com with ESMTPSA id m6-20020a17090b068600b002809074eb3esm1709685pjz.21.2023.10.31.19.51.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Oct 2023 19:51:32 -0700 (PDT)
From: Jim Liu <jim.t90615@gmail.com>
To: JJLIU0@nuvoton.com,
	krzysztof.kozlowski+dt@linaro.org,
	linus.walleij@linaro.org,
	andy@kernel.org,
	benjaminfair@google.com,
	brgl@bgdev.pl,
	jim.t90615@gmail.com,
	robh@kernel.org
Subject: [PATCH v7 0/3] Add Nuvoton NPCM SGPIO feature
Date: Wed,  1 Nov 2023 10:51:07 +0800
Message-Id: <20231101025110.1704543-1-jim.t90615@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: linux-gpio@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This SGPIO controller is for NUVOTON NPCM7xx and NPCM8xx SoC.
Nuvoton NPCM SGPIO module is combine serial to parallel IC (HC595)
and parallel to serial IC (HC165), and use APB3 clock to control it.
This interface has 4 pins  (D_out , D_in, S_CLK, LDSH).
NPCM7xx/NPCM8xx have two sgpio module each module can support up
to 64 output pins,and up to 64 input pin, the pin is only for gpi or gpo.
GPIO pins have sequential, First half is gpo and second half is gpi.

Jim Liu (3):
  dt-bindings: gpio: add NPCM sgpio driver bindings
  arm: dts: nuvoton: npcm: Add sgpio feature
  gpio: nuvoton: Add Nuvoton NPCM sgpio driver

 .../bindings/gpio/nuvoton,sgpio.yaml          |  86 +++
 .../dts/nuvoton/nuvoton-common-npcm7xx.dtsi   |  24 +
 drivers/gpio/Kconfig                          |   8 +
 drivers/gpio/Makefile                         |   1 +
 drivers/gpio/gpio-npcm-sgpio.c                | 649 ++++++++++++++++++
 5 files changed, 768 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/nuvoton,sgpio.yaml
 create mode 100644 drivers/gpio/gpio-npcm-sgpio.c

-- 
2.25.1

