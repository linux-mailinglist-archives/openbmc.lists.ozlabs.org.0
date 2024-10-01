Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9564198B454
	for <lists+openbmc@lfdr.de>; Tue,  1 Oct 2024 08:29:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XHp1x5wbLz3ccV
	for <lists+openbmc@lfdr.de>; Tue,  1 Oct 2024 16:29:25 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727764160;
	cv=none; b=GL9zzQCet4ihHJhCA6yYE6XqJnb/Hkkauv6uC2/f1Yis/b7t5/LqTI7l/0rH+9Ge3CaMZPZwm+My29b9/snfINYhqt/k4lxoq3MZWSeAc13lI9fnxqT6+xolSDcp5qm+UoVYZXFYvoFsryTMMzderbz/c60dPyny1TVwVfV+dPBb2Kkw8OlJzG9kOAm2l3m4eD2NziLq19laMQleWwcM4v6T6ERfwLXOS1lPXWX5Jx28ut/WqU5Oww7fjGdScdQvLCT0NT14UQZuY9+aMRyK9e61CvCcU40D61jCB3/s8gr4f8e5QaCAbVaQZwC3kSUMV44MTL5hEINT5Rtmb6EylA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727764160; c=relaxed/relaxed;
	bh=mgfOidgW6QQd83F5+t8/o7O3J5kWPZhDUGZrc2VOvL0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=Wk5vY7qm+zLMGK4OBYsBoo9Xc1MdWoHBs6/KCippwnngj9w6II35uQHCHr9mjGawRyXCWwemyX1vMgB1khWtA1+PHpd8mlIjPl2ApDNxUV8Bvkd1t9Qi1nld8xRPA9U3ATnxitEHpmOu2GCQkCYWPiwPS+5Kqd+IFgmY7r64J3AptyOdPxM3byhVsEsIqrAJ9HX3UG/c2V0saexuWrn1zOM8IJ1Uag/xfHykJ4eouAdbEsat0I+dtfwvoFk1FwSjK98zV3JQ8gRhGudx6Efvj1mSI1NkGTzguFiQCdhL4oYdQ2L9iYTZHHEhORIaMhUUUaRT7oMZ4S9wPrBSDAMhNw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=M2TOpkho; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=M2TOpkho;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XHp1r0GCTz2y71
	for <openbmc@lists.ozlabs.org>; Tue,  1 Oct 2024 16:29:19 +1000 (AEST)
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-20b93887decso13821795ad.3
        for <openbmc@lists.ozlabs.org>; Mon, 30 Sep 2024 23:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727764157; x=1728368957; darn=lists.ozlabs.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mgfOidgW6QQd83F5+t8/o7O3J5kWPZhDUGZrc2VOvL0=;
        b=M2TOpkhoWTW50f1gixmCIL+VGSHhGCXXRfIpyU8YpkKC+6A2KHrDQjxxT3UAbNv27F
         QCFRsvZrBAnclp3OT6BvCCTXlRpfSvwHh6jtX7TWf+yjhRbYChXF+VwAa31NAloUA62R
         7Gi6ELx16O+J3oJVMHVDUxnqsvjoIXFLMY33cwRwRsu/4c+gu71CpUjGB67HOzO9IDj9
         /HlKaCxTTwTImUUSHH2OAP7IVFaW2lDDt8JUsxovv88qPRbF/+dBeffaftlfZIEMtwWe
         Spw2YXzdiX6i7/kd3OL5W9fY2r2mppEFjmNX9Thk74dZwuZZsNyBWGH9LOTbF9ix7/Wa
         O2uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727764157; x=1728368957;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mgfOidgW6QQd83F5+t8/o7O3J5kWPZhDUGZrc2VOvL0=;
        b=dvyFX9c8uqTh9J55Y4ysm/eLWVTOuCYwLfw5ZlJ4D75XOvJNE7RnTqhdJtXRwTCRO2
         yE1J/1WUPDMkt2i+FiOTbUEEvWqRDP6b97Nhv+LEqE6QqZ3KRn0+RkN4h8EZaAgReimN
         6vTHH15m8H29arWFft2b/HZyDV8XVVEC0vfwdhhuE2VXcoZ9ucwBH82ElAiHTqn52e1M
         9yenRHR+fFSVKMzIVToIwXLLh1HR9asT+UKIzxZiS6lRasAWXkUhmk8UEZ48rjTO0rjq
         GOWXAeFYYkw2mPbd4Pn1Jp11vjpo6qL+roYUyqG+NxGCbibJ+GKmNnDrQIkZ3eTreWvs
         gHXA==
