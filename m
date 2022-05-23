Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 072F15308A9
	for <lists+openbmc@lfdr.de>; Mon, 23 May 2022 07:27:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L65Rp6vTvz3bl7
	for <lists+openbmc@lfdr.de>; Mon, 23 May 2022 15:27:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=PDO1ltwC;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::532;
 helo=mail-pg1-x532.google.com; envelope-from=milkfafa@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=PDO1ltwC; dkim-atps=neutral
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L65Qn6Gd3z3bfH
 for <openbmc@lists.ozlabs.org>; Mon, 23 May 2022 15:26:08 +1000 (AEST)
Received: by mail-pg1-x532.google.com with SMTP id h9so4547505pgl.4
 for <openbmc@lists.ozlabs.org>; Sun, 22 May 2022 22:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=1KbVuW7XSoJDS/I+9egOZ67761pOOMfzmK48C2Bte6s=;
 b=PDO1ltwCxEDERQBIHyx4r4g1N3u1jliI2hd3dINmAuIcmWY1hRByK+vIHhWkSCOkS6
 3OcbZQtuCQhx5/HxTzceSahPqDktr8YZaJfdXLEw83cnlWTNWZSAGvNJnU6G/mT+Vhg6
 y/yD/meUpuhWca5rBY/jeKItZGSjzXH5Zj5at/pDUJV5Z5ExeFc0m+PW7+M4fpYUSdiZ
 P6Owbzrq+kuao0WwN/SIs+13qZ4o33Ml2IFjeq1eF8FZ4b+xtQPzfvgf62ERgboylu0s
 1JI7/yTxpRQ0ITxRduHgXBJ3rn6Ir3RZ5gomzT5zn1SEGgvCSAgKUq1Fc+SF4KUc0MYz
 nSNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=1KbVuW7XSoJDS/I+9egOZ67761pOOMfzmK48C2Bte6s=;
 b=nYFmxrPPkuM2wZzLKzM8lEqy/kPOr4w/FYqltBeHG1LvuYukEWOtSXSnCe5dgeFJs2
 aRet99cyURVATQyXMLjNftHtfN2CJfxGbpwW1TOdOwD010kEmLu9jgR5INjGcrahvVSB
 036fIugtBxdl10t7MgchkU9Nqj+NdTnK6pqux6SZ4tFDrt3oZEugoMN+xTS145mT6cWA
 5Cb+omo/6CaU3a24KGSOCTO0mkrJIadXcm2sR/OY22C/0hmABPi8kYTCW3OLqLWM4/U8
 gqIBeXxnK7cgdLP+U9UUb6rBM8j+MFX+asALZKt1Y1nnK8kBQoPT0Qerme0MswBWI+nt
 CVUA==
X-Gm-Message-State: AOAM533fJFVuvJy4g7Ub3PcjwpN+UACmOjOnRXgZHBB5clmp9XrmPSIj
 4WkH4EcBuRVXCQinuM+oo7o=
X-Google-Smtp-Source: ABdhPJxMEVyiGL0U4n+8vRcPFSHCqcgT+LNDVchrhOc2LvrfGLbmG6DNgad/j2Ve9slnTtiqf3szaw==
X-Received: by 2002:a05:6a00:14c8:b0:518:7789:d33b with SMTP id
 w8-20020a056a0014c800b005187789d33bmr12846585pfu.36.1653283564770; 
 Sun, 22 May 2022 22:26:04 -0700 (PDT)
Received: from localhost.localdomain (60-250-192-107.hinet-ip.hinet.net.
 [60.250.192.107]) by smtp.gmail.com with ESMTPSA id
 y5-20020a655285000000b003c14af50603sm3871523pgp.27.2022.05.22.22.26.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 May 2022 22:26:03 -0700 (PDT)
From: Marvin Lin <milkfafa@gmail.com>
To: mchehab@kernel.org, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/5] Support Nuvoton NPCM Video Capture/Encode Engine
Date: Mon, 23 May 2022 13:25:43 +0800
Message-Id: <20220523052548.28109-1-milkfafa@gmail.com>
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
Cc: kwliu@nuvoton.com, Marvin Lin <milkfafa@gmail.com>, tmaimon77@gmail.com,
 avifishman70@gmail.com, openbmc@lists.ozlabs.org, tali.perry1@gmail.com,
 kflin@nuvoton.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This patch series add DTS node, dt-bindings document and drivers for Video
Capture/Differentiation Engine (VCD) and Encoding Compression Engine (ECE)
present on Nuvoton NPCM SoCs.

VCD can capture/differentiate video data from digital or analog sources,
then the ECE will compress the data into HEXTILE format.

HEXTILE compressed format is defined in Remote Framebuffer Protocol (RFC
6143) and is used by VNC features, so we also add a patch to support it.

Changes since v1:
  - Add Hextile document and locate with vendor formats.
  - Add video driver entry in MAINTAINERS
  - Change config name to CONFIG_VIDEO_NPCM_VCD_ECE
  - Reduce the waiting time after resetting the VCD/ECE module
  - Correct data types of some variables

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
 MAINTAINERS                                   |    9 +
 arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi |   19 +
 drivers/media/platform/Kconfig                |    1 +
 drivers/media/platform/Makefile               |    1 +
 drivers/media/platform/nuvoton/Kconfig        |   12 +
 drivers/media/platform/nuvoton/Makefile       |    2 +
 drivers/media/platform/nuvoton/npcm-video.c   | 2064 +++++++++++++++++
 drivers/media/v4l2-core/v4l2-ioctl.c          |    1 +
 include/uapi/linux/videodev2.h                |    1 +
 12 files changed, 2245 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/npcm/nuvoton,gfxi.yaml
 create mode 100644 Documentation/devicetree/bindings/media/nuvoton,npcm-video.yaml
 create mode 100644 drivers/media/platform/nuvoton/Kconfig
 create mode 100644 drivers/media/platform/nuvoton/Makefile
 create mode 100644 drivers/media/platform/nuvoton/npcm-video.c

-- 
2.17.1

