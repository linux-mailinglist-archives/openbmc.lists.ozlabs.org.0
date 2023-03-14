Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 037786B8E94
	for <lists+openbmc@lfdr.de>; Tue, 14 Mar 2023 10:24:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PbSlt6G79z3cfj
	for <lists+openbmc@lfdr.de>; Tue, 14 Mar 2023 20:24:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=gDFXjIII;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62d; helo=mail-pl1-x62d.google.com; envelope-from=jim.t90615@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=gDFXjIII;
	dkim-atps=neutral
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PbSkq0XFMz3cJv
	for <openbmc@lists.ozlabs.org>; Tue, 14 Mar 2023 20:23:45 +1100 (AEDT)
Received: by mail-pl1-x62d.google.com with SMTP id p20so15867169plw.13
        for <openbmc@lists.ozlabs.org>; Tue, 14 Mar 2023 02:23:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678785821;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WkRcazuJb7v9nTIQ0dhQR/wIjE8fenM+pHebExHfSRc=;
        b=gDFXjIIIBxk2rJLz6BEGVWRZGsY0bEHGcvQtoBp9I0YSbhTwhuzE4loJTzLmLMA1d3
         YzwiWWsJw7t2R3r39B/Ny0SwHfhP5vywYBCfuyZZDHV56KddrQlh90Y7Z1MOyjDV/XSK
         W3rdzBR/KrF8lRu5DQmtd01Dn//M3xIDf/iFMDGVnVE7tYC3NzMxJQcklE52wFB4OR88
         yNd9dMyngc5sQeMhK655/nTL50O9fQwqFfMFGvkFeyzJvIGo6ufBLe0k1qfmKHo4c5ig
         Bg4BFzP2oZV5dRc0OJVrVmCxgWV0slzuU8YEusvOqHxN5DmW3FldGQxrB2cvfrBbt6/d
         i7BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678785821;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WkRcazuJb7v9nTIQ0dhQR/wIjE8fenM+pHebExHfSRc=;
        b=eybTHXDvxFsNJ22Jq9h5HYapjrHU5gaSIY1IVxqcqhq0Ji4mA8bDOuyiOBTlObWz1d
         C37EBwSC5979TAuxXtRDeoEIiPiWl3LcjLIx8zVzR4Eam/C9UjVAj/ZskpU6zMl55WKL
         8QfafPF/FhUsma+J3jVPXPNho6rkDLY6mRFO8f8tUtA14dx1tNGas5/Vxwa354ZzlDiT
         /mBkW61P2a2Gip2rsY5BcTOyQz6eJPVi4kFVUXPvXDx922sqrDMPl7ScONl2S1TbhafU
         M41OvL95xtC7ontdtIQ/oCbDab6+Lp+Du8kc/faRR5JxrkYX6O88y25EbWAESxBZ/Vbf
         llHw==
X-Gm-Message-State: AO0yUKWL/dvMHC4aYkxCuq9R6ib9uG9GUw/N8wT2af18pWdg2VdVQKud
	e12rm2oxq2P6bfKKIzwaxQA=
X-Google-Smtp-Source: AK7set9CmVYYHzcHXn+3N7OGiHWr47DueIgz3FHgT31XfMbtEpFH52tbv+yXIF0e5GGnYiFDYxPy6A==
X-Received: by 2002:a05:6a20:8e0a:b0:c7:6a98:5bd8 with SMTP id y10-20020a056a208e0a00b000c76a985bd8mr23210905pzj.0.1678785820982;
        Tue, 14 Mar 2023 02:23:40 -0700 (PDT)
Received: from localhost.localdomain ([1.200.129.193])
        by smtp.gmail.com with ESMTPSA id f21-20020aa782d5000000b00592626fe48csm1120898pfn.122.2023.03.14.02.23.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Mar 2023 02:23:40 -0700 (PDT)
From: Jim Liu <jim.t90615@gmail.com>
To: JJLIU0@nuvoton.com,
	KWLIU@nuvoton.com,
	linus.walleij@linaro.org,
	brgl@bgdev.pl,
	jim.t90615@gmail.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org
Subject: [PATCH v5 0/3]Add Nuvoton NPCM SGPIO feature
Date: Tue, 14 Mar 2023 17:23:08 +0800
Message-Id: <20230314092311.8924-1-jim.t90615@gmail.com>
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
Nuvoton NPCM SGPIO module is combine serial to parallel IC (HC595)
and parallel to serial IC (HC165), and use APB3 clock to control it.
This interface has 4 pins  (D_out , D_in, S_CLK, LDSH).
NPCM7xx/NPCM8xx have two sgpio module each module can support up
to 64 output pins,and up to 64 input pin, the pin is only for gpi or gpo.
GPIO pins have sequential, First half is gpo and second half is gpi.


Jim Liu (3):
  gpio: nuvoton: Add Nuvoton NPCM sgpio driver
  arm: dts: nuvoton: npcm: Add sgpio feature
  dt-bindings: gpio: add NPCM sgpio driver bindings

 .../bindings/gpio/nuvoton,sgpio.yaml          |  87 +++
 arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi |  30 +
 drivers/gpio/Kconfig                          |   8 +
 drivers/gpio/Makefile                         |   1 +
 drivers/gpio/gpio-npcm-sgpio.c                | 648 ++++++++++++++++++
 5 files changed, 774 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/nuvoton,sgpio.yaml
 create mode 100644 drivers/gpio/gpio-npcm-sgpio.c

-- 
2.17.1

