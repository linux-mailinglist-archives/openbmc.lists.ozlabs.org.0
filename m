Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 865E682B82F
	for <lists+openbmc@lfdr.de>; Fri, 12 Jan 2024 00:44:12 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=mPVY5OBE;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TB1Tk0GJPz3cRk
	for <lists+openbmc@lfdr.de>; Fri, 12 Jan 2024 10:44:10 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=mPVY5OBE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12c; helo=mail-lf1-x12c.google.com; envelope-from=rand.sec96@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T8Ymn3hJQz2xdZ
	for <openbmc@lists.ozlabs.org>; Wed, 10 Jan 2024 01:52:07 +1100 (AEDT)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-50ea8fbf261so3278989e87.2
        for <openbmc@lists.ozlabs.org>; Tue, 09 Jan 2024 06:52:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704811923; x=1705416723; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WIOUb/aBIlK1Nf+/sJcceLe8u9RDBXYQMUJNkLqF+jk=;
        b=mPVY5OBEHP7STezkK3TiA2KgZkuPxpeCVxUFTPg/lbeuL85e4/VZcxCFGba9XtN+E4
         uhXBZL+qhPYTEMmWnLtyF/Y0zET6nL4JR88Ei69/H37KMxC5HAchlESc1oeMFpYZR70l
         SPY8nUSfaVH1zVAC4e74qHtPKadMEgDdiAKFewGdhC3xTmrnadMt3A8Y0SdO1usjoJXi
         cE/yymx8o6QlK76yrRdZvImOWETMrxIH1WJjOqu9BAtoi/BW+obLovK74LX8KXTg7TtE
         Zx+Arf5eSDGcYwiEFf2wvrpYL2KaDvmhmEO6h7Hn1ylBvrxb6xpxwWKKT2V89p/y6CZo
         LA1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704811923; x=1705416723;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WIOUb/aBIlK1Nf+/sJcceLe8u9RDBXYQMUJNkLqF+jk=;
        b=jGGLUeALaZjYmEcpBjzWUHfmPVHwqsu1btFJQKsfKKM2UCDCKoVVcPO9cHQeKGPrz9
         LDTk2aVEasOGeFDPHQnqvwm5Wz5LHK3ePo3LeAKSzyRRkqm8XU4ZulQqWYEeq9GP7bnv
         /FUgF3Wo1TruCEiCxByu/31ajBa/3IGafFsYIOPNNM/pmnwGjRNocJg3nhBuBGm+VXLe
         +88dZD4N4IvxGQj/wxXRpdrE88MqBi2i6IcF8VdmknzEycsPQ+kOcqzHEuNTnLzODdtq
         Pjf9W3J7IkrPEfgE8jDfjXqtir06A4fAQRw5h7/vdTiI5t3QEdMxTdeIXO0KgBX4sAAy
         Wg+A==
X-Gm-Message-State: AOJu0Yx6a2mr9XvYdCt9lolLbydFzjM57scZFuORWn9FYeTtEmyqNY3B
	6tNnEOC3m6A80WXdKDOdN3E=
X-Google-Smtp-Source: AGHT+IHX4Hq5rPkeD5504AXZ6QnaSXBzBZrfEtWVv3iESmgI1RSzHQkbpF0lv43UZIzg/VylkcQF9w==
X-Received: by 2002:a05:6512:20c8:b0:50e:6878:a70b with SMTP id u8-20020a05651220c800b0050e6878a70bmr2104873lfr.54.1704811922775;
        Tue, 09 Jan 2024 06:52:02 -0800 (PST)
Received: from rand-ubuntu-development.dl.local (mail.confident.ru. [85.114.29.218])
        by smtp.gmail.com with ESMTPSA id b13-20020ac2562d000000b0050e7f5cffa6sm369150lff.273.2024.01.09.06.52.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jan 2024 06:52:02 -0800 (PST)
From: Rand Deeb <rand.sec96@gmail.com>
To: Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>,
	Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	openbmc@lists.ozlabs.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] i2c: Fix NULL pointer dereference in npcm_i2c_reg_slave
Date: Tue,  9 Jan 2024 17:51:21 +0300
Message-Id: <20240109145121.8850-1-rand.sec96@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 12 Jan 2024 10:42:46 +1100
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
Cc: voskresenski.stanislav@confident.ru, deeb.rand@confident.ru, lvc-project@linuxtesting.org, Rand Deeb <rand.sec96@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

In the npcm_i2c_reg_slave function, a potential NULL pointer dereference
issue occurs when 'client' is NULL. This patch adds a proper NULL check for
'client' at the beginning of the function to prevent undefined behavior.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Signed-off-by: Rand Deeb <rand.sec96@gmail.com>
---
 drivers/i2c/busses/i2c-npcm7xx.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
index c1b679737240..cfabfb50211d 100644
--- a/drivers/i2c/busses/i2c-npcm7xx.c
+++ b/drivers/i2c/busses/i2c-npcm7xx.c
@@ -1243,13 +1243,14 @@ static irqreturn_t npcm_i2c_int_slave_handler(struct npcm_i2c *bus)
 static int npcm_i2c_reg_slave(struct i2c_client *client)
 {
 	unsigned long lock_flags;
-	struct npcm_i2c *bus = i2c_get_adapdata(client->adapter);
-
-	bus->slave = client;
+	struct npcm_i2c *bus;
 
-	if (!bus->slave)
+	if (!client)
 		return -EINVAL;
 
+	bus = i2c_get_adapdata(client->adapter);
+	bus->slave = client;
+
 	if (client->flags & I2C_CLIENT_TEN)
 		return -EAFNOSUPPORT;
 
-- 
2.34.1

