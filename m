Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CB0B66D5C38
	for <lists+openbmc@lfdr.de>; Tue,  4 Apr 2023 11:43:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PrNBC50s3z3cZp
	for <lists+openbmc@lfdr.de>; Tue,  4 Apr 2023 19:43:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=YeuAYOJg;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::135; helo=mail-lf1-x135.google.com; envelope-from=linus.walleij@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=YeuAYOJg;
	dkim-atps=neutral
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PrN9d3ZZCz3c9r
	for <openbmc@lists.ozlabs.org>; Tue,  4 Apr 2023 19:43:15 +1000 (AEST)
Received: by mail-lf1-x135.google.com with SMTP id y15so41596889lfa.7
        for <openbmc@lists.ozlabs.org>; Tue, 04 Apr 2023 02:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680601389;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KRzv9smVSuXlAiuE6nE47MRg/YlyfJfzc/qVDw1E+Jg=;
        b=YeuAYOJg8RKBKpsfUQjs/kgAenYVEmVwzqJbLFsEPK/KvREOv8xHEoKRmXoFF7sPyG
         v2qbxWjM6hY16GcIoIv5VlHp1y3IWXkCvM033GOY60rNXlDxTma6lriRVkpEecryoOuI
         4Swi+Hc4peb5e13297zht3+L7ukFfdsHE1oflRo/336tvzgz+SlmDq1uV/oG7cqiw3SQ
         ZDDW8p1Fg9K6mHpto+5dHuUssMgWQG9JwDkCUgkJMewCircHt2XNc5aqRRfRZVCQGN5L
         UcbwPZmtLWSbcIk7BUNj1Q0lKn6PxJYm2CxlJ+uzg+3ec3cyst41vGif/jvVpx6dTIIj
         Wt5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680601389;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KRzv9smVSuXlAiuE6nE47MRg/YlyfJfzc/qVDw1E+Jg=;
        b=Eokp6FRyDEGjVUw6j7P9rd7ICKcasdkJgRTpNcrJUZOknUeIa6jeeTcUUAHwnWfv/W
         yIOk5Cfad7L6UJ3jftexNrbtzJRGoIfUERxdXmpZ22h3SNEp09GJI0irCXBpAQKofEaY
         ynDAVNFwSR7A5UjU06CF7WPvx4/TXoRGyZPinOya/aVOTWLKtAaL3jnrY6L+YCTHWeVm
         zFDf/tb559YyZZzNSoc3+l64APl8P6wLspXIP/04Nq+dGBznDb5ujgLpnOPbKsP/1I+x
         qvmKxez5xntdG2Y0OWqPBUQB3VOAWOdggyKRGuK8RZfW6gt81FD7uy2sj88zj8eHJfSe
         wk0w==
X-Gm-Message-State: AAQBX9d4sO2LETx4lFCPcjz7/Zz6TULq600TLkVaFLODRjS/MZUtW+2f
	izEvwMnG1th+ga8gm1+5QlC5vg==
X-Google-Smtp-Source: AKy350b7Z4E6Q1dfw8Fpr7MDoDfW/n0vIeQesGBJNCLP89rnF9qd2fn2IS/qJGPHUXKFEfnY+2tHEg==
X-Received: by 2002:ac2:4c34:0:b0:4b6:f51e:b8b6 with SMTP id u20-20020ac24c34000000b004b6f51eb8b6mr517329lfq.56.1680601389522;
        Tue, 04 Apr 2023 02:43:09 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id l25-20020a19c219000000b004eb258f73a9sm2218443lfc.163.2023.04.04.02.43.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 02:43:09 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 0/9] Convert low hanging pinctrl irqchips to be immutable
Date: Tue, 04 Apr 2023 11:43:02 +0200
Message-Id: <20230403-immutable-irqchips-v1-0-503788a7f6e6@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACbxK2QC/22NSw7CMAwFr1J5TaS0qcrnKoiFkxpiiYZgU4RU9
 e64rFmO5o3eAkrCpHBqFhB6s/KjGLS7BlLGciPHozF0vgu+98HxNM0vjHcT8kyZq7rjAdMY+j2
 1wwAWRlRyUbCkvKVX/sz1T7dNq5Dp3//5sq5f3vhqFo8AAAA=
To: Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
 Patrice Chotard <patrice.chotard@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.12.1
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
Cc: Marc Zyngier <maz@kernel.org>, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This repeats the two-fold exercise in the GPIO subsystem
by doing the same for pin control: let's switch over all
easily identifiable irqchips to be immutable.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Linus Walleij (9):
      pinctrl: iproc: Convert to immutable irq_chip
      pinctrl: nsp: Convert to immutable irq_chip
      pinctrl: armada-37xx: Convert to immutable irq_chip
      pinctrl: npcm7xx: Convert to immutable irq_chip
      pinctrl: equilibrium: Convert to immutable irq_chip
      pinctrl: mcp23s08: Convert to immutable irq_chip
      pinctrl: st: Convert to immutable irq_chip
      pinctrl: stmfx: Convert to immutable irq_chip
      pinctrl: sx150x: Convert to immutable irq_chip

 drivers/pinctrl/bcm/pinctrl-iproc-gpio.c    | 38 +++++++++++------
 drivers/pinctrl/bcm/pinctrl-nsp-gpio.c      | 23 ++++++-----
 drivers/pinctrl/mvebu/pinctrl-armada-37xx.c | 34 ++++++++++-----
 drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c   | 34 +++++++--------
 drivers/pinctrl/pinctrl-equilibrium.c       | 22 ++++++----
 drivers/pinctrl/pinctrl-equilibrium.h       |  2 -
 drivers/pinctrl/pinctrl-mcp23s08.c          | 36 +++++++++++-----
 drivers/pinctrl/pinctrl-mcp23s08.h          |  1 -
 drivers/pinctrl/pinctrl-st.c                | 16 ++++----
 drivers/pinctrl/pinctrl-stmfx.c             | 36 ++++++++++------
 drivers/pinctrl/pinctrl-sx150x.c            | 64 +++++++++++++++++------------
 11 files changed, 190 insertions(+), 116 deletions(-)
---
base-commit: fe15c26ee26efa11741a7b632e9f23b01aca4cc6
change-id: 20230403-immutable-irqchips-98acd347e166

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>

