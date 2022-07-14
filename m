Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A9AA57563E
	for <lists+openbmc@lfdr.de>; Thu, 14 Jul 2022 22:16:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LkQjW1sGlz3cFD
	for <lists+openbmc@lfdr.de>; Fri, 15 Jul 2022 06:15:59 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=arndb.de (client-ip=217.72.192.74; helo=mout.kundenserver.de; envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LkQj92RmMz3c30
	for <openbmc@lists.ozlabs.org>; Fri, 15 Jul 2022 06:15:39 +1000 (AEST)
Received: from mail-yb1-f181.google.com ([209.85.219.181]) by
 mrelayeu.kundenserver.de (mreue106 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MuDsZ-1nOvRD1lL3-00udGo; Thu, 14 Jul 2022 22:15:34 +0200
Received: by mail-yb1-f181.google.com with SMTP id n74so5162496yba.3;
        Thu, 14 Jul 2022 13:15:33 -0700 (PDT)
X-Gm-Message-State: AJIora8+QYJieU6LGkeH7hdRLB2g0ZLUXKG9wQcuy/i6sZrqP9v9l0qR
	dkncv4iv0P03/3G099KtYPtNf7J9DoOQv/Ym0cQ=
X-Google-Smtp-Source: AGRyM1ufLR1tXyfyrelM5ysCbbKNSHqOWqFASMdGq5/rYwOY4jOjwUqmCRVpkzIQCCqnubMWRWU8c8ZFrp1nxf+t2A0=
X-Received: by 2002:a05:6902:120f:b0:668:2228:9627 with SMTP id
 s15-20020a056902120f00b0066822289627mr11089451ybu.134.1657829732313; Thu, 14
 Jul 2022 13:15:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220707132054.GA10610@logan-ThinkPad-T14-Gen-1>
 <CAK8P3a0P2u+LdXcU7As=dfNbg_J2eWfhgB9TT1-xVyH0v6OM5Q@mail.gmail.com> <YtBazSo/uJzFeF+L@pdel-mbp>
In-Reply-To: <YtBazSo/uJzFeF+L@pdel-mbp>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 14 Jul 2022 22:15:15 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1juHV6N2QtXaEcobWs6kQHBqqUn9MynvobyJtFFyOsfg@mail.gmail.com>
Message-ID: <CAK8P3a1juHV6N2QtXaEcobWs6kQHBqqUn9MynvobyJtFFyOsfg@mail.gmail.com>
Subject: Re: [PATCH v3] The Yosemite V3.5 is a facebook multi-node server
 platform that host four OCP server. The BMC in the Yosemite V3.5 platform
 based on AST2600 SoC.
To: peter@pjd.dev
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:FftOzHHCUW8O8yw1KM7A3ogQUoHgKY1d0z/JuXqtMCEM2s894tn
 trNLC/3XXCktC1vc7aAiv02BGvt92FqyZJ8J6V6VSxhmEMJ3AQIRqFEohNTRWN6Z48sRIxo
 uPh3aSHSsTb4RH426wCJyQVTA4y+CPGanwV47xBwYpESk5gr0TTPSqM/LbXOUSPDkeLhZE6
 r7OTmyRJFdHE27D1r9IVg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:3q5CVYEEvnU=:SMnMoGwj/irHu4j78v9ny2
 +w2M9eBZ7Bo+6lSTR7MUeRIflNp9AdYsAo5TsSMapyZH9tiKnh1j3E3KTTx8ho1RVCg2GS7hg
 OzxAnYnWOZa0Tg5loigikdf2DIEvgRcyg1SBNM4Qh6L0l4PPb+1VDnl2hMmkGk85RUlcONpl2
 l+per7DnW4TwNH2r/NA0+buK5qTYBSJwlSYcKR9kQ0nE64TjfbAN0g/w3l0gBoPIQf7uMFZiD
 lQCFij/eHGXLrmZmItaG0rtUeWlivK70Fy9pWBv7bJJuEewrWPt78CGMaJwHrbfA2Osh+XoNt
 XBoVEfvCEfAN3gAEKSktQHDQF9HOGNHxyEtuxPB3rYIK1uApZMEyclv651J1Skr4P0k2azCY5
 x1C//xJuprUDDbXZkrME6n9Q7rTKee4DjlI6e33ATp+B67FFLFLHbKoJBOZ/0+WlRy2C5Jt4i
 pHLTZRnr2Immi36x81dUJtc3wpDjadQL05rXm4LxQdhaiF6oLUIz3HOah1sRTnVk5mo4ZXn3t
 9tX4Eta5Vicm5MY8dIMe5JTOOjINBifD1UL62vOIrK8QJlQ2kN9ut/F3VWnUxXaAdTnFQrqRn
 AFfXqJNhIlt4ROc1jskWHMvuViGu8M8Rs6tx3NDefGXEGBkd3YosBpnY+AThNw+SZDQC1Hqff
 e5gmQBKvedFiX9qGHMCr0c5uP+UoG00dHPP3qWhcVK2SeCoPo1SlY1KH/jWvx3Rh1wBFqrNi6
 495G/svM8BkzkGkwhuILIPeXUSHewPHwh3ikRw==
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
Cc: DTML <devicetree@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, linux-aspeed <linux-aspeed@lists.ozlabs.org>, Logananth Sundararaj <logananth13.hcl@gmail.com>, Andrew Jeffery <andrew@aj.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, naveen.mosess@hcl.com, thangavel.k@hcl.com, SoC Team <soc@kernel.org>, Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Olof Johansson <olof@lixom.net>, garnermic@gmail.com, velumanit@hcl.com, Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Jul 14, 2022 at 8:05 PM Peter Delevoryas <peter@pjd.dev> wrote:
> On Thu, Jul 07, 2022 at 03:33:48PM +0200, Arnd Bergmann wrote:
> > > +       model = "Facebook fby35";
> > > +       compatible = "facebook,fby35", "aspeed,ast2600";
> > > +
> > > +       aliases {
> > > +               serial4 = &uart5;
> > > +       };
> >
> > Why not start at serial0 here?
>
> Hey, Facebook person jumping in here (using a personal email):
>
> I think you're right, it should be like this:
>
>         aliases {
>                 serial0 = &uart5;
>                 serial1 = &uart1;
>                 serial2 = &uart2;
>                 serial3 = &uart3;
>                 serial4 = &uart4;
>         };

Are you actually using all five uarts though?

> > > +       chosen {
> > > +               stdout-path = &uart5;
> > > +               bootargs = "console=ttyS4,57600n8 root=/dev/ram rw vmalloc=384M";
> > > +       };
>
> Also: if we do serial0 = &uart5, it should be console=ttyS0, not ttyS4.
>
> >
> > The bootargs should really come from the boot loader.
>
> What if we want to boot the kernel by itself with QEMU? It's kinda annoying to
> have to specify '-append "console=ttyS0,57600n8...' everytime, or to have to use
> a wrapper script. But, it's also a source of bugs: I realized yesterday the
> dts we were using here:
>
> https://github.com/facebook/openbmc-linux/blob/e26c76992e0761d9e440ff514538009384c094b4/arch/arm/boot/dts/aspeed-bmc-facebook-fby35.dts
>
> Has the wrong console setting.

You can encode the uart settings like

           stdout-path = "serial0:115200n8"

the rest really should be passed on the command line, not in
the DT shipped with the kernel.

        Arnd
