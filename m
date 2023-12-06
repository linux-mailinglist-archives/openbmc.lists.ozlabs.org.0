Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A27680645A
	for <lists+openbmc@lfdr.de>; Wed,  6 Dec 2023 02:46:54 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=EkyJTNyX;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SlKyM681yz3cfB
	for <lists+openbmc@lfdr.de>; Wed,  6 Dec 2023 12:46:51 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=EkyJTNyX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52a; helo=mail-pg1-x52a.google.com; envelope-from=jim.t90615@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SlKxk2R0rz2yVb
	for <openbmc@lists.ozlabs.org>; Wed,  6 Dec 2023 12:46:16 +1100 (AEDT)
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-5bdb0be3591so4001357a12.2
        for <openbmc@lists.ozlabs.org>; Tue, 05 Dec 2023 17:46:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701827171; x=1702431971; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AqnaYhpCrvu4j/R7wQBWuZ3sMmDCeUlCefM7DEmKBhI=;
        b=EkyJTNyX+Hmq1h0I5Ib+5yCTmuzAqyeEkEx+Xh0uQ3mCv/29au2u7LwMkcqLtY+34p
         s/7EQVeV/J5yIGQMMMXmgfT5ERQc3NP0TUK/w3OsfYpZ/2o/Txm6d6HwStLcL06LdrTE
         Id+XKJP5GbpNegp7aCnV495iGqBy1gO4i6Q4k4fOA54dMQHI6G7BminmjnDAmlTgX50K
         h9lalrEhFx7zzddxT9bnej6DiDIQnublGx9U0pqRMrO0ZZxoWDKXgC0PpQ6UZBgEsUOV
         6II9uvAgrUvH++80OEHC32WQRQ8vMF3deU3Rc5aflXYdmrGOEknJCfRLVOnaXJGcisML
         UkYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701827171; x=1702431971;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AqnaYhpCrvu4j/R7wQBWuZ3sMmDCeUlCefM7DEmKBhI=;
        b=Gvi5hAG5TgAM/NJ7rjLbhBwTEc97FDBFGP1GyhSiRvX5Ukaa5r18Ft/YhEE+8a9qH4
         tF7nsEEMm4ArtgJ9w65CtpvczvKKTcIq0uR/AeC0j+PwW5j+NeRlPX7ZTz8PrMr4xe3f
         LgcHLBVgRcAq2U9mQLzCqTXxihe/kOjFLpioJ/hieAnrd6zDaQXtmuE/VlPTdk0wLAbr
         m4BEe9KDvXimpJG7VKA39L2En48CbN03fbWTqxvr1JKd1i8lpIk95UhfeclxaeNkT/zv
         heOxc1XqhBHPU7zRH+TmbML+FDbdV81sFtxD7Bl6Cwlg8PeqO2JooH4fKoP8QJoMqKLP
         wBgQ==
X-Gm-Message-State: AOJu0YwgbpTNj0C6iK+f4AtL8ecYctUGmqkR/7WFQNNq7IQdmjzhz3tX
	OWtLQw1tQeGufJTF/DI3uVA=
X-Google-Smtp-Source: AGHT+IE4OEO6AuDf+OS54EW0+E56+iiZ+R9SGm3qCf4t5dLhN0MKFbtRXY+ezoGotQNnhg6g1OocqQ==
X-Received: by 2002:a05:6a20:7484:b0:18f:97c:8a1c with SMTP id p4-20020a056a20748400b0018f097c8a1cmr145930pzd.71.1701827170873;
        Tue, 05 Dec 2023 17:46:10 -0800 (PST)
Received: from localhost.localdomain ([112.78.94.69])
        by smtp.gmail.com with ESMTPSA id g24-20020aa78758000000b006ce781f6f85sm1250956pfo.43.2023.12.05.17.46.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Dec 2023 17:46:10 -0800 (PST)
From: Jim Liu <jim.t90615@gmail.com>
To: JJLIU0@nuvoton.com,
	krzysztof.kozlowski+dt@linaro.org,
	linus.walleij@linaro.org,
	andy@kernel.org,
	robh+dt@kernel.org,
	conor+dt@kernel.org,
	KWLIU@nuvoton.com,
	jim.t90615@gmail.com
Subject: [PATCH v8 0/3] Add Nuvoton NPCM SGPIO feature
Date: Wed,  6 Dec 2023 09:45:27 +0800
Message-Id: <20231206014530.1600151-1-jim.t90615@gmail.com>
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
 drivers/gpio/gpio-npcm-sgpio.c                | 637 ++++++++++++++++++
 5 files changed, 755 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/nuvoton,sgpio.yaml
 create mode 100644 drivers/gpio/gpio-npcm-sgpio.c

-- 
2.25.1

