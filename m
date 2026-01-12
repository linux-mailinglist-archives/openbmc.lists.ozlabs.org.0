Return-Path: <openbmc+bounces-1151-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ECAE4D103C4
	for <lists+openbmc@lfdr.de>; Mon, 12 Jan 2026 02:12:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dqDqk2zLPz2yYs;
	Mon, 12 Jan 2026 12:12:02 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768180322;
	cv=none; b=cdjJa7Imq36YVdFC9pbnbEWhYDWZBWeu9tEXhilTAdbiJX/ksJvl8baZKOKuRVLv0dLB+9v2anxJAqtHQotiSR/jDe6SoeVYITIuTPkom6n5Nm1A7CtskbnTUQQ78Ps1zyBG9kjR9Q/NQbhEz1/jd1tfpnRT8BNCDqf1taQpEMtIFQ2NHYlMgOJgMFExCBhodGevsvux1g1kcQ5+WP/jquoa8Y2KsenxCkJsB2xg6pmXOwFYNEj50sOsIBGUWXO7+Q8k+JQRqDHP3BjU71ZFvL6/vk71y9WOGr9q3xwPXCJ0fEC8YEHk/xwCGxW08Hcv6oq0KVwHqt+/Gqd8n6n/6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768180322; c=relaxed/relaxed;
	bh=T6ajVF05aHaf00FJKRARFevD4YezZbE6GGQxiG/MFMY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Ijh/dRYydjVEPKumpidB/mF0tDNLgPYv5N/0sUXfWjKifM3v/yWpRXrp3pAMjhKc6ifXFuSy9wwsKwhdyTu9lzHaBWzwssjk0mJKSQJGx3LHhna3MsTfewz4jLkrk5Jil76rwzzWodE7Pv/iVmDLxRwHX4A6CN7rBQkEflaiqWNgczHx6lmH3uLZtFCHnvlnsRcHOPMHElQ0ZAakhH87VlqTFexLV4HbGqoW4meOsI8oxd5WrwcYPJPleLyYQGuHjCLsn023GPm4WqTHSJsuu9ySJWwsLrXkxcbaR9byxkbvh3k4WFsDVjuc4pyUwoan0H9jmTfL2jJc/uR7POel8Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=T35pX18E; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=T35pX18E;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dqDqj5Tvmz2yRM
	for <openbmc@lists.ozlabs.org>; Mon, 12 Jan 2026 12:12:01 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1768180321;
	bh=T6ajVF05aHaf00FJKRARFevD4YezZbE6GGQxiG/MFMY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=T35pX18EfR7PxilFuBe8g666SysD6TBNt2tvjz1M5PDjF2C9AgM99ZbPumV8iJsPz
	 0X3G6UPehBRBxKVNJOWKOYYTV0kFnuJmPIFOdexNN+IxFPSle1LonxtRfhGZZ9gFnb
	 4vhxCYYedT2uxXXsWCVsLvFX0+QlVHzP9NZdxc8IYgX4+kTADfmvVlale42ixkH1YK
	 NZ6EVeki0incDFHdc67UdWI1FI+Xhmj8o2Q2jPq658n5E9XiZkowLk5Cdwy5rcOZCk
	 Wq2h/ncpacz8+8xEVIStnYhxl0PWJshLffb0X2B3Bojy2Hu91fHrMDEdQTw5cBy7p7
	 PRP0FFzuvA8bA==
Received: from [192.168.68.115] (unknown [180.150.112.60])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 80C70648B5;
	Mon, 12 Jan 2026 09:12:00 +0800 (AWST)
Message-ID: <324c2abf90b0c1712b2407b9a9b6f80ae590cb4c.camel@codeconstruct.com.au>
Subject: Re: [PATCH u-boot v2 1/2] drivers: spi: Add support for disabling
 FMC_WDT2 for aspeed
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Ivan Mikhaylov <fr0st61te@gmail.com>, Marc Olberding
 <molberding@nvidia.com>
