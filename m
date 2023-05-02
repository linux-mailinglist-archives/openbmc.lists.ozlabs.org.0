Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 271616F3F86
	for <lists+openbmc@lfdr.de>; Tue,  2 May 2023 10:46:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q9YZx6pN3z3c34
	for <lists+openbmc@lfdr.de>; Tue,  2 May 2023 18:46:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=Z9H3Qcm1;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52a; helo=mail-pg1-x52a.google.com; envelope-from=milkfafa@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=Z9H3Qcm1;
	dkim-atps=neutral
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q9YYQ583tz3bpW
	for <openbmc@lists.ozlabs.org>; Tue,  2 May 2023 18:44:56 +1000 (AEST)
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-51b4ef5378bso3012852a12.1
        for <openbmc@lists.ozlabs.org>; Tue, 02 May 2023 01:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683017088; x=1685609088;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GeQ3YlDylA+SoWbDxm8aDmx/3NOWKe3tMJJA9yBoh7k=;
        b=Z9H3Qcm1sOfVsUJ811IFgTkujKN/+n7Hthp+VKkZhJ458UuMk+IK1ygwnt6el+VDZi
         ZeYPz2fYl1lEaCJ/SO6qct+aj0rPnrW4sjLJAES2uwP6NzNYTC8qfS1/kHvGD6cK0t86
         IFicMkUXrC+pURw1vLc4lnEhWw9FJX7zQn23txsX+TlNdVU8W3DlJNCFjRTTChqJfiE6
         t/6Lly8N3eR5DLNLtUmLk7lqxSkb19FhMkbqHLcATl48uJgLwFPNUIQFVA2iyNo6ZVUY
         3nAj3HE2bVVW31GeFoiYJtjeXEM7WzCccRPx6GxYSF1yv35P26xowL/uMhNy1ipOFRws
         UuNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683017088; x=1685609088;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GeQ3YlDylA+SoWbDxm8aDmx/3NOWKe3tMJJA9yBoh7k=;
        b=UborldqTC8ni7R44JEexETGRogaLTgms4O91qRGdsHcoDex4Uy2fZtBlFRuifUl5Zj
         LJosGmnk+c85ig3ZoLrvM73c1d2eFgU0UmzPpq/ibtuw84OgKncnfBPz1jxYWag/Tkdy
         +nMphz1KONf36ucoubxq2n09IFKFXVPolOq8Tsdj1YDxX0c8rddJ2zw46nJOSN/F/+h3
         7deVQev55ZaG9yE3t2xLC7ubb5BoypHQ18NnoLsvWl3awdx1M8+i5mK5ptC2dPwJu/tT
         GfZ6M4S628A0LufTHXjc6nYxktxpUX8N+OtOUSZNkTf0KVm3dCS2mgnqG31pbR4YZqqS
         SqmQ==
X-Gm-Message-State: AC+VfDziBzX8AfhOOPGf/gCxeeaHtk/Q6jWZ5YjUlCXlCRewpueadYcT
	QnjLICOs/6qkFXeGh1XUYrY=
X-Google-Smtp-Source: ACHHUZ5nu5cx8HImYBYhZJ7/FKDDXNGXg6NIXGlltQL24/2vP4MW8okl+Tqh80wDmI7wO5hoeTfb6g==
X-Received: by 2002:a17:90b:1d01:b0:247:4f32:d108 with SMTP id on1-20020a17090b1d0100b002474f32d108mr17638457pjb.13.1683017088126;
        Tue, 02 May 2023 01:44:48 -0700 (PDT)
