Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66822651C19
	for <lists+openbmc@lfdr.de>; Tue, 20 Dec 2022 09:02:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nbpvg1VWPz3c6y
	for <lists+openbmc@lfdr.de>; Tue, 20 Dec 2022 19:02:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=HLRPvp/3;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com; envelope-from=jim.t90615@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=HLRPvp/3;
	dkim-atps=neutral
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nbpv26Q3Pz2xJN
	for <openbmc@lists.ozlabs.org>; Tue, 20 Dec 2022 19:01:49 +1100 (AEDT)
Received: by mail-pl1-x636.google.com with SMTP id w20so4900680ply.12
        for <openbmc@lists.ozlabs.org>; Tue, 20 Dec 2022 00:01:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wy1qx/0Za3zU/0a34WdVh8eP80ZwdH8mGSZrNJRldY8=;
        b=HLRPvp/3RgzawnVYgVjubCWKwiwtfAHW7vZG5AQP9ZS64ljLVhYqZwE9ni9kwJkAUw
         ZfY5GFIb14k77B9q9rFGAa9emtAbGtc3PWkXIKxPLt4IdnG/Wyk+WmMzcYH4XUYCjoEf
         T7LFzbS9G2BTsTnA+tlxytOmjD3E1+/S+NJDO7U1+AFGvhjnUjsnnTVEzGXOUwAEzbxU
         ePgwJMSvkCpUQ47LHDO7nO2HMRcXbGlqpanpBChmhKp2VJtkjR0DXfb1XcWm9aGsZYVu
         o3MkOX3Ko5ctMThawLz+HtnCXEBsO7HRIYrMcs8d2RfxJTIfmm7NR9LZOLG35w9otKww
         3lfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wy1qx/0Za3zU/0a34WdVh8eP80ZwdH8mGSZrNJRldY8=;
        b=mE60AwHKdoMUZlJhx8Zfl9N2HCZLG/V6nCyKtlVcKsx3LhC8H6faFIwep3dAKdP9Wh
         XnA07e4dJtccwunkU+uxZJH8IoJgkGLH7Z9iMHqI2CKrVeadbKBhhrv9p5/6kWfwqecH
         drJCYd1doHBd9A/okmXTjmvX0kOXvmW2vI5wWuq7tr18LWB5C3wjJV6IcK+2RCwTcCK+
         MxonBxMKNUoQfys0KwfUyGTbWgVKH++M4zGEfc963K3XvuLpb3znq+nXdgRkqtA5AM3E
         MI77Ha77Z/UCZyJMQqHWZGl40m6WwiYQI5AnO6i32gAa177LGt0OenSrI2bmua7vGU0U
         xC/A==
X-Gm-Message-State: ANoB5pmt0fV53kIjZyBrDOfqHiBb1ezxCG3i24ZNGxJ6+/XHynLREFaB
	z0oFPD61IE/CRWkKZERkEmo=
X-Google-Smtp-Source: AA0mqf7M2k9C9yQQxaYaahkxKrjsrZJcfD1plTnFpz5Fd75VxSuzk3Xr/OWQKGyMZRerzs7992hpRg==
X-Received: by 2002:a05:6a20:6f08:b0:a2:df6d:e56b with SMTP id gt8-20020a056a206f0800b000a2df6de56bmr35561907pzb.14.1671523306671;
        Tue, 20 Dec 2022 00:01:46 -0800 (PST)
Received: from localhost.localdomain ([180.217.146.214])
        by smtp.gmail.com with ESMTPSA id u15-20020a65670f000000b00476d1385265sm7559179pgf.25.2022.12.20.00.01.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Dec 2022 00:01:46 -0800 (PST)
From: Jim Liu <jim.t90615@gmail.com>
X-Google-Original-From: Jim Liu <JJLIU0@nuvoton.com>
To: JJLIU0@nuvoton.com,
	KWLIU@nuvoton.com,
	jim.t90615@gmail.com,
	linus.walleij@linaro.org,
	brgl@bgdev.pl,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org
Subject: [PATCH v3 0/3] Add Nuvoton NPCM7xx SGPIO feature
Date: Tue, 20 Dec 2022 16:01:36 +0800
Message-Id: <20221220080139.1803-1-JJLIU0@nuvoton.com>
X-Mailer: git-send-email 2.17.1
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
Nuvoton NPCM7xx SGPIO module is combine serial to parallel IC (HC595)
and parallel to serial IC (HC165), and use APB3 clock to control it.
This interface has 4 pins  (D_out , D_in, S_CLK, LDSH).
NPCM7xx/NPCM8xx have two sgpio module each module can support up
to 64 output pins,and up to 64 input pin, the pin is only for gpi or gpo.
GPIO pins have sequential, First half is gpo and second half is gpi.

Jim Liu (3):
  gpio: nuvoton: Add Nuvoton NPCM7xx sgpio driver
  arm: dts: nuvoton: npcm7xx: Add sgpio feature
  dt-bindings: gpio: add npcm7xx sgpio driver bindings

 .../bindings/gpio/nuvoton,sgpio.yaml          |  83 +++
 arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi |  30 +
 drivers/gpio/Kconfig                          |   8 +
 drivers/gpio/Makefile                         |   1 +
 drivers/gpio/gpio-npcm-sgpio.c                | 639 ++++++++++++++++++
 5 files changed, 761 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/nuvoton,sgpio.yaml
 create mode 100644 drivers/gpio/gpio-npcm-sgpio.c

-- 
2.17.1

