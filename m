Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EFBCBE7D43
	for <lists+openbmc@lfdr.de>; Tue, 29 Oct 2019 00:51:56 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 472BMZ3TrxzDqXT
	for <lists+openbmc@lfdr.de>; Tue, 29 Oct 2019 10:51:54 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::542;
 helo=mail-pg1-x542.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="DBl3frT0"; 
 dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 472BJj57Q2zDrb6
 for <openbmc@lists.ozlabs.org>; Tue, 29 Oct 2019 10:49:25 +1100 (AEDT)
Received: by mail-pg1-x542.google.com with SMTP id l3so8117541pgr.8
 for <openbmc@lists.ozlabs.org>; Mon, 28 Oct 2019 16:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=GidVpWtOgdh1MdJmqQ31diCsiIYL+x3ynRwwdRDWZ4I=;
 b=DBl3frT0ObPftCDPLVdvCNA6f+eWU7L8xYXrNAINA/2539RvUUfmqQgUJedEVcVouy
 v4C0+sPLaigYvhInXnMK5IqiQAJcP6Jrpq2ag33xGAQUA84BnWJEJrI8xLXKBjyRGtZ3
 KQyzVzFOZPbbs3BCay/FkH5LJD2QzhlNlfYq3CF6azGtnD0IdnvEo2042Pyy6hk2BcDq
 vsT5trLoKW94gdvLJyyw9NzIMyLPEOn1t9qI1fIEs0BKWiNnZGAAux4D5C/Lel+wPc8j
 Mo8haqFdd9N2v3zYPSs52W5SD8ba/N27C/MsVQIXS+wytfC7KIxXVXitzBIweesQD91B
 emqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=GidVpWtOgdh1MdJmqQ31diCsiIYL+x3ynRwwdRDWZ4I=;
 b=pjjkSSJQBn/omFmlRSqIY8BqrJP7xtxijcCFTVpgIvToYoIFiOHmnOM+aWMCc2FYKF
 R0fhyJXGjFpOTmJRBOlaei1g/yhk2m2VXDLlDXsVTJ4yefpCcJbPqgm03kg9Fzkysx2T
 DsbBqMRDnCAPEm+lucvscXndvExh655q/IPOWTmOXuv7GsXKsQtL8mSoWlhwA6VmF7IH
 d8ZImSIpId+tLiSmuQRuRMptkdDtaKELbZBlk/yyk7esCiopyADw010Prh48JVs1KA71
 lgUl2aXQ7otVwz78/LRqHhzVLakqggk+Va2Gx8nIzeMHqP9hJNp+Na4wmSjVO3pa3G9C
 ZSqA==
X-Gm-Message-State: APjAAAUTrSeIGJ3Es26xTgFvL+gt6s/KRZtAZV2zAPv+TFsSZqStg46u
 g+Z+5Vh0I0f3e87BSYcbo88=
X-Google-Smtp-Source: APXvYqynSqN7vgOSHKrN2zdo25WkKaEcjhBS0gaz95C8JDomUkLpk8/7aZyMrw8hSpL3sL/vv6+XiA==
X-Received: by 2002:a17:90a:5aa3:: with SMTP id
 n32mr2384540pji.97.1572306562137; 
 Mon, 28 Oct 2019 16:49:22 -0700 (PDT)
Received: from taoren-ubuntu-R90MNF91.thefacebook.com
 ([2620:10d:c090:200::2:c0c7])
 by smtp.gmail.com with ESMTPSA id d4sm597119pjs.9.2019.10.28.16.49.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Oct 2019 16:49:21 -0700 (PDT)
From: rentao.bupt@gmail.com
To: Guenter Roeck <linux@roeck-us.net>, Jean Delvare <jdelvare@suse.com>,
 Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org, taoren@fb.com
Subject: [PATCH 0/3] hwmon: (pmbus) add driver for BEL PFE1100 and PFE3000
Date: Mon, 28 Oct 2019 16:49:01 -0700
Message-Id: <20191028234904.12441-1-rentao.bupt@gmail.com>
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

There are total 3 patches:
  - patch #1 adds the initial version of bel-pfe driver which supports
    BEL PFE1100 power supply.
  - patch #2 adds BEL PFE3000 support into bel-pfe driver.
  - patch #3 adds documentation for PFE1100 and PFE3000 chips.

The driver has been tested on Facebook Wedge40 BMC (with PFE1100) and
Facebook CMM BMC (with PFE3000).

Tao Ren (3):
  hwmon: (pmbus) add BEL PFE1100 power supply driver
  hwmon: (pmbus) add BEL PFE3000 power supply driver
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