X-Gm-Message-State: AOJu0Yzj8d1qYy9qqL8xlhjJuGjWHzQjqqAYKS23NxUk5OW4yl4xcbSM
	pnLvhAih+Vuy+O2DSh4u81JM5jJYT/UjLcTuvEg7x8fvHau366k=
X-Google-Smtp-Source: AGHT+IEGgc2H9KW6IF6JSqvVGEvxrh93vP8PdPD3gKW/pW7XUuaAD+zCQEBtQ//63IbUWmT78h4MFQ==
X-Received: by 2002:a17:903:184:b0:20b:57f0:b394 with SMTP id d9443c01a7336-20b57f0b612mr7096065ad.20.1727764157085;
        Mon, 30 Sep 2024 23:29:17 -0700 (PDT)
Received: from localhost (2001-b400-e30e-7f15-c94a-d42b-025a-8ff3.emome-ip6.hinet.net. [2001:b400:e30e:7f15:c94a:d42b:25a:8ff3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20b37da012fsm63736375ad.96.2024.09.30.23.29.16
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Sep 2024 23:29:16 -0700 (PDT)
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
Subject: [PATCH v5 1/6] i2c: npcm: correct the read/write operation procedure
Date: Tue,  1 Oct 2024 14:28:50 +0800
Message-Id: <20241001062855.6928-2-kfting@nuvoton.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20241001062855.6928-1-kfting@nuvoton.com>
References: <20241001062855.6928-1-kfting@nuvoton.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
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
Cc: openbmc@lists.ozlabs.org, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Tyrone Ting <kfting@nuvoton.com>

Originally the driver uses the XMIT bit in SMBnST register to decide
the upcoming i2c transaction. If XMIT bit is 1, then it will be an i2c
write operation. If it's 0, then a read operation will be executed.

In slave mode the XMIT bit can simply be used directly to set the state.
XMIT bit can be used as an indication to the current state of the state
machine during slave operation. (meaning XMIT = 1 during writing and
XMIT = 0 during reading).

In master operation XMIT is valid only if there are no bus errors.
For example: in a multi master where the same module is switching from
master to slave at runtime, and there are collisions, the XMIT bit
cannot be trusted.

However the maser already "knows" what the bus state is, so this bit
is not needed and the driver can just track what it is currently doing.

Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
Reviewed-by: Tali Perry <tali.perry1@gmail.com>
---
 drivers/i2c/busses/i2c-npcm7xx.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
index bbcb4d6668ce..2b76dbfba438 100644
--- a/drivers/i2c/busses/i2c-npcm7xx.c
+++ b/drivers/i2c/busses/i2c-npcm7xx.c
@@ -1628,13 +1628,10 @@ static void npcm_i2c_irq_handle_sda(struct npcm_i2c *bus, u8 i2cst)
 			npcm_i2c_wr_byte(bus, bus->dest_addr | BIT(0));
 	/* SDA interrupt, after start\restart */
 	} else {
-		if (NPCM_I2CST_XMIT & i2cst) {
-			bus->operation = I2C_WRITE_OPER;
+		if (bus->operation == I2C_WRITE_OPER)
 			npcm_i2c_irq_master_handler_write(bus);
-		} else {
-			bus->operation = I2C_READ_OPER;
+		else if (bus->operation == I2C_READ_OPER)
 			npcm_i2c_irq_master_handler_read(bus);
-		}
 	}
 }
 
-- 
2.34.1

