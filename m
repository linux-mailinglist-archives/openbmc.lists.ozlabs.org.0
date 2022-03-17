Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EC1B4DBCC1
	for <lists+openbmc@lfdr.de>; Thu, 17 Mar 2022 02:59:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KJr1H0Rthz30M3
	for <lists+openbmc@lfdr.de>; Thu, 17 Mar 2022 12:59:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=fWjxUKjy;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::635;
 helo=mail-pl1-x635.google.com; envelope-from=medadyoung@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=fWjxUKjy; dkim-atps=neutral
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KJr0q73FZz2y8P
 for <openbmc@lists.ozlabs.org>; Thu, 17 Mar 2022 12:59:07 +1100 (AEDT)
Received: by mail-pl1-x635.google.com with SMTP id t22so3324660plo.0
 for <openbmc@lists.ozlabs.org>; Wed, 16 Mar 2022 18:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OOu3Dv7ymaz0yaa5xrcvhaRsxtjz1a2I15CMgD9fMiA=;
 b=fWjxUKjyrz8Pb620UJ5EtJrVsMOdAtUb6yYFngyCwkY7GZOqTWsU5uB1+qaBdW0GCX
 gjDTezBiAyI+zjEoZyxP80SKXj3E+f+FgYGxBbTZIUTQLjghEt/K+AhbWIXrs8LK+/nI
 7ec/KKLR7or3Dvr9OsN+JXEzsm2OaQk/5e50hsfpqQJZtlOv6mNlFzbTp783IPyoZr45
 17wCKQhTpjBrfGNZpJ52PTeMg6vqUN2CP9ExIHm/V5ksV/52c7FzlyOZDstZwX9U4lZy
 GqYKdtP3xgoUd2zZOisHLY3TFmNZDTotXYEBYXWN7ns6Tg4LT9KcgoyydkCa9Piu+s4h
 hGLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OOu3Dv7ymaz0yaa5xrcvhaRsxtjz1a2I15CMgD9fMiA=;
 b=T9HEPsw+HXZKepIAyWpidO1oviwCQn481zI4vjfCcwoLXkfa2n9T3HyTjFPlU7zEMA
 /Hj0OeJVEFnFyJroe9PfI3xKf8slpwugYjbTJAqhZQaYA5hKh/1eQRIiQXRKARDE9+Jr
 AuVqRDen8xq3aSfSs0zDMV5SQSl0tlUQ3C0jUFDHuG3Qr4sx/Sm1/wv6iEjCUycwntSB
 wQCTkKVnAp2eVlaDRcrDKfzPZSXX9PsAOAe3Y7iXZqbZCyhWdulZlSmHOCc5YTOyfPY3
 2UGQtpAtTotvxH/n9iU/Z3PHpOSu7zboGNMe8ic5SAl94/Y55jrlVIgKEa7k1TkmEpih
 kzLA==
X-Gm-Message-State: AOAM530jrXWi3yKjK4bISFd1/fdJDwQiW3h5brX0bXMDHzs3pspNKucZ
 NiQg9l94bNh95hSXjuU2h2k=
X-Google-Smtp-Source: ABdhPJx59NLfgkhIv20XhLC9jFj4zU7KpOCkjlO2ZZPnsvgxjnKo41ny/0Zwq6LktZcW5dSOKxoyMw==
X-Received: by 2002:a17:902:a40d:b0:153:7213:1584 with SMTP id
 p13-20020a170902a40d00b0015372131584mr2390788plq.56.1647482343703; 
 Wed, 16 Mar 2022 18:59:03 -0700 (PDT)
Received: from localhost.localdomain ([116.89.135.255])
 by smtp.gmail.com with ESMTPSA id
 nn15-20020a17090b38cf00b001bfceefd8cfsm7945528pjb.48.2022.03.16.18.58.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Mar 2022 18:59:02 -0700 (PDT)
From: Medad CChien <medadyoung@gmail.com>
X-Google-Original-From: Medad CChien <ctcchien@nuvoton.com>
To: rric@kernel.org, james.morse@arm.com, tony.luck@intel.com,
 mchehab@kernel.org, bp@alien8.de, robh+dt@kernel.org,
 benjaminfair@google.com, yuenn@google.com, venture@google.com,
 KWLIU@nuvoton.com, YSCHU@nuvoton.com, JJLIU0@nuvoton.com,
 KFTING@nuvoton.com, avifishman70@gmail.com, tmaimon77@gmail.com,
 tali.perry1@gmail.com, ctcchien@nuvoton.com
Subject: [PATCH v5 0/3] EDAC: nuvoton: Add nuvoton NPCM memory controller
 driver
Date: Thu, 17 Mar 2022 09:58:51 +0800
Message-Id: <20220317015854.18864-1-ctcchien@nuvoton.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Support memory controller for Nuvoton NPCM SoC.

Addressed comments from:
 - Rob Herring : https://lkml.org/lkml/2022/2/25/1103
 - Krzysztof Kozlowski : https://lkml.org/lkml/2022/2/27/63
 - Rob Herring : https://lkml.org/lkml/2022/3/2/828
 - Krzysztof Kozlowski : https://lkml.org/lkml/2022/3/11/294
 - Jonathan Neuschäfer : https://lkml.org/lkml/2022/3/11/1167
 - Krzysztof Kozlowski : https://lkml.org/lkml/2022/3/11/293
 - Rob Herring : https://lkml.org/lkml/2022/3/11/575
 - Krzysztof Kozlowski : https://lkml.org/lkml/2022/3/11/305
 - Avi Fishman : https://lkml.org/lkml/2022/3/13/339
 - Krzysztof Kozlowski : https://lkml.org/lkml/2022/3/14/93
 - Krzysztof Kozlowski : https://lkml.org/lkml/2022/3/14/95
 - Krzysztof Kozlowski : https://lkml.org/lkml/2022/3/15/378
 
Changes since version 5:
 - Update commit message of dt-bindings: edac: nuvoton: add NPCM memory controller.
 
Changes since version 4:
 - Update filename in nuvoton,npcm-memory-controller.yaml.
 - Add COMPILE_TEST in Kconfig.
 - Fix errors in npcm_edac.c.
 - Remove unnecessary checking after of_match_device() and of_device_get_match_data().

Changes since version 3:
 - Rename npcm-edac.yaml as nuvoton,npcm-memory-controller.yaml.
 - Drop 'EDAC' in title of nuvoton,npcm-memory-controller.yaml.
 - Update compatible in nuvoton,npcm-memory-controller.yaml.

Changes since version 2:
 - Update description and compatible in npcm-edac.yaml.
 - Remove address-cells and size-cells in npcm-edac.yaml.
 - Reorder the items of examples in npcm-edac.yaml.
 - Reorder header file in driver.

Changes since version 1:
 - Add nuvoton,npcm750-memory-controller property in NPCM devicetree.
 - Add new property in edac binding document.
 - Add new driver for nuvoton NPCM memory controller.

Medad CChien (3):
  ARM: dts: nuvoton: Add memory controller node
  dt-bindings: edac: nuvoton: add NPCM memory controller
  EDAC: nuvoton: Add NPCM memory controller driver

 .../edac/nuvoton,npcm-memory-controller.yaml  |  62 ++
 arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi |   7 +
 drivers/edac/Kconfig                          |   9 +
 drivers/edac/Makefile                         |   1 +
 drivers/edac/npcm_edac.c                      | 710 ++++++++++++++++++
 5 files changed, 789 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/edac/nuvoton,npcm-memory-controller.yaml
 create mode 100644 drivers/edac/npcm_edac.c

-- 
2.17.1

