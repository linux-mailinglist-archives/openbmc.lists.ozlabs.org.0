Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE93735975D
	for <lists+openbmc@lfdr.de>; Fri,  9 Apr 2021 10:14:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FGrWQ5gnFz30RJ
	for <lists+openbmc@lfdr.de>; Fri,  9 Apr 2021 18:14:10 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=212.227.126.187; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FGrWC02qJz2yyF;
 Fri,  9 Apr 2021 18:13:58 +1000 (AEST)
Received: from mail-oi1-f178.google.com ([209.85.167.178]) by
 mrelayeu.kundenserver.de (mreue010 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MryGj-1lsKvv17Zd-00nvoY; Fri, 09 Apr 2021 10:13:54 +0200
Received: by mail-oi1-f178.google.com with SMTP id k18so71235oik.1;
 Fri, 09 Apr 2021 01:13:53 -0700 (PDT)
X-Gm-Message-State: AOAM531U6SAcgib6HdwNJFEpF4DZIi2hrX6Nd1DNkpSztcKnTZfBkKio
 3mBZAyiT6Z5I2Mg3Aze6K17rgQTklLk+5TzOEtA=
X-Google-Smtp-Source: ABdhPJzFdzRK0Fr9sttYZU00DkmHPob2Ue763VfCmKuqxE8AuUxCM9nJfgP3QwCQkKhUcqhD2rg86m1268AEXjhhEyo=
X-Received: by 2002:aca:5945:: with SMTP id n66mr8949399oib.11.1617956032510; 
 Fri, 09 Apr 2021 01:13:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210319061952.145040-1-andrew@aj.id.au>
 <2db77e16-3f44-4c02-a7ba-a4fac8141ae3@www.fastmail.com>
 <20210408121441.GG7166@minyard.net>
 <6ff29d26-543a-4790-abb4-ebaa3f8d0265@www.fastmail.com>
 <CACPK8Xc5HC7TZ6cUDH6+uHQO1LQCZE0YeENua1sE8nDXs0R2mg@mail.gmail.com>
In-Reply-To: <CACPK8Xc5HC7TZ6cUDH6+uHQO1LQCZE0YeENua1sE8nDXs0R2mg@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 9 Apr 2021 10:13:36 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2ch82=QccNZboa-e1tVaotyJfGFTfqDuQCO0xPVitXgA@mail.gmail.com>
Message-ID: <CAK8P3a2ch82=QccNZboa-e1tVaotyJfGFTfqDuQCO0xPVitXgA@mail.gmail.com>
Subject: Re: [PATCH v2 00/21] ipmi: Allow raw access to KCS devices
To: Joel Stanley <joel@jms.id.au>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:pfd9iRJELPFr4Ish0FIhD5lvPolXLcOH3jSnT4Sueoj5e0qKtB1
 jTkIsy2tX7VWKDnJ8MUpsQmwPN1RgQSXuMx1J+JQB4LyjEGu+u4jENo5S1QikavSLR1YgMN
 /dTZckNeb3fIx1RQTDLAsMOZZICYWXezGEQ0JFCtC+k09n3vjRiN0nO/h+rNGjp121QHN8i
 L99UlYMrFnQZ3MjtOSQeA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:0vNlUMSNDwo=:VcOjllLvlL2TU7gKPUyZY8
 IGTTaMAQu6l7e5uyFHmAR2RlfuwRJOINZpHO43rHr7yzUjxUJfJK3H+Qixc1d90gDTEdMGKVG
 O6BiQXVW+ytXMaNxxOWBAypuvxWs1UwNhjl81svj1WCtawIv59Cgfb5WMROK50y5Hve1t4sXX
 3k5BShg6Uq0ItdcVPR8I4glcUI6jHnsixUzVgoSG0nFO+osZGRdlr4D2wj0jUFn0Pm+obnAHu
 hwAiIPC3RhrvxmEkGxkuT4lr8h2Cr97LICapXSm7JrjcwvgkoBNAXA7JV4eeuB6g9dCLe0zSo
 Dy7HY/RZ4u7n9C0W4S9SfbzZTOeKMrTxq6XWbaMky9glLmoorvcCWYos0vleseips3B1dqi/M
 /HRCj4YLiDaGuwzz+GN/EKU8CM4AOdPH1nx528ac8wCZZkOCPN5IShBnrVqnupcqbC4gjfHg2
 1Ijr6OYJrIMSJKykHxJV7kTxu6iW2MxlD/J0fvnATEe1dCQcFj+ESVccyehAmmyk3m5d1hAEK
 +8GvyaiMeaANY98rWZ1NCD+LVvEiDdAz4oz1nxshQy+vNraCSMFNQ3cRwGeqpP/DY7PZfEMTr
 2rkIYH5P5OfyBljel1mi4sRCLKst4FS1yz
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
Cc: devicetree <devicetree@vger.kernel.org>, "Chia-Wei,
 Wang" <chiawei_wang@aspeedtech.com>, Ryan Chen <ryan_chen@aspeedtech.com>,
 Tomer Maimon <tmaimon77@gmail.com>, Corey Minyard <minyard@acm.org>,
 Andrew Jeffery <andrew@aj.id.au>, Patrick Venture <venture@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Tali Perry <tali.perry1@gmail.com>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Avi Fishman <avifishman70@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 openipmi-developer@lists.sourceforge.net, Lee Jones <lee.jones@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Apr 9, 2021 at 6:09 AM Joel Stanley <joel@jms.id.au> wrote:
> On Thu, 8 Apr 2021 at 23:47, Andrew Jeffery <andrew@aj.id.au> wrote:
> > On Thu, 8 Apr 2021, at 21:44, Corey Minyard wrote:
> > > On Thu, Apr 08, 2021 at 10:27:46AM +0930, Andrew Jeffery wrote:
> > > There were some minor concerns that were unanswered, and there really
> > > was no review by others for many of the patches.
> >
> > Right; I was planning to clean up the minor concerns once I'd received
> > some more feedback. I could have done a better job of communicating
> > that :)
>
> I'll merge the first five through the aspeed tree this coming merge
> window. We have acks from the relevant maintainers.
>
> Arnd: would you prefer that this come as it's own pull request, or as
> part of the device tree branch?

When you are unsure, it's almost never wrong to go for a separate
branch, which gives you a chance to have a concise description
of the contents in the tag. This would be particularly helpful if there
are incompatible changes to the DT binding that require a justification.

If you are only adding a few DT nodes to existing files, then merging
these through the regular branch is probably easier.

       Arnd
