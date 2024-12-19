Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E3D39F7806
	for <lists+openbmc@lfdr.de>; Thu, 19 Dec 2024 10:10:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YDPrC0rFgz3cZ0
	for <lists+openbmc@lfdr.de>; Thu, 19 Dec 2024 20:09:31 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::631"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734599363;
	cv=none; b=fk6OCyOIO8lVID10apqkr6h5j/31JjGtjo/tnzOb+/aRs+OpDw9g0b+NeTOhNyTGq8N1w30i3OjuIXf1Fjpc4DX3Ye/F3JX9/OAXle2c84EO21FUUvx5sXw/fdzBdDvH9Zy9VuJzcofnTGVppCcRobdWJj6KcuOWqIdkaDbEKAq3e0JA0Sdl6kwdhxek5UWFb8kezD3zLMXgPJCVh+A4W9SV3W8W7IMM4tb0F7SwQY9JJFaVdaqgXX4Kvnw2IqwHSf1Ut5VSGePvvX2qvfwVGzjzIpBkNG92rltrWllSUnZc/M18CT31/MEXihIcJiyVhu3xWG5/J4NbBBVoxHPMNw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734599363; c=relaxed/relaxed;
	bh=jzZT6TwhtRV8As1g0Br4z6oNEAAXSFB3IR9CjR0VtHs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=WC2QzZKwVlXa2drmMvOmvBy1hXEfCw34t2O4WwyAPYn8f8PfWXPQm1V0DxIhHXj7UD7x0nxj1vb1O1BhJj8bJFwTRtTJtEu5l6wkVqWcUK6Goct0y7n8BMscuDzocl10VISpblrLKDSKejAnapCYaiSK7FzMvfSTiRY8j8bYxnyGGa6DTTc5ixK1/+9hZjdpS5rxcsXBM6fks3zU7UMNKTeYA9NzSParD21dfps+LXi7fCTpKaZCjB3gmO1cik+TqBHLDXaeHA8RKBh5+SmdQMqI9/nQLyQVsnWtX70/CqTewPZd49eISe1Sug8cuaBs6xtBGuEReBhln9QJGIprMw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=kFoteS00; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::631; helo=mail-pl1-x631.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=kFoteS00;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::631; helo=mail-pl1-x631.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YDPr10MvGz3dW2
	for <openbmc@lists.ozlabs.org>; Thu, 19 Dec 2024 20:09:20 +1100 (AEDT)
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-215770613dbso3578205ad.2
        for <openbmc@lists.ozlabs.org>; Thu, 19 Dec 2024 01:09:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734599358; x=1735204158; darn=lists.ozlabs.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jzZT6TwhtRV8As1g0Br4z6oNEAAXSFB3IR9CjR0VtHs=;
        b=kFoteS004SFh3zjbwmAMjqK0aeU57akwSRmRVBjXytY0juTSWE5HdS2gXhjnlPAVYZ
         bArZVU1SJ99ydqR2aOdqodUJMsB6CPEOAOFdMpWACdMVWVN5GeUCGwZ1vDzpVgeoXsQL
         nefgt5T+0VfO4AALJOiBQkk7RY+gg5snmHlP3eXk20TTFEkpRA0I/4uUmdqA3Od24Wok
         B2oIrlVkFWC9DwSK6S4B8afDV/wsBsXSR6P7OKtbgREtmd4+pPib+c9WY02e7B0oYsTc
         Qk1+Pvy7LhfyBvxPORbJeNNDgVHPjbBk3jWE7UaqUkbgCO7R5cIfTCt0X3DH0WoTM6/f
         nLnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734599358; x=1735204158;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jzZT6TwhtRV8As1g0Br4z6oNEAAXSFB3IR9CjR0VtHs=;
        b=tfEHMgjkOWS6CvXonc3atA1nbcxXhz1qH0vHaK2SZ2syAqOShgLrq3Wd2WUiGMgtE4
         4ktErJEhGajr7HtpUsW18Cr8zKnO70Ul/mc05w1tMLJv/jX5GdGOhKjo2B6zEjd0b9Q2
         OKkmzN6YSIRfwL07DObq/E5vK6s7RLdb34owCIo11I/PMW8lci3TPMxKXJnv6NInIpI8
         SQWv1c0Crmgs1GPdwj2d1O3QMWD36X47HOKxdsjvY9wDL2zAiC07h+hC0VV/yIbCKJkq
         kuAkgEqYMc87hFzVk6HFrSHuzC3pzDrGovFlKSng14hWTqSaIUdl8lKJGWF8+kICiZBM
         UstA==
X-Gm-Message-State: AOJu0YwqT2VMKQw7XAP7aYlPN7j0nmBI0wPQ6NOFcsEJwV9l3yvb2DIh
	wFN8kjDsTFjztpTDCt2m+kTQVaNYFlMp9XSnEzMQXNJdyVeYNME=
X-Gm-Gg: ASbGncsrL6Ic7MtYuWpDvHHo95mH9to2knL5B9RzfX7Gct+vllyp5EZ3LdZzzFHlfB5
	5ErRT73ETKrtvN//HERPwE6BMbyMkoA13UatULf0JTudoHAgtcbQyZvsuEw/G27lHfF0zGHdy/u
	/xCNGLJUSzxfMGMTud7t232OXxutVALboySCLs8ntpaWjO5Q2j3Xx6SDzH9P+pcSJeu7e9Lg1m8
	K8aEBH8j77AvAl64oFzCO30KNJhrX2HeuE/wgbg5abshDD2t1l0urcNldhtnPsn5ey1AskJ3XEi
	IAVwgDq/JyWCprRTMhKtOIR1oKWP3XX2GW6YcdAlElgFrxX2
X-Google-Smtp-Source: AGHT+IErJZuvW91Ox1GbnItc2RtMNO/lrRVXIpHpCWNjIRs59rsAH/atATMYg7HsgdgvdzF4Cm1AQA==
X-Received: by 2002:a17:902:fc4d:b0:216:2dc5:233c with SMTP id d9443c01a7336-219d9692f2dmr44680875ad.41.1734599358516;
        Thu, 19 Dec 2024 01:09:18 -0800 (PST)
Received: from localhost (2001-b400-e356-b45b-f574-35d0-91d3-527b.emome-ip6.hinet.net. [2001:b400:e356:b45b:f574:35d0:91d3:527b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc962db4sm8151225ad.7.2024.12.19.01.09.17
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Dec 2024 01:09:18 -0800 (PST)
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
Subject: [PATCH v8 4/4] i2c: npcm: Enable slave in eob interrupt
Date: Thu, 19 Dec 2024 17:08:59 +0800
Message-Id: <20241219090859.18722-5-kfting@nuvoton.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20241219090859.18722-1-kfting@nuvoton.com>
References: <20241219090859.18722-1-kfting@nuvoton.com>
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
index 1aae1a8a8055..3ca08b8ef8af 100644
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