Received: from hcdev-d520mt2.. (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id v10-20020a17090a520a00b0023fcece8067sm7059039pjh.2.2023.05.02.01.44.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 May 2023 01:44:47 -0700 (PDT)
From: Marvin Lin <milkfafa@gmail.com>
To: mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl,
	avifishman70@gmail.com,
	tmaimon77@gmail.com,
	tali.perry1@gmail.com,
	venture@google.com,
	yuenn@google.com,
	benjaminfair@google.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	andrzej.p@collabora.com
Subject: [PATCH v12 0/7] Support Nuvoton NPCM Video Capture/Encode Engine
Date: Tue,  2 May 2023 16:44:23 +0800
Message-Id: <20230502084430.234182-1-milkfafa@gmail.com>
X-Mailer: git-send-email 2.34.1
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
Cc: kwliu@nuvoton.com, Marvin Lin <milkfafa@gmail.com>, devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, kflin@nuvoton.com, linux-media@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This patch series add DTS node, dt-bindings document and drivers for Video
Capture/Differentiation Engine (VCD) and Encoding Compression Engine (ECE)
present on Nuvoton NPCM SoCs.

As described in the datasheet NPCM750D_DS_Rev_1.0, the VCD can capture a
frame from digital video input and compare two frames in memory, and then
the ECE can compress the frame data into HEXTITLE format which is defined
in Remote Framebuffer Protocol (RFC 6143, chapter 7.7.4. Hextile Encoding).

The output of v4l2-compliance:
v4l2-compliance 1.23.0-4965, 64 bits, 64-bit time_t
v4l2-compliance SHA: d0964d133053 2022-11-06 14:46:45

Compliance test for npcm-video device /dev/video0:

Driver Info:
        Driver name      : npcm-video
        Card type        : NPCM Video Engine
        Bus info         : platform:npcm-video
        Driver version   : 5.15.50
        Capabilities     : 0x84200001
                Video Capture
                Streaming
                Extended Pix Format
                Device Capabilities
        Device Caps      : 0x04200001
                Video Capture
                Streaming
                Extended Pix Format

Required ioctls:
        test VIDIOC_QUERYCAP: OK
        test invalid ioctls: OK

Allow for multiple opens:
        test second /dev/video0 open: OK
        test VIDIOC_QUERYCAP: OK
        test VIDIOC_G/S_PRIORITY: OK
        test for unlimited opens: OK

Debug ioctls:
        test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
        test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
        test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
        test VIDIOC_ENUMAUDIO: OK (Not Supported)
        test VIDIOC_G/S/ENUMINPUT: OK
        test VIDIOC_G/S_AUDIO: OK (Not Supported)
        Inputs: 1 Audio Inputs: 0 Tuners: 0

Output ioctls:
        test VIDIOC_G/S_MODULATOR: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_ENUMAUDOUT: OK (Not Supported)
        test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDOUT: OK (Not Supported)
        Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
        test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
        test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK
        test VIDIOC_DV_TIMINGS_CAP: OK
        test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls (Input 0):
        test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
        test VIDIOC_QUERYCTRL: OK
        test VIDIOC_G/S_CTRL: OK
        test VIDIOC_G/S/TRY_EXT_CTRLS: OK
                warn: v4l2-test-controls.cpp(1070): V4L2_CID_DV_RX_POWER_PRESENT not found for input 0
        test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
        test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
        Standard Controls: 1 Private Controls: 2

Format ioctls (Input 0):
        test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
        test VIDIOC_G/S_PARM: OK (Not Supported)
        test VIDIOC_G_FBUF: OK (Not Supported)
        test VIDIOC_G_FMT: OK
        test VIDIOC_TRY_FMT: OK
        test VIDIOC_S_FMT: OK
        test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
        test Cropping: OK (Not Supported)
        test Composing: OK (Not Supported)
        test Scaling: OK (Not Supported)

Codec ioctls (Input 0):
        test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
        test VIDIOC_G_ENC_INDEX: OK (Not Supported)
        test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls (Input 0):
        test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
        test VIDIOC_EXPBUF: OK
        test Requests: OK (Not Supported)

Total for npcm-video device /dev/video0: 45, Succeeded: 45, Failed: 0, Warnings: 1

Changes in v12:
  - Modify the flow for detecting resolution change and raise
    V4L2_EVENT_SOURCE_CHANGE event.
  - Add V4L2_PIX_FMT_RGB565 format support.

Changes in v11:
  - Replace "u8/u16/u32" with "unsigned int" for generic local variables.
  - Correct subsystem prefixes, drop redundant words in commit subject, and
    add more information in commit message.

Changes in v10:
  - drivers/media/platform/nuvoton/npcm-video.c
    * Let short functions to be inline function.
    * Correct return type of some functions, and properly handle return
      value by callers.
    * Correct the timing of removing rect_list and the flow of FIFO overrun
      case in irq.
    * Adjust line breaks, indentations, and style of variable declarations.

Changes in v9:
  - Change ECE node name to "video-codec".
  - Drop redundant "bindings for" in commit subject of patch 2/7.
  - Refine the format of VCD/ECE dt-binding document.

Changes in v8:
  - Let VCD/ECE to be 2 separate nodes and update dt-binding documents.
  - Move register definitions out to a local header file.
  - Driver refinements (add error handling for memory allocation, remove
    unnecessary condition check and introduce "goto"s to handle similar
    error recovery paths).
  - Correct properties and typo in GFXI dt-binding document.

Changes in v7:
  - Add uapi documents for driver-specific controls.
  - Implement driver-specific controls for switching capture mode and
    getting the count of compressed HEXTILE rectangles.
  - Drop unnecessary "enum_framesizes" and "enum_frameintervals" functions.
  - Include the output of v4l2-compliance in cover letter.

Changes in v6:
  - Support NPCM845 and add compatible "nuvoton,npcm845-video".
  - Correct pixel format to V4L2_PIX_FMT_HEXTILE which is newly added in
    this patch series.

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

Marvin Lin (7):
  ARM: dts: nuvoton: Add node for NPCM VCD and ECE engine
  media: dt-bindings: nuvoton: Add NPCM VCD and ECE engine
  dt-bindings: arm: nuvoton: Add NPCM GFXI
  media: v4l: Add HEXTILE compressed format
  media: v4l2-ctrls: Add user control base for Nuvoton NPCM controls
  media: uapi: Add controls for NPCM video driver
  media: nuvoton: Add driver for NPCM video capture and encode engine

 .../bindings/arm/npcm/nuvoton,gfxi.yaml       |   39 +
 .../bindings/media/nuvoton,npcm-ece.yaml      |   43 +
 .../bindings/media/nuvoton,npcm-vcd.yaml      |   72 +
 .../userspace-api/media/drivers/index.rst     |    1 +
 .../media/drivers/npcm-video.rst              |   67 +
 .../media/v4l/pixfmt-reserved.rst             |    7 +
 MAINTAINERS                                   |   12 +
 arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi |   23 +
 drivers/media/platform/Kconfig                |    1 +
 drivers/media/platform/Makefile               |    1 +
 drivers/media/platform/nuvoton/Kconfig        |   15 +
 drivers/media/platform/nuvoton/Makefile       |    2 +
 drivers/media/platform/nuvoton/npcm-regs.h    |  183 ++
 drivers/media/platform/nuvoton/npcm-video.c   | 1898 +++++++++++++++++
 drivers/media/v4l2-core/v4l2-ioctl.c          |    1 +
 include/uapi/linux/npcm-video.h               |   41 +
 include/uapi/linux/v4l2-controls.h            |    6 +
 include/uapi/linux/videodev2.h                |    1 +
 18 files changed, 2413 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/npcm/nuvoton,gfxi.yaml
 create mode 100644 Documentation/devicetree/bindings/media/nuvoton,npcm-ece.yaml
 create mode 100644 Documentation/devicetree/bindings/media/nuvoton,npcm-vcd.yaml
 create mode 100644 Documentation/userspace-api/media/drivers/npcm-video.rst
 create mode 100644 drivers/media/platform/nuvoton/Kconfig
 create mode 100644 drivers/media/platform/nuvoton/Makefile
 create mode 100644 drivers/media/platform/nuvoton/npcm-regs.h
 create mode 100644 drivers/media/platform/nuvoton/npcm-video.c
 create mode 100644 include/uapi/linux/npcm-video.h

-- 
2.34.1

