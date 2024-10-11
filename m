Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 07762999C54
	for <lists+openbmc@lfdr.de>; Fri, 11 Oct 2024 07:53:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPwlP2LFTz3g6P
	for <lists+openbmc@lfdr.de>; Fri, 11 Oct 2024 16:53:05 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728625980;
	cv=none; b=fni2lxY76A2jHGAkB7GBTHmTtWDgw7agSFk3RfXEbWoG386jevJpGomHr1TWYB6xIihxVKJwcZ2Jnyei2ZfmsYxmEzDA3QgA6NkKMpHHYmLEkGG86Q9EA4ypo62bJWU/ADpxhbimau4NQPwviBb5mma0A7uWwm5H69CmeAASLgFxC5G6f6UjyOR6HhiDzmYRv1ul5prY2IN8udCokE+ZySEkLftBb8pm/u+Ezws0pWn3/9X60S0SI1hAeD4w8Y7CJXg6alj7pUAD3tyDd3EZejIp68vStEyp2Z4IgLm0jQHzeLkFbavxrzhStIneGhP701PlCbD9/ijsf1TO/kC7SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728625980; c=relaxed/relaxed;
	bh=an4kJkObmODiz76Q4UVu1DA+oIFDSnR7hQ7Vqq3zxdA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=SY9eNt9FnZfKiX6Inbi/KO0dYt9qCmOJl4YjjS9dciTE7IFQuu7rvJ/epK2BMFV3OPrCkrlbtobCHf/1gHD7iLCcrPwlGCNmcBlxAskH16lOAlTg8tUQv40NnmPxIF6lxgZXhI2UlHi3M6rLyATxLO6d2Y5B2vgSQJoSyX5gyQxYOUGEFXo9rH8J4Zm2XcAfozUnvojFLtJy5NMUKfH4mEQRSyFbuQcGQ1w+8h0Yx30rROAUj6ipamQB/DluxNAXcSF8joiSW0WfdJzum4KXJK8+uTQluD8gDeRrPhgq33ERnSAc2JftbQsgx74THo3d88gVMo9b+8DMg5xPh/EQ0A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Y1F5p5rk; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62d; helo=mail-pl1-x62d.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Y1F5p5rk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62d; helo=mail-pl1-x62d.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XPwlG5ymJz3fpf
	for <openbmc@lists.ozlabs.org>; Fri, 11 Oct 2024 16:52:58 +1100 (AEDT)
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-20bc506347dso13597015ad.0
        for <openbmc@lists.ozlabs.org>; Thu, 10 Oct 2024 22:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728625976; x=1729230776; darn=lists.ozlabs.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=an4kJkObmODiz76Q4UVu1DA+oIFDSnR7hQ7Vqq3zxdA=;
        b=Y1F5p5rkhPNCHAAyde4OfOwV/sej6cb+00kWARzLNj6Tjs+T0/QBIAiVKn8qGGSKsT
         gjEcJuv4yizbIuveiDYJoLxmDZe5GQA+Pp9X3HRJOJpDLr7NWmMAmyuEQu17Awt9Troa
         bKtgWJsaAd7Ki5BoQeYBD2h4ubBaq+K/T48rQpehnszxAv/lPhIoJLR0AqxDXFOo2MIB
         JapH/cH/IW9Bd3nbvf7BLGqohhZyflBAJ2gjzmLaVDv7EfMu/eE21eKpFNl+drEk1rPG
         S0CoHVCi3nFbT9dsqGF0ZRTwxIqdD178hXaRAUwRkgxSt7OORAm+lpIwB658dX+sqBPE
         Y9TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728625976; x=1729230776;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=an4kJkObmODiz76Q4UVu1DA+oIFDSnR7hQ7Vqq3zxdA=;
        b=DEpb0TG/7kq87bLxIWx9bAc4ikOJ+lvDpHflONV5OZqj0QqGiLFNqzLgKuBHmoqScU
         Ymr+CYpmKRzxiYwqQzAzZKv4XYRpJGPM5P8DohoBcHbUqRFtiK+wqNkxOE8g7jrj4RxM
         V/ggxnmr5pFmscfQ26cnwf+AsrLiCwbk7gFpiqDWAtWfGc3bWOkvlK/vJcCUgPf5zxoM
         q7/wb0zOea7cyjEkUUjPZwgt+0YHERu8D1pruodcj39kGNKkXrmPq0wgd9JQ4xUWyf+j
         P+G5E8mzGvs7GBSsfXP4mX6VP1rZBYx8pGkSuQlz1Joc3DnxxonXKyLHg+xQPSA+FvCN
         QVBQ==
X-Gm-Message-State: AOJu0Yx/LVt9EyQO2Mh5d12CgTqPqwxNAUWRgt1jlLH5DwXCyt7mS9tH
	0Zzn/MJ1+04klR6SxCAdgco4Rt64UgdBhPbCLIH3xlncSwVgER0=
X-Google-Smtp-Source: AGHT+IFtD2PAQaGCcS0aatXtbrM9Qrv/jGG0koL0ZE3kSwlOkv9I/91XaMLJiU2fAyxNUYLV22uZCw==
X-Received: by 2002:a17:903:2b07:b0:207:13a3:a896 with SMTP id d9443c01a7336-20ca1466468mr20257185ad.23.1728625975936;
        Thu, 10 Oct 2024 22:52:55 -0700 (PDT)
Received: from localhost (2001-b400-e38a-6880-f424-8486-7476-9f9d.emome-ip6.hinet.net. [2001:b400:e38a:6880:f424:8486:7476:9f9d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c8bc13394sm17764775ad.108.2024.10.10.22.52.55
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 10 Oct 2024 22:52:55 -0700 (PDT)
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
Subject: [PATCH v6 4/4] i2c: npcm: Enable slave in eob interrupt
Date: Fri, 11 Oct 2024 13:52:31 +0800
Message-Id: <20241011055231.9826-5-kfting@nuvoton.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20241011055231.9826-1-kfting@nuvoton.com>
References: <20241011055231.9826-1-kfting@nuvoton.com>
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
index fcecb098298f..55348308b992 100644
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

