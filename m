Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F10D0999C4E
	for <lists+openbmc@lfdr.de>; Fri, 11 Oct 2024 07:53:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPwlC6Nn4z3fT3
	for <lists+openbmc@lfdr.de>; Fri, 11 Oct 2024 16:52:55 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::331"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728625972;
	cv=none; b=hNyl4pAWTw1n/pgBPzQcjVANwBeTpgH0K6+9ggZVK/Uef271jcv6PrZGkHDmrEFa+nbKdIgnVygCy+aYPSt/HFfrLwsdLS+D0Y+4+TMcJ06mdn0meDh2uL+vEKrUEUwJufd3cqqaYDdt3owneOCds2g6UBHsllKcjOgoRIcun/hJ0lmgPkV30ImvOA2tSLLG1ilkAvym3orKtEyYEhSR+PikAf5JMJWo3MmUrVDatqoAKe8WLJqtQh0rkX/Bfc/0y31rn8wF1LJ5UX3uTHR0VU72e2TcD6U0LEBbBt7s8MVqiD4FDtQJsqMbln822QBuEKKGeK5GhUAcfy5vbcqJwg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728625972; c=relaxed/relaxed;
	bh=xuEkmyRTVFltpV0RlR/fXEwLbNM+hNheAUnuQYiB238=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=lNMdO3vsBVrWB3QV97LA4W3fhcRlcif9GsxuGg5w3WqS6lrlU5y7f0bQdt/ujx2npMO4VDFdO00OR13Gsdg0rYGVThFVSdxo9rrZW3UZQmNn2vHx9FKYuS31nM8TOrnquwoaU2bRc+ZGxC5yqiu15lHriZywTPAFQg6nr1+BU4DGoEdbznnukINN8ycRUFABwJbFVBZfB7DlM52p0G63GiV8zmcbElpyGh2qUWyphECxzBAzKOr2+PeoB8L9I8tLK2eRMp1Af//CokXTQqFL2UqLrC38rYS4q2nLfbSpzaGEpfX9UiSDdy70U6073G+4eYMt5ctrC50iVOLcu3kFFg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=HZ7jzTDl; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::331; helo=mail-ot1-x331.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=HZ7jzTDl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::331; helo=mail-ot1-x331.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XPwl737pwz3dSR
	for <openbmc@lists.ozlabs.org>; Fri, 11 Oct 2024 16:52:51 +1100 (AEDT)
Received: by mail-ot1-x331.google.com with SMTP id 46e09a7af769-717da7cb71fso47211a34.1
        for <openbmc@lists.ozlabs.org>; Thu, 10 Oct 2024 22:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728625968; x=1729230768; darn=lists.ozlabs.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xuEkmyRTVFltpV0RlR/fXEwLbNM+hNheAUnuQYiB238=;
        b=HZ7jzTDlzZeJOogVuILhNFrH68kySHyVlyJcnEAtwpk9agvab3v1LQj9UX7ICZ5M0a
         am27v+S001jzllxELK/Dtd+IoRb0aQf27Gv1/shyQVnO++0wflEpKTdY9OBBcM2Tdne8
         lIeJUkvpOYRgsgJ5fa7XemToy3/qUNgGWxgvi/oNMXM+hWosAZ4ySgMsxYLqwhIsrPjO
         JPVQzOOwrNm9Ja/sJJro6LNJPqHSlPum2iksxMAr8t1CanYUeIIidn8XzInSvkdRNQ+J
         kzKCmmhamPisWTe5dbl0/NZqZEBvvUKQz1aGusPgjDUmju2Kydd5whB1UyO4kTanpUw/
         laVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728625968; x=1729230768;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xuEkmyRTVFltpV0RlR/fXEwLbNM+hNheAUnuQYiB238=;
        b=XFznuo0BP3ECdesMSpYBEu/O6sByHqENsXRliGPZsZXDczWgX1dCC59LlvEiSQ8Xck
         T4uflInWXaWcwTdyDE0jYG/DxDYlXruLps8Zqj2st9HIsuloeI3J0GgvV82GGmSkZa4n
         0O5N2Kk+2a8re98xEer7JzRfqAM5ECB6FkJ2Z9qjRnDru8I4ADpOTSAjtdFUqMxlLlMb
         yiqIZFc15IhoLEt+psHC6bdjvfpCITmvb3BNIR368+YHnXcNViWhROKp+D8qWJXAPGka
         U8jf1E3M3jlTaGdmtJ9UWQpTcGHYZwCPTsSkYj2bOQT1938AmDcQmTu9Gss0qNP+dURb
         VsCA==
