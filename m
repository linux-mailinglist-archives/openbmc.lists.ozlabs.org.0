Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AADF5663B24
	for <lists+openbmc@lfdr.de>; Tue, 10 Jan 2023 09:33:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nrkbk3V9Nz3cDT
	for <lists+openbmc@lfdr.de>; Tue, 10 Jan 2023 19:33:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=WPR2v5fh;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42e; helo=mail-pf1-x42e.google.com; envelope-from=jim.t90615@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=WPR2v5fh;
	dkim-atps=neutral
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nrkb91XJsz3c6G
	for <openbmc@lists.ozlabs.org>; Tue, 10 Jan 2023 19:32:51 +1100 (AEDT)
Received: by mail-pf1-x42e.google.com with SMTP id y5so8233732pfe.2
        for <openbmc@lists.ozlabs.org>; Tue, 10 Jan 2023 00:32:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zJ/v0pFfGvRs3zyXE24+cF6mCJewg5X+XGBEKPnV2CI=;
        b=WPR2v5fheduYSJiBQxrVo5qTgujdxcxL7ORJorYz7h6tbfQy0HP1i5zFKeQ/+H3cP2
         menpkORMbtOJx4istwVMzZtmwn1Z42iCe4wi2a4Gueu40pBPpjmtdRr4j3QpZfTQM30Z
         Ui5aqZtXT6TPpTNjzwj/pmfspFTDifjEGA83H+MvMWjejJNSXWLE+ced7exUbbZ4rhnf
         aqCQ9jtBR4FN8JG61Q5Abn+R70Kp5FMk01dICqdfWDJMyOqustgHQkUrxnqBnRGbc0Dm
         I5oa1i/yUZsfTTC4qBbry3fv/meYH/bZ6tWl+Xn7DsiUkD6ZpLgHq0YHJv39nbNfMWkE
         vZRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zJ/v0pFfGvRs3zyXE24+cF6mCJewg5X+XGBEKPnV2CI=;
        b=UjpVX65bp7HGi/NmD0pWnKCkD9yX7C2NctQQufRLe90RTzUCDTRymyOKt9ONse4OQ/
         jzN5A+rKLSWBlI9aD+Rk7MkF/pwyab3Hs9NQrLXgtMGzL1vgxN8yIR1aNmb3RFAtbtQE
         GwPn5XvcsyVSQSla7v5vY6rfGmqFBptMFwEHtlgqOdVoKUz0oxzj+KOjfvQ+M+WTE7Yy
         r8pnyJiEt0cmBHoGlxx9y/nSi0pN2a4G8qFA9CicIJ4tUFiFERONP1V8+gDJK6Yhy763
         klRk56gGknrcSavoeZ1VLPqrg/ZrvXAYUbHwQIjL9NehqC823ddTh022/Wj6HwYzaoz3
         JurQ==
X-Gm-Message-State: AFqh2kq8YbPXEqJ+cyG11WJzQV4RnggB0bcXC4lRH9gNuXYKT6BwugEI
	MEfYibIwpCLSq2SWK0iK06U=
X-Google-Smtp-Source: AMrXdXu+hHR68hXixfc3ZQpC3Oj7EAgo2UK2shNrYDW+vTHbQBVXzRZFO8OgSppGWc6wO78kSEQSMw==
X-Received: by 2002:aa7:8043:0:b0:573:487d:e852 with SMTP id y3-20020aa78043000000b00573487de852mr76820952pfm.4.1673339569264;
        Tue, 10 Jan 2023 00:32:49 -0800 (PST)
Received: from localhost.localdomain ([180.217.149.10])
        by smtp.gmail.com with ESMTPSA id z3-20020a626503000000b005871b73e27dsm5064950pfb.33.2023.01.10.00.32.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jan 2023 00:32:48 -0800 (PST)
From: Jim Liu <jim.t90615@gmail.com>
To: JJLIU0@nuvoton.com,
	KWLIU@nuvoton.com,
	linus.walleij@linaro.org,
	brgl@bgdev.pl,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org
Subject: [PATCH v4 0/3] Add Nuvoton NPCM SGPIO feature
Date: Tue, 10 Jan 2023 16:32:35 +0800
Message-Id: <20230110083238.19230-1-jim.t90615@gmail.com>
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
Cc: linux-gpio@vger.kernel.org, openbmc@lists.ozlabs.org, Jim Liu <jim.t90615@gmail.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This SGPIO controller is for NUVOTON NPCM7xx and NPCM8xx SoC.
Nuvoton NPCM SGPIO module is combine serial to parallel IC (HC595)
and parallel to serial IC (HC165), and use APB3 clock to control it.
This interface has 4 pins  (D_out , D_in, S_CLK, LDSH).
NPCM7xx/NPCM8xx have two sgpio module each module can support up
to 64 output pins,and up to 64 input pin, the pin is only for gpi or gpo.
GPIO pins have sequential, First half is gpo and second half is gpi.

The datasheet can reference HC165 and HC595.

Jim Liu (3):
  gpio: nuvoton: Add Nuvoton NPCM sgpio driver
  arm: dts: nuvoton: npcm: Add sgpio feature
  dt-bindings: gpio: add NPCM sgpio driver bindings

 .../bindings/gpio/nuvoton,sgpio.yaml          |  92 +++
 arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi |  30 +
 .../dts/nuvoton/nuvoton-common-npcm8xx.dtsi   |  30 +
 drivers/gpio/Kconfig                          |   8 +
 drivers/gpio/Makefile                         |   1 +
 drivers/gpio/gpio-npcm-sgpio.c                | 647 ++++++++++++++++++
 6 files changed, 808 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/nuvoton,sgpio.yaml
 create mode 100644 drivers/gpio/gpio-npcm-sgpio.c

-- 
2.17.1

