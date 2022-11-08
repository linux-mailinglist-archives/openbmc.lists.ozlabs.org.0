Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7622B62234C
	for <lists+openbmc@lfdr.de>; Wed,  9 Nov 2022 06:01:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N6Xqz1zv2z3f6v
	for <lists+openbmc@lfdr.de>; Wed,  9 Nov 2022 16:01:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=DZNEBycT;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1034; helo=mail-pj1-x1034.google.com; envelope-from=jim.t90615@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=DZNEBycT;
	dkim-atps=neutral
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N62qG41p7z3c9y
	for <openbmc@lists.ozlabs.org>; Tue,  8 Nov 2022 20:29:12 +1100 (AEDT)
Received: by mail-pj1-x1034.google.com with SMTP id gw22so13255130pjb.3
        for <openbmc@lists.ozlabs.org>; Tue, 08 Nov 2022 01:29:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JhquCNxmj0tC0Y1mqZV0fd38EeRIsiOPftoxsnYtrZw=;
        b=DZNEBycTqiCz+7bAyRIJ8gpffcgZmGri10+0rSgz74wddC/7ZMZpWGRlYUZE4E036Q
         fh8arMBqo+Mkw8y4jPPgwwp38FKO+zOX5Sbfe9dKf8x/0PhI2Xv9kJclg04cEgn1EwHw
         ngXUC0xSZIs7nCi8+hCjH59LRwzmczXW96/sAPA2nobWwSO9NpKUTvDrfUyTvkfS69aY
         DfLxW01WITl292Lyy15RFjqARjc4fnCgGPjsjowAQqkXQEoxot8+jdbArz+SYxiDAHP4
         a3xdVqzwkzPGP/QATUZn5pmtsUc6hDJXORKmOk9gpsDJilw8E7pEvePoGIPiLMpBx4z5
         zLCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JhquCNxmj0tC0Y1mqZV0fd38EeRIsiOPftoxsnYtrZw=;
        b=6tLg9w+eK/WG7wZQRWVyCjttaByBNizDi7qB0OBk/S/dK/CiNf20+TyuRelaqXvBC5
         YgqmWBA91fKkPbZiYgNqwO2Byw0gUd6EO4mttt7EEqvr5fm+ClAoxlU7vt6VW/OSRrPe
         EymPHdqiiojSqPxXlvS+7LY46iDkLF6xQ2ABmVkWyf5TZgudjIhCtyX7XGqYrt1cPwbw
         V+L5jRclLoTrQqqai/X+6zs8y1AKIQL6+2ixLKkTTHwO31cUC9YPLf4Y2od6k2V58g5K
         0uobQ+9ybP0FICHWge5RsoxL+2z6tCnOchFWvZTtO/y6vhi/16QnNPGcDIBMH/xawFCs
         BNBQ==
X-Gm-Message-State: ACrzQf0XPLw2Ziyy88n8FPDhAQAxFEWxv9wmJlt4N38UiZ/bf/XgNByo
	4en1PVqESyZyrCUv/lhBfRE=
X-Google-Smtp-Source: AMsMyM5NzUFgTEXXrK5ktQjLyqFKibaere+M3Puz0MsE5HIPBekAOhVzrznxVqXjiK0op+/W+Pb5wQ==
X-Received: by 2002:a17:903:2446:b0:187:11c6:6a1b with SMTP id l6-20020a170903244600b0018711c66a1bmr48620825pls.39.1667899749144;
        Tue, 08 Nov 2022 01:29:09 -0800 (PST)
Received: from localhost.localdomain ([180.217.157.203])
        by smtp.gmail.com with ESMTPSA id x17-20020a170902ec9100b00186727e5f5csm6467147plg.248.2022.11.08.01.29.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Nov 2022 01:29:08 -0800 (PST)
From: Jim Liu <jim.t90615@gmail.com>
X-Google-Original-From: Jim Liu <JJLIU0@nuvoton.com>
To: JJLIU0@nuvoton.com,
	jim.t90615@gmail.com,
	KWLIU@nuvoton.com,
	linus.walleij@linaro.org,
	brgl@bgdev.pl,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org
Subject: [PATCH v2 0/3] Support Nuvoton NPCM750 SGPIO
Date: Tue,  8 Nov 2022 17:28:37 +0800
Message-Id: <20221108092840.14945-1-JJLIU0@nuvoton.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Wed, 09 Nov 2022 15:58:50 +1100
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
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

NPCM750 include two SGPIO modules.
Each module supports up eight output ports and eight input ports.
And each port have eight pins, so each module supports up to 64 input and 64 output pins.
the output pin must be serial to parallel device(such as the hc595)
the input in must be parallel to serial device(such as the hc165).


Jim Liu (3):
  gpio:gpio-npcm-sgpio: Add Nuvoton sgpio driver
  arm: dts: nuvoton: npcm7xx: add sgpio node
  dt-bindings: gpio: Add Nuvoton NPCM750 serial I/O expansion
    interface(SGPIO)

 .../bindings/gpio/nuvoton,sgpio.yaml          |  79 +++
 arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi |  30 +
 drivers/gpio/Kconfig                          |   8 +
 drivers/gpio/Makefile                         |   1 +
 drivers/gpio/gpio-npcm-sgpio.c                | 640 ++++++++++++++++++
 5 files changed, 758 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/nuvoton,sgpio.yaml
 create mode 100644 drivers/gpio/gpio-npcm-sgpio.c

-- 
2.17.1

