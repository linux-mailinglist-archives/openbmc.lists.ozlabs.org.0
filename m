Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7D8F359781
	for <lists+openbmc@lfdr.de>; Fri,  9 Apr 2021 10:17:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FGrbn4v49z3btp
	for <lists+openbmc@lfdr.de>; Fri,  9 Apr 2021 18:17:57 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=217.72.192.75; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
X-Greylist: delayed 462 seconds by postgrey-1.36 at boromir;
 Fri, 09 Apr 2021 18:17:48 AEST
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FGrbc3KzMz2yRh
 for <openbmc@lists.ozlabs.org>; Fri,  9 Apr 2021 18:17:47 +1000 (AEST)
Received: from mail-oi1-f172.google.com ([209.85.167.172]) by
 mrelayeu.kundenserver.de (mreue106 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MD9Gh-1lMHo53kAL-009A5s for <openbmc@lists.ozlabs.org>; Fri, 09 Apr 2021
 10:04:53 +0200
Received: by mail-oi1-f172.google.com with SMTP id w70so5021913oie.0
 for <openbmc@lists.ozlabs.org>; Fri, 09 Apr 2021 01:04:51 -0700 (PDT)
X-Gm-Message-State: AOAM531v0K/AnsriHlbNU2MX9B7LQJKYA0S+W1/cEBWrdXTHGv474rAr
 iXRQkOY4hT1OsbDnffe6HCkPoo5rScTFjVzhi/Q=
X-Google-Smtp-Source: ABdhPJw1wO5JX6zgBX4BsEiKPFIsDx6YR60lpWDniVPRNgV9yzXLXThF/0H0/g/gIDeI3dzcgbPsffottKejMu0nxec=
X-Received: by 2002:aca:5945:: with SMTP id n66mr8928933oib.11.1617955490914; 
 Fri, 09 Apr 2021 01:04:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210406120921.2484986-1-j.neuschaefer@gmx.net>
 <CAK8P3a0VfnUucvZNkA9PdxrWiYUOkisV00v-375PmgQYp4aXoQ@mail.gmail.com>
 <YGzZofPvT80b5gS5@latitude>
 <CACPK8XdbwbsbJuZmvsFqJ+x5viu652vpfR1kwB4Gu+khRHNt_g@mail.gmail.com>
 <YHAI+x4OXBKvJkUH@latitude>
In-Reply-To: <YHAI+x4OXBKvJkUH@latitude>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 9 Apr 2021 10:04:34 +0200
X-Gmail-Original-Message-ID: <CAK8P3a18ySEmCzkdD-GmQSPFUza_TK3OBPk0Grbz_aFW72+g7g@mail.gmail.com>
Message-ID: <CAK8P3a18ySEmCzkdD-GmQSPFUza_TK3OBPk0Grbz_aFW72+g7g@mail.gmail.com>
Subject: Re: [PATCH v2 00/10] Initial support for Nuvoton WPCM450 BMC SoC
To: =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:3Hz9XeeLHeONfoPQwHUFUktDImNrl/Yr/KE+dZxVv5hMgWreorn
 z5MDN/yLTD5LY7MwrUPM3v/XTJIyCdnfcuBgOzbVdsASFFSNVfOfVYAhytxwDwHqohALtrQ
 XCTcFdFe6u4Qu7v5/J8nfsw8NhPG9Jgpo5OKI2XkvVSbhaNxS4G88siQlJdP4VUryyj1ZW/
 BObVVXsaEa0big8nTfRWQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:qhqX0LbhLYI=:9piE5X2Y7NUGcFL9uaEvio
 hHVASgICtqJGdWxXWvtYWSNL6s1TGngnVA/e3ELR0p7fBWNNcklaaxix8JXl2+Kh63AEOtWZH
 vvqseLAQMlx32CEnA1fZIKGyAvQyXZNAbNNuXzg9h4JwAOwFRCIlCS+hN0SwtgYBjA0CNAqLc
 KNlC9nXa00KfICRDdwKAQzIyrJR2qcNiDqsH0bg5dkDwRRJbuxk5Rj3F1yMldak+xWxyrE3A0
 3quJ4zTELDg4E68Ah8IMIa5YSeOoxINpYbdjDXes02/BT5XbIHe5iGNNkxtNr0MDfZt6lgnhh
 JullqqU2cvQpW8v2GTxOYYZyjHbRHWxc9hahx6YoXRXmvAsPZ4CuTxGBpWg36PEID8O59q+T1
 IXy4ci5zKQVHq3nJ606EuicvNnSi1PXYIV07O5Vi0hIq8lVqFiHjhcAgLs9lTVp/JpxejQxTz
 vmpMPGC9pjuQdShfxTKirjEOsIwIkos=
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
Cc: DTML <devicetree@vger.kernel.org>, Tomer Maimon <tmaimon77@gmail.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Apr 9, 2021 at 9:58 AM Jonathan Neusch=C3=A4fer
<j.neuschaefer@gmx.net> wrote:
> On Fri, Apr 09, 2021 at 04:37:34AM +0000, Joel Stanley wrote:
> > On Tue, 6 Apr 2021 at 21:59, Jonathan Neusch=C3=A4fer <j.neuschaefer@gm=
x.net> wrote:
> > I've had a look at the series and it looks good to me:
> >
> > Reviewed-by: Joel Stanley <joel@jms.id.au>
> >
> > Nice work Jonathan.
> >
> > I'll put this in it's own branch along with the bindings change it
> > depends on and send a pull request to Arnd for v5.13.
>
> Thanks a bunch!
>
> A few patches are going through other branches (IRQ bindings+driver;
> watchdog bindings+driver probably, I guess). That leaves the following
> patches to go into your branch, AFAIUI:
>
> [PATCH v2 01/10] dt-bindings: vendor-prefixes: Add Supermicro
> [PATCH v2 02/10] dt-bindings: arm: npcm: Add nuvoton,wpcm450 compatible s=
tring
> [PATCH v2 05/10] ARM: npcm: Introduce Nuvoton WPCM450 SoC
> [PATCH v2 08/10] ARM: dts: Add devicetree for Nuvoton WPCM450 BMC chip
> [PATCH v2 09/10] ARM: dts: Add devicetree for Supermicro X9SCi-LN4F based=
 on WPCM450
> [PATCH v2 10/10] MAINTAINERS: Add entry for Nuvoton WPCM450

Actually for an initial merge, we sometimes just put all the patches into o=
ne
branch in the soc tree to avoid conflicts. Unfortunately we already have a
(trivial) conflict now anyway since I merged the irqchip driver for the App=
le
M1 SoC through the soc tree but the wpcm irqchip through the irqchip tree.

You did nothing wrong here, this would have just been a way to make the
initial merge a bit easier, and have a tree that is more easily bisectible
when one branch in the merge window contains all the code that is
needed for booting.

        Arnd
