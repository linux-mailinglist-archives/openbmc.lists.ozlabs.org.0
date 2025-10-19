Return-Path: <openbmc+bounces-769-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 45D16BEEE64
	for <lists+openbmc@lfdr.de>; Mon, 20 Oct 2025 01:00:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cqYtl1WDGz2yjv;
	Mon, 20 Oct 2025 10:00:31 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760914831;
	cv=none; b=LAb+Aeko/IpZe5/cSr6sqqtbICsmnFNsba8osePVTQZj8TZrnG7wsy3xQvK7J4VN1XPgeaJyN1Co1xQYu8W5kHV4PTjTgL180KbdwgwMgPPRDY3g3Pq3ari1qEyVzsOYrla7WYPhhdvkqXrbtQcZ6ISJC6pH4oCHYUUK7rm0cHYYLIW7kfoXJjKvVw0KCF0yScU46qTVRpW2OsyxjA8ZgroYn4ZtYxVB8z6WDuVx/IMj2SYok71J20oaWebEMFOxWHnF/8yBjiazduRo21iwLfXgA/RiL5c1+NNdRDsDzgTcH5HHBqexc+7AODfMsRLhabzyCIkVpBxBDl9aBw4Vpg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760914831; c=relaxed/relaxed;
	bh=YL+/KBVBt7ybXFRGcP41DFJKQfuf10A0qEbi6RFqyFg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=d2c0zB+hdCpg5OgJOb+sHujr5oOvsAnjHx9uWhR2LPfwLZh1CsYeBjvqQka6D5Q/eBbiAcUbWZM6whl+YBuGBOpC04fMtIonid1e/TxGvBXC7fmofHPlHKERHPEHFSge5ygGXX6Rhf3TGQPmjPHqM4N3bzSTl12P7fg8jCTisdlw1vvOk8cPL9vEskrFMGxMNCk2BQRj/NTTdyfWEHyfBfzbYaKWKRiJoQ5FJQ1GBeQL25fwebklleJ8ZlE9cJtDzJuq4LDP6kkFy6bKBQaKE6IBH/BNAP1yPE/oPiw3sC4QNkWl1iYXSqDmuMMsNidDQMuoqL+H5rn25hOpZS/+PQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=EBetrH7M; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=EBetrH7M;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cqYtj67w1z2ygH;
	Mon, 20 Oct 2025 10:00:29 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1760914827;
	bh=YL+/KBVBt7ybXFRGcP41DFJKQfuf10A0qEbi6RFqyFg=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=EBetrH7Mpg1i1zFMo8JaQBs+Cjt3hHOhLBkGvVSs7waTLYIOzg9cqMNtrXUZAOat7
	 zJ6rFaO2+KA/ZfRSDelAVV5cxNxEfrycVHUI2CFYGZD7Ch9+/IWskmiCxCwukNem8F
	 kPTVGo3/XVioCSuH67PQZZ2g1yW2DO2UQiHCf3I8/e56hejAHIGNjEVj0rI4rISro+
	 v2C8BN0ZR9tVobn3cUyCLbBKF47AqKlXWyabKdhiEXCD5r4NN84ic+0Q7Wn5RYmFsn
	 JwKp9Eipxql3mS9Ut+hwivy5RLaCu9IezcvHUCFkyA+LCdt27GTR5DluXFH6cSx011
	 KpY+zwcV3Impg==
Received: from [192.168.68.113] (unknown [180.150.112.213])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 0C68E6CA42;
	Mon, 20 Oct 2025 07:00:17 +0800 (AWST)
Message-ID: <13566a08eeaed313ad789abcae1920d9b00483b0.camel@codeconstruct.com.au>
Subject: Re: [PATCH] peci: controller: peci-aspeed: convert from
 round_rate() to determine_rate()
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Brian Masney <bmasney@redhat.com>, Iwona Winiarska
	 <iwona.winiarska@intel.com>, Joel Stanley <joel@jms.id.au>, Maxime Ripard
	 <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	linux-clk@vger.kernel.org, linux-aspeed@lists.ozlabs.org, 
	openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Date: Mon, 20 Oct 2025 09:30:16 +1030
In-Reply-To: <2025101721-twiddling-huskiness-4852@gregkh>
References: <20250810-peci-round-rate-v1-1-ec96d216a455@redhat.com>
	 <aMatZAX6eFI1RmDH@redhat.com>
	 <28dc3bd8aeca7e3164747960747f75060c596704.camel@codeconstruct.com.au>
	 <aPEZSY6RC-UVclxN@redhat.com>
	 <ba2e6b78e59afb7c89e5022770a142ec8c31659a.camel@codeconstruct.com.au>
	 <2025101759-runner-landing-374b@gregkh>
	 <2975918e3f3a7de245e93fbee52335acb78bb23a.camel@codeconstruct.com.au>
	 <2025101721-twiddling-huskiness-4852@gregkh>
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

