Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ECD435E50
	for <lists+openbmc@lfdr.de>; Wed,  5 Jun 2019 15:49:40 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45JqsY1K1BzDqdv
	for <lists+openbmc@lfdr.de>; Wed,  5 Jun 2019 23:49:37 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::444; helo=mail-pf1-x444.google.com;
 envelope-from=franhsutw@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="kLMgDqbR"; 
 dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45JqlH6rwpzDqR6
 for <openbmc@lists.ozlabs.org>; Wed,  5 Jun 2019 23:44:11 +1000 (AEST)
Received: by mail-pf1-x444.google.com with SMTP id a23so14877783pff.4
 for <openbmc@lists.ozlabs.org>; Wed, 05 Jun 2019 06:44:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=2bkTsTgkQawJii2FT9K3NiAuvCFomSZKmHtsn0p2qb0=;
 b=kLMgDqbRpvHXhdkXK/zAetsUzdaGIz7oblFKMEqO4PVQLwJ2ucW62+Bi3IIW0z9kEz
 w0PcXrUGpEopJk5Cl53tQ+US2QYDOyn6DSIYergZoTfSOmzSqX+ZNfgLN0EEu2lUDC7r
 mknzTUYa0OvVCSdtoFo8thPLbFeu1wdQ3YKY94Vtdape9qD8Lmd5S6C/gKltyQlx35lE
 JtGyOed7mbRpfbn8RO3XGVHd003gtdNOyLNxU4/2syathX0sXDKTB1Tigy55XbUu65G0
 PfFNiqA0cLXz88M4zzJUw1isD8VszoHDCegrpEyi3xIDVZF+4gANcP1Qq1G9vQSNMkm5
 Y67A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:references:in-reply-to:subject:date
 :message-id:mime-version:content-transfer-encoding:content-language
 :thread-index;
 bh=2bkTsTgkQawJii2FT9K3NiAuvCFomSZKmHtsn0p2qb0=;
 b=lhZvlo3ngBoGs1saRmWAklq7g3o42qStFiivwNOYIZfxDd35/vcHg4Hw4YurI3dNDp
 aIhPq9koKFsBHrwH7peZ5VJHLA/eH4R6TMhy+Elu0rJO2FcL4S+EKAFJnT3bXOUpRKnb
 4zJWRq4pcI7cGqygO+WBz3GCK5DbEOeqAWlrEVU0PLBXL7WTgw81MwclQ8ApA+HhtCAG
 LsqTOL8oAoMTJA/yhtn/gLMLlwl8CY5UOOAqs3WGQ1f3pvyVwAP+uJTKhtkjXbtdd/mi
 Tp2khJ4jPkf6do2boDVRtHNus/g+PoM1T58cJ3gbbzOtVxGOLYH//Nf6inRkmDcprtps
 h6JQ==
X-Gm-Message-State: APjAAAXI+Qri3i4ESAG0ujzGXkOYpGbg5+qr7ZwvGmjdqApO4C9DRGVk
 AY4cwyCCpf3Af1ELtNU+pYQ=
X-Google-Smtp-Source: APXvYqyNWFjtiDIPib2nwUX1V33L7+DyFHRS2DVR7nimsDQ63PDqLT616IJaLUBbP9pGMZGZsxvhbw==
X-Received: by 2002:a17:90a:9f93:: with SMTP id
 o19mr45018390pjp.70.1559742249142; 
 Wed, 05 Jun 2019 06:44:09 -0700 (PDT)
Received: from FranNI7 (220-135-135-179.HINET-IP.hinet.net. [220.135.135.179])
 by smtp.gmail.com with ESMTPSA id
 l20sm20795244pff.102.2019.06.05.06.44.07
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 05 Jun 2019 06:44:08 -0700 (PDT)
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
Date: Wed, 5 Jun 2019 21:43:46 +0800
Message-ID: <033001d51ba4$c06727b0$41357710$@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: zh-tw
Thread-Index: AQIMNuR9zSzK/pk3BDBVMtL8800HPgKZreQ4AqiAsMACQxD836XisG/Q
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
 'Fran Hsu' <Fran.Hsu@quantatw.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Joel, Benjamin,
    I did some modification and push the patch v6 for review.
The patch v6 fixed the warning of nuvoton-npcm730-gsj.dts only.
Regarding the other warning messages, I will co-work with Nuvoton team.
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

