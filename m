Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BB3D97D425
	for <lists+openbmc@lfdr.de>; Fri, 20 Sep 2024 12:20:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X97f16QV5z3gJL
	for <lists+openbmc@lfdr.de>; Fri, 20 Sep 2024 20:19:05 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::102d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726827540;
	cv=none; b=RJkAjc4rEc25n/tFh+l0KtqevFC7r+o9Xl7boX8dVlJH84YpmQHPrQ70mJUbwdG+b/eaW8AUpk9z+s++mK9vILemY2GUmEOsgEumBvSQhcjRHsETXlJutDkUJqds2DgF5ISc02hNzXmAjO5q4MLczgFX63QkTlS5K9aTMV3fxopMv5d1RdRY9uU67E0eGlI3Q5Hb9C5KY6vVbgInEQ4/PvS8UwSrInGWhzNB6PiLYkFqGrvAe/chyBHzRW5YXlcsfc5KjPDfIrMa7oM40X6jbyrqk/ko09QLcMWQz5yHDN6zrsoeuYxtS/aK4UCfu+pbMJsqWyYOhmMq13aDzUKZqg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726827540; c=relaxed/relaxed;
	bh=MOSQS2phhZy9vhfSdqHxVy6juQR6vrzN7E2tXsy++5Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=fACC3KM0/YpmUpsBzqtSFiYJC/I5bK3vJfegt6eqA9eYc/sldKFh1ZCKQw13vWu+03iGCga/cSp4Ym6WrES6X27bCLscNOrNWWUVlqy03g2oiJmSuxJnjqgFotnKEX9cnkUHLsKDOwPkUDBio4qifuaig3qmxav18Tf7A1tPMFsBNo6nW3zLx85nlCgzTCvvyQ1xSdku6SUE493t13OgeS6yDx1B+j76Od/+MEIeTCXIyZW6EYcLbdtbqxRHD/XleJlns+DCqFvml8pIbKzAKoOZUsl3YVKMjN9h+Vgp2h5sKwTv1j5QUbR1wGdn79bJ6mbrjEUSCprNkga3XgXvBg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=m/ZaW4nV; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::102d; helo=mail-pj1-x102d.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=m/ZaW4nV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102d; helo=mail-pj1-x102d.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X97dw40b1z2yV8
	for <openbmc@lists.ozlabs.org>; Fri, 20 Sep 2024 20:19:00 +1000 (AEST)
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-2daaa9706a9so1654952a91.1
        for <openbmc@lists.ozlabs.org>; Fri, 20 Sep 2024 03:19:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726827538; x=1727432338; darn=lists.ozlabs.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MOSQS2phhZy9vhfSdqHxVy6juQR6vrzN7E2tXsy++5Y=;
        b=m/ZaW4nVA3jeEW61MaR8AAq6ATgl0IKXMHa3oAnwr/WSqoBK1j0cNdd4bzXkBlavo9
         1YDE4A/w5hJr8lGb8l+AoV64sSQZAiCyayjmEanZdGKGKFmhj/rS5fy5/PJRFeIGzYge
         xSQ+fNZfxRw7sCvD+t2KkCaRS4PvxJeyJXcmlSr41qTJMY8ZnjQy7GAYYL+cenMzShVp
         ZSjB6cBT56YnZEzcirVQrdHM7xNZ99kQY1vsz++kyjoe9x7qQgQ6efku6WYwbVUGTOna
         f+w+IK8QunwVH6hJGnqSqWZwAz46YxJVEYIDJUq0Wn5nGchehWazOwPMLbtUXFUtck6x
         julQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726827538; x=1727432338;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MOSQS2phhZy9vhfSdqHxVy6juQR6vrzN7E2tXsy++5Y=;
        b=T8MUGRqBopFiqFskf8HQY+ALFn/rqjKueIfY3ZZBMAFc8YpaF8uuHen2mFpAGsCmxU
         CLEJTSS6SkncSZsh9BGIiSRSPcDIlI2FEFH3YE9exMW8PWbHV9H8aH1MoXg/ZCIo1Cye
         0XPOrntNGZ35FuB69RsGq5XK4Ph2AuQmbPe/UsiVT7hDcNmiAep0/cmt2cHVrvgNL9lj
         w7OG6t9OcQPVwfniqQblQCgFLenYYwDyJTeeh77bTsOdo8XZpBvtMcKLMX9YzRGS9kB7
         liflQGcAChqfrylIpqBVXoOPqCUDSBlGUZfMtcGsek+jjgw12N2bkVxTkz+/ZILrKMLu
         KQyg==
X-Gm-Message-State: AOJu0YzUWejoIrFodWW3SSvS5AXrp2QS+3qnlRKFs70eWEEUdeBxilPu
	m4PJSDtbXA4r1ght4nlx9M3iCiBWltSIXS6mO7sdAQzJ/wuaEno=
X-Google-Smtp-Source: AGHT+IFG40FXFa7cL/Nwmch53MN0BC+f2vfZG29tfUmd80whMxH/9pjTgZnrwZksfCx6vZxpzJKgrA==
X-Received: by 2002:a17:90a:9313:b0:2d3:cd22:e66f with SMTP id 98e67ed59e1d1-2dd865e77e5mr1171550a91.9.1726827537966;
        Fri, 20 Sep 2024 03:18:57 -0700 (PDT)
Received: from localhost (2001-b400-e35c-9cc2-447a-d760-d4f6-01f4.emome-ip6.hinet.net. [2001:b400:e35c:9cc2:447a:d760:d4f6:1f4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2dd7f947427sm1487476a91.48.2024.09.20.03.18.57
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Sep 2024 03:18:57 -0700 (PDT)
From: warp5tw@gmail.com
X-Google-Original-From: kfting@nuvoton.com
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
Subject: [PATCH v4 6/6] i2c: npcm: Enable slave in eob interrupt
Date: Fri, 20 Sep 2024 18:18:20 +0800
Message-Id: <20240920101820.44850-7-kfting@nuvoton.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240920101820.44850-1-kfting@nuvoton.com>
References: <20240920101820.44850-1-kfting@nuvoton.com>
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
index 9d533873e477..aa3310afbf6d 100644
--- a/drivers/i2c/busses/i2c-npcm7xx.c
+++ b/drivers/i2c/busses/i2c-npcm7xx.c
@@ -1925,6 +1925,12 @@ static int npcm_i2c_int_master_handler(struct npcm_i2c *bus)
 	    (FIELD_GET(NPCM_I2CCST3_EO_BUSY,
 		       ioread8(bus->reg + NPCM_I2CCST3)))) {
 		npcm_i2c_irq_handle_eob(bus);
+#if IS_ENABLED(CONFIG_I2C_SLAVE)
+		/* reenable slave if it was enabled */
+		if (bus->slave)
+			iowrite8((bus->slave->addr & 0x7F) | NPCM_I2CADDR_SAEN,
+				 bus->reg + NPCM_I2CADDR1);
+#endif
 		return 0;
 	}
 
-- 
2.34.1

