Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 43C3080E489
	for <lists+openbmc@lfdr.de>; Tue, 12 Dec 2023 07:52:49 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=lqsoNAft;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sq8SZ5PQhz3c13
	for <lists+openbmc@lfdr.de>; Tue, 12 Dec 2023 17:52:46 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=lqsoNAft;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::435; helo=mail-pf1-x435.google.com; envelope-from=jim.t90615@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sq8S25NyFz2ygY
	for <openbmc@lists.ozlabs.org>; Tue, 12 Dec 2023 17:52:17 +1100 (AEDT)
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-6ce9c8c45a7so3275829b3a.0
        for <openbmc@lists.ozlabs.org>; Mon, 11 Dec 2023 22:52:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702363933; x=1702968733; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kTf2cuqewiPrk1RQQoqt4/IkxJXXPXtDeMWQFMEZ4Hw=;
        b=lqsoNAftCDwfiY+b6z4TWgqyQeJ/o3ogEy/j6xw+KbyECafDR7cchMUQlhWo+7nlDC
         aArUQILQKjlJeeLd+hHG5Yipd8cy8sLfdIEb0kVgEj6C+HaqQkpB7k7iH5Gu21DqqMch
         VsRMHQnYr36nFlNTZqiCrgbcVXxczHTQPS3uxGaIqlDrqkj8eBA9qwHDHloRpSqWo1Ub
         slwCI8avAo1Skb90L1by93BL6fpCDe/WxseF87BjD6nbfwtqy3tXCsEiTVa7rheEfA3e
         iUUXoaTmuh2hhsGJ1VY/T7Nz7msyVfFWsmKhm4TPij09mOBIbFzeNS8x0eHADc4lYRK2
         ZkNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702363933; x=1702968733;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kTf2cuqewiPrk1RQQoqt4/IkxJXXPXtDeMWQFMEZ4Hw=;
        b=wJ5JB1vsID/yPVCS72pPQi0tEXHO2yr7JHiSLnHV2chrDbtihjvyBPXS003YJ3rj0P
         +m5eRTQmFBidnU0xO6xFG4Zi+GE0hgxQ/rWy5nKUuFcgo2DPcFndVh1lZ6YkXIAeELRo
         vmssYNHjYpY78oZigBVHgTUfZMqkGKTPiptv+gid0sfKTLrxWsOaEWrutG8oOsprzv7E
         I2dixdrrKTSDC4Rt/QyyD8eA84E5yhESlm1tgqjnm7cMflL2XOR6bNn8tFSbNZNUbH+n
         eUU/7ZzSBOl7tED5Sl2jEab7+bxvs/jq8oClzHOw5sL8PROPWkvdp0lST9X55/h4FJpr
         KWpA==
X-Gm-Message-State: AOJu0YxTokTFYaYlXnQD0SfLMj04cZlYi2eDsPly2cQNPlG5EibaVDSj
	k5TZcJqbhQrAGuWVR7PKhQhdYVkKzRBX+Q==
X-Google-Smtp-Source: AGHT+IH7Lpx23pIFrf41IMWWQR20J3LQ8P14JiziXUXV88Cyrk6LtlNKTDlumeVyZW/StlZIysKFjQ==
X-Received: by 2002:a05:6a21:999d:b0:18f:fb0d:e961 with SMTP id ve29-20020a056a21999d00b0018ffb0de961mr3104973pzb.60.1702363932793;
        Mon, 11 Dec 2023 22:52:12 -0800 (PST)
Received: from localhost.localdomain ([1.200.151.130])
        by smtp.gmail.com with ESMTPSA id z3-20020a170903018300b001d0c4869725sm7855221plg.97.2023.12.11.22.52.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 22:52:12 -0800 (PST)
From: Jim Liu <jim.t90615@gmail.com>
To: jim.t90615@gmail.com,
	JJLIU0@nuvoton.com,
	KWLIU@nuvoton.com,
	linus.walleij@linaro.org,
	brgl@bgdev.pl,
	andy@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org
Subject: [PATCH v9 0/3] Add Nuvoton NPCM SGPIO feature
Date: Tue, 12 Dec 2023 14:51:44 +0800
Message-Id: <20231212065147.3475413-1-jim.t90615@gmail.com>
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
to 64 output pins,and up to 64 input pin, the pin is only for GPI or GPO.
GPIO pins have sequential, First half is GPO and second half is GPI.

Jim Liu (3):
  dt-bindings: gpio: add NPCM sgpio driver bindings
  arm: dts: nuvoton: npcm: Add sgpio feature
  gpio: nuvoton: Add Nuvoton NPCM sgpio driver

 .../bindings/gpio/nuvoton,sgpio.yaml          |  86 +++
 .../dts/nuvoton/nuvoton-common-npcm7xx.dtsi   |  24 +
 drivers/gpio/Kconfig                          |   7 +
 drivers/gpio/Makefile                         |   1 +
 drivers/gpio/gpio-npcm-sgpio.c                | 635 ++++++++++++++++++
 5 files changed, 753 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/nuvoton,sgpio.yaml
 create mode 100644 drivers/gpio/gpio-npcm-sgpio.c

-- 
2.25.1

