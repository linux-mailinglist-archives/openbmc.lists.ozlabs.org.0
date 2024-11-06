Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 515FB9BF910
	for <lists+openbmc@lfdr.de>; Wed,  6 Nov 2024 23:17:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XkKLz39kBz3cG9
	for <lists+openbmc@lfdr.de>; Thu,  7 Nov 2024 09:17:15 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::433"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730860788;
	cv=none; b=TMPm9I1DfpT4KxSNZvRWUrkOZbjkqKmSe6CCJprdE7hUATnkh5upiDIgmQQGb6C20MgdSQdo8vhuiAYpc/OvnYnxO2c05DAlForo/dZg4yF7s6GFKCcek5GjOC8COkaPmTr68VuxqaYyE1HaVDlZN3Z9GpItnBPKkrM2Kxf8MPHiwKSN+riMDY/g/8ur96HFlR95KPnhOsw9XflRkm4Zr0xgK4mKvazP43jiFxHw1IQ4i0kIb5b/x5ZEFyBj6SQnexwDH7d9HA4TCXSSokaxTOCqPFDZxGRQBxC/x+ta1f28qBa811PPX8wXnMiaJhwW2fzLlPBh3iEkFVoFFeKVWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730860788; c=relaxed/relaxed;
	bh=5aqta9xWdl89diKgAynphJa4Bu9tznPgpZ4juTK/lOs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=gvPVA0vDiRvQjzZtURYCCKyVTNF8GxUVO3pbzeqqYwypQOXb/cz8yfIvxQonL4zP+gm9X3ati2slZg3ZWN0mzn6n6q6GCylblXjKx5ZcYrHc9O5NjitO4Fwj2TRtAQ6Z+ITkHxa+DsKrj8Lau+UPaut1TRYcsSaSwZaI94sGpCkEmRt7DFuI5jCInU5oRCb347RdpnOtqt1Vsuj4J5yYJwmUC3PSss1efg26ysIODFFrnWhaRRXinGHv3KSL+2etMmgIZr0GqPppm4RPBkdZ0PZX2ir41WcW/8N35W3BjEp2+mn1CGa0QeZnBx8Gnqim5ppTy4llZI0KdDmxQP2g1Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Ot+Y8fo7; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::433; helo=mail-pf1-x433.google.com; envelope-from=j2anfernee@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Ot+Y8fo7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::433; helo=mail-pf1-x433.google.com; envelope-from=j2anfernee@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XjqDK4fPHz2yfm
	for <openbmc@lists.ozlabs.org>; Wed,  6 Nov 2024 13:39:44 +1100 (AEDT)
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-71e5130832aso5050491b3a.0
        for <openbmc@lists.ozlabs.org>; Tue, 05 Nov 2024 18:39:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730860776; x=1731465576; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5aqta9xWdl89diKgAynphJa4Bu9tznPgpZ4juTK/lOs=;
        b=Ot+Y8fo7ttXo37UCkm0ah+n8GDhC+cSvoj9pKJPiXQ6zuy2lDt6kLae+qnHfBXAZyb
         X67+TemrKfoPNqnXA4YtNQDdM1eCxHIV5LAHtzR4AokbV0qj9ntqLnSfAwVCjGJ6xhmh
         JCdHMEt5dewXwnairB5Bd67rbXv5CYEce8uUC5PUYwvC2m9D9m9NLOqsnUTMMwG1xq97
         PHTgNOgRbpSyRjQvveT5RJJFQpM4wneS/xRgY3ltWsNTTonD6k9d8MY4PW54X+lGJTNe
         6vGWYhIUQDI3hgL5CeK01cot6jvviNPbdOINKFyap43QOblavjU5d9Oyu1SgnH5EZtyD
         2ieQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730860776; x=1731465576;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5aqta9xWdl89diKgAynphJa4Bu9tznPgpZ4juTK/lOs=;
        b=Wzf4E6cdWxqI1GbGyFqE0aXw05xeCzWiGf7758fEudDi0FNqjIYDYMCMW4iHgKIKkP
         E8NDuQ6DyxDJt2MIaGUO357nHVMNRHQ8QfxfxVQKzulzyOatXho5BfViabkfdEzbsI0Q
         kcuLxbMJeIcZuvWfaJJv9h6kNrFOQjTZySYDGzxhRy4LyE1s9hCoa2y63ByD29/Acrys
         fsh1TPW8fOwU93s7jDEjprEQb86+RoikPVg1gfwA5S9//uxL/B5DUWgJwPH3P2jiCl1x
         5a9B4ZQg0RgCNykyl9vtT1vzuIO/imdk+4ItDqGUFcnd3Dr+KVzfnetgZxgKHL2rguiJ
         F+ZQ==
X-Gm-Message-State: AOJu0Yyp+V/RF5Bb9feHlWQiBV0kN+UH8hesrN7K8I77xluXfB6D+Nk2
	7foU0wj62FWe9OZaM7vE2OjB6lrvt4urw4gCdC5MsRgYtIvYpIbP
X-Google-Smtp-Source: AGHT+IGHXwrWMQWOHGiJbdIOc25nriZXhePbhiKeAdZty+sczhomUbGDQZgQON2Ctu8YaN4Kln3sSg==
X-Received: by 2002:a05:6a00:a2a:b0:71d:f64d:ec60 with SMTP id d2e1a72fcca58-720c98a3d45mr24435157b3a.7.1730860775842;
        Tue, 05 Nov 2024 18:39:35 -0800 (PST)
Received: from hcdev-d520mt.. (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-720bc2c39acsm10382484b3a.137.2024.11.05.18.39.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 18:39:35 -0800 (PST)
From: Eason Yang <j2anfernee@gmail.com>
To: avifishman70@gmail.com,
	tmaimon77@gmail.com,
	tali.perry1@gmail.com,
	venture@google.com,
	yuenn@google.com,
	benjaminfair@google.com,
	jic23@kernel.org,
	lars@metafoo.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	nuno.sa@analog.com,
	dlechner@baylibre.com,
	javier.carrasco.cruz@gmail.com,
	andy@kernel.org,
	marcelo.schmitt@analog.com,
	olivier.moysan@foss.st.com,
	mitrutzceclan@gmail.com,
	matteomartelli3@gmail.com,
	alisadariana@gmail.com,
	joao.goncalves@toradex.com,
	marius.cristea@microchip.com,
	mike.looijmans@topic.nl,
	chanh@os.amperecomputing.com,
	KWLIU@nuvoton.com,
	yhyang2@nuvoton.com
Subject: [PATCH v1 0/2] iio: adc: add Nuvoton NCT720x ADC driver
Date: Wed,  6 Nov 2024 10:39:14 +0800
Message-Id: <20241106023916.440767-1-j2anfernee@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailman-Approved-At: Thu, 07 Nov 2024 09:17:12 +1100
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
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Eason Yang <j2anfernee@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Changes since version 1:
 - Add new property in iio:adc binding document.
 - Add new driver for Nuvoton NCT720x driver.

Eason Yang (2):
  dt-bindings: iio: adc: Add binding for Nuvoton NCT720x ADCs
  iio: adc: add Nuvoton NCT720x ADC driver

 .../bindings/iio/adc/nuvoton,nct720x.yaml     |  47 ++
 MAINTAINERS                                   |   2 +
 drivers/iio/adc/Kconfig                       |   9 +
 drivers/iio/adc/Makefile                      |   1 +
 drivers/iio/adc/nct720x.c                     | 617 ++++++++++++++++++
 5 files changed, 676 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/nuvoton,nct720x.yaml
 create mode 100644 drivers/iio/adc/nct720x.c

-- 
2.34.1

