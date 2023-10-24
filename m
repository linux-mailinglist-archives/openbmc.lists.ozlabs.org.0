Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1164F7D4B8F
	for <lists+openbmc@lfdr.de>; Tue, 24 Oct 2023 11:07:37 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=TPLvCuBv;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SF5mk6qMvz3cD7
	for <lists+openbmc@lfdr.de>; Tue, 24 Oct 2023 20:07:34 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=TPLvCuBv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::530; helo=mail-pg1-x530.google.com; envelope-from=jim.t90615@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SF5m72hmYz2xTP
	for <openbmc@lists.ozlabs.org>; Tue, 24 Oct 2023 20:07:01 +1100 (AEDT)
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-5859d13f73dso2599476a12.1
        for <openbmc@lists.ozlabs.org>; Tue, 24 Oct 2023 02:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698138418; x=1698743218; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yDL40uP+kAC3ujsM0EdFsGaQpPzT9QQURdIX1zfn8SM=;
        b=TPLvCuBvoacnVCXeebeyQHZTbIBrUYSAGpLbZHbQGnFgbG3zKQSMYhO/3w2B1ETtxP
         LtX8bfnn5XB+NTxDPFmi8hx9QEPaRaBrB0S83HzIPWeWcJXyO89/b5IIZhxIgeILwBDz
         S+bxOTNGgcG31fFCNxhQOMI//gJmFwekO/oQhpHtRXuUz1wJMS0LtF0JPDtkw/jE7DDv
         1UXiaMfnveFUB2bX69buvv+LApMtL218Ck3QuUi8eFV3XjdPAsj7tAPzo8Tv062QJSwg
         UgQ/BZ39sgF14yqyNiVJyucTmC5CNY24h3D/pxPWHufISw2VU/jNCcY7B3id+f2XU1+3
         FTYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698138418; x=1698743218;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yDL40uP+kAC3ujsM0EdFsGaQpPzT9QQURdIX1zfn8SM=;
        b=cSeb0tVzj5NQRzDhDC10ooQOVi3J68HWx7sHFkVW0+CFQSU1jg5IIdFzu89Jhdgyv3
         rlDQnBW3mMVjjBa8LDTRpyuewRyX+gdWQc+SXQviWzRa2Bjn9WoKlmi95hrOj1+1H7mv
         Q/cXINGXkCETHsjOjDLM4Cxbx+CmDZqPqAs2eBCYawuiyE7B74yWI5Txp5sID62qVkrm
         M5OLUtxOlCXsLb4KaIy8p82i0dKfC+hllrdPIugE2Wv4CeymVIDlB3OipR6NY0Dgvtkx
         S7hz0JT1RzNXLnJybujFCK4dQm6+oaybhQsPGmAIway39ELN66d49HKm3edamhxY8Teu
         kD/g==
X-Gm-Message-State: AOJu0Yxx3iaJT+ybEqzPtWTTudP3tJcI7CtqwfKZY7Tc9CD2po5zQoFq
	ObVkmd/JFSiTOLd4LmBxgG4=
X-Google-Smtp-Source: AGHT+IGPI0C1cwkNW52VsX90UmIRRS7/kDnveimVHYzyudFdRLFzW3L08ZWGf9t+sYXuJduWkE/VYw==
X-Received: by 2002:a05:6a21:1448:b0:17a:d173:42f1 with SMTP id oc8-20020a056a21144800b0017ad17342f1mr1464806pzb.44.1698138418256;
        Tue, 24 Oct 2023 02:06:58 -0700 (PDT)
Received: from cs20-buildserver.lan ([1.200.144.223])
        by smtp.gmail.com with ESMTPSA id c24-20020a170902d91800b001c9ab91d3d7sm7055324plz.37.2023.10.24.02.06.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Oct 2023 02:06:57 -0700 (PDT)
From: Jim Liu <jim.t90615@gmail.com>
To: jim.t90615@gmail.com,
	JJLIU0@nuvoton.com,
	linus.walleij@linaro.org,
	krzysztof.kozlowski+dt@linaro.org,
	brgl@bgdev.pl
Subject: [PATCH v6 0/3] Add Nuvoton NPCM SGPIO feature
Date: Tue, 24 Oct 2023 17:06:28 +0800
Message-Id: <20231024090631.3359592-1-jim.t90615@gmail.com>
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
 drivers/gpio/gpio-npcm-sgpio.c                | 650 ++++++++++++++++++
 5 files changed, 769 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/nuvoton,sgpio.yaml
 create mode 100644 drivers/gpio/gpio-npcm-sgpio.c

-- 
2.25.1

