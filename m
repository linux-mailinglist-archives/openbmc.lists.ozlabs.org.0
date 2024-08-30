Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A7A19655F3
	for <lists+openbmc@lfdr.de>; Fri, 30 Aug 2024 05:50:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ww3zv55WQz3g8j
	for <lists+openbmc@lfdr.de>; Fri, 30 Aug 2024 13:49:15 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724989750;
	cv=none; b=EAsbzyn/T1rLAkEEgtAkca28Wuu6k9FOTRPOjqzDcsaqhiuP3NiEFYioXsoCPoRHA67N05FM8xTrQn5c2USgTpGDAByq/0uv5xf/5b9XiHIgn+BIChtiZMGSugeYlaNH2kfG+RYX8+ruSRLT1oaSIeuDSHAuMBegAijVV+Tijmm5jJAESkQCcoeTtTqLkt8XfMFH+uGtYFLOyGroIi8An4hjQXFHOEt4tXnkvew6o66HksNuedmRR1yT/c2gkktbxvR5Gk00AOHCZNjjiJNVWXz5k3QJzNL1gO8VpcEimXeYC2kt1+GUCkKf/y4vlrR6G8hMJG5k4sqVCfhOBqnwiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724989750; c=relaxed/relaxed;
	bh=XqFq8EWoNEfLfpi6AmZzlGu/jzM8vHDtRNwp/7NnlVU=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:Received:From:
	 X-Google-Original-From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References; b=dHTxSUuzXN9dl2dlmaT8LFx+wYo39Kl5MGQ88UXjazrLaQy5hP0Dp9yeNBi+oyuZYVf2wGw2SThzjTIoLf9Ymk5iyk4Os9fKJ6H/nTzYWLhHXr/t1LKTEye39cSM//AuJzIuGYxqZflzelLaSoNlLVmdfY0KPI7L4CASZM2OUIek9orNQNgnFf0aqq/0gBnJGFqmTMy9qIrBPMy1eUqiyZsSFxwsSFLYiLEIeop6HTv9E+qRFB50yPVti6BPinaYYKiDJRum0yuKd7JQWgDEO9PzdcG7IbKxMPRT7v8zQfd/GMoKEF+qtbfXQrFQDUDOFxudAmOwuN3zDuUzryj21w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=NsIpMRo8; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62f; helo=mail-pl1-x62f.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=NsIpMRo8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62f; helo=mail-pl1-x62f.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ww3zp4Kx2z3frS
	for <openbmc@lists.ozlabs.org>; Fri, 30 Aug 2024 13:49:10 +1000 (AEST)
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-201e52ca0caso9588735ad.3
        for <openbmc@lists.ozlabs.org>; Thu, 29 Aug 2024 20:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724989748; x=1725594548; darn=lists.ozlabs.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XqFq8EWoNEfLfpi6AmZzlGu/jzM8vHDtRNwp/7NnlVU=;
        b=NsIpMRo8v3uQ72Dweyo4jyuPHh85HdYN5oqO1N2NvBQQpd1TOaX4/mpdkbfxqMPr1q
         dJBh/4BR/8ez0poMM5+Bc5Fybj+e/+oUAn5ignNub8lyK06wxEpxoAsDOIjzLVu/X5sV
         f1ZFxiZBWf1pTUZEXcxqprjBRHfKd0Ui2bj70Au3H1x/nX4hikXIjWRRD9Ebe8qtJ20g
         0qyscyJ2UaQoFrtelrVZhEUeoHmveTi5Mf7QQCm25HzU2oa4X8hKnLPLb29OGXsMSp3B
         d6IzfXZKGDmW6RkgDJOVbRwr7ows+s0n8gk0KncfulZdFnjHcTHoCzuu4J4MpIwmKrLO
         NoEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724989748; x=1725594548;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XqFq8EWoNEfLfpi6AmZzlGu/jzM8vHDtRNwp/7NnlVU=;
        b=JBw9fMcJcwgGAvAE83bUGG4dF7Ar6PBuRnAmbxcUIwVZcCjYMRn1aw8T1XVJtx498o
         PZ+rMbbPU0N4fUCc65BHgzrflTS4neAw/svpeKvgV2k8GcQY6FsaTLJ6aM+fYE3YFgWS
         RaAncpeAEPpx/k/iPbPynU+dlMAOxs1QJqVFkJt/bzE9tt+KYIiLQFzZtvKqiSvYHJaI
         3Gct1pWxd83BEMekXtVI5Cz2iEmFgfXCUe769nwYVnJYkkdNN/Hsw1t3CFUOnh3hG2q9
         XyfQ3ydO8J4b3zvCuy3iktUjOyu17wm+DtyA2t/W3n2g/Sn2llaA3Vbm/7nf56NKE3EE
         Ts7w==
X-Gm-Message-State: AOJu0YzvNJ0Y58J1Ve8oKp14bCr1EucJtbUTUn/hRpc2DCFJliEHXywo
	69biiYxKvT3hsCe11Iuwf5wVFHHIlfNJ3PHlqE85cV2LujkA6lk=
X-Google-Smtp-Source: AGHT+IHizkeEALsJJzSovFZ2tihJcLdkSMPu2gI6fgOxc/IwZpNGYjr2kbuSimtekmZnUMXCtYDQ6g==
X-Received: by 2002:a17:902:da8c:b0:1fb:8cab:ccc9 with SMTP id d9443c01a7336-2050c423fabmr63064475ad.45.1724989747578;
        Thu, 29 Aug 2024 20:49:07 -0700 (PDT)
Received: from localhost (2001-b400-e338-dab5-746d-1a82-f21e-bb0a.emome-ip6.hinet.net. [2001:b400:e338:dab5:746d:1a82:f21e:bb0a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20515545329sm18341245ad.215.2024.08.29.20.49.06
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 29 Aug 2024 20:49:07 -0700 (PDT)
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
Subject: [PATCH v2 5/7] i2c: npcm: Modify the client address assignment
Date: Fri, 30 Aug 2024 11:46:38 +0800
Message-Id: <20240830034640.7049-6-kfting@nuvoton.com>
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

Store the client address earlier since it's used in the i2c_recover_bus
logic flow.

Fixes: 48acf8292280 ("i2c: Remove redundant comparison in npcm_i2c_reg_slave")
Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
---
 drivers/i2c/busses/i2c-npcm7xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
index 68f3d47323ab..67d156ed29b9 100644
--- a/drivers/i2c/busses/i2c-npcm7xx.c
+++ b/drivers/i2c/busses/i2c-npcm7xx.c
@@ -2155,6 +2155,7 @@ static int npcm_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 
 	} while (time_is_after_jiffies(time_left) && bus_busy);
 
+	bus->dest_addr = slave_addr << 1;
 	if (bus_busy || bus->ber_state) {
 		iowrite8(NPCM_I2CCST_BB, bus->reg + NPCM_I2CCST);
 		npcm_i2c_reset(bus);
@@ -2163,7 +2164,6 @@ static int npcm_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 	}
 
 	npcm_i2c_init_params(bus);
-	bus->dest_addr = slave_addr;
 	bus->msgs = msgs;
 	bus->msgs_num = num;
 	bus->cmd_err = 0;
-- 
2.34.1

