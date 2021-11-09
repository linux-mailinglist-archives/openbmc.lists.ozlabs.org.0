Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DA5644B90E
	for <lists+openbmc@lfdr.de>; Tue,  9 Nov 2021 23:54:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HpjwQ0cVSz2yfg
	for <lists+openbmc@lfdr.de>; Wed, 10 Nov 2021 09:54:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=gaizNiw4;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=flex--suichen.bounces.google.com
 (client-ip=2607:f8b0:4864:20::b4a; helo=mail-yb1-xb4a.google.com;
 envelope-from=3c_ykyqckb0iwymglirksskpi.gsqstirfqgpmwxw.s3pefw.svk@flex--suichen.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=gaizNiw4; dkim-atps=neutral
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com
 [IPv6:2607:f8b0:4864:20::b4a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hpjw22ks2z2xgb
 for <openbmc@lists.ozlabs.org>; Wed, 10 Nov 2021 09:54:08 +1100 (AEDT)
Received: by mail-yb1-xb4a.google.com with SMTP id
 w132-20020a25c78a000000b005c27f083240so937304ybe.16
 for <openbmc@lists.ozlabs.org>; Tue, 09 Nov 2021 14:54:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=fqkBKrDgG+U2J0jLPhfOG5/umxYft29Uz1Bp7bFqlU4=;
 b=gaizNiw45AQlsLUXXmDt2Z841rK7YK6dEfm5VUXvm3abRCI+G8ZqrXQWuNbZFwSTmh
 XDzZI4SMXh1Kl1WuBipnZdUMW5smsEdFRI30aJdHi4uxTjC51z/SGOAdP3IDilh5sA6s
 /sSmu2/cpqoRmeJbNXVj0ei5YxIaGqfnnBf6LzmJqATWgWiIW0Xra422ZhbB2T5p60li
 5XlCkM7OAc8IKhtaC9Kb+KTV20K8CJaIJEenVStxz2lj1egMVnF1gWjvufv0elFOFJm6
 vQmvqmQak8AO9ZWg2dxaMsYd7YJHpDNagF8ZXUXIP8LumSzCYBbzUn5cgxHU9PfXEk0+
 9RVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=fqkBKrDgG+U2J0jLPhfOG5/umxYft29Uz1Bp7bFqlU4=;
 b=xN62h5hWX0j23aAL4Xl6jkvrvSUC/bjCg8hktYN5AfFTsXcu+vn3PLtolbagTDjkAZ
 Xucye4CjWGPNJJc7JYxlR8rsorLnL+sTx2lEOIZ02ILNm61JPO6+rTK7vH6LtRXKIFaU
 mukWfBLvqc5IXIH26h5TjEyK0H0CPfwXA6pUk/psiA5+eQQb79pEsO5I3aE4kKV8ZsFm
 giUVti2h+Xu2TgUy3F1QIKn88ZxOeorlE6sY5NoIrxjO10pyEKJQh8rQGzUBMoh2EPXO
 4n1p5prfVonEs8iJbDlQxp2fNC/3lEbwXdTtJJo7M69KlrXYjnWP+NnoRqXb3WBNbXh/
 u/JQ==
X-Gm-Message-State: AOAM530enqGE1DkdfiqNuxcTW3rvJDfmLjZATmVkciw1FIcOwp5wQG5r
 cxfv+7Sa6imcwvnKih2LXUUBZ5WWnsE4
X-Google-Smtp-Source: ABdhPJzNKPj7oPovvEeYQf8vpEbvDToEAPKuadIbnxVFDOySdOXin+j0m8TstBdNk2fD9endANDJ4D0MzBGV
X-Received: from suichen.svl.corp.google.com
 ([2620:15c:2c5:13:7559:12f5:de29:c918])
 (user=suichen job=sendgmr) by 2002:a25:e6c5:: with SMTP id
 d188mr12102876ybh.217.1636498443089; Tue, 09 Nov 2021 14:54:03 -0800 (PST)
Date: Tue,  9 Nov 2021 14:53:19 -0800
Message-Id: <20211109225321.618688-1-suichen@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.34.0.rc0.344.g81b53c2807-goog
Subject: [RFC Patch Resend 0/2] I2C statistics as sysfs attributes
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
Cc: Benjamin Fair <benjaminfair@google.com>, Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Mailing List <openbmc@lists.ozlabs.org>,
 Tali Perry <tali.perry1@gmail.com>, Josh Lehan <krellan@google.com>,
 Sui Chen <suichen@google.com>, linux-i2c <linux-i2c@vger.kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add I2C statistics such as Bus Error counts and NACK counts as sysfs
attributes.

I2C statistics such as bus error counts and NACK counts, are
implemented in many I2C controllers.

Some drivers already populate the counters in debugfs. Having those
statistics in sysfs can enable for a unified definition across various
I2C drivers, make the statistics more ABI-stable.

Overall the patch works in the following way:
1) A sysfs directory for I2C statistics is created for an i2c_adapter.
2) Each specific I2C driver can optionally instantiate each of the
statistics individually.

Test Process:
1. Clone the OpenBMC repository
2. `devtool modify`and apply patch to the linux-nuvoton recipe
3. Build image for quanta-gsj
4. Build QEMU
5. Run the image-bmc image in QEMU

Results:
root@gsj:/sys/class/i2c-adapter/i2c-1/stats# ls
ber_cnt       i2c_speed     nack_cnt      rec_fail_cnt  rec_succ_cnt
timeout_cnt
root@gsj:/sys/class/i2c-adapter/i2c-1/stats# cat *
0
100000
0
0
0
0

Sui Chen (2):
  i2c debug counters as sysfs attributes
  add npcm7xx debug counters as sysfs attributes

 drivers/i2c/busses/i2c-npcm7xx.c |  8 +++
 drivers/i2c/i2c-core-base.c      |  2 +
 drivers/i2c/i2c-dev.c            | 98 ++++++++++++++++++++++++++++++++
 include/linux/i2c.h              | 26 +++++++++
 4 files changed, 134 insertions(+)

(Previously sent to linux-i2c, resending to linux-kernel with
CCed correspondents)

CC: OpenBMC Mailing List <openbmc@lists.ozlabs.org>
CC: linux-i2c <linux-i2c@vger.kernel.org>
CC: linux-kernel <linux-kernel@vger.kernel.org>
CC: Joel Stanley <joel@jms.id.au>
CC: Andrew Jeffery <andrew@aj.id.au>
CC: Tali Perry <tali.perry1@gmail.com>
CC: Benjamin Fair <benjaminfair@google.com>
CC: Josh Lehan <krellan@google.com>


-- 
2.34.0.rc0.344.g81b53c2807-goog

