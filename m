Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F3D8D525A2A
	for <lists+openbmc@lfdr.de>; Fri, 13 May 2022 05:35:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KzvS76PNbz3c8T
	for <lists+openbmc@lfdr.de>; Fri, 13 May 2022 13:35:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=e5KSV/fr;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1032;
 helo=mail-pj1-x1032.google.com; envelope-from=milkfafa@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=e5KSV/fr; dkim-atps=neutral
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KzvRm4bcMz3bfq
 for <openbmc@lists.ozlabs.org>; Fri, 13 May 2022 13:35:31 +1000 (AEST)
Received: by mail-pj1-x1032.google.com with SMTP id
 l20-20020a17090a409400b001dd2a9d555bso6666744pjg.0
 for <openbmc@lists.ozlabs.org>; Thu, 12 May 2022 20:35:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=xB3Nks/3PZ8n8YE9KWGnAkbqCqvpCjSbkXuUmVufMJE=;
 b=e5KSV/frgL0y90h9WqaG4FkFK9FPt3hC1zgca8AjROj+zUJka/k48R426iC/Z+T8rl
 HbMLuv5luVQb/LxqPQmj7ZvmAoK6HYQQJ8LfGaa0BJLx92RQNiNkUJrfWjUbGzMblwfI
 ps5AidIQnesJSyVuioiiMJ0JHhfQVH1NTuyWkqIKUPq4nqHb/wgyHxX67+kOhB9FYD/M
 +VyCgOIZSz9Eqj61XIWVtZIDMjybh0KHHh+rbrvKfw9IPBLDEurn+RN2m9s/xJL8ANNf
 l+qv0p6f/QCX9cAHVspG7kbz0rIf/aWK+6MNsxX1mJROEgq/R7tn8SsGV77s+1ANri/Y
 bmNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=xB3Nks/3PZ8n8YE9KWGnAkbqCqvpCjSbkXuUmVufMJE=;
 b=LF2eIDZRs0F0WnM6VU+woPbrFAYleoRWwZDSktLYd03F10mclNUaEgvb36Yy64Jl53
 cYslrupLhNloIjPtftpFnAAHIPcyWNlu5upEmp2/94dzeHi4nD/SyRajQVS8lEju06Gw
 dds9a1+nGSKKUqNTCmZH1TqBwSff6l0YL28ajXmDSoMsGvkgtfyx6neP6sJYJRW5vpJ0
 9BwG1jDYx7Xf/BibAIqdOpKvGgKLMfWrGaOzTEfvjGrsU/pedYpp2Q4KCU6ij1tMNipi
 vO1F35uo6/dxo3t7vvqkRtMMDVl1ZMpGwqAhoCBgssb0Rlaq0jiTyE8ww8hI0ix7g0j/
 AsKA==
X-Gm-Message-State: AOAM533Blx82KUCQTsnYEI5UvxqaZyjz/CU0wS4lRx4JR/vQOvNuJxfa
 VEqwFdq3dPxl8zQDOr7ECkU=
X-Google-Smtp-Source: ABdhPJzCPONrWkNJJNUxQjkZmdNVGTHsJlRIZRaZyXHsGPITgnOoKbCbu4Csf4TCy9A96bwXauu3xA==
X-Received: by 2002:a17:902:eb88:b0:15e:967b:f934 with SMTP id
 q8-20020a170902eb8800b0015e967bf934mr2859768plg.67.1652412927312; 
 Thu, 12 May 2022 20:35:27 -0700 (PDT)
Received: from localhost.localdomain (60-250-192-107.hinet-ip.hinet.net.
 [60.250.192.107]) by smtp.gmail.com with ESMTPSA id
 b7-20020a1709027e0700b0015e8d4eb1c7sm685133plm.17.2022.05.12.20.35.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 May 2022 20:35:16 -0700 (PDT)
From: Marvin Lin <milkfafa@gmail.com>
X-Google-Original-From: Marvin Lin <kflin@nuvoton.com>
To: mchehab@kernel.org, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/5] Support Nuvoton NPCM Video Capture/Encode Engine
Date: Fri, 13 May 2022 11:34:45 +0800
Message-Id: <20220513033450.7038-1-kflin@nuvoton.com>
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
Cc: kwliu@nuvoton.com, tmaimon77@gmail.com, avifishman70@gmail.com,
 openbmc@lists.ozlabs.org, tali.perry1@gmail.com, kflin@nuvoton.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Changes in v2: Add Hextile document and locate with vendor formats.

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
 .../media/v4l/pixfmt-reserved.rst             |    7 +
 arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi |   19 +
 drivers/media/platform/Kconfig                |    1 +
 drivers/media/platform/Makefile               |    1 +
 drivers/media/platform/nuvoton/Kconfig        |   12 +
 drivers/media/platform/nuvoton/Makefile       |    2 +
 drivers/media/platform/nuvoton/npcm-video.c   | 2074 +++++++++++++++++
 drivers/media/v4l2-core/v4l2-ioctl.c          |    1 +
 include/uapi/linux/videodev2.h                |    1 +
 11 files changed, 2246 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/npcm/nuvoton,gfxi.yaml
 create mode 100644 Documentation/devicetree/bindings/media/nuvoton,npcm-video.yaml
 create mode 100644 drivers/media/platform/nuvoton/Kconfig
 create mode 100644 drivers/media/platform/nuvoton/Makefile
 create mode 100644 drivers/media/platform/nuvoton/npcm-video.c

-- 
2.17.1

