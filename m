Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E5E852E2A9
	for <lists+openbmc@lfdr.de>; Fri, 20 May 2022 04:48:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L4B411zqcz3bkQ
	for <lists+openbmc@lfdr.de>; Fri, 20 May 2022 12:48:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=DjIc+Wo4;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102c;
 helo=mail-pj1-x102c.google.com; envelope-from=milkfafa@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=DjIc+Wo4; dkim-atps=neutral
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L4B3g4c1Jz3bkY
 for <openbmc@lists.ozlabs.org>; Fri, 20 May 2022 12:47:58 +1000 (AEST)
Received: by mail-pj1-x102c.google.com with SMTP id
 nr2-20020a17090b240200b001df2b1bfc40so10302390pjb.5
 for <openbmc@lists.ozlabs.org>; Thu, 19 May 2022 19:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=1KbVuW7XSoJDS/I+9egOZ67761pOOMfzmK48C2Bte6s=;
 b=DjIc+Wo49kCqJg/FkuRXmC89Ony0yoizgWJPv5dNXvlZiERI1Kfwf6/BUwC/D+UIX9
 Ma4XWnlvhiT6md7t1eFGmZwL2LY5l/hA9UyW1gf2W8ACgCFVE+ZNgz5yGutCEaA4N2vf
 cKqVUDCdXfauT0j8JHgMWm3cUfHHjBJT4vq34LZ3TAqN3PcIu5z9yEoukk0zxY9sBKtZ
 Uw0cenW3JdipOtG859J8F4+5i4hjDKZebQVTGU+e8jn7BVUIYDv+IkmYljKKfvC4in5D
 ID6+IlF5lle1qQuAK6g51MWIe1fCnM55Go99RkquctSrPpzoyT1MpF3afNVXLdli9Cwl
 ckLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=1KbVuW7XSoJDS/I+9egOZ67761pOOMfzmK48C2Bte6s=;
 b=IVtaOAjQfoyhFdBXpVSn5uICiG7haprrj2YXVPh92XrO8IgydXAE57jqjlF9hNR0PE
 m2nCMzwqkXoiRj6tEuak9z6QAWnF1R1Ao6tQSH5+eRPTYaapxkCWY7Poc/WME5/XGbwq
 iCcfieHiOQEPHZT9Gnsp0ScnB1ZAl9TOD7pKrbMAjFQ+3gKQ4jYD3PfXcistci203QVa
 7BXDsKVa32AJqBkXR1zvgry/zb7VOaTtunZAt5I7uZUqFOvB+ixVCzmq2O+aajCqKHcT
 adtEJwwqI1BBul6jlqN0jFvzJsrSul5kGI3UIbKYi/x8lf2JeUDdYP1K01kPlMUE/zCP
 kIOw==
X-Gm-Message-State: AOAM5332u+Gfd3eO9ecGzxG4Z9JY/iijrnpX0A2FteiBsNhcx03u8Cxe
 0qFp8nptj+17gUBZ9+uz6wU=
X-Google-Smtp-Source: ABdhPJy2uFtFFtN9rWyLz0yS4jZov005QUyAqUS2Ux+p8b3SBjFXKYwDlWCJ5OAifMB6G0FHkzSZoQ==
X-Received: by 2002:a17:902:8c92:b0:161:e861:861f with SMTP id
 t18-20020a1709028c9200b00161e861861fmr3477531plo.33.1653014876607; 
 Thu, 19 May 2022 19:47:56 -0700 (PDT)
Received: from localhost.localdomain (60-250-192-107.hinet-ip.hinet.net.
 [60.250.192.107]) by smtp.gmail.com with ESMTPSA id
 n9-20020a629709000000b0050df474e4d2sm379406pfe.218.2022.05.19.19.47.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 May 2022 19:47:56 -0700 (PDT)
From: Marvin Lin <milkfafa@gmail.com>
To: mchehab@kernel.org, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/5] Support Nuvoton NPCM Video Capture/Encode Engine
Date: Fri, 20 May 2022 10:47:39 +0800
Message-Id: <20220520024744.25655-1-milkfafa@gmail.com>
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

