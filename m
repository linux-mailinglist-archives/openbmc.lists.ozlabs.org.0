Return-Path: <openbmc+bounces-785-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 977DFBF90FB
	for <lists+openbmc@lfdr.de>; Wed, 22 Oct 2025 00:35:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4crnDl3gzRz2yxG;
	Wed, 22 Oct 2025 09:35:19 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761086119;
	cv=none; b=Dpm35/ytWoj+YCsvF5zX6AjESLxRF7ItoAfp2tBGOToPy06ZCSu6+11bjKMpqbk0ucg/eg125uuLy5dxYFXdI23peGuNuBB91Nz4kiBalx2Rszi0WaRpS7GPAXt6Bn2jWprwNZ/Ld1o24Du8vpwvXLSq9/IxB8AVEOadOM1dIffeOCmnk8PeqCz8zKNWPIX1+O83SNBW76vU2vJTLhW9Vz2Rl2WM5ZiSwTU/sFd5iKhXqhj05xR8l3F4w3sKUQpXgOVlDTFihDKhVDAy+EdR8X4ajK/NK13nkV5yvKAewtwHHhViKDe28riOhuFnoMvkUSQBPeI54e44Ac9hrTMcPg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761086119; c=relaxed/relaxed;
	bh=j6Z5RyFXrHpvFc4eRiFbkrrxzN6WfAoXMcnq2pqicfw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UlBdqPc3fRSozTdqoMRSYerkHNrkGEMk7nELgFkzNWkI06Uc3FlUXo9NSCSy57snTReusRu2Zx7mAVhxsDxYF2Hjx1wBCuvpAWqfl5RLZi9GNid3zIw13APfkWeYGXu277FkwmgN690wCLPJzKAQTWhOmJXQ9r01NTYvNPkdZNSwB+MkS7Y9rdAh1bXWN3tMFEaW9UihResSskOpjBRif3AQi/Rpd9xH1ZrVo8fwfk3ha7snC7/ZsTBnSlDcgfG3OGWk2ymVd82JxRCwmmbmxNblfWn53bG6iMx/KgOUR5Bvx8DQP8CNjkx13cVhfG5o5S/7+3cya8XnLQWyg8r7qA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=NwVzHpcr; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=NwVzHpcr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4crnDk0JM2z2yjp;
	Wed, 22 Oct 2025 09:35:18 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1761086116;
	bh=j6Z5RyFXrHpvFc4eRiFbkrrxzN6WfAoXMcnq2pqicfw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=NwVzHpcr0vkIJvUKi4uJ0cl729CK2k58bT2Z9Ridpa0BoeNFzr4MFJoyHmGl5fbzL
	 gYMCighc5YVlazpkf8da3p75/KNSwBfP0ZG2KsCPTB4YLtUh+alrSexKuCyr7nNRkG
	 LBhYY6ftXBx6U6YFmeKdl+dzpeEh+kIivnR6uYPC9VMKf6dBXAzF4L4vdCQqKHRTaV
	 8lolNXRaQ+P5jNzfc7yWl5ErfUyvSn6RrmZIMqxg3QnMC9O13/h/SYXQQVE1VE1Hbw
	 L0da78AKJ5pE5O8L81Bkf01EzxTShIlzcfSiZFAkH2K4nmMtgdASu2tgLNzHs+f6IQ
	 QTIbNS/9CZZpg==
Received: from [192.168.68.113] (unknown [180.150.112.213])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id C76C57406C;
	Wed, 22 Oct 2025 06:35:13 +0800 (AWST)
Message-ID: <4aa22124cefc6bd23d75bdb0d5a85a2f38c22a77.camel@codeconstruct.com.au>
Subject: Re: [PATCH] peci: controller: peci-aspeed: convert from
 round_rate() to determine_rate()
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: "Winiarska, Iwona" <iwona.winiarska@intel.com>, 
 "gregkh@linuxfoundation.org"
	 <gregkh@linuxfoundation.org>, "bmasney@redhat.com" <bmasney@redhat.com>
Cc: "joel@jms.id.au" <joel@jms.id.au>, "linux-aspeed@lists.ozlabs.org"
	 <linux-aspeed@lists.ozlabs.org>, "sboyd@kernel.org" <sboyd@kernel.org>, 
 "linux-kernel@vger.kernel.org"
	 <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	 <linux-arm-kernel@lists.infradead.org>, "linux-clk@vger.kernel.org"
	 <linux-clk@vger.kernel.org>, "openbmc@lists.ozlabs.org"
	 <openbmc@lists.ozlabs.org>, "mripard@kernel.org" <mripard@kernel.org>