On Fri, 2025-10-17 at 09:43 +0200, Greg Kroah-Hartman wrote:
> On Fri, Oct 17, 2025 at 05:57:44PM +1030, Andrew Jeffery wrote:
> > On Fri, 2025-10-17 at 08:41 +0200, Greg Kroah-Hartman wrote:
> > > On Fri, Oct 17, 2025 at 04:52:37PM +1030, Andrew Jeffery wrote:
> > > > Hi Greg,
> > > >=20
> > > > On Thu, 2025-10-16 at 12:11 -0400, Brian Masney wrote:
> > > > > Hi Andrew and Iwona,
> > > > >=20
> > > > > On Mon, Sep 15, 2025 at 02:36:48PM +0930, Andrew Jeffery wrote:
> > > > > > Hi Brian,
> > > > > >=20
> > > > > > On Sun, 2025-09-14 at 07:56 -0400, Brian Masney wrote:
> > > > > > > Hi Iwona, Joel, and Andrew,
> > > > > > >=20
> > > > > > > On Sun, Aug 10, 2025 at 06:21:51PM -0400, Brian Masney wrote:
> > > > > > > > The round_rate() clk ops is deprecated, so migrate this
> > > > > > > > driver from
> > > > > > > > round_rate() to determine_rate() using the Coccinelle
> > > > > > > > semantic patch
> > > > > > > > appended to the "under-the-cut" portion of the patch.
> > > > > > > >=20
> > > > > > > > Signed-off-by: Brian Masney <bmasney@redhat.com>
> > > > > > >=20
> > > > > > > Would it be possible to get this picked up for v6.18? I'd
> > > > > > > like to remove
> > > > > > > this API from drivers/clk in v6.19.
> > > > > >=20
> > > > > > My (strong) preference is that Iwona applies it, but I'll keep
> > > > > > an eye
> > > > > > out for any unusual delays.
> > > > >=20
> > > > > This patch wasn't picked up for v6.18. Any chance this can get
> > > > > picked up
> > > > > now for v6.19?
> > > > >=20
> > > > > I'm hoping to get this merged so that we can remove the
> > > > > round_rate() clk
> > > > > op from the clk core. The clk maintainer (Stephen) mentioned this
> > > > > work
> > > > > in his last pull to Linus.
> > > > >=20
> > > > > https://lore.kernel.org/linux-clk/20251007051720.11386-1-sboyd@ke=
rnel.org/
> > > >=20
> > > > Are you happy to pick this up directly in Iwona's absence?
> > >=20
> > > Why me?
> >=20
> > I figured that would be sensible since Iwona historically sent you PRs
> > for the PECI subsystem.
>=20
> I did not remember that, sorry.
>=20

No worries.

> =C2=A0 The MAINTAINERS file does not mention
> this at all, and it lists many other maintainers that should be able to
> take this patch:
> 	$ ./scripts/get_maintainer.pl=C2=A0 drivers/peci/controller/peci-aspeed.=
c
> 	Iwona Winiarska <iwona.winiarska@intel.com> (maintainer:ASPEED PECI CONT=
ROLLER)
> 	Joel Stanley <joel@jms.id.au> (maintainer:ARM/ASPEED MACHINE SUPPORT)
> 	Andrew Jeffery <andrew@codeconstruct.com.au> (maintainer:ARM/ASPEED MACH=
INE SUPPORT)

Iwona currently appears unresponsive, as mentioned. Joel's stepped back
from maintaining the ASPEED bits as of earlier this year; I worked with
him to add myself as a maintainer there, hence the last entry, and now
getting in touch with you.

I can apply the patch and send you a PR if that helps, if Iwona doesn't
respond in the mean time.

Andrew

> 	linux-aspeed@lists.ozlabs.org=C2=A0(moderated list:ASPEED PECI CONTROLLE=
R)
> 	openbmc@lists.ozlabs.org=C2=A0(moderated list:ASPEED PECI CONTROLLER)
> 	linux-arm-kernel@lists.infradead.org=C2=A0(moderated list:ARM/ASPEED MAC=
HINE SUPPORT)
> 	linux-kernel@vger.kernel.org=C2=A0(open list)
> 	ASPEED PECI CONTROLLER status: Supported
> 	PECI SUBSYSTEM status: Supported
> 	ARM/ASPEED MACHINE SUPPORT status: Supported
>=20
> thanks,
>=20
> greg k-h

