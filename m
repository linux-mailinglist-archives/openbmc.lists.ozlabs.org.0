Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B8140435AF
	for <lists+openbmc@lfdr.de>; Thu, 13 Jun 2019 13:50:45 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Phrg1nJ7zDrPC
	for <lists+openbmc@lfdr.de>; Thu, 13 Jun 2019 21:50:43 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=209.85.160.195; helo=mail-qt1-f195.google.com;
 envelope-from=arndbergmann@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arndb.de
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
 [209.85.160.195])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Phqx2pgxzDrNd;
 Thu, 13 Jun 2019 21:50:02 +1000 (AEST)
Received: by mail-qt1-f195.google.com with SMTP id i34so22104429qta.6;
 Thu, 13 Jun 2019 04:50:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=S6eReS1tzSjL5Z2a0z+5t8DdvrnPFO8rpSM4WEkGBlk=;
 b=aLei0yKUgqUMx84JAir4rM57iZCIzgPmxkobajdRCNjv6Vx3zFoEuK93Dvctoh3EVU
 +sh0v3pYQORgcxqgDFauu8WgXcKJQnT06wPu/NrMxoaQxoC94aWqUTNSNhm5oldtoNem
 in35u9feyY0ePm241it5/cDjoIHj162Wo7ahGLFOc9s+lgSfJTVPrZTvBe5/BEw39Ih8
 8sUIae9SgOPiDP6AtPa9D4BtVsWBVPN/BPB75pqWjH2rZboOVodn71RpjnRo+F3GolvT
 pYvNBktslgSceO0QTNVxvWdeJ5B/ISQWenDEYI930IN5OzVWpycWiO20mcwlUyHw6PAf
 7XTQ==
X-Gm-Message-State: APjAAAXnndHmMXzyiL/Nl6hDGS/H1wtEY7BuKsZKjY2MXXXfHjo6g03r
 B46KgPzy/gwsRAXC6/3jOeWEZd903gQUERwQufk=
X-Google-Smtp-Source: APXvYqwH48n1uy34j2P77tvT1tzglrEnNCLZoANqaBrKML2Z8FzldrXot4yLtYvQya5u4E0YiIHiaQJGI6TRVaEbsLI=
X-Received: by 2002:a0c:b758:: with SMTP id q24mr3141733qve.45.1560426599161; 
 Thu, 13 Jun 2019 04:49:59 -0700 (PDT)
MIME-Version: 1.0
References: <20190610133245.306812-1-tmaimon77@gmail.com>
 <20190610133245.306812-3-tmaimon77@gmail.com>
 <CAK8P3a0s1fdt2yHVjOXffeKPKkwUyJ7DKCZHHMKjx+3j300ZAQ@mail.gmail.com>
 <CAP6Zq1jZEUzbB-ZidF2SD24k8iC_uBkXZ9WbtPpOYNCRjRTz3g@mail.gmail.com>
In-Reply-To: <CAP6Zq1jZEUzbB-ZidF2SD24k8iC_uBkXZ9WbtPpOYNCRjRTz3g@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 13 Jun 2019 13:49:42 +0200
Message-ID: <CAK8P3a1YvBoehevVuRHMD71pkA1iDJLrfhvdhup2p+f-33HtzA@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] soc: nuvoton: add NPCM LPC BPC driver
To: Tomer Maimon <tmaimon77@gmail.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, DTML <devicetree@vger.kernel.org>,
 Benjamin Fair <benjaminfair@google.com>, linux-aspeed@lists.ozlabs.org,
 Andrew Jeffery <andrew@aj.id.au>, Patrick Venture <venture@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Avi Fishman <avifishman70@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 gregkh <gregkh@linuxfoundation.org>, Olof Johansson <olof@lixom.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Jun 13, 2019 at 11:18 AM Tomer Maimon <tmaimon77@gmail.com> wrote:
>
>
> Probably the only vendors that will use the snoop will be Nuvoton and Aspeed.
> is it worth to create new snoop common user interface for it,
> if we will develop a new snoop user interface who will be the maintainer?

One or more of you will have to volunteer to maintain the new subsystem.

There are lots of ways this can be structured, and once you have
a maintainer (team), they can decide how to do it, but I'm available
to come up with ideas here.

Generally speaking, you don't need a ton of abstraction. The
drivers/watchdog subsystem could serve as a template there.
This has both models, the old way in which each HW specific
driver uses its own chardev, and the new model in which the
common code sits in a library module, and individual drivers
register to it.

I think the amount of code for two drivers is roughly the same
in either model, but the shared user interface implementation
makes it easier to ensure that the interfaces are in fact
compatible.

The other thing your own framework can do is to provide some
consistency between BMC specific drivers for different
functionality.

>> Maybe we can introduce a drivers/bmc/ (or even drivers/openbmc)
>>
>> that collects all those user interfaces with a thin abstraction layer
>> and one or two hardware specific back-ends?
>
> Sounds good, Maybe we can move the KCS BMC from driver/char/ipmi to the drivers/bmc/?

Good idea. Yes, please.

       Arnd
