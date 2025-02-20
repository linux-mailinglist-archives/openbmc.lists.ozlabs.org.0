Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FDE7A3D044
	for <lists+openbmc@lfdr.de>; Thu, 20 Feb 2025 05:01:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yz0113tXsz3cVB
	for <lists+openbmc@lfdr.de>; Thu, 20 Feb 2025 15:00:53 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740024049;
	cv=none; b=ma5vvPrF+W5QpE9Il5MWHJrZyaKHhhmxrglsTttUDIg29fC3FYTf9+QpP4LqRvtPXlJiLKB6wGu1S2ykZP1Kzud8UfDaDqVqFfNTrUhpE4bAPgVCJI8IdUcVlC9m2Dg5gDx2wydD6QARi/ftP/vr58IAkJazOq3DMT6ODd3+VgfE8IWv4l+Wol3FdUPwM66TyQ8ZRA4yIuhihd5Jfj0d0lBPquF4DJx76s1Lgo41FrVz9VJerHJ9Q5egcN6brzX7Ou9TenQVDKow03wANWJp3VmbMCkz3oE8dQOu+4SNVug0lx4dZtvNaBqErl5S2X95LX+FSxEDl+lo8f6wEgU2IA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740024049; c=relaxed/relaxed;
	bh=UOqJDp/c7tt8tcSaOZCRxBhXVm7kyLOq7AnJmppBzVE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=GF4yBLoo7LEyLdAhOtwK45rHYxjS5UbwmvVC5k1mgOCQhFqMhdTotekajXqfPnAN4NzBP3FXd79dA0josZwoIcyTIJ4dfEc4MQ/AJu/RlmSYrT/yIUEVak0KC8wNMy9q1DAQ//vblu33tPPX/+oJfcFE99GgDDY5UTpCxEr7hu3e5DvXVlOEm+HX1eMOME+Usc3Li9hfCKUkJvZL8olvmmkTTX0QLCCg+QtMVWThPB4JbJKtqnpe6NK4t2NG4KKmwD+zTUzmQodQJFejMKhL+IW1RJbQB5SRTpCRZMgeh2saF7h3d5Kuhr3/716INO7Wt8w3cGttl4poQ8mLjoyzdg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Iucr4hd4; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62f; helo=mail-pl1-x62f.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Iucr4hd4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62f; helo=mail-pl1-x62f.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yz00w6L1Fz2xtt
	for <openbmc@lists.ozlabs.org>; Thu, 20 Feb 2025 15:00:48 +1100 (AEDT)
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-220d132f16dso6877435ad.0
        for <openbmc@lists.ozlabs.org>; Wed, 19 Feb 2025 20:00:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740024046; x=1740628846; darn=lists.ozlabs.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UOqJDp/c7tt8tcSaOZCRxBhXVm7kyLOq7AnJmppBzVE=;
        b=Iucr4hd4hAEg8UNDr3p4uWdov7YhnRgn4j/OX5B7u5FI6BlpvdCirhTmQwoLF5uELZ
         SMUgJMuyXXcPvSfcFz9Nlyp1r4rzQgJPF4B4JRkwvHtLg0mMT8xTKVPL0UIxxlfuao8q
         4IczYHUX4Pfdhjnx6gWwGc71hDN1rp8xrJB/suj3h5LTnJRLuDSsN50UWhULAIdIY6dH
         o8cCZ5qo+dKLcqNxKMKsAZ3z4NB+HCIv22G2vjXeuRlGQo7Icq1jxbxWOiAzeQ35xOao
         hj0K7YymE3Sh1QaTP6DM/ylkwKBg+k9q5zuOiFP8mC7Joi2iTG5QX2guVWLMfr1Nduaw
         OYDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740024046; x=1740628846;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UOqJDp/c7tt8tcSaOZCRxBhXVm7kyLOq7AnJmppBzVE=;
        b=q4FB8D2W3wmeQ5lVDQLFhb7jKjenbcGh4lIVeYwDqnHXioiwR6HCyYNUdMqOXlKz0+
         WecaFTOl54YBXJhV8Bii/Hll6qrL5m1mFubTXe4am+iKM6PhFoHJb9OUIHk5nuvhB6mP
         Y9Ph87JheRw0yONjITVVop9+9p/qiHeoQZQmF5kTytqbuS8liJtLAAskfvY7bSXmcp9L
         wrhaHl6KGwvh1EVbTRSM8Jdshm/bGAPldSOyDXXzYpktzL8uYWrOMa8gEU3EKbjNR/IV
         LUjvfqx0H01zXXRlHp68zFIo9GbuvoF5GAVrPI0lqRFNo020GBntxQKSoeSyIyy8szCb
         ccrw==
