Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C6D24BD7E9
	for <lists+openbmc@lfdr.de>; Mon, 21 Feb 2022 09:40:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K2G316Shvz3c5g
	for <lists+openbmc@lfdr.de>; Mon, 21 Feb 2022 19:40:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=G2uKcFZ0;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72c;
 helo=mail-qk1-x72c.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=G2uKcFZ0; dkim-atps=neutral
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com
 [IPv6:2607:f8b0:4864:20::72c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K2G2Y1y79z30gg
 for <openbmc@lists.ozlabs.org>; Mon, 21 Feb 2022 19:40:03 +1100 (AEDT)
Received: by mail-qk1-x72c.google.com with SMTP id g24so15773191qkl.3
 for <openbmc@lists.ozlabs.org>; Mon, 21 Feb 2022 00:40:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=s5B4YomWl6YcuDNS/5ZSy9Ee5vW/FUHQ9NrgrTJaP0M=;
 b=G2uKcFZ0slXRhBZZaZfMjHyLGeJ141r9JJ68bPGZoOtsFvYuhR9fkD7fjkNEHOjLEX
 dl/jfU86zpeUN3HRF+k1HBUSnOlTtf3IqyjhW/OiQCcK83KWtzDoLvaD//svUoUzxE6K
 YvGLIoQARJUdaWpBPMcFx/wRpYjSw3x7cg93I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=s5B4YomWl6YcuDNS/5ZSy9Ee5vW/FUHQ9NrgrTJaP0M=;
 b=B20gLDKres5AhJpMDsXJ3qhwjITb+qAVzprM7iQ/aKWo2mlMkNBYG00KMxQjUnMyn8
 hoQh2m5815FnnqfAfNgI0nsWnut49A48Cjx7Mkp9Z4/xZEW8ZBcbX8W+tlfVhSDCBar2
 BeP98+e8HnAHW0N/yqSLHF80m0geyMW+VVEOTt30jDmrY2OFOpWjMn4fJB+bvQXB78KA
 kF7jtEphq2UsDazvBeekpqlvr3xKadVwOu1WYYOXL7POnoeBYFZEHwYttg87I+aljSPn
 8t/i0INd6smtQ2DKIrBfbQyC/ubWw1qOUPfl1sYi6U1OCqbG0XUzqklAoASNBPOh/DnZ
 HMsQ==
X-Gm-Message-State: AOAM532guV98CfPfgA5FxjG+iPNMwnFhNQpas2jIv7G7u0tg2Ig2k1qS
 3Vq2U5gT3dYUggUi1w6TdY6yGPP8WD6FF8Xcrco=
X-Google-Smtp-Source: ABdhPJxFJvuwWGC5GrFl1qj+qpwGu1Hw17FayDDh83qmi1ySNxF6NpZN0/Wvnp/61O2HQfqO5gnK9Vn7LIva3OI+Ewo=
X-Received: by 2002:a37:f903:0:b0:648:ca74:b7dc with SMTP id
 l3-20020a37f903000000b00648ca74b7dcmr3488000qkj.666.1645432800168; Mon, 21
 Feb 2022 00:40:00 -0800 (PST)
MIME-Version: 1.0
References: <nick.hawkins@hpe.com>
 <20220125194609.32314-1-nick.hawkins@hpe.com>
 <CAK8P3a0ccoH_sNE9eWxQnWHEWNBPFL6k4k6mku=cHs_fRfnL-w@mail.gmail.com>
 <CA8148A1-578E-4621-9714-45AB391C353A@hpe.com>
 <2f4dd91a-e4ad-2559-f65e-914561de4047@canonical.com>
 <015EB9CD-ADB9-4C12-BD3F-78268E849884@hpe.com>
 <CAK8P3a3AUdQ94yu5An0-MhOuY2bOsr=zFWhtqVHk6E_+hBUCZQ@mail.gmail.com>
In-Reply-To: <CAK8P3a3AUdQ94yu5An0-MhOuY2bOsr=zFWhtqVHk6E_+hBUCZQ@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 21 Feb 2022 08:39:47 +0000
Message-ID: <CACPK8XfgbQvAN+RzXWV0zJ_s9u3huyqA-1rofpf__3ifyB_Vzw@mail.gmail.com>
Subject: Re: [PATCH] Adding architectural support for HPE's GXP BMC. This is
 the first of a series of patches to support HPE's BMC with Linux Kernel.
To: Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
 Hao Fang <fanghao11@huawei.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Sam Ravnborg <sam@ravnborg.org>,
 "Verdun, Jean-Marie" <verdun@hpe.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Russell King <linux@armlinux.org.uk>, Ard Biesheuvel <ardb@kernel.org>,
 "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>,
 Rob Herring <robh+dt@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, "Hawkins,
 Nick" <nick.hawkins@hpe.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 Masahiro Yamada <masahiroy@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Stanislav Jakubek <stano.jakubek@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 1 Feb 2022 at 09:00, Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Mon, Jan 31, 2022 at 7:52 PM Verdun, Jean-Marie <verdun@hpe.com> wrote=
:
> >
> > - GXP is the name of the SoC. It has multiple implementations, which ar=
e currently compatibles. I don't think for the moment that we need to disti=
nguished them. We might have a GXP v2 coming up but not before a certain am=
ount of time which is far enough.
> > - This SoC is used to implement BMC features of HPE servers (all ProLia=
nt, many Apollo, and Superdome machines)
>
> Is there any more specific name of the chip that can be used to identify =
the
> exact generation after a new one comes out? The normal way we handle
> compatible strings for devices is to start with a specific model number o=
f
> the chip that integrates it, and then have later chips refer to the devic=
e by
> its new name, with the old one as a fallback. This makes drivers work out=
 of
> the box when the device is unchanged, but gives you a way to distinguish =
them
> if a difference gets noticed after both revisions are already used.
>
> As with some of points that Krzysztof and others made previously, the goa=
l
> here is to avoid binding incompatibilities in the future: anything that w=
orks
> in an upstream kernel should keep working in later versions, ideally
> allowing any combination of old and new dtb blobs in the bootloader
> with old or new kernel versions.
>
> > It does support many features including:
> > - ARMv7 architecture, and it is based on a Cortex A9 core
> > - Use an AXI bus to which
> >         - a memory controller is attached, as well as multiple SPI inte=
rfaces to connect boot flash, and ROM flash, a 10/100/1000 Mac engine which=
 supports SGMII (2 ports) and RMII
> >         - Multiple I2C engines to drive connectivity with a host infras=
tructure
> >         - A video engine which support VGA and DP, as well as an hardwa=
re video encder
> >         - Multiple PCIe ports
> >                 - A PECI interface, and LPC eSPI
> >         - Multiple UART for debug purpose, and Virtual UART for host co=
nnectivity
> >         - A GPIO engine
>
> Thanks for the description. This seems quite normal then, similar to the
> aspeed and npcm BMC platforms that we support already. You can
> probably drop some of the people on the Cc list, but I would suggest you =
add
> the openbmc list and Joel Stanley (Cc'd now) in your next submissions, Jo=
el
> would be the best person to review the parts that are BMC specific.

I had a call with some of the HPE developers a while back. It's good
to hear from you again.

As Arnd said, please cc me on your submissions and I'll provide
review. You can also cc openbmc@lists.ozlabs.org to reach a wider
audience of BMC developers.

After our call the other month, I took a look at your latest kernel
tree and started teasing out something that could be submitted:

https://github.com/shenki/linux/commits/gxp

Hopefully this helps illustrate what we mean about breaking down the
patches into small logical chunks. Don't take what I've done there as
correct, but it's an indication. Feel free to re-use.

I encourage you to take a look at the aspeed device trees for
inspiration. The way they are organised into generations - 2400, 2500,
2600 - illistrate's Arnd's points about supporting multiple
generations of SoC with the one code base.

Cheers,

Joel
