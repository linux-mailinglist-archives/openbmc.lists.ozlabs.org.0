Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D295B173D9
	for <lists+openbmc@lfdr.de>; Wed,  8 May 2019 10:30:32 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44zV6G239SzDqFL
	for <lists+openbmc@lfdr.de>; Wed,  8 May 2019 18:30:30 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::844; helo=mail-qt1-x844.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="D8DdWHca"; 
 dkim-atps=neutral
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44zV5N6sxCzDqBY
 for <openbmc@lists.ozlabs.org>; Wed,  8 May 2019 18:29:44 +1000 (AEST)
Received: by mail-qt1-x844.google.com with SMTP id d13so864520qth.5
 for <openbmc@lists.ozlabs.org>; Wed, 08 May 2019 01:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=8LNwhjHkGi8U2N9/szs++gQ+NQfEG2a5l9K0H/X9Juo=;
 b=D8DdWHcablHi0TwmJbxKbm4PWzhk3RFilr1eazYuOAu/5H10E63dm+8+79ehKQzFtc
 Xq7lIfwUsv/4e4vpLIyqDHg3RpIP4TWSkWnMNxMoC4qkgjS+sHJje9QJaGYp2fUMkaj6
 2S+dRyxAaUSElKZbggWJho6b64WWAn/E37ciY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=8LNwhjHkGi8U2N9/szs++gQ+NQfEG2a5l9K0H/X9Juo=;
 b=k6hk0YxZ9oSFz4df9O+Z1ScXcx1f3fZGuWTFElxba4KRxjOV/yZ5/fDqLT02gIpGNJ
 RJ2LFei2Ajo9KL8RaCUr0K7rQ8WBv6RwWzo0vaOHYurlwnKKaOR1vlGQ6sUR/lYLC7ZD
 GqivUPcx0VH0SkokJoz8I/HrUcFhJjPghGgA+FcSnHr5YaNw+zWHHWfwsUtqdxF2NvNK
 +99/G9+301+9VqeURmJWHIH/HeX2KCTcOja1L5G0R5a/dmgzvIv9Eu02SaFaWmYzjn8K
 mOxMCJFU4rJWXhmjiz3cGuv33ZTWlOfYkCgRuhG1rBNUGSY+aLl26SBhpPyPsdtg652B
 rC9Q==
X-Gm-Message-State: APjAAAUuaWQuCLcxQrkt3Y1/7Zc2xvXs93iVz0iShUz0MNlqqduakBRj
 CK4I2SOb9EGAFcGm8JtZjbPAI+MC5S+Z6G8KqhrwE5RC2f0=
X-Google-Smtp-Source: APXvYqxkXzQeXQmRitfa4mp1Ff9a69WazJkpfQhG1Qvkt3lJMWuQrJf0YFnnEulBKDh9k8DmfYwn57w/e71hDOWDUC8=
X-Received: by 2002:ac8:5352:: with SMTP id d18mr17489762qto.284.1557304179730; 
 Wed, 08 May 2019 01:29:39 -0700 (PDT)
MIME-Version: 1.0
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 8 May 2019 08:29:27 +0000
Message-ID: <CACPK8XeSFx7LUKch3Vy+OVKaV=3P4UVWOXBkUF0WO3iKx47NVw@mail.gmail.com>
Subject: Moving kernel to 5.1
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
Cc: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
 Tomer Maimon <tomer.maimon@nuvoton.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello OpenBMC developers,

Linux 5.1 was tagged a few days ago. I've rebased the openbmc tree on
this release and pushed a dev-5.1 branch to github.

Please take a look at the bump commit, give it a spin on your
hardware, and +1 if it looks good to you:

 https://gerrit.openbmc-project.xyz/c/openbmc/meta-aspeed/+/21212
 https://gerrit.openbmc-project.xyz/c/openbmc/meta-nuvoton/+/21287

I've had a look at the patches we're carrying in the tree. The numbers
on the left is the patch count, and the number on the right is the
number of openbmc kernel tree rebases the patch has survived. Note
that three or more rebases should be considered bad, and should have
someone assigned to help move the code upstream.

$ git log v5.1..dev-5.1 | grep OpenBMC-Staging | sort | uniq -c

      3     OpenBMC-Staging-Count: 1
     46     OpenBMC-Staging-Count: 2

These commits include the fixes recently made to the aspeed-video
driver, device tree updates, and config changes.

     27     OpenBMC-Staging-Count: 3

There are two main components here:

 * PECI. Jae said that he is re-working the series to use configs, so
there is some more work to do before submitting upstream.

 * nuvoton drivers: I haven't had an update from our Nuvoton team.
There are the ethernet mac, i2c, pci mailbox, bios post code and
spi-nor drivers.

      2     OpenBMC-Staging-Count: 4
      3     OpenBMC-Staging-Count: 5
     10     OpenBMC-Staging-Count: 6
     11     OpenBMC-Staging-Count: 7

These patches are quite old. They include:

 *  maxim fan controller: this driver has some hacks to work around
bad i2c behavior, as well as some device tree bindings that were not
accepted upstream. Andrew J has plans to work on this.

 * aspeed spi-nor driver: upstream has asked us to re-write using the
spi-mem framework. Cedric plans to work on this when he has time.

 * DPS310 temp sensor: this driver needed pressure sensor support
before upstream would take it. Eddie is working on that now, with v1
on the lists.

 * aspeed mbox: the openpower machines have stopped using this device.
We will drop the driver from the tree in the 5.2 timeframe

Cheers,

Joel
