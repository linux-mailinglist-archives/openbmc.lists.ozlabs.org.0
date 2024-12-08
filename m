Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DBE49E885E
	for <lists+openbmc@lfdr.de>; Sun,  8 Dec 2024 23:51:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y60Zl4y6jz3f7G
	for <lists+openbmc@lfdr.de>; Mon,  9 Dec 2024 09:50:39 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733678225;
	cv=none; b=G3i5p7B8iNQ9wL0Ld+IfHXRHW219mcPE5kMsJeXyWzZzYwYwMko1+nTtC+FTx0Bb9MK3aSwRSJw3j9zT1YSXl5mQQA84Y+f7NdstE3YSnMUm+mAmkfqj3M/QbGUEPtLRjU32lsjhPq5YN3kgzl5xuPJpMKgDPOO+J7ZBkAdNatm5N/DAZsoduc4CdYvk6Z+DbpKRTvlabRS4mb3xVYa4dEABpsuAv3Wp1e+MJ06LHSKJXEaYMIPs8y1tiKNbcO32GKtXblUBm7k9IIbjP5ApbJRzuvlgL4pchZXQNazQqohWABRt+8ArvpO/Cg26NlowJ9d9QailTRva0pZD0WeLzw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733678225; c=relaxed/relaxed;
	bh=O6neKXqS6q5X5pwPw5b0UsccNe07xKGcHcccn/AhNp8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=URKJGxGlqALBgbT7KHJ+FCgsZiVeErkOKe1XWP3u/1CDh63tZkt6hyMfphjNy74DWpGSLujnq7Kbgon7ffydAa6wdXkdxeJwlcAcTOpMwABpxkgKXSIWeKSmNTkF3TRLg0PK5YoAR3fQalt+TdtiywI2WOKDgBOSMZL/352uTWi5MM1dOPIHQDUCNH8VfUtp4CE8zQpIum9NcUTmDcIuYvzejytoA7tCSi41k0BTpjFTxawkmKFML0EkBvAZUQZ6A8eX0wJvObeTkSDHbbii6c7CvhOxmGfJL5R3MqDf99e1dRpR9IglLUL0bSR77wjWc7oK6UBuzfcDhmbStu+sSw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=J7mZE4gb; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=jic23@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=J7mZE4gb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=jic23@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y5s9q5RYdz2xfR
	for <openbmc@lists.ozlabs.org>; Mon,  9 Dec 2024 04:17:03 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 45BBB5C0755;
	Sun,  8 Dec 2024 17:16:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBFDDC4CED2;
	Sun,  8 Dec 2024 17:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733678218;
	bh=80jm1WGeYCwdtfUxEN8KjbUhw+3thz/j0DAOCSXhp5k=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=J7mZE4gbcAjvD3ebbTAarbmj9Cxl+vuoNBsmn8aET2qbOfc0DDscYXSdWjPpbNCrd
	 u/HlYPrPa2/zKDpdS5oUhnBVNZtvMTZZliKgTUBJIVJ5RAIB2k0knS5rATe4DrC4Ve
	 nL7AuzdFnEsFWjdLC7JEYAgnJGWCKb1VdaLp1qQ1UPYYz1x3bw1rksaKZ+46BXviY/
	 H2WooL49CvuW2ujKVzRH4S5bPXRW7TU6QixT46JbZaLIrlLk8wAvmXOmnn4RKwW2sx
	 syZe9hZ2KJ88RzRXcSng7AQ661rfE11SZasHmckdMFm5F27k3Idfr9l1JWrCJIID6t
	 JwR3pvPiLLatA==
