Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E331555BDD7
	for <lists+openbmc@lfdr.de>; Tue, 28 Jun 2022 05:30:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LX98R2t1sz3c81
	for <lists+openbmc@lfdr.de>; Tue, 28 Jun 2022 13:30:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=EEueh/v7;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102c; helo=mail-pj1-x102c.google.com; envelope-from=milkfafa@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=EEueh/v7;
	dkim-atps=neutral
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LX9881gfbz30Dp
	for <openbmc@lists.ozlabs.org>; Tue, 28 Jun 2022 13:29:59 +1000 (AEST)
Received: by mail-pj1-x102c.google.com with SMTP id l2so10102424pjf.1
        for <openbmc@lists.ozlabs.org>; Mon, 27 Jun 2022 20:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=1KbVuW7XSoJDS/I+9egOZ67761pOOMfzmK48C2Bte6s=;
        b=EEueh/v7BkDbtKXAB/Ic2Nfainam+mEZY78i7SMnzTZOdOxMjcMOkUp/C7iosI05Zn
         76Ugras2AieqsBYb/nbsDS9hffP11cYLImGNPIZsrnf83L23VyATooTsBAAFbDtvjbis
         2il4qybGGIK78QxBJuRvpTN20JUXKAcqIbuzTHZvLq17KR/CMdEMaa6hiUeHhe1T1tYv
         0Xnp7P0c8T9veNPpQz/XvAZyTVum6Ncbfy5oujj5T8TwcYw+D4/KNyvXc216hL8/kBct
         6yzarR+F+LyB8VxlX6GMTo9vq0Hh/Rz9OB4tvmI/+5aJVw6fhAodDFdYrMjPuXVv/6EM
         Bouw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=1KbVuW7XSoJDS/I+9egOZ67761pOOMfzmK48C2Bte6s=;
        b=OeF5Q5vD7NiI4pk9ESiY9mNTWEYapNMRyduMhcdxZIomgGm523l9xCreYgD9TelcEq
         FmHEJeU+I2Ase5/P7L4Z7EX292fTL3VxKPNnmqL9EGofH2F+4UhW5s5zutr+lOALkGfm
         WTx9qa5hLjq217c3DKXbnYTtmx4f3oTA/m+86LHAU9qumqz18i2qA008nSo5B3XrCM1Z
         qym/YNws64NImmI5vMv5oj1begsVa1iwkokwTkNSZG48kNdTV8yXFSBc4rsX3U/vWeCP
         3AbdyZhQxrsN0OndxaoduCVueNcK/oEzLKMCqQwBVh4GpC7o/CrRh2JeY99WBO6Lmpk7
         cF/g==
X-Gm-Message-State: AJIora9wZT1I8+soxw2y4y7moz36Wc6A1HTgtR7Xm9MDtJy+OAMG05x0
	/E+DZvFgl5aNGdMy7IkrfZkPYaOX+AlowA==
X-Google-Smtp-Source: AGRyM1tdp/7AgyD1MoZ6Lg/8L2v7IRhOFg80oiTRI3ibsnSdqFebZiSsob347DSyGp+vPNucqByneQ==
X-Received: by 2002:a17:90a:ac04:b0:1ec:81d2:732 with SMTP id o4-20020a17090aac0400b001ec81d20732mr19859152pjq.45.1656386997195;
        Mon, 27 Jun 2022 20:29:57 -0700 (PDT)
Received: from localhost.localdomain (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id c26-20020a62e81a000000b0050dc762816dsm8091160pfi.71.2022.06.27.20.29.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 20:29:56 -0700 (PDT)
From: Marvin Lin <milkfafa@gmail.com>
To: mchehab@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RESEND PATCH v4 0/5] Support Nuvoton NPCM Video Capture/Encode Engine
Date: Tue, 28 Jun 2022 11:29:40 +0800
Message-Id: <20220628032945.15410-1-milkfafa@gmail.com>
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
Cc: kwliu@nuvoton.com, Marvin Lin <milkfafa@gmail.com>, tmaimon77@gmail.com, avifishman70@gmail.com, openbmc@lists.ozlabs.org, tali.perry1@gmail.com, kflin@nuvoton.com
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

