Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D18AE341D8
	for <lists+openbmc@lfdr.de>; Tue,  4 Jun 2019 10:31:10 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45J4rX2H91zDqNr
	for <lists+openbmc@lfdr.de>; Tue,  4 Jun 2019 18:31:08 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::443; helo=mail-pf1-x443.google.com;
 envelope-from=franhsutw@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="cin3wODJ"; 
 dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45J4qp1L8FzDqLy
 for <openbmc@lists.ozlabs.org>; Tue,  4 Jun 2019 18:30:29 +1000 (AEST)
Received: by mail-pf1-x443.google.com with SMTP id u17so12235110pfn.7
 for <openbmc@lists.ozlabs.org>; Tue, 04 Jun 2019 01:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=vIPlMP6IBHVaVvv/GaitazA7K9JSVvphLhzalysQWMU=;
 b=cin3wODJwQ+mFnuebloS/2Fb2eHbnRYYGbfkom7jlO1uZWUj1y/1j8tCtZI/LWnWg0
 mYGcDjycOLQGSNVpTRHEUZXQ1OfWhylJclNY/VgxoYFY9uC6wIz3G7vZsNw/2hRkCHTL
 0Q8jKP5GqGNIFI2rwrAl3FL/aZKSkJLxmedzNSSm8d7zKX/bCiBfTrS3ZeIUadC7m88U
 zMNo7UCK1rlczMWXHJS2CJ11VVbQ5kdqP1I4KPskao2wWVTyGQ6nlGTptW3PPS+jJdkl
 5QVhsUtZMbX9NPmOswuAFIKvOJPUs+MDu+QPHQFujXzOm86XbvdtCJuYHHXvgnNWSl4z
 dRFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:references:in-reply-to:subject:date
 :message-id:mime-version:content-transfer-encoding:content-language
 :thread-index;
 bh=vIPlMP6IBHVaVvv/GaitazA7K9JSVvphLhzalysQWMU=;
 b=BIYZWUjGL4dhYlA09siipr7373yb/iE9t67uRKSJ1bA524eXnK54buJ4HQExXEErFG
 Edc2i90qq8ibnJamYZLqwMuVzwyFTQTiD3tlrh8vxVtDKWSO6MCa78Y7lxx7czurVwJE
 cYqxuudwu1em6a3WI8aSc+MPPv2zXZQr0S5u2kMa1Xlepk3PMyrx2rfZpfEXL8lKTpuw
 ea3dLF6+A5gO9EhA14i1TUlZs9LILckeR7DCffxn4kc9YVFsJnFhZih2I8o2t8n2bxjL
 Zn07v/bgWcmfwrz1QxPKuX7jPRKtfKE5PfPkGTl7gAeUHSkM46oiQsGiAu3iBdWcf03d
 qCnA==
X-Gm-Message-State: APjAAAUaTV4YhCiLhgRbb1pxrV/yCsmcfA7Nge+7pMjWRT1pdDosCAFh
 kZ6M0XS7Ljo617eMAvR46EI=
X-Google-Smtp-Source: APXvYqwWTCsbZo41Dsmz1MvrPaCX5jpqM5oU6spqdsaHQCQ6tpEG7tu1/kzbO/ZwnJFii6WQpMN2Yw==
X-Received: by 2002:a63:570c:: with SMTP id l12mr31093772pgb.252.1559637026269; 
 Tue, 04 Jun 2019 01:30:26 -0700 (PDT)
Received: from FranNI7 (220-135-135-179.HINET-IP.hinet.net. [220.135.135.179])
 by smtp.gmail.com with ESMTPSA id
 u20sm6022517pga.82.2019.06.04.01.30.24
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 04 Jun 2019 01:30:25 -0700 (PDT)
From: franhsutw@gmail.com
X-Google-Original-From: <FranHsuTW@gmail.com>
To: "'Joel Stanley'" <joel@jms.id.au>,
 "'Benjamin Fair'" <benjaminfair@google.com>
References: <20190531132440.37572-1-Fran.Hsu@quantatw.com>
 <CADKL2t6K1Vu-DyuH_MYt5jGoFyCWe+X3fWETLNiPbZYO8Xrcpw@mail.gmail.com>
 <CACPK8XetcxfY1uWfiv9pLsX9a+X+66d2pD5-A68ZHrOUZhAd0Q@mail.gmail.com>
 <CACPK8Xe9rAEi8e5FDsbc89CQ_+iDhD5YW6+aqnZ0N5GxpZCR0Q@mail.gmail.com>
