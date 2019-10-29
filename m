Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 271C4E8F32
	for <lists+openbmc@lfdr.de>; Tue, 29 Oct 2019 19:25:14 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 472g452CNyzF35H
	for <lists+openbmc@lfdr.de>; Wed, 30 Oct 2019 05:25:09 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::541;
 helo=mail-pg1-x541.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="oJ3XeKlY"; 
 dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 472fzr0gC6zDsy8
 for <openbmc@lists.ozlabs.org>; Wed, 30 Oct 2019 05:21:26 +1100 (AEDT)
Received: by mail-pg1-x541.google.com with SMTP id r1so10113863pgj.12
 for <openbmc@lists.ozlabs.org>; Tue, 29 Oct 2019 11:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=q2NMW0yAo8fjN7AdHRf7TeqifEqFkIujHEcA+YXzOGI=;
 b=oJ3XeKlYGDd2DdRMvocbGt69kaPWeiuAmPVlC2MTf6c9HSkecZAVKZNVAT9ceCxQxm
 GPO6Rx/G5hx7tVNAsxMMxBUuArhZ+e5rxhAq4sBTlmcbwLcGPBn3YqnMKKuQpOkm/rBI
 Kp3RdCBCZDXolNSxt+va7Q1+QFHHUmTnl5iVlQZPogEV1XuJ57Wdx21zd+O+mAcofk5w
 QzzIcLTw3AELSwM3ZZC/KHn6TSkCh1TU9Ea8lZnLdkJYjtGWtp2cSyGhwMy2Rq2AC+ba
 evhIMyRPs6/oHMEGufPhOBaU18FJNWZRdkHE8+lcBNV79kZ1WB12cj51zop7E7tKWxvl
 CFog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=q2NMW0yAo8fjN7AdHRf7TeqifEqFkIujHEcA+YXzOGI=;
 b=byl7gb5op55H2QX8I83D7kR2sB7cGdeoVZtnlt0z/UE4GbQNUcPxibpDIvqy4ujJbd
 X6ba37HRnHrYwOVEy5Uw391a6O/UMDv+VpDQOnarqOuw4XYbEaQOUl5dvh74JrDlZPgc
 q+utBcXnA3TjHmpiDEOmz6T4QxZglr/nqtjkZjQvgQyc2V3cV082X4C0/rMKx/Gldb4m
 +PfU94yR6pWQ3EGfOFnsN+EAiDH1Lmb2WBkTv8ejydLgRkUF7pS7jsXUCl0crkKIrFKM
 FWtcYA9YMI78xDmTaXUrwzB1DTrPaB9BU3qFfLepvU8dJdfimZOSFzGS/SdsIoAc7WQq
 zZFQ==
X-Gm-Message-State: APjAAAUiQ3Dmj+cJlSWIGWCTewQCXHzQLXD+hvMG6X2s+k+SmenowWQ/
 /awROZ8ucoQSGm+VV/1WrHo=
X-Google-Smtp-Source: APXvYqxfKmkMhaGDGZdZ4YkXEbO7LOpPtr49mJT10hxJgi++TFhKI91TQfBx7mRbEfIj3vl+4f92EQ==
X-Received: by 2002:a17:90a:c405:: with SMTP id i5mr8790458pjt.9.1572373283389; 
 Tue, 29 Oct 2019 11:21:23 -0700 (PDT)
Received: from taoren-ubuntu-R90MNF91.thefacebook.com
 ([2620:10d:c090:200::1:3a3e])
 by smtp.gmail.com with ESMTPSA id j10sm13488418pfn.128.2019.10.29.11.21.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Oct 2019 11:21:22 -0700 (PDT)
From: rentao.bupt@gmail.com
To: Guenter Roeck <linux@roeck-us.net>, Jean Delvare <jdelvare@suse.com>,
 Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org, taoren@fb.com
Subject: [PATCH v2 0/2] hwmon: (pmbus) add driver for BEL PFE1100 and PFE3000
Date: Tue, 29 Oct 2019 11:20:52 -0700
Message-Id: <20191029182054.32279-1-rentao.bupt@gmail.com>
X-Mailer: git-send-email 2.17.1
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
Cc: Tao Ren <rentao.bupt@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Tao Ren <rentao.bupt@gmail.com>

The patch series adds "bel-pfe" pmbus driver which supports hardware
monitoring for BEL PFE1100 and PFE3000 power supplies.

There are total 2 patches:
  - patch #1 adds bel-pfe pmbus driver for BEL PFE1100 and PFE3000 power
    supplies.
  - patch #2 adds documentation for the bel-pfe pmbus driver.

The driver has been tested on Facebook Wedge40 BMC (with PFE1100) and
Facebook CMM BMC (with PFE3000).

Tao Ren (2):
  hwmon: (pmbus) add driver for BEL PFE1100 and PFE3000
  docs: hwmon: Document bel-pfe pmbus driver

 Documentation/hwmon/bel-pfe.rst | 112 +++++++++++++++++++++++++++
 drivers/hwmon/pmbus/Kconfig     |   9 +++
 drivers/hwmon/pmbus/Makefile    |   1 +
 drivers/hwmon/pmbus/bel-pfe.c   | 131 ++++++++++++++++++++++++++++++++
 4 files changed, 253 insertions(+)
 create mode 100644 Documentation/hwmon/bel-pfe.rst
 create mode 100644 drivers/hwmon/pmbus/bel-pfe.c

-- 
2.17.1

