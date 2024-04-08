Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B574989BD8F
	for <lists+openbmc@lfdr.de>; Mon,  8 Apr 2024 12:52:38 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=cWlLR23e;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VCmBr3lnqz3vX6
	for <lists+openbmc@lfdr.de>; Mon,  8 Apr 2024 20:52:36 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=cWlLR23e;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42d; helo=mail-pf1-x42d.google.com; envelope-from=potin.lai.pt@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VCm9M4LLqz3bXk
	for <openbmc@lists.ozlabs.org>; Mon,  8 Apr 2024 20:51:17 +1000 (AEST)
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-6eced6fd98aso3783025b3a.0
        for <openbmc@lists.ozlabs.org>; Mon, 08 Apr 2024 03:51:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712573475; x=1713178275; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iIzL8YShLcMoAtGulfb/NYpWjJTmCHCfK5SW2whJB/g=;
        b=cWlLR23ehjI9NMUB8GxIvYjlHjrt+S3UCmYNabZGWcNjOMYIwo1BV1BGDHXia9Gyy4
         /NP5lXv4EUz+jrmwtiCI/VhrrjGn5bSmBjst99lELSFFab8+x44uesgNTqOgt6ycnxk8
         HTnaDKFH4tK0f9D8DU/IG8kJXioy/VWfFF2/5NSQK6MBXyXWG6AkFIsnDcCpWcarS7af
         MR1HGdTP6F/YB9KqEnvIqh2qVvnRbo4NpV9SO9L9PUycE488diqUVhRrHlKVlExt3zMr
         f8n6JecsWs8VQAC7BCaxK3Uir9n9+3hSOo+NVvmZDLuRUZrxEmSMfLj+0WkJFRkHU4U0
         PUng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712573475; x=1713178275;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iIzL8YShLcMoAtGulfb/NYpWjJTmCHCfK5SW2whJB/g=;
        b=WBFWR/Wu9CCzZ8AhyerAsZ6Df/ciIdKQDDM0YXmuuGyqRAhK1MgJh7a1OGgi+9lgAW
         szqWN5gEnN8KIJBN+6bNXNYek3c/HoMZ95FIhbHXTmaOO96GQYYfY3m/8EASKgCEce/D
         l2igOh8szwloI5A9tGYTaVvsgFz6tkSywMeZrAlPlOPfzKwpm23RVz9V4c/61vtYb6BL
         enMMRFLhWv+O96VxP3zEJcpeNLu8gfTcriNzsxeraQokALQ6F+U0cr+R/onPz0Xo+wfz
         sqANjclblmzfIWqdF/Vs+o1lZ8m/3TZzXR0S5DxDyCwYwGhYzOunxCTEKL4MrbrUXrMf
         8EpA==
X-Gm-Message-State: AOJu0YyzkKwXHYTnv9NDk52ZyzVrc4kJC+N99/7NUyJu+Maua6WnP8wh
	HK3K3Vla3sNrILrUA3ak/98WLFEAYIQXJknep6ZL9C+G4jowWnEh/0PT1vZR
X-Google-Smtp-Source: AGHT+IH2HN9pVD59+BU23jFYEaBNefGxCi+Nr/06rgf0bsYr0S0pki+40lPlwe3DDg/7MnBli2s2Eg==
X-Received: by 2002:a05:6a21:1a2:b0:1a3:c4d9:3e19 with SMTP id le34-20020a056a2101a200b001a3c4d93e19mr9982823pzb.40.1712573474914;
        Mon, 08 Apr 2024 03:51:14 -0700 (PDT)
Received: from localhost.localdomain (1-34-21-66.hinet-ip.hinet.net. [1.34.21.66])
        by smtp.gmail.com with ESMTPSA id d4-20020a170902654400b001e2a484db76sm6818026pln.56.2024.04.08.03.51.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Apr 2024 03:51:14 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
X-Google-Original-From: Potin Lai <potin.lai@quantatw.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au,
	andrew@codeconstruct.com.au
Subject: [PATCH linux dev-6.6 0/3] Support pwm/tach driver for aspeed ast26xx
Date: Mon,  8 Apr 2024 18:50:57 +0800
Message-Id: <20240408105100.2946497-1-potin.lai@quantatw.com>
X-Mailer: git-send-email 2.31.1
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
Cc: billy_tsai@aspeedtech.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add pwm/tach driver support for aspeed ast26xx.

LORE Link: https://lore.kernel.org/all/20240221104025.1306227-1-billy_tsai@aspeedtech.com/

Billy Tsai (2):
  dt-bindings: hwmon: Support Aspeed g6 PWM TACH Control
  hwmon: (aspeed-g6-pwm-tacho): Support for ASPEED g6 PWM/Fan tach

Naresh Solanki (1):
  dt-bindings: hwmon: fan: Add fan binding to schema

 .../bindings/hwmon/aspeed,g6-pwm-tach.yaml    |  71 +++
 .../devicetree/bindings/hwmon/fan-common.yaml |  79 +++
 Documentation/hwmon/aspeed-g6-pwm-tach.rst    |  26 +
 Documentation/hwmon/index.rst                 |   1 +
 drivers/hwmon/Kconfig                         |  11 +
 drivers/hwmon/Makefile                        |   1 +
 drivers/hwmon/aspeed-g6-pwm-tach.c            | 549 ++++++++++++++++++
 7 files changed, 738 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/aspeed,g6-pwm-tach.yaml
 create mode 100644 Documentation/devicetree/bindings/hwmon/fan-common.yaml
 create mode 100644 Documentation/hwmon/aspeed-g6-pwm-tach.rst
 create mode 100644 drivers/hwmon/aspeed-g6-pwm-tach.c

-- 
2.31.1