In-Reply-To: <CACPK8Xe9rAEi8e5FDsbc89CQ_+iDhD5YW6+aqnZ0N5GxpZCR0Q@mail.gmail.com>
Subject: RE: [PATCH dev-5.1 v5 1/4] ARM: dts: nuvoton: Add NPCM730 common
 device tree include file.
Date: Tue, 4 Jun 2019 16:30:04 +0800
Message-ID: <00d401d51aaf$c318d080$494a7180$@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: zh-tw
Thread-Index: AQIMNuR9zSzK/pk3BDBVMtL8800HPgKZreQ4AqiAsMACQxD836XguvKw
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
Cc: 'OpenBMC Maillist' <openbmc@lists.ozlabs.org>,
 'Fran Hsu' <Fran.Hsu@quantatw.com>, tomer.maimon@nuvoton.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Joel,
    Let me check it and I will update a new patch soon.=20
BTW, I had tried to merge these device tree patches into mainline =
(dev-5.2) but built fail.
I will talk with Tomer to ask for help.

Thanks,
Fran

> -----Original Message-----
> From: Joel Stanley <joel@jms.id.au>
> Sent: Tuesday, June 4, 2019 1:29 PM
> To: Benjamin Fair <benjaminfair@google.com>
> Cc: Fran Hsu <franhsutw@gmail.com>; OpenBMC Maillist
> <openbmc@lists.ozlabs.org>; Fran Hsu <Fran.Hsu@quantatw.com>
> Subject: Re: [PATCH dev-5.1 v5 1/4] ARM: dts: nuvoton: Add NPCM730 =
common
> device tree include file.
>=20
> On Tue, 4 Jun 2019 at 05:23, Joel Stanley <joel@jms.id.au> wrote:
> >
> > On Fri, 31 May 2019 at 15:28, Benjamin Fair =
<benjaminfair@google.com>
> wrote:
> > > This looks great! I think it's ready to merge.
> > >
> > > On Fri, May 31, 2019 at 6:26 AM Fran Hsu <franhsutw@gmail.com> =
wrote:
> > > >
> > > > Quanta GSJ BMC uses the Nuvoton NPCM730 BMC soc.
> > > > This file describes the common setting of NPCM730 soc.
> > > >
> > > > Signed-off-by: Fran Hsu <Fran.Hsu@quantatw.com>
> > >
> > > Reviewed-by: Benjamin Fair <benjaminfair@google.com>
> >
> > Thanks Benjamin for reviewing, and Fran for working to get these
> > patches in a state that we can merge them. I've put them in the
> > dev-5.1 tree with some small tweaks to the commit messages.
>=20
> I spoke too soon. I see these warnings when building:
>=20
> ../arch/arm/boot/dts/nuvoton-npcm730-gsj.dts:307.6-25: Warning
> (i2c_bus_reg): /ahb/apb/i2c@8d000/ipmb@40000010:reg: I2C address must
> be less than 10-bits, got "0x40000010"
> ../arch/arm/boot/dts/nuvoton-npcm730-gsj.dts:320.6-25: Warning
> (i2c_bus_reg): /ahb/apb/i2c@8e000/ipmb@40000012:reg: I2C address must
> be less than 10-bits, got "0x40000012"
>=20
> Please send follow up patches to fix these warnings.
>=20
> The following warnings also exist when building the npcm kernel. If =
you could
> also fix those it would be appreciated:
>=20
> ../arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi:222.22-231.5: Warning
> (spi_bus_bridge): /ahb/fiu@fb000000: node name for SPI buses should be =
'spi'
>   also defined at =
../arch/arm/boot/dts/nuvoton-npcm730-gsj.dts:81.22-126.5
> arch/arm/boot/dts/nuvoton-npcm730-gsj.dtb: Warning (spi_bus_reg):
> Failed prerequisite 'spi_bus_bridge'
> ../arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi:222.22-231.5: Warning
> (spi_bus_bridge): /ahb/fiu@fb000000: node name for SPI buses should be =
'spi'
>   also defined
> at ../arch/arm/boot/dts/nuvoton-npcm750-evb.dts:164.22-221.5
> ../arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi:233.22-244.5: Warning
> (spi_bus_bridge): /ahb/fiu@c0000000: node name for SPI buses should be =
'spi'
>   also defined
> at ../arch/arm/boot/dts/nuvoton-npcm750-evb.dts:223.22-242.5
>=20
> Cheers,
>=20
> Joel