Date: Sun, 8 Dec 2024 17:16:42 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Yu-Hsian Yang <j2anfernee@gmail.com>
Subject: Re: [PATCH v2 2/2] iio: adc: add Nuvoton NCT720x ADC driver
Message-ID: <20241208171642.2bbfa5aa@jic23-huawei>
In-Reply-To: <CA+4Vgc+HUwbHUWHdCoLVgm7aSMdqOGQZZawU8L8z7hMFop_VxQ@mail.gmail.com>
References: <20241203091540.3695650-1-j2anfernee@gmail.com>
	<20241203091540.3695650-3-j2anfernee@gmail.com>
	<Z08MkR40fjfW3MXZ@smile.fi.intel.com>
	<CA+4VgcJW=9rtuqr3VZbfA8QxgYAR+KvfAHdf_0xv4XLQtVVQJw@mail.gmail.com>
	<Z0_aNIrNvLxqcRHv@smile.fi.intel.com>
	<CA+4Vgc+HUwbHUWHdCoLVgm7aSMdqOGQZZawU8L8z7hMFop_VxQ@mail.gmail.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailman-Approved-At: Mon, 09 Dec 2024 09:50:29 +1100
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
Cc: tgamblin@baylibre.com, tmaimon77@gmail.com, devicetree@vger.kernel.org, linux-iio@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, tali.perry1@gmail.com, yhyang2@nuvoton.com, marcelo.schmitt@analog.com, robh@kernel.org, lars@metafoo.de, benjaminfair@google.com, javier.carrasco.cruz@gmail.com, openbmc@lists.ozlabs.org, ramona.nechita@analog.com, matteomartelli3@gmail.com, olivier.moysan@foss.st.com, thomas.bonnefille@bootlin.com, dlechner@baylibre.com, KWLIU@nuvoton.com, conor+dt@kernel.org, alisadariana@gmail.com, mike.looijmans@topic.nl, nuno.sa@analog.com, krzk+dt@kernel.org, chanh@os.amperecomputing.com, avifishman70@gmail.com, venture@google.com, mitrutzceclan@gmail.com, linux-kernel@vger.kernel.org, gstols@baylibre.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 4 Dec 2024 17:05:19 +0800
Yu-Hsian Yang <j2anfernee@gmail.com> wrote:

> Dear Andy Shevchenko,
>=20
> Andy Shevchenko <andriy.shevchenko@linux.intel.com> =E6=96=BC 2024=E5=B9=
=B412=E6=9C=884=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=8812:27=E5=AF=
=AB=E9=81=93=EF=BC=9A
> >
> > On Wed, Dec 04, 2024 at 11:20:20AM +0800, Yu-Hsian Yang wrote: =20
> > > Andy Shevchenko <andriy.shevchenko@linux.intel.com> =E6=96=BC 2024=E5=
=B9=B412=E6=9C=883=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=889:50=E5=AF=
=AB=E9=81=93=EF=BC=9A =20
> > > > On Tue, Dec 03, 2024 at 05:15:40PM +0800, Eason Yang wrote: =20
> >
> > ...
> > =20
> > > > Second, why do you need two regmaps? How debugfs is supposed to wor=
k on the
> > > > registers that are 16-bit if you access them via 8-bit regmap and v=
ice versa?
> > > >
> > > > Can't you simply use bulk reads/writes when it makes sense and drop=
 16-bit
> > > > regmap completely? =20
> > >
> > > Read VIN info can use word read or byte read, and other registers
> > > should use byte read.
> > >
> > > For a reviewer's comment, If the i2c controller allows word read then=
 the
> > > right thing is to always use it. =20
> >
> > But how does this differ to bulk read of two sequential 8-bit offsets?
> > And if there is a difference, shouldn't this be addressed on regmap lev=
el for
> > all? Like testing for the supported flags and access registers based on=
 the
> > controller capability and user request.
> > =20
>=20
> We would explain why we use two regmaps.
> In the beginning, we declare a property read-vin-data-size for user to
> select byte read or word read.
> After discuss with reviewers, we don't need this property.
> So I get rid of this property and take word read vin data first.
> We can't use regmap_bulk_read since the vin data is not sequential.
>=20
> For Nuvoton NCT7201/NCT7202 chip,
> Take an example as to Vin1:
> The VIN reading supports Byte read (One Byte) and Word read (Two Byte)
>=20
> For Byte read:
> First read Index 00h to get VIN1 MSB, then read Index 0Fh Bit 3~7 to
> get VIN1 LSB.
> Index 0Fh is a shared LSB for all VINs.
>=20
> For Word read:
> Read Index 00h and get 2 Byte (VIN1 MSB and VIN1 LSB).

Yeah. This is a really weird device.  2 regmaps is probably
the best option.  The regmap access tables or functions can be used to
avoid the debugfs problem Andy mentioned.

Jonathan

>=20
> > --
> > With Best Regards,
> > Andy Shevchenko
> >
> > =20

