Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF04764C5F1
	for <lists+openbmc@lfdr.de>; Wed, 14 Dec 2022 10:28:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NX96H4cBHz3cH9
	for <lists+openbmc@lfdr.de>; Wed, 14 Dec 2022 20:28:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=R2bP2jlx;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::535; helo=mail-pg1-x535.google.com; envelope-from=milkfafa@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=R2bP2jlx;
	dkim-atps=neutral
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NX94c4l2Tz3bdl
	for <openbmc@lists.ozlabs.org>; Wed, 14 Dec 2022 20:27:26 +1100 (AEDT)
Received: by mail-pg1-x535.google.com with SMTP id h33so1569605pgm.9
        for <openbmc@lists.ozlabs.org>; Wed, 14 Dec 2022 01:27:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kSW6DJQkRV+H7gsyb9sPerq2jQ4X/gjWtChiRwRFow0=;
        b=R2bP2jlxkaqpkPldwY70ee1i4nlQNmcNFmIoOtG+nc3QWiktfmIZgdo9XaUxIHo/jJ
         i6bME60hBpFsrZ7XYPEsgMxshjevRTps5jmd0DVboiu7ZzGNanZfJNfj6N1WTgabZiId
         2SMByeionPLHgz7BHbBa9TxInt3wbd2KRqjO2hLiDdRDcfkCyTkE4UqSoDc5/6+ar9sZ
         ZLUDsuq5RtDpv+m3uGC4vnrMj+djEoTcLjL7/Sw+piD2LTGsXuxX3gcupD5ppLMSo7V2
         ihovdMsN050XP0M0/VcByc7exTAepbohnz0Ay+iFUbVnZthRKonblIyI3XEIMw8IPUyR
         G5rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kSW6DJQkRV+H7gsyb9sPerq2jQ4X/gjWtChiRwRFow0=;
        b=OAPvNBTDGGtfcNCt9mppgcg9o1pqhB+FiDk4GmLJZSTtJwarhz+hHBQkjys5C4GCJG
         wvigubGsev8PVmX+9Q4hSzTZxoIZkUImdwqXugt2NhTuG2gccCHcwyrTBkIkCVdqSipu
         XcAAi4ndOLFuPXIJEGoVqhfPu938ccWC72gm9KYdXkSJI3yXr4FqFwKY8fJv+5fsaS4i
         mf8LPNWtCI1aC1thCNWSiZIgz30w6euGXASPQAnD5WjvnIhUWjd3mB4gehMc1XxDGyca
         +aPXJT1IAWz705xz05dcqXt8a4gK20co3+pEUxKJZFDxILLbGxB8b0aTfpwH4VmAzARi
         e5Fg==
X-Gm-Message-State: ANoB5pk1Rp57T2Ht2AjvNudFElIUN19t/f1d/H49AAGdCkVV66IuhFk4
	tsVfMK9p/bdl9ZVjeu0oPqM=
X-Google-Smtp-Source: AA0mqf7EPvHSUytzuohYcHQREFr2fNQQSHGOi/CaaGo56+25GsWzCm/RogaXK2UFjX3GHvewOC+2iA==
X-Received: by 2002:a05:6a00:1d1b:b0:57c:2ab7:2c0b with SMTP id a27-20020a056a001d1b00b0057c2ab72c0bmr1862692pfx.28.1671010042315;
        Wed, 14 Dec 2022 01:27:22 -0800 (PST)
Received: from hcdev-d520mt2.. (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id t123-20020a628181000000b00576145a9bd0sm9003312pfd.127.2022.12.14.01.27.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Dec 2022 01:27:21 -0800 (PST)
From: Marvin Lin <milkfafa@gmail.com>
To: mchehab@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v8 0/7] Support Nuvoton NPCM Video Capture/Encode Engine
Date: Wed, 14 Dec 2022 17:26:29 +0800
Message-Id: <20221214092636.810883-1-milkfafa@gmail.com>
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
Cc: kwliu@nuvoton.com, Marvin Lin <milkfafa@gmail.com>, tmaimon77@gmail.com, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, tali.perry1@gmail.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, kflin@nuvoton.com, benjaminfair@google.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This patch series add DTS node, dt-bindings document and drivers for Video
Capture/Differentiation Engine (VCD) and Encoding Compression Engine (ECE)
present on Nuvoton NPCM SoCs.

VCD can capture/differentiate video data from digital or analog sources,
then the ECE will compress the data into HEXTILE format which is defined in
Remote Framebuffer Protocol (RFC 6143, chapter 7.7.4. Hextile Encoding).

The output of v4l2-compliance:
v4l2-compliance 1.23.0-4965, 64 bits, 64-bit time_t
v4l2-compliance SHA: d0964d133053 2022-11-06 14:46:45

Compliance test for npcm-video device /dev/video0:

Driver Info:
        Driver name      : npcm-video
        Card type        : NPCM Video Engine
        Bus info         : platform:npcm-video
        Driver version   : 5.15.50
        Capabilities     : 0x85200001
                Video Capture
                Read/Write
                Streaming
                Extended Pix Format
                Device Capabilities
        Device Caps      : 0x05200001
                Video Capture
                Read/Write
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
                warn: /usr/src/debug/v4l-utils/1.22.1-r0/utils/v4l2-compliance/v4l2-test-controls.cpp(1070): V4L2_CID_DV_RX_POWER_PRESENT not found for input 0
        test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
        test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
        Standard Controls: 1 Private Controls: 2

Format ioctls (Input 0):
        test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
                warn: /usr/src/debug/v4l-utils/1.22.1-r0/utils/v4l2-compliance/v4l2-test-formats.cpp(1411): S_PARM is supported for buftype 1, but not for ENUM_FRAMEINTERVALS
        test VIDIOC_G/S_PARM: OK
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

Total for npcm-video device /dev/video0: 45, Succeeded: 45, Failed: 0, Warnings: 2

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
  media: dt-binding: nuvoton: Add bindings for NPCM VCD and ECE engine
  dt-bindings: arm: nuvoton: Add bindings for NPCM GFXI
  media: v4l: Add HEXTILE compressed format
  media: v4l2-ctrls: Reserve user control base for NPCM video controls
  media: uapi: Add controls for NPCM video driver
  media: nuvoton: Add driver for NPCM video capture and encode engine

 .../bindings/arm/npcm/nuvoton,gfxi.yaml       |   40 +
 .../bindings/media/nuvoton,npcm-ece.yaml      |   44 +
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
 drivers/media/platform/nuvoton/npcm-regs.h    |  171 ++
 drivers/media/platform/nuvoton/npcm-video.c   | 1924 +++++++++++++++++
 drivers/media/v4l2-core/v4l2-ioctl.c          |    1 +
 include/uapi/linux/npcm-video.h               |   41 +
 include/uapi/linux/v4l2-controls.h            |    6 +
 include/uapi/linux/videodev2.h                |    1 +
 18 files changed, 2429 insertions(+)
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

