Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 996B4467014
	for <lists+openbmc@lfdr.de>; Fri,  3 Dec 2021 03:38:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J4xns3Yxtz305t
	for <lists+openbmc@lfdr.de>; Fri,  3 Dec 2021 13:38:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=pWMHEleN;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=flex--suichen.bounces.google.com
 (client-ip=2607:f8b0:4864:20::b4a; helo=mail-yb1-xb4a.google.com;
 envelope-from=39ikpyqckb7mlnbvaxgzhhzex.vhfhixgufveblml.hsetul.hkz@flex--suichen.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=pWMHEleN; dkim-atps=neutral
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com
 [IPv6:2607:f8b0:4864:20::b4a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J4xnR1wypz2ynk
 for <openbmc@lists.ozlabs.org>; Fri,  3 Dec 2021 13:37:45 +1100 (AEDT)
Received: by mail-yb1-xb4a.google.com with SMTP id
 l75-20020a25254e000000b005f763be2fecso3747516ybl.7
 for <openbmc@lists.ozlabs.org>; Thu, 02 Dec 2021 18:37:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=hQggcIGgy6ZKALnkw04VjX0+7sX9DPBYoaUquorKfFo=;
 b=pWMHEleNRosicEE52A3D6C0q7o0/IDzJIRvUkGOSOELfD2qJrCPRyIZlCBMeJQDANC
 AAvEUPB6xllw71fAGtEjVJ1m3+jPzglhd4SnOvaoaZgp8Y596PSaD3ke32Vnae1Hw1Gf
 iGgd6msT77zeuFtRo1xlHC0z+lM+KY8vAmucadw3158GLkoTMYE9W50foko4KUCzkoja
 k/kv9dljHRCOdJcx7QuonHtnRAu9hojV7fOgEgYx0uphk84mRDBseX8tso6n0xgY06hk
 8i0+cTbfFDZnHSE3GxLlvCjD9I/Ct99bCIEFasuUKf7usCb4LjFEURW97otzohlnKJLL
 M9dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=hQggcIGgy6ZKALnkw04VjX0+7sX9DPBYoaUquorKfFo=;
 b=lmam15pBg4dptQkzkyj6r6+K1z/IY5ZEF0QpbPy2X02EqWTHjKzVRpRKPp5sLOgAQ6
 xtJbIB5IOsWI9vN4j4froDwCxr+KSi29ORyCuScdLSvMqLbuW09YSo6U6Pd2AscQGbK4
 3SmRFkFDDZCTqtyItEGN4jLnxO73LZCLDAPsztc/QI3PI336jsf2rZCdfQuDtwsr3U29
 1Yj1Z0Qa3/y2gLjqOYv59CP4/H9z0c+pZ7PQg6N5+6Pg/WWC/sr7khsffO7A6gAl7djh
 fDPV7xjT7fZ2VQ4bQYzC8xu4Hj0B8n6C94FPryT2KBPmNSGBOUFI73TQEz/MZRW39jkO
 Yx/g==
X-Gm-Message-State: AOAM532bEql2fzIOwKhXuRpULZODDvFFF1nPshzCVkuw16UtWUUi36FF
 f+Xi8qDHtdY2kKG9avt8HwuJGO6sjaVY
X-Google-Smtp-Source: ABdhPJyEstOP7jjC8xY+y2To+7nO+sQ3QFKHnOyof+ZDQy+NSFAWu4iDF6eIdQPDmbDhVfAhZ0yeMw3kskYd
X-Received: from suichen.svl.corp.google.com
 ([2620:15c:2c5:13:bc47:f5e4:20fa:844b])
 (user=suichen job=sendgmr) by 2002:a25:c010:: with SMTP id
 c16mr20955799ybf.760.1638499060256; Thu, 02 Dec 2021 18:37:40 -0800 (PST)
Date: Thu,  2 Dec 2021 18:37:25 -0800
Message-Id: <20211203023728.3699610-1-suichen@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.34.0.384.gca35af8252-goog
Subject: [RFC Patch v2 0/3] I2C statistics as sysfs attributes
From: Sui Chen <suichen@google.com>
To: linux-kernel@vger.kernel.org
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
Cc: benjaminfair@google.com, andrew@aj.id.au, openbmc@lists.ozlabs.org,
 tali.perry1@gmail.com, krellan@google.com, linux-i2c@vger.kernel.org,
 joe@perches.com, Sui Chen <suichen@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add I2C statistics such as Bus Error counts and NACK counts as sysfs
attributes so they don't need to live in debugfs.

There are a few I2C statistics that are implemented in many I2C
controllers, such as bus error counts and NACK counts. Having those
statistics in sysfs will 1) allow for a unified definition across
various I2C drivers, and 2) make the statistics more ABI-stable and
available on devices with the debugfs disabled.

Overall the patch works as the following way:
1) An I2C statistics sysfs directory is created.
2) Each specific I2C driver is responsible for instantiating the
statistics available.

Test Process:
1. Clone the OpenBMC repository
2. `devtool modify`and apply patch to the linux-nuvoton recipe
3. Build image for quanta-gsj
4. Build QEMU
5. Run the image-bmc image in QEMU

Results:
root@gsj:/sys/class/i2c-adapter/i2c-1/stats# ls
ber_cnt          i2c_speed        nack_cnt         rec_fail_cnt
rec_succ_cnt     timeout_cnt      tx_complete_cnt
root@gsj:/sys/class/i2c-adapter/i2c-1/stats# cat *
0
100000
0
0
0
0
53

Sui Chen (2):
  i2c debug counters as sysfs attributes
  add npcm7xx debug counters as sysfs attributes

Tali Perry (1):
  i2c: npcm7xx: add tx_complete counter

 drivers/i2c/busses/i2c-npcm7xx.c |  13 ++++
 drivers/i2c/i2c-core-base.c      |   2 +
 drivers/i2c/i2c-dev.c            | 103 +++++++++++++++++++++++++++++++
 include/linux/i2c.h              |  27 ++++++++
 4 files changed, 145 insertions(+)

-- 
2.34.0.384.gca35af8252-goog