X-Gm-Message-State: AOJu0YwHAYZ3OlHW17qcUCdkjvmd4jTqAMy8k4QqME+Dj+i1e/epeRCP
	edwB9KJprVVptuKaZocsauiSQAhESZ+A9rrJXM+AkaIA6Xh0ADM=
X-Gm-Gg: ASbGncuhZ+TpDKg0wsUeetGk1VZjUc5U/rz3cal648KE4dQVhfapzebDNUn/w8EVZeR
	2qv56ngzGFpD0IC4KO5ljh/afU6uDcTPYtkLZgPuzwTUERwEOs9/3XtIrCMoeI63H0YHO0MOlg0
	RrvtyYxlZvkRw3ELK2JK/lVo9Q41qTbzeeItGFhvR3qt51o6lHqWgOKZdye9oxVsNQ2SQYb2rA2
	PLo0lTF0J1lXRndTBQlU1JzVqLgWWJE3++2PaYHSLMxzXBINA5/OIp+paIWO9mw27D5Di3naZw3
	UHyMLBiGST1dYhAggshr2fI3mpb++itgsNmb/EZs/phYr2A5yXqjYKt9efNjz6LYi7XZzfhvSHg
	4pGFJDPI=
X-Google-Smtp-Source: AGHT+IFHAfZP0ic9c/8xm17hs9w1i84l+PJiMVHVQzhMCVFIOJRDUpgi7DVDTHZUsnoRu80e/bjeMw==
X-Received: by 2002:a05:6a20:a11f:b0:1ee:ce0a:5333 with SMTP id adf61e73a8af0-1eed4eb475fmr11726760637.23.1740024046107;
        Wed, 19 Feb 2025 20:00:46 -0800 (PST)
