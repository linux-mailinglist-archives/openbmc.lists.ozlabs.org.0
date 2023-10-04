Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B7E57B9867
	for <lists+openbmc@lfdr.de>; Thu,  5 Oct 2023 00:53:38 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=avckHbHo;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S19336pnvz3cP7
	for <lists+openbmc@lfdr.de>; Thu,  5 Oct 2023 09:53:35 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=avckHbHo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S192Q2M5Rz307V
	for <openbmc@lists.ozlabs.org>; Thu,  5 Oct 2023 09:53:02 +1100 (AEDT)
Received: from [192.168.68.112] (ppp118-210-84-62.adl-adc-lon-bras32.tpg.internode.on.net [118.210.84.62])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id A3106200DB;
	Thu,  5 Oct 2023 06:52:57 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1696459978;
	bh=vEIQaHEXR3HyAWTY+2E3QsilkBS84zJlXGnVwLjiNAM=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=avckHbHovkJ5MNxR+Zyl+PZ0tjdXYqppPg0UcVNJ4NDC26S4pfReCGSvLJQQBO+7H
	 CwIXsX/U66p3WAP95H/+wRTopxd5by6lpfFnQuiNXfKuOTcyXhHawtbbcUpwyV/MNT
	 xavi1Z653u810Uy+rcu4K7/OLiziJutZC5ooZKCXW+UJ6td1ktGbQ9mqkXAYPXVHam
	 Dbq0t3aFOx6DuncRDCGC8dymr0DkSe/PH7EFFD7ZjRNKEXVA6kVFCCXYLgCqE0JF/f
	 tYnDip4z6GV8kC1t6gIeVgA8+RFfCHsiy/F4YakOfDXjhGhgmY0DxSl+GW84Z8AlPe
	 ncoAK6zSWpT/w==
Message-ID: <5dcbd06f90de39f191eabacf61f0e42d9719bbac.camel@codeconstruct.com.au>
Subject: Re: Aspeed SuperIO runtime management
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Zev Weiss <zweiss@equinix.com>, "openbmc@lists.ozlabs.org"
	 <openbmc@lists.ozlabs.org>
Date: Thu, 05 Oct 2023 09:22:53 +1030
In-Reply-To: <20231004003427.GI19997@packtop>
References: <20231004003427.GI19997@packtop>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 2023-10-04 at 00:34 +0000, Zev Weiss wrote:
> Hello all,
>=20
> I was hoping to gather any thoughts in the community on how best to deal
> with a problem I've encountered on my latest OpenBMC platform port (but
> which I think might be relevant to some other systems as well).
>=20
> For reasons I don't fully understand but that I think are orthogonal to
> this particular issue, the platform in question can't use the Aspeed
> VUART, and so instead uses two SUARTs configured back-to-back via the
> UART mux to provide the host's serial console.  The host's firmware thus
> enables its UART early in the host boot sequence, which requires that
> the AST2500's built-in SuperIO device be enabled (SCU70[20]=3D0).

Is part of the issue that it's difficult to change the initialisation=20
sequence in the host firmware here? I assume host firmware doesn't=20
behave very well if you disable SuperIO entirely?

If host firmware doesn't completely bail out, would the PUARTs help?

Essentially you can configure UART1 and UART2 to behave as if they were
VUARTs in the sense that they're configurable from the BMC-side, but=20
with the benefit (?) of still doing TTL serial signalling internally=20
and being hooked up to the UART mux.

The big caveat is I haven't actually tried this myself so have no=20
feel for the potential traps, and may in-fact be imagining the
functionality. However, see the description of the PUARTs at the end of
43.1 (pg 669) in ast2500v17.pdf

> Unfortunately that exposes the BMC to some of the CVE-2019-6260
> ("pantsdown") vulnerabilities, which is a pretty big downside, and one
> that I'd like to minimize as much as I can.
>=20
> The SuperIO only really *needs* to be enabled during the window of time
> in which the host firmware performs the UART-enable sequence; once it's
> up and running I can manually disable it without any adverse effects.
> So what I'd ideally like is to have the BMC enabling and disabling the
> SuperIO at runtime, turning it on only when it's expected to be needed
> and then turning it back off so as to minimize the exposure to known
> security holes (while in general I wouldn't like the BMC to consider the
> BIOS/UEFI code as "trusted", it's hopefully at least less actively
> hostile than whatever might be running when the host OS is booted).
>=20
> To that end, what I've currently got consists of:
>=20
>  1. A kernel tweak (currently hacked onto the aspeed-socinfo driver) to
>     expose the SuperIO enable/disable state as a read/write sysfs file,
>     and
>=20
>  2. A patch to x86-power-control using that file to enable the SuperIO
>     when the host's POST-complete signal is deasserted (and disable it
>     when it's asserted).
>=20
> Aside from being a bit of a kludge (and a fairly special-purpose one at
> that), the major drawback with this approach is that it seems kind of
> inherently racy.  When the host resets and the POST-complete signal
> deasserts, there's nothing synchronizing the BMC and the host to ensure
> that the BMC does in fact enable the SuperIO before the host tries to
> access it when it goes to enable the UART.  In the stress-testing I've
> done (including swamping the BMC with artificial CPU & interrupt load) I
> haven't ever seen it "lose" the race, but I don't have a terribly
> accurate sense of how tight the window of time really is.

I assume it's not enough to live with maintaining BMC integrity but not
confidentiality by putting the iLPC2AHB into read-only mode and leaving
SuperIO enabled?

Andrew
