Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 288B84D07EA
	for <lists+openbmc@lfdr.de>; Mon,  7 Mar 2022 20:48:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KC8CP6hgtz3bTL
	for <lists+openbmc@lfdr.de>; Tue,  8 Mar 2022 06:48:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=lyEI4eFF;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::c35;
 helo=mail-oo1-xc35.google.com; envelope-from=tmaimon77@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=lyEI4eFF; dkim-atps=neutral
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com
 [IPv6:2607:f8b0:4864:20::c35])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KC8Bz3PZ1z2xDM
 for <openbmc@lists.ozlabs.org>; Tue,  8 Mar 2022 06:48:09 +1100 (AEDT)
Received: by mail-oo1-xc35.google.com with SMTP id
 k13-20020a4a948d000000b003172f2f6bdfso19189228ooi.1
 for <openbmc@lists.ozlabs.org>; Mon, 07 Mar 2022 11:48:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vhRo0brwogVCRu+VQGQ+254ZKo6uOsXDV93NbH7cxRs=;
 b=lyEI4eFF/cgOepyL0gQmTpH0gR19hH+lkFhsIY8IfOTogiBgFHC1PF/eRMG0mDYUnM
 LtuZZPq3WucgXCJiB6lKNyvN9Dg6VWsvupNviCXwNhriWam4C8qv4FPJVE3Z4GAI2OdS
 ssE89YQ3GayFDCQYUAN3bRMoKCFGGnJqul+8vW4RSjLAfH3C2ogCy85b2n2xDJ+0wKm7
 KAxSZARvPkuVHMdP7gSdqdU6/ubWmVZWfJBP08AHUF8hxccUBu0XOw6oVoNU7XQQJ20d
 wqiCX/UaUQpFi4ia2aefl833rWAyzFiZVxyuYQszyW0ax8mxQzJryaCdNmprlber4CpF
 1IUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vhRo0brwogVCRu+VQGQ+254ZKo6uOsXDV93NbH7cxRs=;
 b=lUWBEKV54l+mG9gyNGL6G9jV64Epwk6Hcpn+mTR8/XSQdVMXlzuYPuBMPLdw59AYcT
 cQiptPpA6iaU5Yb1rLVXzuEU4wjMOwsB5Me+/J78mdXHArxxg5SzbplnS3rLcBAvHKod
 3ZBXJOBJkYYn68vaibYigGfHln4Lh0bKIYKtl5GPR7UW83T3TubSZrH4r0fBVCietJzI
 fG4Mz7b4f5ONsp6C89V2moiPFHZk+uB+eNQClQux95IohUrCICKDLROwoTsug0vtloxB
 5tdrsrrnsHEyO2gHl7IzDoIEO2kZc7d95Y/Hal7xqTSdrUtPDgzrlwECO8GWgShkVgXM
 gVLw==
X-Gm-Message-State: AOAM533ZgcZgIMi6lVhJ5zwGbG3j/xH7HBBe561CPCT2nyWgnu4jEq6f
 C5kE5sJosOsgyoG3fsN0X+mrfnX6oeoCFkJ8JHA=
X-Google-Smtp-Source: ABdhPJwgEOVu2ifH6xNfUbg+v5eS3Hkc8HPpuyzWeFSFcO7W4XCYVysWkd0x3lAcgeskTCURqazPw8oVMW0KpsbtBMA=
X-Received: by 2002:a05:6870:a116:b0:d7:54ba:99f0 with SMTP id
 m22-20020a056870a11600b000d754ba99f0mr350984oae.29.1646682486901; Mon, 07 Mar
 2022 11:48:06 -0800 (PST)
MIME-Version: 1.0
References: <20220303083141.8742-1-warp5tw@gmail.com>
 <20220303083141.8742-12-warp5tw@gmail.com>
 <YiCb7LNY9tmMCZx7@smile.fi.intel.com>
 <CAHb3i=tWhtXK+c5GGbp6m23AHoyy=4woT_+n3a_N-6CqKUYb=g@mail.gmail.com>
 <YiDMX7pUqs/rLJUU@smile.fi.intel.com>
 <CAP6Zq1iy0yNMemqDjrLu1F0rrRSDFhZ+SqdoOa9FyJDNL0ENXA@mail.gmail.com>
 <YiXT1JX5A7Ez7C6G@smile.fi.intel.com>
In-Reply-To: <YiXT1JX5A7Ez7C6G@smile.fi.intel.com>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Mon, 7 Mar 2022 21:47:56 +0200
Message-ID: <CAP6Zq1gLQ6BaDgrE8vq1p5CHQ3WDbCp59e_=zghmU_6J0FB-mQ@mail.gmail.com>
Subject: Re: [PATCH v3 11/11] i2c: npcm: Support NPCM845
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: multipart/alternative; boundary="000000000000b0912a05d9a6243c"
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
Cc: devicetree <devicetree@vger.kernel.org>, Tali Perry <tali.perry1@gmail.com>,
 Linux I2C <linux-i2c@vger.kernel.org>, Benjamin Fair <benjaminfair@google.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, JJLIU0@nuvoton.com,
 lukas.bulwahn@gmail.com, Tomer Maimon <tomer.maimon@nuvoton.com>,
 KWLIU@nuvoton.com, bence98@sch.bme.hu, Arnd Bergmann <arnd@arndb.de>,
 sven@svenpeter.dev, Rob Herring <robh+dt@kernel.org>,
 Avi Fishman <Avi.Fishman@nuvoton.com>, Tyrone Ting <warp5tw@gmail.com>,
 yangyicong@hisilicon.com, semen.protsenko@linaro.org, jie.deng@intel.com,
 Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Wolfram Sang <wsa@kernel.org>, kfting@nuvoton.com,
 Tali Perry <tali.perry@nuvoton.com>, Olof Johansson <olof@lixom.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000b0912a05d9a6243c
