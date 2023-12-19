Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 810188192FC
	for <lists+openbmc@lfdr.de>; Tue, 19 Dec 2023 23:04:15 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=HUxu6JGW;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SvrM11cF6z3cSP
	for <lists+openbmc@lfdr.de>; Wed, 20 Dec 2023 09:04:13 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=HUxu6JGW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52d; helo=mail-pg1-x52d.google.com; envelope-from=baneric926@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SvTdm3BSwz3vjW
	for <openbmc@lists.ozlabs.org>; Tue, 19 Dec 2023 19:00:43 +1100 (AEDT)
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-5c6ce4dffb5so1318133a12.0
        for <openbmc@lists.ozlabs.org>; Tue, 19 Dec 2023 00:00:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702972841; x=1703577641; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uw+kYnYNk9hZHNMOrj4qxXorwiwE6kTW/ev0nql9iYg=;
        b=HUxu6JGWf4xEQILdlKeARzQXrwjeAxatmNY3FGj243I22Rsbh2pAiaOb6ivBcQ3HLm
         4nd0yPuHSGayvvOWvC0j9fwOOUmWlZ7YNhX5Ld7jMHOA8Uke3lkInd3vQW/A8SQYDmVf
         Xs+g3qSA8UQN2FVUA9WU9x6x2z5d2B45S6m8fTeMNIQMdxUPLHWvtp5QiLac67SemQen
         DfAQ4c+S+kpwVa22We2z5v5oAOCvV5c0MrDch0XvT/QAHx+CMHn+52ReW5gfbZoWpa9J
         WX84hiPFvxVXtspjhgIVQzeDYSoqTjZ/OSf2Jn0/YDo4ekz7wz8/uOiIYhnYA+dPkdHT
         vS2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702972841; x=1703577641;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uw+kYnYNk9hZHNMOrj4qxXorwiwE6kTW/ev0nql9iYg=;
        b=vEizVvqeoZTagRSz8LKL54gKtmPTLAdCB1/aVEjB+rONvq7isiiZe+M45i06Sd8DE6
         Tw0Ftk7v/GUy/KWF+vBfhCYgjWvkcSDPyFlrR7QTlPxlZeuyEKD3ZGrJOFacBrtkzzSK
         f0G6ms0YfKTb7RHoC8dNVjAc0+iwEzlP1CL2HbJ67/RKkIt1myva2L89lNbKzX4EB5Kx
         9mEuUfkuz8keELM+GpZnpwuGyt6y1etxjbVdro4Hroyx3SefTvuwA/cT3E2Qcs1CEg9R
         cYfiu6tGrWpaFAn9uDRV/0H9jqEvYbzCeHyoBRMwffkM4qFnzbqLbrcYdI/ejmpi+pUR
         XVpQ==
X-Gm-Message-State: AOJu0Yx38Y2ARC5nBel9594poRNsB2HSuoFGHwNrW+V1VnD2yse2xArc
	27P58/ke4rZxo4THnOy28wo=
X-Google-Smtp-Source: AGHT+IHDS5YCYIfRlrtW0Hkq+K/JcbqTDdBHtWGryLIVehkw0TtH79JKy50MoK5i0ZaTlsIS8OeNNw==
X-Received: by 2002:a05:6a20:7fa6:b0:18f:dde5:7211 with SMTP id d38-20020a056a207fa600b0018fdde57211mr8990952pzj.7.1702972840569;
        Tue, 19 Dec 2023 00:00:40 -0800 (PST)
Received: from hcdev-d520mt2.. (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id jl13-20020a170903134d00b001d0b410271fsm20261005plb.218.2023.12.19.00.00.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Dec 2023 00:00:40 -0800 (PST)
From: baneric926@gmail.com
X-Google-Original-From: kcfeng0@nuvoton.com
To: jdelvare@suse.com,
	linux@roeck-us.net,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	corbet@lwn.net
Subject: [PATCH v2 0/2] hwmon: Driver for Nuvoton NCT7363Y
Date: Tue, 19 Dec 2023 16:00:19 +0800
Message-Id: <20231219080021.2048889-1-kcfeng0@nuvoton.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 20 Dec 2023 09:03:45 +1100
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
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, kcfeng0@nuvoton.com, kwliu@nuvoton.com, openbmc@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, DELPHINE_CHIU@wiwynn.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Ban Feng <kcfeng0@nuvoton.com>

NCT7363Y is an I2C based hardware monitoring chip from Nuvoton.

Changes since version 1:
- Modify NCT736X(nct736x) to NCT7363Y(nct7363)
- Convert to devm_hwmon_device_register_with_info API
- All ID tables are next to each other and should be consistent
  between i2c_device_id and of_device_id
- Ref. fan-common.yaml and modify properties (nuvoton,pwm-mask/
  nuvoton,fanin-mask) to (pwms/tach-ch)
- Convert to devm_regmap_init_i2c API
- Remove unused function (watchdog timer)
- Fix uninitialized symbol which is reported by kernel test robot

Ban Feng (2):
  dt-bindings: hwmon: Add NCT7363Y documentation
  hwmon: Driver for Nuvoton NCT7363Y

 .../bindings/hwmon/nuvoton,nct7363.yaml       |  62 +++
 Documentation/hwmon/index.rst                 |   1 +
 Documentation/hwmon/nct7363.rst               |  33 ++
 MAINTAINERS                                   |   8 +
 drivers/hwmon/Kconfig                         |  11 +
 drivers/hwmon/Makefile                        |   1 +
 drivers/hwmon/nct7363.c                       | 515 ++++++++++++++++++
 7 files changed, 631 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/nuvoton,nct7363.yaml
 create mode 100644 Documentation/hwmon/nct7363.rst
 create mode 100644 drivers/hwmon/nct7363.c

-- 
2.34.1

