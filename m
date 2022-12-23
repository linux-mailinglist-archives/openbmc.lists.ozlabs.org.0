Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A7D654BC0
	for <lists+openbmc@lfdr.de>; Fri, 23 Dec 2022 04:30:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NdXk85PDFz3bXQ
	for <lists+openbmc@lfdr.de>; Fri, 23 Dec 2022 14:30:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=gvXwP+6g;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com; envelope-from=milkfafa@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=gvXwP+6g;
	dkim-atps=neutral
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NdXjX37mlz307C
	for <openbmc@lists.ozlabs.org>; Fri, 23 Dec 2022 14:29:35 +1100 (AEDT)
Received: by mail-pl1-x630.google.com with SMTP id d7so3804812pll.9
        for <openbmc@lists.ozlabs.org>; Thu, 22 Dec 2022 19:29:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GeemHnrH9+ojMc2sxTxo6/NiqXsu00sy+aryfTNI9f8=;
        b=gvXwP+6gXQ4kSrjuu3ifNh1lfmhon2wh7iF4gmUIHN1mcyOotJ0/oVdmTzsrFlJPg7
         fawHXyM2SaEtSCNBwlvVjAWSfcTL79fsWeaEw4on7A2Wk7CSIUfj0nW8aYR2M3CiD9u2
         Q6OjQynP8I0l/Q8jBgL86DgNI4lM0rXXrvYEB/508d2UY+nvy5gXP1wdOfnyOnKsbkgF
         WMPDlj5Tt0f3CxXG+CZGIji91l5wv62i9WwZjirvToRFz2CLlvIcdd9vm5DzqAod5lDK
         zwKJme4vssgIqfIfL78kPx3XwmVEx/lR1TLhocJFdnETNBVxj27YHZkhHtKy72QMVagz
         wY5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GeemHnrH9+ojMc2sxTxo6/NiqXsu00sy+aryfTNI9f8=;
        b=Ssw3LPu1fDfA4UKWbzahKj4OFxXQRm/aEsiAltNmqAbCK7GW4IlYp8q/lyQcMw7NSd
         fGeP5083HX0rSvCxdetf+XqZG+RgYx/A4pP4knw1MlDjwXl19nkk2VtW61UobxWvfcLQ
         yXjwgLe2YcxNC1SuL+IVtg9Yh/k3aU80nTfpXdhG0hXHueArYYhIFxmgbZ+VYtNAumbl
         F35uOPHaT+d5/dzmv731Kn9TUIHmOOBM2RhaoAOHc/LEACvAvHrQw3OFYzlN56mQDg1V
         Lm3XFf5rY+WmABCNoVB+6SAxsGPrZpXGZAhFhhZSSlsxcWolKjrtwFRGuuwhpKvhgbKb
         zFzw==
X-Gm-Message-State: AFqh2kph9u9aL5nsNTjshDac3ErT2czYWJwNV+4fHDH3angYxNNQV7Rj
	m/GDLkmeF+AyYLsLMWpQubY=
X-Google-Smtp-Source: AMrXdXscb+BT37NezP69AEJ6tWXDRwhw/NiLRGTS4VzkaSaKfZDCkOEC4jnQ1FfAKPu1+jIhgxAPfA==
X-Received: by 2002:a05:6a21:6d90:b0:b0:3318:ab59 with SMTP id wl16-20020a056a216d9000b000b03318ab59mr13387356pzb.14.1671766172324;
        Thu, 22 Dec 2022 19:29:32 -0800 (PST)
Received: from hcdev-d520mt2.. (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id w192-20020a6282c9000000b00575448ab0e9sm1376854pfd.123.2022.12.22.19.29.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Dec 2022 19:29:31 -0800 (PST)
From: Marvin Lin <milkfafa@gmail.com>
To: krzysztof.kozlowski@linaro.org,
	robh+dt@kernel.org,
	bp@alien8.de,
	tony.luck@intel.com,
	james.morse@arm.com,
	mchehab@kernel.org,
	rric@kernel.org,
	benjaminfair@google.com,
	yuenn@google.com,
	venture@google.com,
	avifishman70@gmail.com,
	tmaimon77@gmail.com,
	tali.perry1@gmail.com
Subject: [PATCH v17 0/3] EDAC/nuvoton: Add NPCM memory controller driver
Date: Fri, 23 Dec 2022 11:28:56 +0800
Message-Id: <20221223032859.3055638-1-milkfafa@gmail.com>
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
Cc: KWLIU@nuvoton.com, YSCHU@nuvoton.com, Marvin Lin <milkfafa@gmail.com>, devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, ctcchien@nuvoton.com, kflin@nuvoton.com, linux-edac@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This patch series add DTS node, dt-bindings document and driver for memory
controller present on Nuvoton NPCM SoCs.

The memory controller supports single bit error correction and double bit
error detection (in-line ECC in which a section 1/8th of the memory device
used to store data is used for ECC storage).

Changes in v17:
  - Correct subject prefixes of patch 1/3.
  - Change dt-bindings document name to "nuvoton,npcm-memory-controller.yaml"
    and refine the document format.

Changes in v16:
  - Correct dt-bindings document path in MAINTAINERS.
  - Fix wrong indentation in driver.

Changes in v15:
  - Move dt-bindings document to memory-controllers directory and remove
    superfluous string in content title.

Changes in v14:
  - Fix compile warnings.

Changes in v13:
  - Support error injection via debugfs.
  - Fix coding style issues.

Marvin Lin (3):
  ARM: dts: nuvoton: Add node for NPCM memory controller
  dt-bindings: edac: nuvoton: Add document for NPCM memory controller
  EDAC/npcm: Add NPCM memory controller driver

 .../nuvoton,npcm-memory-controller.yaml       |  50 ++
 MAINTAINERS                                   |   8 +
 arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi |   7 +
 drivers/edac/Kconfig                          |  11 +
 drivers/edac/Makefile                         |   1 +
 drivers/edac/npcm_edac.c                      | 520 ++++++++++++++++++
 6 files changed, 597 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/nuvoton,npcm-memory-controller.yaml
 create mode 100644 drivers/edac/npcm_edac.c

-- 
2.34.1

