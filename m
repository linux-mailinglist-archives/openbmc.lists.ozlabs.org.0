Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D0922575EB
	for <lists+openbmc@lfdr.de>; Mon, 31 Aug 2020 10:58:31 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bg3yV2xJPzDqR0
	for <lists+openbmc@lfdr.de>; Mon, 31 Aug 2020 18:58:26 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::641;
 helo=mail-ej1-x641.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=VHcRW9VO; dkim-atps=neutral
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com
 [IPv6:2a00:1450:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bg3xg559zzDqNv
 for <openbmc@lists.ozlabs.org>; Mon, 31 Aug 2020 18:57:43 +1000 (AEST)
Received: by mail-ej1-x641.google.com with SMTP id d11so7370714ejt.13
 for <openbmc@lists.ozlabs.org>; Mon, 31 Aug 2020 01:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:from:date:message-id:subject:to;
 bh=zR8rf+bjGv03fmgEi6yu0vTJ5tajgy9RGi4RI72XmFg=;
 b=VHcRW9VOxEpyS7dHAPuj+3iZ91VS4rE4fPJJMfbSeRT9/3b7BjX/HHioFZwlvhaw3r
 8+4hn0QM+3s7UZObRSslX4oK2jb+nOCsjWh0MbuDnHOtpWe3+kY2GKJ/jF9OfEP88d6M
 p2UYsEWZH19nKntVWTOK7TFlnwvaK39oC/2N4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=zR8rf+bjGv03fmgEi6yu0vTJ5tajgy9RGi4RI72XmFg=;
 b=cgEly+mQidI7pCh3yO7C3wu+XS0V7td+Di1BXx/VcJ4o7kxPZN8xcgSIJ62MaXxkvm
 wzrsEvEfusplp1r5xWYNpHp+7js6/tHnEHuEpvLDAlDMIFXWLvLhaBUEvz1Zv+pVEaEG
 FdKDZizJqs68wo5tWzxZcuIhUl27BLsmAzjYfZNh1pBaok+I7Rp5Ygo8lMXv7+JQJ0rZ
 +ph9a6bS3BN94MTqcPVSE99iQMdCAZJDT1X7A1pjFJqKkFgqQKHoiAaKVopzH6+bFY/D
 ohSPz651Ih76LqOsTRFY8MgxOVArDf+Vg8wJQFcTa5FKKPQ1dsvVT40JnqQTWRbWhZuC
 lTxw==
X-Gm-Message-State: AOAM533k1S6D4BnPXWvZ84LzGIOe/szr+L/QcFIjhOkR7045DacQ1mwW
 PIBfYIAtZ62R52xiNLl4647Qqz/Z2ITFMZj1tPqkqoolNU0b9g==
X-Google-Smtp-Source: ABdhPJzaW4SjIVkgJsoR5BBR+ECquNmoDPxyh8ZWMFXHwTNoH0kdrIkqZmDW/b8CK7owF9ans+nCpfTbH5uiWRBN/Uc=
X-Received: by 2002:a17:906:4c58:: with SMTP id
 d24mr209771ejw.108.1598864259184; 
 Mon, 31 Aug 2020 01:57:39 -0700 (PDT)
MIME-Version: 1.0
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 31 Aug 2020 08:57:27 +0000
Message-ID: <CACPK8XddFvszC1daDKTtqwkE-XDfB7uYFP_H4HZXNUxvNHUaqw@mail.gmail.com>
Subject: PECI patchset status
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello OpenBMCers,

The PECI patchset has been carried in the openbmc tree in some form
since it was first posted in December 2017.

It has not made it upstream in that time, placing the maintenance
burden on me as the kernel maintainer. Generally this isn't a large
amount of work, although in some cases it has held up releasing kernel
branches. Today I noticed that the icotl number it chose has been
claimed by a different ioctl in linux-next, meaning we are guaranteed
to have future kernel/userspace incompatibility.

OpenBMC has strong rules about upstreaming kernel patches, and in
particular userspace facing code, to avoid this issue.

Given the lack of progress I propose dropping it from the OpenBMC
kernel tree until it is merged upstream. This would necessitate
removing tiogapass from the OpenBMC CI, as it relies on PECI support
in the kernel to build.

If you have an interest in the patchset staying in openbmc, we would
need someone (or a team) to take the patchset (v11 is the latest[1])
and submit for inclusion in the mainline kernel, including an entry in
MAINTAINERS to commit to future maintenance. Now is the perfect time
to submit for inclusion in 5.10.

[1] https://lore.kernel.org/linux-hwmon/20191211194624.2872-1-jae.hyun.yoo@linux.intel.com/

Cheers,

Joel
