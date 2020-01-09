Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C6678136316
	for <lists+openbmc@lfdr.de>; Thu,  9 Jan 2020 23:11:17 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47v0gk2sF6zDqbY
	for <lists+openbmc@lfdr.de>; Fri, 10 Jan 2020 09:11:14 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::836;
 helo=mail-qt1-x836.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=I2c0WEYV; dkim-atps=neutral
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com
 [IPv6:2607:f8b0:4864:20::836])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47v0dX6ztPzDqcw
 for <openbmc@lists.ozlabs.org>; Fri, 10 Jan 2020 09:09:20 +1100 (AEDT)
Received: by mail-qt1-x836.google.com with SMTP id g1so157716qtr.13
 for <openbmc@lists.ozlabs.org>; Thu, 09 Jan 2020 14:09:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aRU7AcZNfozJqFv2d84Wfp0y42dP1PzqpV1vyjK6GGY=;
 b=I2c0WEYVQ/q4BIK9KxNXKLmbU1Vr4FJIRg3JXvSmYH3f+sNmLvMIUPvRal0xMJ0dMs
 hvp5zfYGQIkyJWo5eEsKF+vAe056H8solpZAyAGEGOg21Rl5J/QIB5ANtoUoIsMY7d4A
 iEU0D6nexyYJixM4FIxmOkiwGBm2x4SJjPuXg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aRU7AcZNfozJqFv2d84Wfp0y42dP1PzqpV1vyjK6GGY=;
 b=AyfYqmqAm2kcjqPUjfR582HjD/ZF7z9bBY6ZrMoF6U9XPj6SLtzrczR/JJwhTBRhxN
 enlhBW8XwR9A+X6XK2UUcFK5EuVgkCMT7Glx2trIYgJnGrkh3nujtGcDBaVqF9WWrkUx
 VQrLuvvHbTJJHrbQfiWY2hR49oh4ZHHbpTiiSYHrSeFza2zF6sHLGqhzTiotffQsRq8B
 75NBgA8qBAXSobl0j8OlrDMlzArXU/1fYXoYE6M6BQso8Lv2+nbHEoOfXfk11D/zqD4t
 ma+W3AxnEU40NSsU8lGEsXu/1jK00Q1OBUEWfVmvuueUvyXyl/CcUWEIDwz4ED8m9kmW
 yZKQ==
X-Gm-Message-State: APjAAAX08LLzry98MdhX4H7O+O3vsG10LTtJ+2Ym1TMGci3O1HjmdQQE
 UntZtiX+CTS2ivjAeDuPXdikCajUaIyc9PfM4xE=
X-Google-Smtp-Source: APXvYqwspgKty3xOuBNwdDS6b9odLceAz4FSM56rSH5po9p3T8eV616nFSIwXRh+EG3EJUQPd19WJORGm6i/Z2iViuM=
X-Received: by 2002:ac8:4151:: with SMTP id e17mr10029927qtm.234.1578607754332; 
 Thu, 09 Jan 2020 14:09:14 -0800 (PST)
MIME-Version: 1.0
References: <MWHPR15MB154906E39EEC026958D2EB42A8390@MWHPR15MB1549.namprd15.prod.outlook.com>
In-Reply-To: <MWHPR15MB154906E39EEC026958D2EB42A8390@MWHPR15MB1549.namprd15.prod.outlook.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 9 Jan 2020 22:09:02 +0000
Message-ID: <CACPK8XejhEWROY_CKCDDytnq-Po6Mr8h2zrNt5CDRhsCvoaVqg@mail.gmail.com>
Subject: Re: U-Boot upstream, patch and maintain model and plan for OpenBMC
To: Dan Zhang <zhdaniel@fb.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Dan,

On Thu, 9 Jan 2020 at 21:51, Dan Zhang <zhdaniel@fb.com> wrote:
>
> I am writing to see how can I align and contribute to the U-Boot development for OpenBMC.

Great to hear from you again. I know we spoke about this at OSFC,
apologies for not finding time to chat since then.

> OpenBMC supported platforms ( IBM witherspoon: tacoma and rainier) are using new Aspeed SDK (https://github.com/AspeedTech-BMC/u-boot/tree/aspeed-dev-v2019.04).
> In my new project, I am planning to use this SDK also.
> I believe it will be benefit to align with and contribute to OpenBMC community regarding upstream, patch and maintain this new SDK.

Yes, that would be great.

> Thus, I have some open questions about OpenBMC communities' u-boot developing model and/or plan:
> 1. Will U-Boot also follow Kernel's developing model for OpenBMC?
> Kernel developing model ( my understanding )
> individual contributor actively aligned with OpenBMC about the kernel patch upstreaming plan and status,
> and OpenBMC kernel maintainers will pull-in and/or backports the accepted patches to all supported kernel versions.

I think this makes sense. Would you be happy following this model?

> All supported kernel versions will be maintained on corresponding branches in https://github.com/openbmc/linux  OpenBMC fork.
>
> 2. Will, eventually, u-boot code of OpenBMC be maintained in https://github.com/openbmc/u-boot OpenBMC fork? or kept in BSP/SDK vendor's u-boot fork?

Eventually, we hope to have all of our code upstream, and not require
an openbmc fork. While this is a work in progress I suggest we use
openbmc/u-boot, but work closely with the vendors to ensure fixes and
new features are sent upstream and applied to the openbmc tree.

I have spent some time working on a patchset suitable for upstream
that supports the ast2600. It contains support for:

 - dram training
 - clocking/reset
 - pinmux
 - gpio
 - ftgmac100 with phy

I am still working on:

 - ncsi: I see broadcast traffic. Debugging why the NIC does not
respond to NCSI packets
 - spi-nor: patches from Cedric, but I have not integrated them into my tree

We have mmc support upstream. I have not tested this yet.

I will publish this tree in the coming days, and send it to the u-boot
lists for review. As long as testing goes well, we will switch to that
for the ast2600 platforms in OpenBMC.

I propose we support the ast2500 platforms with the same tree.

I would ask that someone step forward to add ast2400 support, and in
the mean time it will use the existing tree.

How does this plan sound to you? Is there an area you would like to
take ownership of?

Cheers,

Joel
