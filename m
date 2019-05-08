Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C39E7180D2
	for <lists+openbmc@lfdr.de>; Wed,  8 May 2019 22:08:12 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44znbG1LR3zDqGW
	for <lists+openbmc@lfdr.de>; Thu,  9 May 2019 06:08:10 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::442; helo=mail-pf1-x442.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="UvUJcPzf"; 
 dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44znZV65KCzDqGC
 for <openbmc@lists.ozlabs.org>; Thu,  9 May 2019 06:07:30 +1000 (AEST)
Received: by mail-pf1-x442.google.com with SMTP id g3so22456pfi.4
 for <openbmc@lists.ozlabs.org>; Wed, 08 May 2019 13:07:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RW8zH4c6NmZj3zfuue6cE/FmiI5MCeKg9ktwjeKkDh4=;
 b=UvUJcPzf+1H/tFKtN1yZHCKYdoc6AZMoyj2K10x54G3+Bah8iM3skZLzGsgnlLsWPy
 yADHgUrMfrBCxm9MnhlQubwISNvV/uG9XGxvRCTiOrtNxS9T+RKqkTnBQrIxt8Z+jNw1
 qBJz3sBiUWiV4/qIeQxGjpp6IJlcQ5u9YSQ8NwYGM4MNy0HWG162ag3IIsa5Z8dcWXgC
 uXwXzQNk/r70FRKMHMSd9ks/JD14TW6XmS5BuZHYulU3Mo9jdgGB2U7xWEJ+mmZnOOk8
 YsCgB7oLwK/rP/7IlNG4Fnf/Kn68+coiVoq8fBmfmLAbwPJs4LqQzQ9xLEE5i9uV5fwq
 Wg8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RW8zH4c6NmZj3zfuue6cE/FmiI5MCeKg9ktwjeKkDh4=;
 b=AXkfHd2xK5XUNBpUAqFcVfaOe/tYarsNRMQ+Swi/O849clbD5VD7va2StC5tnWtWYE
 uov216O+AbKU7cHDnKb9aGKGbWun61TkYaWLyNuoFLHwWrUzZIHFsv58OhlcYibHB4pC
 Vk7Yrsc7QUk2O9tvXVyitoj3oaSTolH0cE4Xjf1gmtWQPmEfj+u5sTGprADOOoWLHJss
 0XVzl0qLXtMgmR5Kq3DXezdKQjp1tzkF9uYQ4Y7pftoLxm2t41xxT7a8wlU/8PHwwqit
 eUT83UDaKOgu7r4Lf2h5RtSCpbW2R+xvnfbbmMGKuzumvwNA0IwjychpTaFoixFBYJ+6
 AalA==
X-Gm-Message-State: APjAAAWCFbAVn9tBB0TZRdbMAvlOOe+kQi57/8WsiL2vxO5y47bKY4JF
 JYy07LNsS4xj3XvNuC9iI0C2JVIYM4x0W5ZWIjs6Jw==
X-Google-Smtp-Source: APXvYqz+pJNPtEq56Bvj2nEGJ36cNCulFNx5PGwA7PsoHK+9D5sNzrlPtd3xRCQFzcGHxFhc03W0OhdwEeffHjyD54k=
X-Received: by 2002:a65:654c:: with SMTP id a12mr49922449pgw.101.1557346046259; 
 Wed, 08 May 2019 13:07:26 -0700 (PDT)
MIME-Version: 1.0
References: <CACPK8XeSFx7LUKch3Vy+OVKaV=3P4UVWOXBkUF0WO3iKx47NVw@mail.gmail.com>
In-Reply-To: <CACPK8XeSFx7LUKch3Vy+OVKaV=3P4UVWOXBkUF0WO3iKx47NVw@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Wed, 8 May 2019 13:07:15 -0700
Message-ID: <CAO=notzpukhdPckn_-KDpkSLQs+cbEmZK82YHGMD+Yt_0w22FQ@mail.gmail.com>
Subject: Re: Moving kernel to 5.1
To: Joel Stanley <joel@jms.id.au>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
 Tomer Maimon <tomer.maimon@nuvoton.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, May 8, 2019 at 1:30 AM Joel Stanley <joel@jms.id.au> wrote:
>
> Hello OpenBMC developers,
>
> Linux 5.1 was tagged a few days ago. I've rebased the openbmc tree on
> this release and pushed a dev-5.1 branch to github.
>
> Please take a look at the bump commit, give it a spin on your
> hardware, and +1 if it looks good to you:
>
>  https://gerrit.openbmc-project.xyz/c/openbmc/meta-aspeed/+/21212

Quanta-q71l-variation booted to userspace.

>  https://gerrit.openbmc-project.xyz/c/openbmc/meta-nuvoton/+/21287
>
> I've had a look at the patches we're carrying in the tree. The numbers
> on the left is the patch count, and the number on the right is the
> number of openbmc kernel tree rebases the patch has survived. Note
> that three or more rebases should be considered bad, and should have
> someone assigned to help move the code upstream.
>
> $ git log v5.1..dev-5.1 | grep OpenBMC-Staging | sort | uniq -c
>
>       3     OpenBMC-Staging-Count: 1
>      46     OpenBMC-Staging-Count: 2
>
> These commits include the fixes recently made to the aspeed-video
> driver, device tree updates, and config changes.
>
>      27     OpenBMC-Staging-Count: 3
>
> There are two main components here:
>
>  * PECI. Jae said that he is re-working the series to use configs, so
> there is some more work to do before submitting upstream.
>
>  * nuvoton drivers: I haven't had an update from our Nuvoton team.
> There are the ethernet mac, i2c, pci mailbox, bios post code and
> spi-nor drivers.
>
>       2     OpenBMC-Staging-Count: 4
>       3     OpenBMC-Staging-Count: 5
>      10     OpenBMC-Staging-Count: 6
>      11     OpenBMC-Staging-Count: 7
>
> These patches are quite old. They include:
>
>  *  maxim fan controller: this driver has some hacks to work around
> bad i2c behavior, as well as some device tree bindings that were not
> accepted upstream. Andrew J has plans to work on this.
>
>  * aspeed spi-nor driver: upstream has asked us to re-write using the
> spi-mem framework. Cedric plans to work on this when he has time.
>
>  * DPS310 temp sensor: this driver needed pressure sensor support
> before upstream would take it. Eddie is working on that now, with v1
> on the lists.
>
>  * aspeed mbox: the openpower machines have stopped using this device.
> We will drop the driver from the tree in the 5.2 timeframe
>
> Cheers,
>
> Joel
