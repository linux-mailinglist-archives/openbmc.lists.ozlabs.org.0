Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 486D41AEE8
	for <lists+openbmc@lfdr.de>; Mon, 13 May 2019 04:27:50 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 452PqR6HpxzDqHJ
	for <lists+openbmc@lfdr.de>; Mon, 13 May 2019 12:27:47 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::842; helo=mail-qt1-x842.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="XZChTrFb"; 
 dkim-atps=neutral
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 452PpF2L6qzDqDN
 for <openbmc@lists.ozlabs.org>; Mon, 13 May 2019 12:26:44 +1000 (AEST)
Received: by mail-qt1-x842.google.com with SMTP id j53so13006451qta.9
 for <openbmc@lists.ozlabs.org>; Sun, 12 May 2019 19:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=l2puY/T7+sHO7XfHX1OrmXbx38CaMngxe+9c75yNOcg=;
 b=XZChTrFb9n/+ouZmItx1vH8rSMERIyH9zv1xm/VDin+c6bKIZ+k6GBqf+sPgFwn8Ws
 zj8Z7JOdP3qrlYsUuz3dqDsyU/0UkhftaEfD+y08pvonn5Yhv4epatnoR7LS4focnTYa
 cDVrWOFOQTwiMo1POfif4Mouby5iwtx/RFgT4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=l2puY/T7+sHO7XfHX1OrmXbx38CaMngxe+9c75yNOcg=;
 b=nTrzT/IWjjXKJvKFDaOFQY++i8kDwEVtfO83/b/5ut6/3fIOdM3i7Gw/jHcRTqCLdg
 i100prz0/dj8zSRiq0agzy6FzRCWYlF0yus6AEASa6mja1w7tQuxgmJKz9UjYQrS5ugd
 9mdn310nSL2SO3+hpsde3Yl+qXeNVDQuTIilktOO8cM8d6z94Vd9oqVx9AseHX9N1l0D
 uh9i7GBohzqRP6+eZH3IJ9kzBjqO+CVVsZwbrl90ezu/4jW4dzD2dsZirl+bC++ZHiir
 +YsbCb7ythyWW6V7zkoibXObpwp9GWihf6XKtiu1g/aa9V1AfY7ALApLBEbU7pgR0+ca
 B2wA==
X-Gm-Message-State: APjAAAWe0Oc5wrn/jp8ZYkFM+6WSNCJBkHY4cC6Kyxc6ktkAgkCuk9JX
 0rneoJrq+3PEmpLqvDXVjFys4WnClJlRqAgLr40=
X-Google-Smtp-Source: APXvYqwUV9BGlIJE/QR+hMjxIERPtgbK6Noh14/cggq6pI8/A3OIxQlhIk24lgl8thzY6UEq2JHakzZvgh0IIox8/1M=
X-Received: by 2002:ac8:45da:: with SMTP id e26mr12349186qto.235.1557714400879; 
 Sun, 12 May 2019 19:26:40 -0700 (PDT)
MIME-Version: 1.0
References: <CACPK8XeSFx7LUKch3Vy+OVKaV=3P4UVWOXBkUF0WO3iKx47NVw@mail.gmail.com>
 <9a1adf03-ee54-0674-54bc-d5c37a9ae516@linux.intel.com>
 <CACPK8XfQVySsmzUGLenPA5cM2AdCfgTzf1hO2cbqg1_D62tK8w@mail.gmail.com>
 <b211f8797d984e45bc50f65547863a39@NTILML02.nuvoton.com>
In-Reply-To: <b211f8797d984e45bc50f65547863a39@NTILML02.nuvoton.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 13 May 2019 02:26:28 +0000
Message-ID: <CACPK8XcxAYs8e_kq6XHBVYm69U6Hh4Qy6CEaLsKK7yxu63MvHQ@mail.gmail.com>
Subject: Re: Moving kernel to 5.1
To: Tomer Maimon <tomer.maimon@nuvoton.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Sun, 12 May 2019 at 17:19, <tomer.maimon@nuvoton.com> wrote:
>
> Hi Joel,
>
> Sorry for the late reply, we were on holiday.
>
> We had checked dev-5.1 on Nuvoton NPCM750 EVB and it looks fine.
> There is a minor change that need to done in the spi node in the dts file.

Thanks for testing!

> About Nuvoton drivers:
> 1. Ethernet mac (EMC) - on work, hopefully first upstream version will sent soon.
> 2. I2C - on upstream process, the maintainer have not send feedback yet.
> 3. PCI mailbox - cannot upstream, it the same reason as Aspeed.
> 4. BIOS post code - on upstream process, the maintainer have not send feedback yet.
> 5. SPI-NOR - hopefully first upstream version to SPI will sent soon.

Thanks, it's great to have an update.

We should decide what to do about the mailbox drivers. Did you get
told that it needs to use the in-kernel mailbox API?