Date: Wed, 22 Oct 2025 09:05:13 +1030
In-Reply-To: <d53256b35ee7089607463c66bb4a8c3420faf058.camel@intel.com>
References: <20250810-peci-round-rate-v1-1-ec96d216a455@redhat.com>
			 <aMatZAX6eFI1RmDH@redhat.com>
			 <28dc3bd8aeca7e3164747960747f75060c596704.camel@codeconstruct.com.au>
			 <aPEZSY6RC-UVclxN@redhat.com>
			 <ba2e6b78e59afb7c89e5022770a142ec8c31659a.camel@codeconstruct.com.au>
			 <2025101759-runner-landing-374b@gregkh>
			 <2975918e3f3a7de245e93fbee52335acb78bb23a.camel@codeconstruct.com.au>
			 <2025101721-twiddling-huskiness-4852@gregkh>
		 <13566a08eeaed313ad789abcae1920d9b00483b0.camel@codeconstruct.com.au>
	 <d53256b35ee7089607463c66bb4a8c3420faf058.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1 
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

On Tue, 2025-10-21 at 21:01 +0000, Winiarska, Iwona wrote:
> On Mon, 2025-10-20 at 09:30 +1030, Andrew Jeffery wrote:
> > On Fri, 2025-10-17 at 09:43 +0200, Greg Kroah-Hartman wrote:
> > > On Fri, Oct 17, 2025 at 05:57:44PM +1030, Andrew Jeffery wrote:
> > > > On Fri, 2025-10-17 at 08:41 +0200, Greg Kroah-Hartman wrote:
> > > > > On Fri, Oct 17, 2025 at 04:52:37PM +1030, Andrew Jeffery wrote:
> > > > > > Hi Greg,
> > > > > >=20
> > > > > > On Thu, 2025-10-16 at 12:11 -0400, Brian Masney wrote:
> > > > > > > Hi Andrew and Iwona,
> > > > > > >=20
> > > > > > > On Mon, Sep 15, 2025 at 02:36:48PM +0930, Andrew Jeffery wrot=
e:
> > > > > > > > Hi Brian,
> > > > > > > >=20
> > > > > > > > On Sun, 2025-09-14 at 07:56 -0400, Brian Masney wrote:
> > > > > > > > > Hi Iwona, Joel, and Andrew,
> > > > > > > > >=20
> > > > > > > > > On Sun, Aug 10, 2025 at 06:21:51PM -0400, Brian Masney wr=
ote:
> > > > > > > > > > The round_rate() clk ops is deprecated, so migrate this
> > > > > > > > > > driver from
> > > > > > > > > > round_rate() to determine_rate() using the Coccinelle
> > > > > > > > > > semantic patch
> > > > > > > > > > appended to the "under-the-cut" portion of the patch.
> > > > > > > > > >=20
> > > > > > > > > > Signed-off-by: Brian Masney <bmasney@redhat.com>
> > > > > > > > >=20
> > > > > > > > > Would it be possible to get this picked up for v6.18? I'd
> > > > > > > > > like to remove
> > > > > > > > > this API from drivers/clk in v6.19.
> > > > > > > >=20
> > > > > > > > My (strong) preference is that Iwona applies it, but I'll k=
eep
> > > > > > > > an eye
> > > > > > > > out for any unusual delays.
> > > > > > >=20
> > > > > > > This patch wasn't picked up for v6.18. Any chance this can ge=
t
> > > > > > > picked up
> > > > > > > now for v6.19?
> > > > > > >=20
> > > > > > > I'm hoping to get this merged so that we can remove the
> > > > > > > round_rate() clk
> > > > > > > op from the clk core. The clk maintainer (Stephen) mentioned =
this
> > > > > > > work
> > > > > > > in his last pull to Linus.
> > > > > > >=20
> > > > > > > https://lore.kernel.org/linux-clk/20251007051720.11386-1-sboy=
d@kernel.org/
> > > > > >=20
> > > > > > Are you happy to pick this up directly in Iwona's absence?
> > > > >=20
> > > > > Why me?
> > > >=20
> > > > I figured that would be sensible since Iwona historically sent you =
PRs
> > > > for the PECI subsystem.
> > >=20
> > > I did not remember that, sorry.
> > >=20
> >=20
> > No worries.
> >=20
> > > =C2=A0 The MAINTAINERS file does not mention
> > > this at all, and it lists many other maintainers that should be able =
to
> > > take this patch:
> > > 	$ ./scripts/get_maintainer.pl=C2=A0 drivers/peci/controller/peci-
> > > aspeed.c
> > > 	Iwona Winiarska <iwona.winiarska@intel.com> (maintainer:ASPEED PECI
> > > CONTROLLER)
> > > 	Joel Stanley <joel@jms.id.au> (maintainer:ARM/ASPEED MACHINE
> > > SUPPORT)
> > > 	Andrew Jeffery <andrew@codeconstruct.com.au> (maintainer:ARM/ASPEED
> > > MACHINE SUPPORT)
> >=20
> > Iwona currently appears unresponsive, as mentioned. Joel's stepped back
> > from maintaining the ASPEED bits as of earlier this year; I worked with
> > him to add myself as a maintainer there, hence the last entry, and now
> > getting in touch with you.
> >=20
> > I can apply the patch and send you a PR if that helps, if Iwona doesn't
> > respond in the mean time.
>=20
> Hi!
>=20
> Sorry for the delay - for some reason this entire thread didn't land in m=
y inbox
> and I just found it now, randomly browsing mailing list :/
>=20
> I will sent it as a PR for v6.19.

Ah, super! Thanks Iwona.

Andrew

