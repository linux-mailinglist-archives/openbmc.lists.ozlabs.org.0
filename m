Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A05D981FDD6
	for <lists+openbmc@lfdr.de>; Fri, 29 Dec 2023 08:46:06 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=OIUKcVHg;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T1crD2rbFz3cLv
	for <lists+openbmc@lfdr.de>; Fri, 29 Dec 2023 18:46:04 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=OIUKcVHg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::231; helo=mail-oi1-x231.google.com; envelope-from=jim.t90615@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T1cqb1zxGz2xdg
	for <openbmc@lists.ozlabs.org>; Fri, 29 Dec 2023 18:45:29 +1100 (AEDT)
Received: by mail-oi1-x231.google.com with SMTP id 5614622812f47-3bbce1202ebso1254282b6e.2
        for <openbmc@lists.ozlabs.org>; Thu, 28 Dec 2023 23:45:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703835924; x=1704440724; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rSHwqKa1O5F2oXrIiKvFNvbBOMiFR0XtCw83IG7yVSc=;
        b=OIUKcVHgXxypOieWWm2ONAN/am2wduQKGl1K+oWqpfz/basf4MJm5rYzf1G865Cq4p
         XjokLg+HkwYG+fmj+gehXza780fMe2b72QmhrWvFp/Xst/FaoORtC05P169Y4uaVmxRQ
         MZgUFchReAgo9CMIoAeFiL0JMCLThTODf7J9KnseW1Y4E4lLJDTt1BJKCiYq5XD0UJIu
         HSlkMN/JnFUR+g9cIjzA5Zi8jdmOZW1ALX0/VKSS4g/7NQm+6393NXH2Wud4ZRZhiMUS
         u2n4IrqEYKNg+uWl78UBJDBrAUCxFCIvSrvKlttegJC/FHCyqTRU2dIzZUBpd3KWK9vC
         /OYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703835924; x=1704440724;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rSHwqKa1O5F2oXrIiKvFNvbBOMiFR0XtCw83IG7yVSc=;
        b=PJAOCTPkXL3UUTvprOz0sl26Ruq+9E5/HFMYirMXAo7tv+82gsGjVvHdevroDo4DWy
         W/tEveNQnbBppA6azeZJ/4KvPWtawP3CqIYnhmybdgol/Z6z7IQI22z66y7nY/pOaym4
         PjtvhakzzDkbkf48qcw7+Npty55f38Ogx0k8hUJdA2rsh5sd8x8e7aWvbn5B4ndrZOKh
         Qk6FWhP1SB7eouTWQV7w+GgnuXizw5EXXnJKZVrdD3FPayLs2VOhIVQLnqrTvDuYDy80
         RIhPcfRHAZDOHlM8LRXIC2y+2eH9LFl8khP7JjIa0Xmyty08VBlN2xkahpKWkU3YEJ/0
         1KSQ==
X-Gm-Message-State: AOJu0YymK5kfT6SA+F38Z0iSzBR/klazLLMJYQXh1be9B57lnaKGSMkd
	+pvIf0J33L4Amn8lu+S1m6s=
X-Google-Smtp-Source: AGHT+IFoYHqVzhNOZNnASAFhndS87+2zTbD3FPnw3A6TyKRQSRuMabJeS1Kg54KuDlJVbLfIrjXbiw==
X-Received: by 2002:a05:6808:13c2:b0:3bb:e066:7d27 with SMTP id d2-20020a05680813c200b003bbe0667d27mr1025603oiw.91.1703835924688;
        Thu, 28 Dec 2023 23:45:24 -0800 (PST)
Received: from localhost.localdomain ([1.200.140.173])
        by smtp.gmail.com with ESMTPSA id s188-20020a6377c5000000b005c683937cc5sm10305186pgc.44.2023.12.28.23.45.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Dec 2023 23:45:24 -0800 (PST)
From: jim.t90615@gmail.com
X-Google-Original-From: JJLIU0@nuvoton.com
To: JJLIU0@nuvoton.com,
	KWLIU@nuvoton.com,
	jim.t90615@gmail.com,
	linus.walleij@linaro.org,
	brgl@bgdev.pl,
	andy@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org
Subject: [PATCH v10 0/3] Add Nuvoton NPCM SGPIO feature
Date: Fri, 29 Dec 2023 15:45:05 +0800
Message-Id: <20231229074508.2709093-1-JJLIU0@nuvoton.com>
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

From: Jim Liu <JJLIU0@nuvoton.com>

This SGPIO controller is for NUVOTON NPCM7xx and NPCM8xx SoC.
Nuvoton NPCM SGPIO module is combine serial to parallel IC (HC595)
and parallel to serial IC (HC165), and use APB3 clock to control it.
This interface has 4 pins  (D_out , D_in, S_CLK, LDSH).
NPCM7xx/NPCM8xx have two sgpio module each module can support up
to 64 output pins,and up to 64 input pin, the pin is only for GPI or GPO.

Jim Liu (3):
  dt-bindings: gpio: add NPCM sgpio driver bindings
  arm: dts: nuvoton: npcm: Add sgpio feature
  gpio: nuvoton: Add Nuvoton NPCM sgpio driver

 .../bindings/gpio/nuvoton,sgpio.yaml          |  87 +++
 .../dts/nuvoton/nuvoton-common-npcm7xx.dtsi   |  24 +
 drivers/gpio/Kconfig                          |   7 +
 drivers/gpio/Makefile                         |   1 +
 drivers/gpio/gpio-npcm-sgpio.c                | 612 ++++++++++++++++++
 5 files changed, 731 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/nuvoton,sgpio.yaml
 create mode 100644 drivers/gpio/gpio-npcm-sgpio.c

-- 
2.25.1

