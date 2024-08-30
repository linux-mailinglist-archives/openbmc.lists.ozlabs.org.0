Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB9BF9655E9
	for <lists+openbmc@lfdr.de>; Fri, 30 Aug 2024 05:49:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ww3zj4bQyz3cWd
	for <lists+openbmc@lfdr.de>; Fri, 30 Aug 2024 13:49:05 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::102b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724989741;
	cv=none; b=IdhGDwbqVDxba9RbnrzaHcptfohF4JiwHnz+RP1/o1EdE8D3rP9cvMzcvHdVfeVZ13PI1Pdzw2HYsN+lFcp5am8D0W+hNjvYnbHXQjDN1MFJyHooCqIp1yyDu/ldEuJSqIhHbrKHR/Af4Qc683rexeNoSqhNb1WVB4twhcNxDZ1blOn8VWkuoCPXn6ffOUFaAggLdGNSgdsPLhgYbjMJg3QaWLwoynrGCFjN/J13saHd5maTm4UMRJg1h70neQo3jSHQcoiobNBpMA44exq5d/3AdttWK68Pez+ZVutoqcliH4wx7dW/orUbkt9tGeSstm4uWNVL29LO/HJeqfJ7Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724989741; c=relaxed/relaxed;
	bh=nuaU/FEUSJ1zDJhf2kq5x0CsZK8UIXnkrpW0Xmu9tsI=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:Received:From:
	 X-Google-Original-From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References; b=VBbGSbox78f9WHxv1hjWPcCq62laAptKLS8C/fXZsGnGs0lK/sbld9rATQW0pBtNQoarS4fygyNlKhD5hoqgMZGayxwkSLSQhsNbdeSuGX6TmTHAZz8v+tQ3NtiUEkPUQedIIEst9/HkHc9KhDFsJxVr6uRAZORYTX0YhrxqR4YlIuANDoA4cl4/porvVKXCoMu38FLscUWCSEyWUleVf6O+EotZxkQxekOJxI+acFlaUuJwBRWxBQFD2/nbXyt6oj8IyxJUS8/AEB3uL4rN6A1klDLKGzUrw/dRKxypiylOcGtGhVNanKQ8tGFFh/mF6jZoDJ/Mlh+8ZwrHFI8UcA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=KbwP6nJs; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::102b; helo=mail-pj1-x102b.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=KbwP6nJs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102b; helo=mail-pj1-x102b.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ww3zd2L90z3bqs
	for <openbmc@lists.ozlabs.org>; Fri, 30 Aug 2024 13:49:01 +1000 (AEST)
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-2d3c99033d6so1047529a91.0
        for <openbmc@lists.ozlabs.org>; Thu, 29 Aug 2024 20:49:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724989738; x=1725594538; darn=lists.ozlabs.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nuaU/FEUSJ1zDJhf2kq5x0CsZK8UIXnkrpW0Xmu9tsI=;
        b=KbwP6nJs/XUfiQh0fs9SA3JPst8B5BTKXd5Iz+BJfItBh2LGqt9JpXG2kzcxo/TeS2
         hmz/jEfofokoVk73kxtSNjgpkXS25vUYJbEsLxX+CTowbSODxRETCMFjOLzaIw1A1MlB
         8NyJI0Am6G85gM9T1rrx1e3Xs5pBL4ZIWITKOk20Jb9F2xJv9ooC4pfhU+kjJNxbvgt3
         3GAxBBe/ONeL6MFYfB3OEU4M2d5Lo0h6f9oXmLTHFubpPBqvVLNMupytUQ4ajzdcRNS5
         zdlRE/ZCFsSf0FDY60bYWopnyw3jhF5rrxhk82QYbG0IpN/SNDStr1R7CHEyYaaMRQVh
         kT0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724989738; x=1725594538;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nuaU/FEUSJ1zDJhf2kq5x0CsZK8UIXnkrpW0Xmu9tsI=;
        b=Ufd6oYOIu/+FJ7pQ6Fsw/xJlJtwSB0mkGqJO/mLVN6x+Zp6VGZsdPz17HxLncr3eQc
         g0hWjDqxd2MoCqPxOm1V1p2uu5rc42uTD9phMtj8/NJQ1APhYqkumYuV13zmeG5SVEQH
         HiepotANUhWSXhaqHMVoYSnbKMsKdO0RRQ42ugRZhYjxX4FpzJPxoEMQHsZTM1o6Lg44
         UMsgkcA+tL/4WvIbLf6WJKu2ILSnGm6nFXbgBl5KZinIFmuCcxDsEz2GBgKd2o5PKDO4
         98+5KxJzBBSqRt19hAoEvnohMUtq+z+OYPXO74LnaYKHn8Sm4so7qQfsP0nc6jsuZZZd
         3mCg==
X-Gm-Message-State: AOJu0Yyote2q0QhUyzAKYhSPyDIqygUb97ioWJnkZXpJsULmzgYkhRiD
	Cqcw2HRloDRg5FNeV87xqZsJRNhvg8XaaTZM0FIDIDzFgm2bbXYyXno5yZo=
X-Google-Smtp-Source: AGHT+IFvcywH8BJHv9GFcHbrQr1DMuLwHzrwh4tiQWWXNGDKDjjMuTvElE/5TNzEIJwRDxb0/LFeSA==
X-Received: by 2002:a17:90b:d8f:b0:2d8:7a29:838f with SMTP id 98e67ed59e1d1-2d87a298613mr29080a91.10.1724989738433;
        Thu, 29 Aug 2024 20:48:58 -0700 (PDT)
Received: from localhost (2001-b400-e338-dab5-746d-1a82-f21e-bb0a.emome-ip6.hinet.net. [2001:b400:e338:dab5:746d:1a82:f21e:bb0a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d85b11b7e0sm2616978a91.17.2024.08.29.20.48.57
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 29 Aug 2024 20:48:57 -0700 (PDT)
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
Subject: [PATCH v2 2/7] i2c: npcm: correct the read/write operation procedure
Date: Fri, 30 Aug 2024 11:46:35 +0800
Message-Id: <20240830034640.7049-3-kfting@nuvoton.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240830034640.7049-1-kfting@nuvoton.com>
References: <20240830034640.7049-1-kfting@nuvoton.com>
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

Originally the driver uses the XMIT bit in SMBnST register to decide
the upcoming i2c transaction. If XMIT bit is 1, then it will be an i2c
write operation. If it's 0, then a read operation will be executed.

After checking the datasheet, the XMIT bit is valid when the i2c module
is acting in a slave role. Use the software status to control the i2c
transaction flow instead when the i2c module is acting in a master role.

Fixes: 48acf8292280 ("i2c: Remove redundant comparison in npcm_i2c_reg_slave")
Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
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