X-Gm-Message-State: AOJu0Yyq4WBkZS4yPq5DwkDVlu7hJLiJU0aMni79esxkLdb28DdvamWq
	ujG+NHH/zxV74/+rw/qO8CM6dxTy9nprq5s9aY6qWxs4kKszzOI=
X-Google-Smtp-Source: AGHT+IFI+YEgKjTOGlTjgbwnkQl3Sg69mjhkL5/43+Y++zB1j0ROyjoHxWdrtmO/E8N04+bukogyeg==
X-Received: by 2002:a05:6830:2587:b0:710:f7b8:c4ed with SMTP id 46e09a7af769-717d64972d1mr1211821a34.28.1728625968193;
        Thu, 10 Oct 2024 22:52:48 -0700 (PDT)
Received: from localhost (2001-b400-e38a-6880-f424-8486-7476-9f9d.emome-ip6.hinet.net. [2001:b400:e38a:6880:f424:8486:7476:9f9d])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7ea449663e7sm1910843a12.76.2024.10.10.22.52.47
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 10 Oct 2024 22:52:47 -0700 (PDT)
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
Subject: [PATCH v6 2/4] i2c: npcm: Modify the client address assignment
Date: Fri, 11 Oct 2024 13:52:29 +0800
Message-Id: <20241011055231.9826-3-kfting@nuvoton.com>
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
Cc: openbmc@lists.ozlabs.org, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Tyrone Ting <kfting@nuvoton.com>

Store the client address earlier since it might get called in
the i2c_recover_bus() logic flow at the early stage of
npcm_i2c_master_xfer().

Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
Reviewed-by: Tali Perry <tali.perry1@gmail.com>
---
 drivers/i2c/busses/i2c-npcm7xx.c | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
index c96a25d37c14..349492f114e7 100644
--- a/drivers/i2c/busses/i2c-npcm7xx.c
+++ b/drivers/i2c/busses/i2c-npcm7xx.c
@@ -2155,6 +2155,19 @@ static int npcm_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 
 	} while (time_is_after_jiffies(time_left) && bus_busy);
 
+	/*
+	 * Previously, the address was stored w/o left-shift by one bit and
+	 * with that shift in the following call to npcm_i2c_master_start_xmit().
+	 *
+	 * Since there are cases that the i2c_recover_bus() gets called at the
+	 * early stage of npcm_i2c_master_xfer(), the address is stored with
+	 * the shift and used in the i2c_recover_bus().
+	 *
+	 * The address is stored from bit 1 to bit 7 in the register for
+	 * sending the i2c address later so it's left-shifted by 1 bit.
+	 */
+	bus->dest_addr = i2c_8bit_addr_from_msg(msg0);
+
 	/*
 	 * Check the BER (bus error) state, when ber_state is true, it means that the module
 	 * detects the bus error which is caused by some factor like that the electricity
@@ -2165,6 +2178,16 @@ static int npcm_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 	 * bus is busy.
 	 */
 	if (bus_busy || bus->ber_state) {
+		/*
+		 * Since the transfer might be a read operation, remove the I2C_M_RD flag
+		 * from the bus->dest_addr for the i2c_recover_bus() call later.
+		 *
+		 * The i2c_recover_bus() uses the address in a write direction to recover
+		 * the i2c bus if some error condition occurs.
+		 */
+		if (bus->dest_addr & I2C_M_RD)
+			bus->dest_addr &= ~I2C_M_RD;
+
 		iowrite8(NPCM_I2CCST_BB, bus->reg + NPCM_I2CCST);
 		npcm_i2c_reset(bus);
 		i2c_recover_bus(adap);
@@ -2172,7 +2195,6 @@ static int npcm_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 	}
 
 	npcm_i2c_init_params(bus);
-	bus->dest_addr = slave_addr;
 	bus->msgs = msgs;
 	bus->msgs_num = num;
 	bus->cmd_err = 0;
-- 
2.34.1

