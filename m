Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13A3C85CACE
	for <lists+openbmc@lfdr.de>; Tue, 20 Feb 2024 23:37:10 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=JvGHSM+X;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TfZ5w02J7z3cQ4
	for <lists+openbmc@lfdr.de>; Wed, 21 Feb 2024 09:37:08 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=JvGHSM+X;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TfZ5K0p2fz2xQB;
	Wed, 21 Feb 2024 09:36:36 +1100 (AEDT)
Received: from [192.168.68.112] (ppp14-2-85-8.adl-apt-pir-bras31.tpg.internode.on.net [14.2.85.8])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 0932F20154;
	Wed, 21 Feb 2024 06:36:31 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1708468595;
	bh=bAguqTpdGJckXBQC6UU/JtFufFB52QFTiS2nWxrqpUE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=JvGHSM+XE/LFqrPlzs/radD0aS5koT/XXbKC+5mTXe6+C84/j1oB2KyYI2nZwlYcB
	 bp0GCyOYK7oE0hvZP9pDKJg6jFPISq8gptEe53VmSFw2nT+R6C2q+S5rwgso7w87Rq
	 bX6rpccgD0aXvwZOCqE4qYRId4gfSVGRgAAKcqbnr6zc877YGcMr7/naV9GJ4tht7g
	 1lP+viKKdNCuLBlek3PBk1ecAcok8YyyM2Boc6dVAKt5xBWvSP7dwPWMoYS9bjFHEv
	 H5AOrsTAhvieHyiaQMpFIq2s3BeXvfcoLlniTVsitjUZu8B17CfSAGcdF16ulYzxy9
	 YWgbPXnt01tvw==
Message-ID: <9680ad7d7a48fc36a0572dc2286a1229a29341fe.camel@codeconstruct.com.au>
Subject: Re: [PATCH] ipmi: kcs: Update OBF poll timeout to reduce latency
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: minyard@acm.org, Paul Menzel <pmenzel@molgen.mpg.de>
Date: Wed, 21 Feb 2024 09:06:29 +1030
In-Reply-To: <ZdT+eThnYqb3iawF@mail.minyard.net>
References: <20240220123615.963916-1-geissonator@gmail.com>
	 <a9169894-6972-49c0-a1d4-d80863f5b511@molgen.mpg.de>
	 <ZdT+eThnYqb3iawF@mail.minyard.net>
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
Cc: linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, joel@jms.id.au, openipmi-developer@lists.sourceforge.net, Andrew Geissler <geissonator@yahoo.com>, openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 2024-02-20 at 13:33 -0600, Corey Minyard wrote:
> On Tue, Feb 20, 2024 at 04:51:21PM +0100, Paul Menzel wrote:
> > Dear Andrew,
> >=20
> >=20
> > Thank you for your patch. Some style suggestions.
> >=20
> > Am 20.02.24 um 13:36 schrieb Andrew Geissler:
> > > From: Andrew Geissler <geissonator@yahoo.com>
> >=20
> > (Oh no, Yahoo. (ignore))
> >=20
> > You could be more specific in the git commit message by using *Double*:
> >=20
> > > ipmi: kcs: Double OBF poll timeout to reduce latency
> >=20
> > > ipmi: kcs: Double OBF poll timeout to 200 us to reduce latency
> >=20
> > > Commit f90bc0f97f2b ("ipmi: kcs: Poll OBF briefly to reduce OBE
> > > latency") introduced an optimization to poll when the host has
>=20
> I assume that removing that patch doesn't fix the issue, it would only
> make it worse, right?

Yep.

>=20
> > > read the output data register (ODR). Testing has shown that the 100us
> > > timeout was not always enough. When we miss that 100us window, it
> > > results in 10x the time to get the next message from the BMC to the
> > > host. When you're sending 100's of messages between the BMC and Host,
> >=20
> > I do not understand, how this poll timeout can result in such an increa=
se,
> > and why a quite big timeout hurts, but I do not know the implementation=
.
>=20
> It's because increasing that number causes it to poll longer for the
> event, the host takes longer than 100us to generate the event, and if
> the event is missed the time when it is checked again is very long.
>=20
> Polling for 100us is already pretty extreme. 200us is really too long.
>=20
> The real problem is that there is no interrupt for this.  I'd also guess
> there is no interrupt on the host side, because that would solve this
> problem, too, as it would certainly get around to handling the interupt
> in 100us.  I'm assuming the host driver is not the Linux driver, as it
> should also handle this in a timely manner, even when polling.

I expect the issues Andrew G is observing are with the Power10 boot
firmware. The boot firmware only polls. The runtime firmware enables
interrupts.

>=20
> If people want hardware to perform well, they ought to design it and not
> expect software to fix all the problems.

+1

>=20
> The right way to fix this is probably to do the same thing the host side
> Linux driver does.  It has a kernel thread that is kicked off to do
> this.  Unfortunately, that's more complicated to implement, but it
> avoids polling in this location (which causes latency issues on the BMC
> side) and lets you poll longer without causing issues.

In Andrew G's case he's talking MCTP over KCS using a vendor-defined
transport binding (that also leverages LPC FWH cycles for bulk data
transfers)[1]. I think it could have taken more inspiration from the
IPMI KCS protocol: It might be worth an experiment to write the dummy
command value to IDR from the host side after each ODR read to signal
the host's clearing of OBF (no interrupt for the BMC) with an IBF
(which does interrupt the BMC). And doing the obverse for the BMC. Some
brief thought suggests that if the dummy value is read there's no need
to send a dummy value in reply (as it's an indicator to read the status
register). With that the need for the spin here (or on the host side)
is reduced at the cost of some constant protocol overhead.

[1]: https://github.com/openbmc/libmctp/blob/master/docs/bindings/vendor-ib=
m-astlpc.md


Andrew J
