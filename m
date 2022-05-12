Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 12D5E5294C1
	for <lists+openbmc@lfdr.de>; Tue, 17 May 2022 01:12:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L2FQh02ZBz3bcv
	for <lists+openbmc@lfdr.de>; Tue, 17 May 2022 09:12:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=P6pNllwb;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42f;
 helo=mail-pf1-x42f.google.com; envelope-from=milkfafa@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=P6pNllwb; dkim-atps=neutral
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KzNf70516z3bcj
 for <openbmc@lists.ozlabs.org>; Thu, 12 May 2022 17:27:41 +1000 (AEST)
Received: by mail-pf1-x42f.google.com with SMTP id x23so4030040pff.9
 for <openbmc@lists.ozlabs.org>; Thu, 12 May 2022 00:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=VgtuSspPJrZl0jLVEiIkQ6TuZqE9Z2iilbMNeSQTMxI=;
 b=P6pNllwbvdjsOPDvGlj6WiFYA2FBOGg18byFnZLrqjvxmqcGL1ouVMe5B7n0ld6Nxw
 lGvbjJju+fwxbZjeK2a9zYJHmJ+8VvJfF715SHWREAXvri5JWg4fZH3HxVKxAquLMjRz
 HI5JxydTEnbcggMP/2SsGwDpoooEUHrCuT73ZxcaFISGt5EHptHR+L074/8YLXPJxcEI
 VhgPQg8CCUmE8nonBDehT2mg3QTE+I+JkG1Br/N/Gs7DzH2lLMsiMHwk1wIsE8Bim5iJ
 U2s+4skU1/VRHJa21j3NKsvQxBQOvjYWzvqxHwHodoeUJXg7Ux5cNHXxd5dsntdvq32I
 Pm+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=VgtuSspPJrZl0jLVEiIkQ6TuZqE9Z2iilbMNeSQTMxI=;
 b=WWhervikRCQoUGaHBW+awSiEr5GDiBCRhpUGrvCdTdzQdqhfpWN77n0gX2jiiYwR7M
 8n4BM5aGy6as4lVRZCbFu9yTzzunNVxqvRpWHawryi0PlH4DfibWP2m4lZWFGhJhYprx
 I0YeVJVC2hYbBLrELktTFkwnpf6Xdsm4iNOCn58Ow8yq7loIx99PxoLFVvN4aLvfTN5s
 /Np/yUOQlyaR8P3yoQGP0TWbxcqBKlcBGxqIdjeQfN9Cd6N7w1Bjcxtt65NAwReW4tbm
 mARWuhJej0SIbd6yB8lHmSOgcTDqOGqaO+EMc037c+VsT63pF169TbQWGQ7ScSup4Kaz
 j5xQ==
X-Gm-Message-State: AOAM5306hyp0+0i6ljGLQKGTHsbhRyBLuEwYWnc9GYx3xvxzlT93LSZ8
 5/IstR+WC2VCFG0QsHy3naU=
X-Google-Smtp-Source: ABdhPJxODcr5MqRHBIViamAPN40p1m+6snj1eKf+gSdwUTr2qMEIvN3b3sXB2xmnWCSOY52qHZIH7w==
X-Received: by 2002:a65:6aa3:0:b0:3ab:23fb:adae with SMTP id
 x3-20020a656aa3000000b003ab23fbadaemr23973962pgu.278.1652340456354; 
 Thu, 12 May 2022 00:27:36 -0700 (PDT)
Received: from localhost.localdomain (60-250-192-107.hinet-ip.hinet.net.
 [60.250.192.107]) by smtp.gmail.com with ESMTPSA id
 z9-20020aa79e49000000b0050dc762813csm3082779pfq.22.2022.05.12.00.27.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 May 2022 00:27:35 -0700 (PDT)
From: Marvin Lin <milkfafa@gmail.com>
X-Google-Original-From: Marvin Lin <kflin@nuvoton.com>
To: mchehab@kernel.org, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/5] Support Nuvoton NPCM Video Capture/Encode Engine
Date: Thu, 12 May 2022 15:27:17 +0800
Message-Id: <20220512072722.25005-1-kflin@nuvoton.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Tue, 17 May 2022 09:10:20 +1000
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
Cc: kwliu@nuvoton.com, tmaimon77@gmail.com, avifishman70@gmail.com,
 openbmc@lists.ozlabs.org, tali.perry1@gmail.com, kflin@nuvoton.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This patch series add DTS node, dt-bindings document and drivers for Video
Capture/Differentiation Engine (VCD) and Encoding Compression Engine (ECE)
present on Nuvoton NPCM SoCs.

VCD can capture/differentiate video data from digital or analog sources,
then ECE will compress the data into HEXTILE format.

HEXTILE compressed format is defined in Remote Framebuffer Protocol (RFC
6143) and is used by VNC features, so we also add a patch to support it.

Marvin Lin (5):
  arm: dts: Add node for NPCM Video Capture/Encode Engine
  dt-bindings: media: Add dt-bindings for NPCM Video Capture/Encode
    Engine
  dt-bindings: arm/npcm: Add dt-bindings for Graphics Core Information
  media: Add HEXTILE compressed format
  drivers: media: platform: Add NPCM Video Capture/Encode Engine driver

 .../bindings/arm/npcm/nuvoton,gfxi.yaml       |   41 +
 .../bindings/media/nuvoton,npcm-video.yaml    |   87 +
 MAINTAINERS                                   |    1 +
 arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi |   19 +
 drivers/media/platform/Kconfig                |    1 +
 drivers/media/platform/Makefile               |    1 +
 drivers/media/platform/nuvoton/Kconfig        |   12 +
 drivers/media/platform/nuvoton/Makefile       |    2 +
 drivers/media/platform/nuvoton/npcm-video.c   | 2074 +++++++++++++++++
 drivers/media/v4l2-core/v4l2-ioctl.c          |    1 +
 include/uapi/linux/videodev2.h                |    1 +
 11 files changed, 2240 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/npcm/nuvoton,gfxi.yaml
 create mode 100644 Documentation/devicetree/bindings/media/nuvoton,npcm-video.yaml
 create mode 100644 drivers/media/platform/nuvoton/Kconfig
 create mode 100644 drivers/media/platform/nuvoton/Makefile
 create mode 100644 drivers/media/platform/nuvoton/npcm-video.c

-- 
2.17.1

