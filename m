Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 54391C19C2
	for <lists+openbmc@lfdr.de>; Mon, 30 Sep 2019 01:28:07 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46hMCS167NzDqN8
	for <lists+openbmc@lfdr.de>; Mon, 30 Sep 2019 09:28:04 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::336; helo=mail-ot1-x336.google.com;
 envelope-from=tmaimon77@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="o9UuwxLH"; 
 dkim-atps=neutral
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com
 [IPv6:2607:f8b0:4864:20::336])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46hMBt601qzDqMC
 for <openbmc@lists.ozlabs.org>; Mon, 30 Sep 2019 09:27:33 +1000 (AEST)
Received: by mail-ot1-x336.google.com with SMTP id e11so6773247otl.5
 for <openbmc@lists.ozlabs.org>; Sun, 29 Sep 2019 16:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pafynaNr7kkJu+mOozQE31UESx03ndTbhrbTw0kcyWI=;
 b=o9UuwxLHeZ9Ufut27jdYt3lyHhRI8LPNBXPWCLj1h51RLUAunHLbv2MmiaL/w1HQBe
 W8j7EQ3h0q0uGwGDo+4U332cdTpKTxIx7ktX7lamQoxOfF75R/nFhfVS5+Pcn2q3stnP
 zxvf6zoizzfsN9OH3fzrN53BgON9q6mKY6ig0AUCTzHKZbTfjKXecNLCRyc4hTbDaiPE
 S/2R3GDQ4s4UKsOYItjRFXk49bF3z8n1vUqvbOFNucaC7K76OmyxWtXA1PcQRYfesQQL
 SjrThOUd/49j+JluhdObjFLkJn2N8LJyyT4hXTQ9cynIDIZ7KjG9gH7DFGDgGA5OL1oe
 H5Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pafynaNr7kkJu+mOozQE31UESx03ndTbhrbTw0kcyWI=;
 b=gKyvzml4I9SfdRJGG+uoByxVVDDdzhhu3XiSXxfR+0MVlZZRt+QbL+zK0j8k1vo8NW
 IJq3TaHyoxN10Z4ItP9ukxhukGbZWwQ1ybDKnn/WXQvc6Nxw/oiXhNkGhrBZZoA6tplw
 eQFkMHOV34auC+kNP79U0OebwLDgGw5nd+7yXAdSv0qmBlbNqEmKx13Jnlzo7ziyIjIj
 /UEDyQzGHas+qyJI2gKXxn9wqr2lMb1XW9BNDwZpLscjdxXuJPG10RStTtXKLQyxUkaO
 peAw+/FHSdHFoqK8NX6SNTicwsfgMI0IFfCtpAlqma2gfG/2HoS/nmGke5V9hH6OfMS0
 L1jA==
X-Gm-Message-State: APjAAAVCHCLcO2u8JhpKRX3qH8YIxcqvdUEjwKXnivUQLXgQPO2bUtMD
 SHrS+QdFODRIA+Mpt0P0HZUFpTXXS7F4sTivOik=
X-Google-Smtp-Source: APXvYqx4ifLaWJdCwM49MWnZK1lCcaPxgH1HcdScdYnH1W4ozQru/jBVohpef5nvMrMXDOKuyVyX9W24Exm6prbD+t0=
X-Received: by 2002:a05:6830:609:: with SMTP id
 w9mr11859947oti.292.1569799650585; 
 Sun, 29 Sep 2019 16:27:30 -0700 (PDT)
MIME-Version: 1.0
References: <1569414398-180553-1-git-send-email-tmaimon77@gmail.com>
 <CACPK8Xfx03hNyw+8gdUh6vhdD01aB1a4NZvkLT9vPouzJaTeyg@mail.gmail.com>
In-Reply-To: <CACPK8Xfx03hNyw+8gdUh6vhdD01aB1a4NZvkLT9vPouzJaTeyg@mail.gmail.com>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Mon, 30 Sep 2019 02:36:52 +0300
Message-ID: <CAP6Zq1h_8vXBUFdQByqZOMcL5BYOnTxXF6uEhuwB0DOFZZU00g@mail.gmail.com>
Subject: Re: [linux dev-5.3 v2] arm: dts: add NPCM7xx RunBMC Olympus Quanta
 device tree
To: Joel Stanley <joel@jms.id.au>
Content-Type: multipart/alternative; boundary="0000000000008ab08f0593b97617"
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

--0000000000008ab08f0593b97617
Content-Type: text/plain; charset="UTF-8"

Hi Joel,

Thanks for upstream the Olympus RunBMC device tree files.

When we compile the device tree in the OpenBMC we didn't see these
warnings, but I can see it in other DTC.

Sorry we are on vacation until Wednesday, I will work on it as soon we will
be back on work.

Cheers

Tomer

On Thu, 26 Sep 2019 at 11:46, Joel Stanley <joel@jms.id.au> wrote:

