Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 156DE8224F7
	for <lists+openbmc@lfdr.de>; Tue,  2 Jan 2024 23:50:41 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=permerror header.d=gmail.com header.i=@gmail.com header.a=rsa-sha1 header.s=20230601 header.b=KEytw/aX;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T4Sk65VDWz3bX5
	for <lists+openbmc@lfdr.de>; Wed,  3 Jan 2024 09:50:38 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=KEytw/aX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::12a; helo=mail-il1-x12a.google.com; envelope-from=baneric926@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com [IPv6:2607:f8b0:4864:20::12a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sx8wm0zL1z2xYk
	for <openbmc@lists.ozlabs.org>; Fri, 22 Dec 2023 12:34:30 +1100 (AEDT)
Received: by mail-il1-x12a.google.com with SMTP id e9e14a558f8ab-35fd9e40039so2794225ab.1
        for <openbmc@lists.ozlabs.org>; Thu, 21 Dec 2023 17:34:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703208867; x=1703813667; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Gzd2Vq49cs2OXoA1p9yPTdJ8jRds9If5/Ztk+9Dsun0=;
        b=KEytw/aXOgoCGJOjts0Y07pmHqoYGxtR37F4X01g0j8UMQxzP/vTYwh5sSWWz3Lg8M
         DGXTvW9A7ag9nOwjWrAZ2SGcOmFHpSsoosnPhQz37AEw3+G+85kdzC7e07II+uzeUA7P
         68aCgu7/lvsc1qtXObDdiEd7Y8cbMWbnD1Ig/Y8Cu4ifRlsXpH4l4MYME4nQ9noZa2w/
         5Ec69Ri1OEZuElgMMMTZeDr+kEKrF4XfnISR8tWhslQyiLOiOWkwPQOSkHdA31FApZlx
         g1HssDZEGTn/IMkqFasHnx2HL6jFCW3YoVmlWxPD3wJndAyhbFcnYn3u8L92PBUDYAVv
         eZAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703208867; x=1703813667;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gzd2Vq49cs2OXoA1p9yPTdJ8jRds9If5/Ztk+9Dsun0=;
        b=IMn9iQcJS4VXkSC5WdcgHYoPjoJyU6FmcRyTBngFwmn2X8NRb4BpHXG/x7mrQGxPkQ
         IaikPh0Y3gkpVzrXL/qide55BoLBWmSeAVcYUgWXcmCI0UpXrECemnMClojv/F42ONSs
         nh94mw+R4QnHIhd5aGcjxREixkJw7Nvv8ikz8eb7+yX+MLEh8QXNj78+UA9HApR5aJus
         smm1Q7bsQs8uakjK3cyl6YNORAVRRtdfMixVBkHkekwdmZ+81pnQFo5oGwnr9R8wEki/
         XRLsynAoOJ1+o4WtX7UUJsSUfqlhrvyxwwkJYv/xMwlO8ByPB6lqF719IiWMZAidL0Zq
         tkww==
X-Gm-Message-State: AOJu0YzE/91YwOjTAKoBq5Wkjx28P4Ba9Gq6Ba2jESFA6dEC4vZRfjfc
	uSXWpwWsvtAe/0tv/H8qeEU=
X-Google-Smtp-Source: AGHT+IEVj9D/whIu1FDqQtMmMPwJ51/a3mthgT8d8o+mlufUBen02S7Yk+XNPAXA0+012GUgSPnmRA==
X-Received: by 2002:a92:c267:0:b0:35f:daa8:5caf with SMTP id h7-20020a92c267000000b0035fdaa85cafmr793821ild.30.1703208867182;
        Thu, 21 Dec 2023 17:34:27 -0800 (PST)
Received: from hcdev-d520mt2.. (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id 5-20020a170902c24500b001d3d8e718c6sm2258634plg.282.2023.12.21.17.34.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 17:34:26 -0800 (PST)
From: baneric926@gmail.com
X-Google-Original-From: kcfeng0@nuvoton.com
To: jdelvare@suse.com,
	linux@roeck-us.net,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	corbet@lwn.net
Subject: [PATCH v3 0/3] hwmon: Driver for Nuvoton NCT7363Y
Date: Fri, 22 Dec 2023 09:33:49 +0800
Message-Id: <20231222013352.3873689-1-kcfeng0@nuvoton.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 03 Jan 2024 09:46:15 +1100
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
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, kcfeng0@nuvoton.com, kwliu@nuvoton.com, openbmc@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, DELPHINE_CHIU@wiwynn.com, naresh.solanki@9elements.com, billy_tsai@aspeedtech.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Ban Feng <kcfeng0@nuvoton.com>

NCT7363Y is an I2C based hardware monitoring chip from Nuvoton.

Changes since version 2:
- Cherry-pick the fan-common.yaml in [1]
- Fix nct736x typo and add unevaluatedProperties

[1]: https://patchwork.kernel.org/project/linux-hwmon/patch/
     20231107105025.1480561-2-billy_tsai@aspeedtech.com/

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

Naresh Solanki (1):
  dt-bindings: hwmon: fan: Add fan binding to schema

 .../devicetree/bindings/hwmon/fan-common.yaml |  76 +++
 .../bindings/hwmon/nuvoton,nct7363.yaml       |  63 +++
 Documentation/hwmon/index.rst                 |   1 +
 Documentation/hwmon/nct7363.rst               |  33 ++
 MAINTAINERS                                   |   8 +
 drivers/hwmon/Kconfig                         |  11 +
 drivers/hwmon/Makefile                        |   1 +
 drivers/hwmon/nct7363.c                       | 515 ++++++++++++++++++
 8 files changed, 708 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/fan-common.yaml
 create mode 100644 Documentation/devicetree/bindings/hwmon/nuvoton,nct7363.yaml
 create mode 100644 Documentation/hwmon/nct7363.rst
 create mode 100644 drivers/hwmon/nct7363.c

-- 
2.34.1

