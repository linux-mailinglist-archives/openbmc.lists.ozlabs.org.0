Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 667895AAB55
	for <lists+openbmc@lfdr.de>; Fri,  2 Sep 2022 11:28:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MJsyj44jZz2yxF
	for <lists+openbmc@lfdr.de>; Fri,  2 Sep 2022 19:27:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=hG+sHGkj;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62f; helo=mail-pl1-x62f.google.com; envelope-from=milkfafa@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=hG+sHGkj;
	dkim-atps=neutral
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MJsyH4lwMz2xmm
	for <openbmc@lists.ozlabs.org>; Fri,  2 Sep 2022 19:27:34 +1000 (AEST)
Received: by mail-pl1-x62f.google.com with SMTP id f24so1331105plr.1
        for <openbmc@lists.ozlabs.org>; Fri, 02 Sep 2022 02:27:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=pWy2kwNqBvwcyw3fBPdY/JfajG8Vs72kY13dOodD5tQ=;
        b=hG+sHGkjpI8EnZ0YS8lhCTS0vbXfiYfns2SbT+EcMHIJ2o1c8YBE6A3snWTGoljJ3V
         zSh+tpSxLWOKnxnXAtFtzdH2g3GGOkXKXMadTiTN1vHTCWKdSVDcRLvCL0tdFyPmrxt7
         jPs9q6Hsn/+TLWlHjsY4uKZptNsy462NFhU18Mm2fco4j2CRwbAp2QO5GM3DzvNIdmPO
         EsNst7yz5Vm0iL6aQo8PR+zAggIOSTU21O4LlLua4lq+kIcOZ5PEQnmtmDszPLWihx7K
         XqDpv/dLRGGtoKQJLqeTbAQHMoro8PgZ8wbJOL8XzqmRdi4qLGj68iYolMNqIDPvCoRy
         5JTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=pWy2kwNqBvwcyw3fBPdY/JfajG8Vs72kY13dOodD5tQ=;
        b=y/dhfmZ09dI3fY3rRiKPSRW7ueGBjXtkhtC4G0sMV4X5adiHQDJjfUGo6az5s8c3bM
         G0S4fDGtmuBAPClo90tcRTEhy1lK1FfVZZLwcSpVXXjdRXjPRxwNIICVcTDvdXIntm33
         /V6VDcQJ1HG1isICJXTz8vZqOf1xSQLD0qyyiIJ65Ez59UHu/TYsmXHZrAdjOUqXdBPd
         jRd2AlZwjz4I/Wi9Mj9cld4rIbAVyRHmQjxMz3cacyGDeWScrSuN5PIzy7scXcotxXRE
         A0DDkXgRqhdzY3d7yZ2RwbjIyNX8lRV4Q75paPK4869wo7tBFcaqKZTbHkyUKxdtc51m
         zSqg==
X-Gm-Message-State: ACgBeo23y9X5yZRSOWklPuG3lFyIYFJ1QwtgF5bVmjcPxtj2EALkKObU
	StwOjwwuN5j0MpjqN+QslpU=
X-Google-Smtp-Source: AA6agR6vw56oJH0NMXCoOMzY/8aFlYkyziOZAMyASf3qy0cwfesRkYKFXmP+o0W6dit5vKyUYi3YKw==
X-Received: by 2002:a17:90a:d150:b0:1fd:9336:5db3 with SMTP id t16-20020a17090ad15000b001fd93365db3mr3851008pjw.242.1662110851662;
        Fri, 02 Sep 2022 02:27:31 -0700 (PDT)
Received: from hcdev-d520mt2.. (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id s62-20020a625e41000000b005350ea966c7sm1169315pfb.154.2022.09.02.02.27.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Sep 2022 02:27:30 -0700 (PDT)
From: Marvin Lin <milkfafa@gmail.com>
To: linux-edac@vger.kernel.org,
	rric@kernel.org,
	james.morse@arm.com,
	tony.luck@intel.com,
	mchehab@kernel.org,
	bp@alien8.de,
	robh+dt@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v15 0/3] EDAC/nuvoton: Add NPCM memory controller driver
Date: Fri,  2 Sep 2022 17:27:11 +0800
Message-Id: <20220902092714.3683980-1-milkfafa@gmail.com>
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
Cc: KWLIU@nuvoton.com, YSCHU@nuvoton.com, Marvin Lin <milkfafa@gmail.com>, benjaminfair@google.com, devicetree@vger.kernel.org, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, KFTING@nuvoton.com, JJLIU0@nuvoton.com, tali.perry1@gmail.com, ctcchien@nuvoton.com, kflin@nuvoton.com, tmaimon77@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This patch series add DTS node, dt-bindings document and driver for memory
controller present on Nuvoton NPCM SoCs.

The memory controller supports single bit error correction and double bit
error detection (in-line ECC in which a section 1/8th of the memory device
used to store data is used for ECC storage).

v15:
  - Move dt-bindings document to memory-controllers directory and remove
    superfluous string in content title

v14:
  - Fix compile warnings

v13:
  - Support error injection via debugfs
  - Fix coding style issues

Marvin Lin (3):
  arm: dts: nuvoton: Add node for NPCM memory controller
  dt-bindings: edac: nuvoton: Add document for NPCM memory controller
  EDAC/nuvoton: Add NPCM memory controller driver

 .../memory-controllers/nuvoton,npcm-mc.yaml   |  54 ++
 MAINTAINERS                                   |   7 +
 arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi |   7 +
 drivers/edac/Kconfig                          |  11 +
 drivers/edac/Makefile                         |   1 +
 drivers/edac/npcm_edac.c                      | 516 ++++++++++++++++++
 6 files changed, 596 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/nuvoton,npcm-mc.yaml
 create mode 100644 drivers/edac/npcm_edac.c

-- 
2.34.1