Content-Type: text/plain; charset="UTF-8"

Hi Andy,

On Mon, 7 Mar 2022 at 11:44, Andy Shevchenko <
andriy.shevchenko@linux.intel.com> wrote:

> On Sun, Mar 06, 2022 at 03:33:20PM +0200, Tomer Maimon wrote:
> > On Thu, 3 Mar 2022 at 16:11, Andy Shevchenko <
> > andriy.shevchenko@linux.intel.com> wrote:
> > > On Thu, Mar 03, 2022 at 02:35:58PM +0200, Tali Perry wrote:
> > > > > On Thu, Mar 3, 2022 at 12:45 PM Andy Shevchenko <
> > > andriy.shevchenko@linux.intel.com> wrote:
>
> ...
>
> > > But hold on and read set of questions below.
> > >
> > > Previously it was a fixed field with the NPCM_I2CTXF_STS_TX_BYTES mask
> > > applied,
> > > right? From above I have got that FIFO is growing twice. Is it correct?
> >
> > What do you mean by growing twice? TX and RX?
>
> I meant from 16 bytes to 32 bytes.
>
Yes, the FIFO grow to 32 byte

>
> > > Does the LSB stay at the same offset? What is the meaning of the MSB
> in 32
> > > byte
> > > case? If it's reserved then why not to always use 32 byte approach?
> >
> > Yes, the LSB stays in the same place, and bit 5 is reserved in the
> NPCM7XX
> > SoC.
> > Unfortunately, the I2C test failed when we tried to use the 32 bytes
> > approach at NPCM7XX Soc, this is why we added NPCM_I2CTXF_STS_TX_BYTES
> and
> > NPCM_I2C_STSRXF_RX_BYTES to the data structure.
> >
> > The device tree data structure pass data for each specific device, so I
> > don't understand why not use device tree data for supporting the I2C
> > specific device? this is not the case here?
>
> Basically we use compatible strings for that, but in any case if something
> can be autodetected from hardware, it's better to use autodetection.

Thanks for the clarification, in our case we don't autodetect from the
hardware...

>


>
> --
> With Best Regards,
> Andy Shevchenko
>
>
> We will send a new version soon, highly appreciate your help!

Best regards,

Tomer

--000000000000b0912a05d9a6243c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Andy,</div><br><div class=3D"gmail_quo=
te"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, 7 Mar 2022 at 11:44, Andy=
 Shevchenko &lt;<a href=3D"mailto:andriy.shevchenko@linux.intel.com">andriy=
.shevchenko@linux.intel.com</a>&gt; wrote:<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">On Sun, Mar 06, 2022 at 03:33:20PM +0200, Tomer =
Maimon wrote:<br>
&gt; On Thu, 3 Mar 2022 at 16:11, Andy Shevchenko &lt;<br>
&gt; <a href=3D"mailto:andriy.shevchenko@linux.intel.com" target=3D"_blank"=
>andriy.shevchenko@linux.intel.com</a>&gt; wrote:<br>
&gt; &gt; On Thu, Mar 03, 2022 at 02:35:58PM +0200, Tali Perry wrote:<br>
&gt; &gt; &gt; &gt; On Thu, Mar 3, 2022 at 12:45 PM Andy Shevchenko &lt;<br=
>
&gt; &gt; <a href=3D"mailto:andriy.shevchenko@linux.intel.com" target=3D"_b=
lank">andriy.shevchenko@linux.intel.com</a>&gt; wrote:<br>
<br>
...<br>
<br>
&gt; &gt; But hold on and read set of questions below.<br>
&gt; &gt;<br>
&gt; &gt; Previously it was a fixed field with the NPCM_I2CTXF_STS_TX_BYTES=
 mask<br>
&gt; &gt; applied,<br>
&gt; &gt; right? From above I have got that FIFO is growing twice. Is it co=
rrect?<br>
&gt; <br>
&gt; What do you mean by growing twice? TX and RX?<br>
<br>
I meant from 16 bytes to 32 bytes.<br></blockquote><div>Yes, the FIFO grow =
to 32 byte=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; &gt; Does the LSB stay at the same offset? What is the meaning of the =
MSB in 32<br>
&gt; &gt; byte<br>
&gt; &gt; case? If it&#39;s reserved then why not to always use 32 byte app=
roach?<br>
&gt; <br>
&gt; Yes, the LSB stays in the same place, and bit 5 is reserved in the NPC=
M7XX<br>
&gt; SoC.<br>
&gt; Unfortunately, the I2C test failed when we tried to use the 32 bytes<b=
r>
&gt; approach at NPCM7XX Soc, this is why we added NPCM_I2CTXF_STS_TX_BYTES=
 and<br>
&gt; NPCM_I2C_STSRXF_RX_BYTES to the data structure.<br>
&gt; <br>
&gt; The device tree data structure pass data for each specific device, so =
I<br>
&gt; don&#39;t understand why not use device tree data for supporting the I=
2C<br>
&gt; specific device? this is not the case here?<br>
<br>
Basically we use compatible strings for that, but in any case if something<=
br>
can be autodetected from hardware, it&#39;s better to use autodetection.</b=
lockquote><div>Thanks for the clarification, in our case we don&#39;t=C2=A0=
autodetect from the hardware...</div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">=C2=A0</blockquote><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">
<br>
<br>
-- <br>
With Best Regards,<br>
Andy Shevchenko<br>
<br>
<br></blockquote><div>We will send a new version soon, highly appreciate=C2=
=A0your help!</div><div><br></div><div>Best regards,</div><div><br></div><d=
iv>Tomer</div><div><br></div><div>=C2=A0</div></div></div>

--000000000000b0912a05d9a6243c--
