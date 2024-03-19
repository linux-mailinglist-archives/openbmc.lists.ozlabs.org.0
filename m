Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F0F487FAD2
	for <lists+openbmc@lfdr.de>; Tue, 19 Mar 2024 10:35:54 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=TcRk8frN;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TzRRW6h81z3dgN
	for <lists+openbmc@lfdr.de>; Tue, 19 Mar 2024 20:35:51 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=TcRk8frN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::532; helo=mail-pg1-x532.google.com; envelope-from=manojkiran.eda@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TzRR10bggz3bnv;
	Tue, 19 Mar 2024 20:35:24 +1100 (AEDT)
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-5ce07cf1e5dso3609813a12.2;
        Tue, 19 Mar 2024 02:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710840921; x=1711445721; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=32AXx27SSzTCLszDWarNun8O1zcaf1jj0VawsZbBOHE=;
        b=TcRk8frNUEgasru2+4PU1q6NpHClOL40K3o0mKZOazTq1pne/HPo9XU+OtIDEibEqU
         KQslEL1Ougo/Kwy8TUNxqKEzpT6LGnR27NWFrzeoSp9dlmSo0RlcJ2+0hyBXgoePuRPW
         rDttLuFODcIiWgSOhuM74kxZwRv2WxQQ2qx9GIkmH4ULyo5Qcmevb71vaiYuvnokiC2W
         IyYlMGSQWTadG/+y6lxZv83UNXyEHKeUk/WVBDQKwdL0ENIib0WaiWuvFprI1c70XNjH
         TpDrWN90cSOYIPjsz//rzrjaMRtNZki6gVs271HPKEYCVPBqho8w597BzpdOWCe0U2lw
         SGUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710840921; x=1711445721;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=32AXx27SSzTCLszDWarNun8O1zcaf1jj0VawsZbBOHE=;
        b=PLCJANpuyfn/4zH095u4/rZRwoN0Sk7W6qpiH8L9G/QqiHHfHvdcortr/BNUfckMS+
         7CRBlInGWLZsDubMyqtVghDbivD6uFnrU6zE+qMI2g7x+fqOw5h8E6x9QgNf4If5HUML
         fuO3lpm6nqqK43SvEkd/KJS4L8UBTKB+OtTgHhnRl69t5EY8w72bTvp3y/CVlMRKiSux
         9S6boNd7XLbUNGhaOtGdhUkR+KG8k10OogofkloVUB8AShzKK4jmX+zsixoYa95QgkeB
         z9ouY3WGuUhN87c93eiZL0C4toRsIZn/QU/iteGc7kj3ZsQyz+tOrn9NlMraizT63iOU
         a60Q==
X-Forwarded-Encrypted: i=1; AJvYcCVUaLCDL2LgLYJhJcOfRR782plgRDfr4fVr2KlELbMAFexWZHqAfNXBYqZ9B2+ei8Yl5ELtbzIodPk0NCCUOKakXwS3FeGDNGmnABrpAxXBeVBwthyKwHYsmoxVfY7Pz9YhANUkb5yB
X-Gm-Message-State: AOJu0YwIonbRApx8nduAx8BZryGzzLGae1n39eYHWYkHeYPyxQdAaFGH
	u6C1X2aaaTwkXWE46vn7CQPtUNvl4BICAleDYutSuW7iZNaLl9q/
X-Google-Smtp-Source: AGHT+IHDM7HsAh3M015ITHV9MavYe4suAIxVy7uxIJgbuM/TKnaJlg+0UVSfSczJwcMqkUErwsaA9g==
X-Received: by 2002:a05:6a20:d49b:b0:1a3:55d2:1489 with SMTP id im27-20020a056a20d49b00b001a355d21489mr2341521pzb.7.1710840921367;
        Tue, 19 Mar 2024 02:35:21 -0700 (PDT)
Received: from localhost.localdomain ([129.41.58.3])
        by smtp.gmail.com with ESMTPSA id n5-20020a170903110500b001ddc0bc5934sm10942432plh.249.2024.03.19.02.35.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Mar 2024 02:35:21 -0700 (PDT)
From: Manojkiran Eda <manojkiran.eda@gmail.com>
To: patrick.rudolph@9elements.com,
	chiawei_wang@aspeedtech.com,
	ryan_chen@aspeedtech.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: [PATCH v2 0/4] Add eSPI device driver (flash channel)
Date: Tue, 19 Mar 2024 15:04:01 +0530
Message-Id: <20240319093405.39833-1-manojkiran.eda@gmail.com>
X-Mailer: git-send-email 2.40.1
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
Cc: conor+dt@kernel.org, vigneshr@ti.com, richard@nod.at, openbmc@lists.ozlabs.org, robh+dt@kernel.org, joel@jms.id.au, krzysztof.kozlowski+dt@linaro.org, miquel.raynal@bootlin.com, jk@codeconstruct.com.au, manojkiran.eda@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello everyone,

I'm presenting a revised version of the eSPI device driver patch series found at
the following link:

https://lore.kernel.org/openbmc/20220516005412.4844-1-chiawei_wang@aspeedtech.com/

This update addresses the issues identified during the review process.

While the previous patch series attempted to incorporate support for all four
different channels of eSPI using the ioctl interface , this new series focuses
on upstreaming the flash channel (using the mtd interface) initially, ensuring
that all review comments are duly addressed, before progressing further.

Diff between PACTH v1-v2:
1. The commit is split into multiple commits as per the review comments.
2. Explicity renamed the driver to indicate that it only support master attached
flash storage (mafs).
3. Added new kconfig options to enable/disable eSPI mafs support.


Results:

Successfully conducted a flash update via eSPI.




Manojkiran Eda (4):
  Add eSPI device driver (flash channel)
  mtd: Replace module_init with subsys_initcall
  ARM: dts: aspeed: Add eSPI node
  dt-bindings: aspeed: Add eSPI controller

 .../bindings/soc/aspeed/aspeed,espi.yaml      |  94 ++++
 arch/arm/boot/dts/aspeed/aspeed-g5.dtsi       |  19 +
 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi       |  20 +
 drivers/mtd/mtdcore.c                         |   2 +-
 drivers/soc/aspeed/Kconfig                    |  38 ++
 drivers/soc/aspeed/Makefile                   |   2 +
 drivers/soc/aspeed/aspeed-espi-ctrl.c         | 197 ++++++++
 drivers/soc/aspeed/aspeed-espi-ctrl.h         | 169 +++++++
 drivers/soc/aspeed/aspeed-espi-flash-mafs.c   | 467 ++++++++++++++++++
 drivers/soc/aspeed/aspeed-espi-flash.h        |  71 +++
 10 files changed, 1078 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/soc/aspeed/aspeed,espi.yaml
 create mode 100644 drivers/soc/aspeed/aspeed-espi-ctrl.c
 create mode 100644 drivers/soc/aspeed/aspeed-espi-ctrl.h
 create mode 100644 drivers/soc/aspeed/aspeed-espi-flash-mafs.c
 create mode 100644 drivers/soc/aspeed/aspeed-espi-flash.h

-- 
2.40.1

