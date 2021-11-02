Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D98ED442DA6
	for <lists+openbmc@lfdr.de>; Tue,  2 Nov 2021 13:15:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hk84P53zHz30J3
	for <lists+openbmc@lfdr.de>; Tue,  2 Nov 2021 23:15:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Oy4e08YQ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b2b;
 helo=mail-yb1-xb2b.google.com; envelope-from=lukas.bulwahn@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=Oy4e08YQ; dkim-atps=neutral
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com
 [IPv6:2607:f8b0:4864:20::b2b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hk84156THz2y0C
 for <openbmc@lists.ozlabs.org>; Tue,  2 Nov 2021 23:15:12 +1100 (AEDT)
Received: by mail-yb1-xb2b.google.com with SMTP id a129so39470427yba.10
 for <openbmc@lists.ozlabs.org>; Tue, 02 Nov 2021 05:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=H0Nynl9KYEos60TLF3kMyaTZRdbJ2IJWnWt8dmgsZ8o=;
 b=Oy4e08YQ+S5kroIaoipFHcseTK3NpOCo+MSIUrjmGs+88S/D2FVe1zsab/MobPaAsJ
 PQSblcw2EVBRG7rlaelIkp5D00fsyXAEz5c56YjBeOkuUcgFksHHayttv/PlUy02IcOw
 4nYDu8pQY0a/1NAAIM0hgPWQF9DdZl0/SwbFRVd+BQBVuUxAasx1nyiEcz9r94hfjt4X
 iSf84fPNvSvJrMBzzKbo04BZXEl5kI6YVUB2vTaEDy+Oc9rXn8V6WHlcLml1QSj6+70S
 GCa4ByRWzS8yR6FfDveQEFkp41ZSXZByjoP+diuB7jYpeUlZhqJDZQrUwxjxKLSg3zQX
 wD5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=H0Nynl9KYEos60TLF3kMyaTZRdbJ2IJWnWt8dmgsZ8o=;
 b=XxocDrEsu9sUPsmgubZMoeNqX7hrAMjDl7LqAH+tkfVwD8/QigRjCYbF820jVwpM5H
 o6BYV3X3VOKNE/X3IUjcj/9WaYvAYzghaMQuqWzhRuV21+TAdY1f+/xx1GOEec+Nn+Jq
 KkBodJuYbOWWIoZ6E5sFuDgSpxw9nr4BkTUi1+GPQfYOZe8a7DxedVQ22akEyxkwra5c
 q7PqAxubctJuhRK19AOymhLj61+UMR22OOkiKLm2kcSR2Wul1j2BkAoDgCjwlOWE1XHe
 ReBM3kO7dkzovDnk8lB1mphauT63AaiFeRpaUOz0yc3ACSXU+giTAmgwLt072jRltJJo
 ivLQ==
X-Gm-Message-State: AOAM530U5e/pdqqHyTnFxKZmqXOwtqt+EVPE5z791ARyESM2My+4Qe9X
 0mCNuMIF6ZO17DLR8P01jZ40ZOurD4dFkMw82ds=
X-Google-Smtp-Source: ABdhPJxLjg53nX46gv9ag9zyfyZJr3b9fP3tgKwpwWhIuIrPOLIV5FCJQF8aI+BgAh5o6cQY+rn/rGbzr6eUr7UoMbk=
X-Received: by 2002:a25:71c3:: with SMTP id
 m186mr37252318ybc.434.1635855309301; 
 Tue, 02 Nov 2021 05:15:09 -0700 (PDT)
MIME-Version: 1.0
References: <20211028141938.3530-1-lukas.bulwahn@gmail.com>
 <20211028141938.3530-12-lukas.bulwahn@gmail.com>
 <CAK8P3a0Nq9hLbGiPCQTjVTiGFPR9-tdhN8Tf06Q=cWTgMK78yw@mail.gmail.com>
 <CACPK8XfiN5qziPHLU6J=bC34mcjz+ix7jjSX=xk9zsr7+vyTdw@mail.gmail.com>
 <CAKXUXMyrhrM2o-OEW_qTTKjfKgxt-Z6Nt69geU80AoFnM1OuMA@mail.gmail.com>
 <CAK8P3a2N3zNkGzXQD8Pbs-8pDL7mv6rneJop-C_p_+d7-_sNqA@mail.gmail.com>
In-Reply-To: <CAK8P3a2N3zNkGzXQD8Pbs-8pDL7mv6rneJop-C_p_+d7-_sNqA@mail.gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Tue, 2 Nov 2021 13:14:58 +0100
Message-ID: <CAKXUXMzeTE11Qfces6sHLb7F_0sSSCOr91aivZmnqCS4cZM-VQ@mail.gmail.com>
Subject: Re: [PATCH 11/13] arm: npcm: drop selecting non-existing
 ARM_ERRATA_794072
To: Arnd Bergmann <arnd@arndb.de>
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
Cc: Tomer Maimon <tmaimon77@gmail.com>,
 kernel-janitors <kernel-janitors@vger.kernel.org>,
 Tali Perry <tali.perry1@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Benjamin Fair <benjaminfair@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Russell King <linux@armlinux.org.uk>, Sekhar Nori <nsekhar@ti.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Krzysztof Halasa <khalasa@piap.pl>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>,
 Linus Walleij <linusw@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Dinh Nguyen <dinguyen@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Imre Kaloz <kaloz@openwrt.org>, Shawn Guo <shawnguo@kernel.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Nov 2, 2021 at 9:11 AM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Tue, Nov 2, 2021 at 8:31 AM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
> > On Fri, Oct 29, 2021 at 8:36 AM Joel Stanley <joel@jms.id.au> wrote:
> > > On Thu, 28 Oct 2021 at 14:57, Arnd Bergmann <arnd@arndb.de> wrote:
> > > > On Thu, Oct 28, 2021 at 4:19 PM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
> > > https://lore.kernel.org/all/6be32e0b5b454ed7b609317266a8e798@BLUPR03MB358.namprd03.prod.outlook.com/
> > >
> > > It looks like it's the same workaround as ARM_ERRATA_742230, which the
> > > kernel does implement.
> > >
> > > It would be good to hear from the Nuvoton people, or an Arm person.
> >
> > I will happily update the patch to select ARM_ERRATA_742230 instead of
> > the dead non-existing ARM_ERRATA_794072.
> >
> > In contrast to the current patch that basically only cleans up "dead
> > config" and has no effective functional change, the new patch would
> > change the behaviour. I cannot test this patch (beyond some basic
> > compile test) on the hardware; so, we certainly need someone to have
> > that hardware, knows how to test it or confirm otherwise that we
> > should select the ARM_ERRATA_742230 fix for this hardware.
> >
> > The current patch should be subsumed by the new patch; the submission
> > of the new patch is deferred until that person shows up. Let's see.
>
> I'd prefer to leave the broken Kconfig symbol in place as a reminder until it
> gets fixed properly then.
>

Agree, this patch here should not be integrated. I rather expect that
Avi or others at Nuvoton will provide a proper patch to act
appropriately for the ARM_ERRATA_794072, or after proper analysis can
determine that there is no change in the kernel required.

Lukas
