Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A60CB5A1EF9
	for <lists+openbmc@lfdr.de>; Fri, 26 Aug 2022 04:43:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MDPJj48Ybz3bnY
	for <lists+openbmc@lfdr.de>; Fri, 26 Aug 2022 12:43:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=djM1cSOi;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com; envelope-from=milkfafa@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=djM1cSOi;
	dkim-atps=neutral
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MDPHd0HTSz3bTZ
	for <openbmc@lists.ozlabs.org>; Fri, 26 Aug 2022 12:42:03 +1000 (AEST)
Received: by mail-pl1-x635.google.com with SMTP id c2so447348plo.3
        for <openbmc@lists.ozlabs.org>; Thu, 25 Aug 2022 19:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:subject:cc:to:from:from:to:cc;
        bh=7xmFFYm+XcYvKh7z4do1m6bswn3gHfIMo5PCJ65CLMY=;
        b=djM1cSOi3W4T9puhAdrRPIIF8Du/zeee5X7KEGDTXTnPzNo+VEe0yGiweRfDBhQXSL
         auLCS+g8KvGJNnakSFss2N6vWJ2wxflfkLylwNpJTctjjHoC0vI1pCzkwH2u3Fl43v6w
         PHQwUf7glMQ73LFqQlpw+BTASrkurrzQzE0GiLLbQG+xxxVRH0tkyMBym5A43mqPEeAR
         oLTR4FTIFydN2HUlFtmYg2l/u083PbxK+iYFr9Avib/7/3opBiXSDebSIJWOQ3QfKTcX
         RBAu01sz05rlkG5OMY4oV+MiM+pu5Iy7B5iI10fXzuwKzRPuL2iRVhZhccRbohjfN/RT
         vNOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=7xmFFYm+XcYvKh7z4do1m6bswn3gHfIMo5PCJ65CLMY=;
        b=57+QFOI9mkzKyuLqr2C+hnS8kUOPKgfAl1mjLxfhnXtDHkBpyxDHRFcaxOSt0pZH2k
         kHdDceztov616WriBGFTtpSTvZYprMOCabwO/800/KXSKZ9vAhIP5s70L/7cVGGwqxH4
         ShjdNLYskiY+S6ioJpD/KDEDgZy3yN8fbyctLFcjGJ/0l53qKDnmTOvBcYn3qymKdGo+
         1hawpJlqzit0goEcBlS3TuW1cyX/jI//IU8RDmS4pwsLqnjymZ+90M4jX2DLt0x4QjTr
         kSCNXwFruZAOYTLDdKj7v8GlvIK6XyD6xndcg21rrQwOiQ+S36tzemIK6rfuMfp8e+6Y
         xBaQ==
X-Gm-Message-State: ACgBeo2VU1xl1TqIDNKS059QwmbPg8bl4+Gwr0T0q0664OmYFfM2R/km
	Eez+Y+ntTIncEK2NAveNpfg=
X-Google-Smtp-Source: AA6agR5x0IhdFPivC2pfQKnAkFj8iM7odo3NM+06iBY5Y1IaAVfJti6/b6yByKNrzSmIY9tg4aqH+w==
X-Received: by 2002:a17:90a:c78f:b0:1fa:e505:18e6 with SMTP id gn15-20020a17090ac78f00b001fae50518e6mr2047814pjb.23.1661481717811;
        Thu, 25 Aug 2022 19:41:57 -0700 (PDT)
Received: from localhost.localdomain (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id s34-20020a17090a69a500b001f021cdd73dsm444473pjj.10.2022.08.25.19.41.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Aug 2022 19:41:57 -0700 (PDT)
From: Marvin Lin <milkfafa@gmail.com>
To: mchehab@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/5] Support Nuvoton NPCM Video Capture/Encode Engine
Date: Fri, 26 Aug 2022 10:41:19 +0800
Message-Id: <20220826024124.22747-1-milkfafa@gmail.com>
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

Changes in v5:
  - Simplify function prefix "nuvoton_" to "npcm_".
  - Increase VCD_BUSY_TIMEOUT_US and ECE_POLL_TIMEOUT_US to 300ms to
    prevent polling timeout when ECC is enabled or system is busy.

Changes in v4:
  - Fix compile warning reported by kernel test robot.

Changes in v3:
  - Add video driver entry in MAINTAINERS.
  - Change config name to CONFIG_VIDEO_NPCM_VCD_ECE.
  - Reduce the waiting time after resetting the VCD/ECE module.
  - Correct data types of some variables.

Changes in v2:
  - Add Hextile document and locate with vendor formats.

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
 drivers/media/platform/nuvoton/npcm-video.c   | 2056 +++++++++++++++++
 drivers/media/v4l2-core/v4l2-ioctl.c          |    1 +
 include/uapi/linux/videodev2.h                |    1 +
 12 files changed, 2237 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/npcm/nuvoton,gfxi.yaml
 create mode 100644 Documentation/devicetree/bindings/media/nuvoton,npcm-video.yaml
 create mode 100644 drivers/media/platform/nuvoton/Kconfig
 create mode 100644 drivers/media/platform/nuvoton/Makefile
 create mode 100644 drivers/media/platform/nuvoton/npcm-video.c

-- 
2.17.1

