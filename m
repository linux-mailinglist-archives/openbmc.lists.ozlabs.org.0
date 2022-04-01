Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AF874EE558
	for <lists+openbmc@lfdr.de>; Fri,  1 Apr 2022 02:27:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KV1GK6ck1z2yXP
	for <lists+openbmc@lfdr.de>; Fri,  1 Apr 2022 11:27:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=XfEzhDsP;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=flex--suichen.bounces.google.com
 (client-ip=2607:f8b0:4864:20::114a; helo=mail-yw1-x114a.google.com;
 envelope-from=330zgygckb54qsgafclemmejc.amkmncl9kajgqrq.mxj89q.mpe@flex--suichen.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=XfEzhDsP; dkim-atps=neutral
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com
 [IPv6:2607:f8b0:4864:20::114a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KV1Fy4Ktdz2xSM
 for <openbmc@lists.ozlabs.org>; Fri,  1 Apr 2022 11:27:16 +1100 (AEDT)
Received: by mail-yw1-x114a.google.com with SMTP id
 00721157ae682-2e5db04460cso11564167b3.17
 for <openbmc@lists.ozlabs.org>; Thu, 31 Mar 2022 17:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=ajRe3xml6x6TIHxlNyRSouJyjrQRi/5ANmvvr78T1RA=;
 b=XfEzhDsPaKMplT2gcU82amGS+tWMOKVhIV/IP3TgmzuwF9EnVaWO/5T9GVdFCvZC2e
 sK/XQqCaDq78CdX8XqxI9ig275iDHA17rLmnx4d5P2cNCl5gYlHlxkXegCSh5NRNRCYa
 GNkcTY5fDZnzRejLhVqDVV3rfvGHu9tA4oEnrIa86IT9JZ13w47JEoU96r7DPX9X7pRH
 /nwjIR3pFmdnTHnlf3Ri+DiLjdPbdW198cjVxdZ4719H5o0HY2kcDuO9zzZgXX7J4RA8
 EOi/Gn+IF/7/GUQFgCYofi6C5lB886/dVB/9RPzDaSUr4mNA1MUQr1h7EBBbOI0cs9qS
 K2NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=ajRe3xml6x6TIHxlNyRSouJyjrQRi/5ANmvvr78T1RA=;
 b=qHBk22BY1zMAMv0NOXFMqHJzJawD3QVNE4wuGYKPtBzPyHW4Z/PAIv4fGZgyIJc+HM
 SQQaewvUAnNHT7lEhWxZ7wYkpKk0xQ84mwhAcj/Vz/NLb4HJbF2ET5868JDr8FIecZDq
 fUPhnrmcu1xMFSCXij4W8AHFfxsqPstBcJIs9aLcLPpW5ZArFoXeCixjGY76AQwveFUJ
 Iui1xGt4OA3cISPXxFMQCcDEg2HRhFC1lEihMsyw9LzRH1f4VfNMhGmc3AFrqi2BMwnT
 JJxQWk6h+dWkueZG1gRCCmymO3oLQk1xq/7T7YW/L9woPt7ST6ToiJuelL8e3F1Npic7
 asuw==
X-Gm-Message-State: AOAM530hWuY+d9VV58ympi4SS0yaQ5r12jB6HU4mM/C0CeaYW67s4KLU
 kaCJSkijh1+a90t+P/m1LWCGwTHylYXz
X-Google-Smtp-Source: ABdhPJwKAM9KrL/ylYBQgAeHo7R6yNx8SLVIk6ATj14VdBL8QxwdOcBKu0pnz0ACZMiZaRma56CNvdQ1V3dA
X-Received: from suichen.svl.corp.google.com
 ([2620:15c:2c5:13:e046:decd:d8b3:41f0])
 (user=suichen job=sendgmr) by 2002:a5b:801:0:b0:633:eba2:8414 with SMTP id
 x1-20020a5b0801000000b00633eba28414mr6623672ybp.119.1648772831655; Thu, 31
 Mar 2022 17:27:11 -0700 (PDT)
Date: Thu, 31 Mar 2022 17:21:59 -0700
Message-Id: <20220401002200.27584-1-suichen@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.35.1.1094.g7c7d902a7c-goog
Subject: [RFC Patch v4 0/1] i2c statistics as sysfs attributes
From: Sui Chen <suichen@google.com>
To: linux-i2c@vger.kernel.org, openbmc@lists.ozlabs.org, joel@jms.id.au, 
 andrew@aj.id.au, tali.perry1@gmail.com, benjaminfair@google.com, 
 krellan@google.com
Content-Type: text/plain; charset="UTF-8"
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
Cc: Sui Chen <suichen@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This change renames the I2C debug counters as suggested, and moves their
processing into the i2c core:
- bus_errors
- transfers
- nacks
- recovery_successes
- recovery_failures
- timeouts

Did some brief tests with a few test programs that saves/replays I2C
trace by reading hwmon sensors. The test program and hardware run in
QEMU. The test programs are located at
https://gerrit.openbmc-project.xyz/c/openbmc/openbmc-tools/+/52527

(A normal read)

root@gsj:/tmp# cat /sys/class/i2c-adapter/i2c-1/stats/transfers
264
root@gsj:/tmp# ./i2c_bmk_bmc  0
idx=0
Processing 1 inputs
/sys/class/hwmon/hwmon0/temp1_input
(../../devices/platform/ahb/ahb:apb/f0081000.i2c/i2c-1/1-005c/hwmon/hwmon0):
0
[FindTraceEntries] t0=391.000000 t1=393.000000
Found 4 interesting I2C trace entries:
 i2c_write: i2c-1 #0 a=05c f=0000 l=1 [00]
 i2c_read: i2c-1 #1 a=05c f=0001 l=2
 i2c_reply: i2c-1 #1 a=05c f=0001 l=2 [00-00]
 i2c_result: i2c-1 n=2 ret=2
root@gsj:/tmp# cat /sys/class/i2c-adapter/i2c-1/stats/transfers
265

(Read from an inexistent address, NACK)

root@gsj:/tmp# cat /sys/class/i2c-adapter/i2c-1/stats/nacks
6
root@gsj:/tmp# cat /sys/class/i2c-adapter/i2c-1/stats/transfers
265

root@gsj:/tmp# cat i2c_trace.txt
 i2c_write: i2c-1 #0 a=0ff f=0000 l=1 [00]
 i2c_read: i2c-1 #1 a=0ff f=0001 l=2
root@gsj:/tmp# ./i2c_replay_bmc i2c_trace.txt
(program runs and finishes with 6 errors)

root@gsj:/tmp# cat /sys/class/i2c-adapter/i2c-1/stats/nacks
12
root@gsj:/tmp# cat /sys/class/i2c-adapter/i2c-1/stats/transfers
265

The program makes 2 attempts, performing 3 I2C operations at each
attempt, which translates to the 6 nack events.

We will do more testing.

Sui Chen (1):
  i2c debug counters as sysfs attributes

 drivers/i2c/i2c-core-base.c | 32 ++++++++++++-
 drivers/i2c/i2c-dev.c       | 94 +++++++++++++++++++++++++++++++++++++
 include/linux/i2c.h         | 26 ++++++++++
 3 files changed, 151 insertions(+), 1 deletion(-)

-- 
2.35.1.1094.g7c7d902a7c-goog