Received: from localhost (2001-b400-e386-8f50-c5f8-9184-9e47-206d.emome-ip6.hinet.net. [2001:b400:e386:8f50:c5f8:9184:9e47:206d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73242568961sm12707052b3a.38.2025.02.19.20.00.45
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 Feb 2025 20:00:45 -0800 (PST)
From: Tyrone Ting <warp5tw@gmail.com>
X-Google-Original-From: Tyrone Ting <kfting@nuvoton.com>
To: avifishman70@gmail.com,
	tmaimon77@gmail.com,
	tali.perry1@gmail.com,
	venture@google.com,
	yuenn@google.com,
	benjaminfair@google.com,
	andi.shyti@kernel.org,
	wsa+renesas@sang-engineering.com,
	warp5tw@gmail.com,
	tali.perry@nuvoton.com,
	Avi.Fishman@nuvoton.com,
	tomer.maimon@nuvoton.com,
	KWLIU@nuvoton.com,
	JJLIU0@nuvoton.com,
	kfting@nuvoton.com
Subject: [PATCH v1 1/1] i2c: npcm: disable interrupt enable bit before devm_request_irq
Date: Thu, 20 Feb 2025 12:00:29 +0800
Message-Id: <20250220040029.27596-2-kfting@nuvoton.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250220040029.27596-1-kfting@nuvoton.com>
References: <20250220040029.27596-1-kfting@nuvoton.com>
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

The customer reports that there is a soft lockup issue related to
the i2c driver. After checking, the i2c module was doing a tx transfer
and the bmc machine reboots in the middle of the i2c transaction, the i2c
module keeps the status without being reset.

Due to such an i2c module status, the i2c irq handler keeps getting
triggered since the i2c irq handler is registered in the kernel booting
process after the bmc machine is doing a warm rebooting.
The continuous triggering is stopped by the soft lockup watchdog timer.

Disable the interrupt enable bit in the i2c module before calling
devm_request_irq to fix this issue since the i2c relative status bit
is read-only.

Here is the soft lockup log.
[   28.176395] watchdog: BUG: soft lockup - CPU#0 stuck for 26s! [swapper/0:1]
[   28.183351] Modules linked in:
[   28.186407] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.15.120-yocto-s-dirty-bbebc78 #1
[   28.201174] pstate: 40000005 (nZcv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[   28.208128] pc : __do_softirq+0xb0/0x368
[   28.212055] lr : __do_softirq+0x70/0x368
[   28.215972] sp : ffffff8035ebca00
[   28.219278] x29: ffffff8035ebca00 x28: 0000000000000002 x27: ffffff80071a3780
[   28.226412] x26: ffffffc008bdc000 x25: ffffffc008bcc640 x24: ffffffc008be50c0
[   28.233546] x23: ffffffc00800200c x22: 0000000000000000 x21: 000000000000001b
[   28.240679] x20: 0000000000000000 x19: ffffff80001c3200 x18: ffffffffffffffff
[   28.247812] x17: ffffffc02d2e0000 x16: ffffff8035eb8b40 x15: 00001e8480000000
[   28.254945] x14: 02c3647e37dbfcb6 x13: 02c364f2ab14200c x12: 0000000002c364f2
[   28.262078] x11: 00000000fa83b2da x10: 000000000000b67e x9 : ffffffc008010250
[   28.269211] x8 : 000000009d983d00 x7 : 7fffffffffffffff x6 : 0000036d74732434
[   28.276344] x5 : 00ffffffffffffff x4 : 0000000000000015 x3 : 0000000000000198
[   28.283476] x2 : ffffffc02d2e0000 x1 : 00000000000000e0 x0 : ffffffc008bdcb40
[   28.290611] Call trace:
[   28.293052]  __do_softirq+0xb0/0x368
[   28.296625]  __irq_exit_rcu+0xe0/0x100
[   28.300374]  irq_exit+0x14/0x20
[   28.303513]  handle_domain_irq+0x68/0x90
[   28.307440]  gic_handle_irq+0x78/0xb0
[   28.311098]  call_on_irq_stack+0x20/0x38
[   28.315019]  do_interrupt_handler+0x54/0x5c
[   28.319199]  el1_interrupt+0x2c/0x4c
[   28.322777]  el1h_64_irq_handler+0x14/0x20
[   28.326872]  el1h_64_irq+0x74/0x78
[   28.330269]  __setup_irq+0x454/0x780
[   28.333841]  request_threaded_irq+0xd0/0x1b4
[   28.338107]  devm_request_threaded_irq+0x84/0x100
[   28.342809]  npcm_i2c_probe_bus+0x188/0x3d0
[   28.346990]  platform_probe+0x6c/0xc4
[   28.350653]  really_probe+0xcc/0x45c
[   28.354227]  __driver_probe_device+0x8c/0x160
[   28.358578]  driver_probe_device+0x44/0xe0
[   28.362670]  __driver_attach+0x124/0x1d0
[   28.366589]  bus_for_each_dev+0x7c/0xe0
[   28.370426]  driver_attach+0x28/0x30
[   28.373997]  bus_add_driver+0x124/0x240
[   28.377830]  driver_register+0x7c/0x124
[   28.381662]  __platform_driver_register+0x2c/0x34
[   28.386362]  npcm_i2c_init+0x3c/0x5c
[   28.389937]  do_one_initcall+0x74/0x230
[   28.393768]  kernel_init_freeable+0x24c/0x2b4
[   28.398126]  kernel_init+0x28/0x130
[   28.401614]  ret_from_fork+0x10/0x20
[   28.405189] Kernel panic - not syncing: softlockup: hung tasks
[   28.411011] SMP: stopping secondary CPUs
[   28.414933] Kernel Offset: disabled
[   28.418412] CPU features: 0x00000000,00000802
[   28.427644] Rebooting in 20 seconds..

Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
---
 drivers/i2c/busses/i2c-npcm7xx.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
index 3ca08b8ef8af..de713b5747fe 100644
--- a/drivers/i2c/busses/i2c-npcm7xx.c
+++ b/drivers/i2c/busses/i2c-npcm7xx.c
@@ -2554,6 +2554,13 @@ static int npcm_i2c_probe_bus(struct platform_device *pdev)
 	if (irq < 0)
 		return irq;
 
+	/*
+	 * Disable the interrupt to avoid the interrupt handler being triggered
+	 * incorrectly by the asynchronous interrupt status since the machine
+	 * might do a warm reset during the last smbus/i2c transfer session.
+	 */
+	npcm_i2c_int_enable(bus, false);
+
 	ret = devm_request_irq(bus->dev, irq, npcm_i2c_bus_irq, 0,
 			       dev_name(bus->dev), bus);
 	if (ret)
-- 
2.34.1

