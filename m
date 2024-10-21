Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48F0F9A5A5A
	for <lists+openbmc@lfdr.de>; Mon, 21 Oct 2024 08:28:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XX53C1Dgrz3g1Z
	for <lists+openbmc@lfdr.de>; Mon, 21 Oct 2024 17:28:07 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::52d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729492082;
	cv=none; b=EmX7xtwohP45D0xt85Cb3ToL4uUX47KTkLlIbrt2En48gWX3CQQy+YlXamjwC64yza6jamjylVWT+rAvNjyG37aHNIiihZjYcZ5aiQCa4Ma4vkFyS9IYY8oUlHClRcPPoYQQdi68/o9a73u5bRetciZ/NJ6EFnSvOIaMtEe6AGYGRt2lXHtjhkGtNHxVecuPHK50fF4hfrDvy5SMu/BAAyXLlg93P9v4hy8zcN0oTqV2kmgXdms7ipyJUVfyy1Hx/2t6pDmROmMUAC4HUepW/c2f4SPJAWu0BsBY8VY8WFP4pJ9zw4M0nGbgBkApNEEh/SSZuMhA9lSn+M12ES8+ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729492082; c=relaxed/relaxed;
	bh=mOLFK47U9/Y6DQjYR5qVahjW1+FgiYlZ12obUNdB6kg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=XOY4/a1zBC5oxYQD+0HwKvN/NjXjGrG+3pppM+DSemL9M5m9uNnuH2qcMxqAYceiooRHyDGXrWMeyM5WE1cDEdWjY0XuS6vOx4IjzfY+bOynee23MQYXSZsTzvNyaMTZ+q3p4QzbIBBTEtSoEM+ru0qHC9chAkNiNekgEJPdxwJc9Bgqo72iwhYoNvyuVoXOnH8YmxKCVd++p3hvaUAMFavdCPXlQVktFVuuTCyQ+VlRacU26rYWsQ6gI2c/iU2ke8xxSRyFMvYgi31TQVRuG61lDszv2exj1YW9dBFbYA3sYzBnakd5ts2frpwUJo4BopskIyLIrBXmaud/kcjxKQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ZNUjHrPB; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::52d; helo=mail-pg1-x52d.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ZNUjHrPB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52d; helo=mail-pg1-x52d.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XX53530Bgz3fln
	for <openbmc@lists.ozlabs.org>; Mon, 21 Oct 2024 17:28:01 +1100 (AEDT)
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-7ead1edbf1dso1052706a12.0
        for <openbmc@lists.ozlabs.org>; Sun, 20 Oct 2024 23:28:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729492078; x=1730096878; darn=lists.ozlabs.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mOLFK47U9/Y6DQjYR5qVahjW1+FgiYlZ12obUNdB6kg=;
        b=ZNUjHrPBA4zdRcccrUT9ZiR16cICKK4/7lioPvedQ7+tR+Zaz9QcLvqs0v/i6jfRft
         Vnodtnql9cEzWmT3BU6wtAXwHsnOvMmiD9CBPQr0VCV3zpYlhnFETc8In/EcbtdnKJvx
         YEhjqyZ5TI3JkrqjT4sgueBIjMnFnqcLgNECWzVrFJEwehYfxA1gKg0LkPrz6+u9P3Uy
         Ot/4DJknJmqUPI6CdIQGgQIAFQQQTtra/L4Mo1j/dzhNZakmoSMT8M8VcBNTvULCCUF8
         gOL5PboEv5OijeknuANbi7Owbscf4TlOl8F/fbpPPFB4s+vCGLpCzOuQ7UsVXRlYsxHs
         vfOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729492078; x=1730096878;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mOLFK47U9/Y6DQjYR5qVahjW1+FgiYlZ12obUNdB6kg=;
        b=vsykjFJQnbpNn7WzCYrHNMHOWk5MfXIyMW0H+oP8OqO1EDWCnz/6UEMM627pxyovsE
         4VJZxiKqgbKgVW15BIViL+sDA6Rwx7h2Fxo3wvHV7cvpiljfv4p1zwpmfYjzi6Fnvudl
         4n8l0OPROHkr3VhFy5BbKmjRCGHYfLFEUpFq3nDcVdKFZJ3kEILRMWxeFmsb9PS7qAZT
         NcnyvuJHevncTPzneRN4HDUi/hBTrZVjdT1vxLmIfvNJj+cE0XapK2mwi1SaAWkUHvoZ
         PYFjdo6LCppImTaZAMBrzpTsjvWWlJCm+VsapNDGw/OeIYeraCYXIYcLkRCzZirOISjv
         HyZw==