> On Wed, 25 Sep 2019 at 12:26, Tomer Maimon <tmaimon77@gmail.com> wrote:
> >
> > Add Nuvoton NPCM7xx RunBMC Olympus Quanta board
> > device tree.
> >
> > Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
>
> Thanks Tomer, I've applied this to dev-5.3. Please test it when you
> get a chance as I do not have access to RunBMC hardware.
>
> There's some warnings that are produced if you're using a recent
> device tree compiler version:
>
> $ dtc --version
> Version: DTC 1.5.0
>
>   DTC     arch/arm/boot/dts/nuvoton-npcm750-runbmc-olympus.dtb
> ../arch/arm/boot/dts/nuvoton-npcm750-runbmc-olympus.dts:428.6-25:
> Warning (i2c_bus_reg):
> /ahb/apb/i2c@85000/i2c-slave-mqueue@40000010:reg: I2C address must be
> less than 10-bits, got "0x40000010"
> ../arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi:222.22-231.5: Warning
> (spi_bus_bridge): /ahb/fiu@fb000000: node name for SPI buses should be
> 'spi'
>   also defined at
> ../arch/arm/boot/dts/nuvoton-npcm750-runbmc-olympus.dts:134.22-195.5
> ../arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi:233.22-244.5: Warning
> (spi_bus_bridge): /ahb/fiu@c0000000: node name for SPI buses should be
> 'spi'
>   also defined at
> ../arch/arm/boot/dts/nuvoton-npcm750-runbmc-olympus.dts:197.22-220.5
> arch/arm/boot/dts/nuvoton-npcm750-runbmc-olympus.dtb: Warning
> (spi_bus_reg): Failed prerequisite 'spi_bus_bridge'
>
> If you could send a follow up patch that fixes this that would be great.
>
> Cheers,
>
> Joel
>

--0000000000008ab08f0593b97617
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Joel,<div><br></div><div>Thanks for upstream the Olympu=
s RunBMC device tree files.</div><div><br></div><div>When we compile the de=
vice tree in the=C2=A0OpenBMC we didn&#39;t see these warnings, but I can s=
ee it in other DTC.</div><div><br></div><div>Sorry we are on vacation until=
 Wednesday, I will work on it as soon we will be back on work.</div><div><b=
r></div><div>Cheers</div><div><br></div><div>Tomer</div></div><br><div clas=
s=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, 26 Sep 2019=
 at 11:46, Joel Stanley &lt;<a href=3D"mailto:joel@jms.id.au">joel@jms.id.a=
u</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>On Wed, 25 Sep 2019 at 12:26, Tomer Maimon &lt;<a href=3D"mailto:tmaimon77=
@gmail.com" target=3D"_blank">tmaimon77@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Add Nuvoton NPCM7xx RunBMC Olympus Quanta board<br>
&gt; device tree.<br>
&gt;<br>
&gt; Signed-off-by: Tomer Maimon &lt;<a href=3D"mailto:tmaimon77@gmail.com"=
 target=3D"_blank">tmaimon77@gmail.com</a>&gt;<br>
<br>
Thanks Tomer, I&#39;ve applied this to dev-5.3. Please test it when you<br>
get a chance as I do not have access to RunBMC hardware.<br>
<br>
There&#39;s some warnings that are produced if you&#39;re using a recent<br=
>
device tree compiler version:<br>
<br>
$ dtc --version<br>
Version: DTC 1.5.0<br>
<br>
=C2=A0 DTC=C2=A0 =C2=A0 =C2=A0arch/arm/boot/dts/nuvoton-npcm750-runbmc-olym=
pus.dtb<br>
../arch/arm/boot/dts/nuvoton-npcm750-runbmc-olympus.dts:428.6-25:<br>
Warning (i2c_bus_reg):<br>
/ahb/apb/i2c@85000/i2c-slave-mqueue@40000010:reg: I2C address must be<br>
less than 10-bits, got &quot;0x40000010&quot;<br>
../arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi:222.22-231.5: Warning<br>
(spi_bus_bridge): /ahb/fiu@fb000000: node name for SPI buses should be<br>
&#39;spi&#39;<br>
=C2=A0 also defined at<br>
../arch/arm/boot/dts/nuvoton-npcm750-runbmc-olympus.dts:134.22-195.5<br>
../arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi:233.22-244.5: Warning<br>
(spi_bus_bridge): /ahb/fiu@c0000000: node name for SPI buses should be<br>
&#39;spi&#39;<br>
=C2=A0 also defined at<br>
../arch/arm/boot/dts/nuvoton-npcm750-runbmc-olympus.dts:197.22-220.5<br>
arch/arm/boot/dts/nuvoton-npcm750-runbmc-olympus.dtb: Warning<br>
(spi_bus_reg): Failed prerequisite &#39;spi_bus_bridge&#39;<br>
<br>
If you could send a follow up patch that fixes this that would be great.<br=
>
<br>
Cheers,<br>
<br>
Joel<br>
</blockquote></div>

--0000000000008ab08f0593b97617--