Cc: joel@jms.id.au, openbmc@lists.ozlabs.org, eajames@linux.ibm.com
Date: Mon, 12 Jan 2026 11:42:00 +1030
In-Reply-To: <CAKkNK0JGjmurZQ4C5jnOBGAig3n24xr4FAxHpyvqWyTTTHW8eg@mail.gmail.com>
References: <20251202-msx4-v2-0-a605d448bd02@nvidia.com>
	 <20251202-msx4-v2-1-a605d448bd02@nvidia.com>
	 <CAKkNK0JOPAyw8HA0XnD836d115p5YBbo=uBD9eXXvByzCv92Yg@mail.gmail.com>
	 <aVxRrM14yN3YZ6Xo@molberding.nvidia.com>
	 <CAKkNK0JGjmurZQ4C5jnOBGAig3n24xr4FAxHpyvqWyTTTHW8eg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, 2026-01-06 at 17:52 +0300, Ivan Mikhaylov wrote:
> On Tue, Jan 6, 2026 at 3:05=E2=80=AFAM Marc Olberding <molberding@nvidia.=
com> wrote:
> >=20
> > On Sat, Jan 03, 2026 at 12:24:07AM +0300, =D0=98=D0=B2=D0=B0=D0=BD =D0=
=9C=D0=B8=D1=85=D0=B0=D0=B9=D0=BB=D0=BE=D0=B2 wrote:
> > > On Wed, Dec 3, 2025 at 2:53=E2=80=AFAM Marc Olberding <molberding@nvi=
dia.com> wrote:
> > > >=20
> > > > Adds support for disabling the ast2600 FMC_WDT2 through
> > > > a device tree entry in the fmc node.
> > > > Set `aspeed,watchdog-disable` in your device tree to have
> > > > the driver disable it.
> > >=20
> > > Marc, FMC_WDT2 doesn't disable watchdog, it controls ABR mode.
> > > Watchdog with or without ABR still in operational mode.
> > > So, maybe aspeed,abr-disable?
> > >=20
> > > Below namings probably should be corrected.
> > We aren't disabling ABR mode with this change, right? That's only
> > done through hardware straps or OTP changes. All this is doing is clear=
ing bit 0
> > of FMC64, which per the datasheet disables the watchdog. The idea here =
is
> > to just allow boot to progress normally, without the watchdog. For ping=
 pong update,
> > userspace can flash the alternative SPI and re-enable the watchdog time=
r on complete,
> > and the BMC will boot from the new image upon reset. Let me know if I'm=
 misunderstanding
> > your comment.
> >=20
>=20
> Marc, when you clrbits_le on FMC64/FMC_WDT2, then you disable ABR mode, I
> assume you can check it with evb board or ast2600-a3 to prove. On my boar=
d
> ast2600-a3 it works in that way I described with enabled OTP strap for AB=
R.

Can you elaborate on the sequences involved?

The reset definitions for the FMC suggest it's affected by an ARM
reset, which should in-turn reinitialise FMC_WDT2 and follow the boot
flow to enable the ABR again. In my understanding disabling it in
firmware shouldn't prevent ABR operations subsequent to future resets?

Further, the aspeed,watchdog-disable property is to be taken in the
context of the node with the FMC compatible string, referring to the
FMC's watchdog and not the (separate) SoC watchdogs. However the FMC
does have multiple watchdogs, one for address mode detection and the
other for ABR. So maybe the name of the property could be improved in
that regard. I think it's still reasonable to have watchdog in the
name. My immediate reaction is that "aspeed,abr-disable" overstates its
behaviour. How about "aspeed,abr-watchdog-disable"? Previous
suggestions were "fmc-wdt2-disable", and the current "aspeed,watchdog-
disable"

>=20
> Also description of it in 14.2.2 Alternative Boot Recovery Function.

The second bullet in that section says:

   When the firmware booting successfully, it should disable FMC_WDT2
   to stop booting switch

This is what Marc is trying to achieve by providing the property. Other
platforms may want to make the choice elsewhere.

Andrew