X-Gm-Message-State: AOJu0YzGG1222eftPWqxI/B/zUEeonNuVvRtCJYfR/XUxt3bY+xVZVmS
	dK1eow//kH+62XZ0uN5ZgimDnaD3vshXwsyjX30bzcXvsJWJLjE=
X-Google-Smtp-Source: AGHT+IESXZ+/N3PIyc7LDJsv7sVHecGiuGUJEHC9qjMUpsNRwbQBPLejQVhpBz9mg4VYhkBtf6gopw==
X-Received: by 2002:a05:6a21:3a94:b0:1d8:a759:525b with SMTP id adf61e73a8af0-1d92c575d5cmr15442030637.34.1729492078605;
        Sun, 20 Oct 2024 23:27:58 -0700 (PDT)
Received: from localhost (2001-b400-e38e-c9a7-dd38-775c-4093-c057.emome-ip6.hinet.net. [2001:b400:e38e:c9a7:dd38:775c:4093:c057])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7eaeaafaa40sm2236471a12.15.2024.10.20.23.27.57
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 20 Oct 2024 23:27:58 -0700 (PDT)
From: Tyrone Ting <warp5tw@gmail.com>
X-Google-Original-From: Tyrone Ting <kfting@nuvoton.com>
To: avifishman70@gmail.com,
	tmaimon77@gmail.com,
	tali.perry1@gmail.com,
	venture@google.com,
	yuenn@google.com,
	benjaminfair@google.com,
	andi.shyti@kernel.org,
	andriy.shevchenko@linux.intel.com,
	wsa@kernel.org,
	rand.sec96@gmail.com,
	wsa+renesas@sang-engineering.com,
	warp5tw@gmail.com,
	tali.perry@nuvoton.com,
	Avi.Fishman@nuvoton.com,
	tomer.maimon@nuvoton.com,
	KWLIU@nuvoton.com,
	JJLIU0@nuvoton.com,
	kfting@nuvoton.com
Subject: [PATCH v7 4/4] i2c: npcm: Enable slave in eob interrupt
Date: Mon, 21 Oct 2024 14:27:32 +0800
Message-Id: <20241021062732.5592-5-kfting@nuvoton.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20241021062732.5592-1-kfting@nuvoton.com>
References: <20241021062732.5592-1-kfting@nuvoton.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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
Cc: openbmc@lists.ozlabs.org, Charles Boyer <Charles.Boyer@fii-usa.com>, Vivekanand Veeracholan <vveerach@google.com>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Charles Boyer <Charles.Boyer@fii-usa.com>

Nuvoton slave enable was in user space API call master_xfer, so it is
subject to delays from the OS scheduler. If the BMC is not enabled for
slave mode in time for master to send response, then it will NAK the
address match. Then the PLDM request timeout occurs.

If the slave enable is moved to the EOB interrupt service routine, then
the BMC can be ready in slave mode by the time it needs to receive a
response.

Signed-off-by: Charles Boyer <Charles.Boyer@fii-usa.com>
Signed-off-by: Vivekanand Veeracholan <vveerach@google.com>
Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
Reviewed-by: Tali Perry <tali.perry1@gmail.com>
---
 drivers/i2c/busses/i2c-npcm7xx.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
index 7c13f9f6014a..1551f9755ce4 100644
--- a/drivers/i2c/busses/i2c-npcm7xx.c
+++ b/drivers/i2c/busses/i2c-npcm7xx.c
@@ -1925,6 +1925,12 @@ static int npcm_i2c_int_master_handler(struct npcm_i2c *bus)
 	    (FIELD_GET(NPCM_I2CCST3_EO_BUSY,
 		       ioread8(bus->reg + NPCM_I2CCST3)))) {
 		npcm_i2c_irq_handle_eob(bus);
+#if IS_ENABLED(CONFIG_I2C_SLAVE)
+		/* reenable slave if it was enabled */
+		if (bus->slave)
+			iowrite8(bus->slave->addr | NPCM_I2CADDR_SAEN,
+				 bus->reg + NPCM_I2CADDR1);
+#endif
 		return 0;
 	}
 
-- 
2.34.1

