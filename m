Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B2FB18C7F88
	for <lists+openbmc@lfdr.de>; Fri, 17 May 2024 03:30:46 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=W5oikWKq;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VgTtX1HBxz3fph
	for <lists+openbmc@lfdr.de>; Fri, 17 May 2024 11:30:44 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=W5oikWKq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VgTsy3fy5z3fmy
	for <openbmc@lists.ozlabs.org>; Fri, 17 May 2024 11:30:14 +1000 (AEST)
Received: from [192.168.68.112] (ppp118-210-171-248.adl-adc-lon-bras34.tpg.internode.on.net [118.210.171.248])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id C1210200E0;
	Fri, 17 May 2024 09:30:11 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1715909412;
	bh=dihbwPEg4dA+PS/EOnP+wHVc3pE2jn78LpDHdnQdv08=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=W5oikWKqH2m9csNHYDGlxMI5ixk8ZKzo6eQsNK/dTVJednO9tRbjpmPJ4Geu5sfKM
	 nDT/nfyT41AVKL1/FmnH7yq5YxJ4523YeMh6ei7MKLrUPCEtIlwgjVdfanSrY73G71
	 rrZM/f8yOsgpbLQfGQCRZ71vN0Y23lxSSAfuxN0nAEMqlhLxWnJpXQIkGs9WcVRCnA
	 eih6uKQxyH++DX6jISfR1rP3CWuJiGuapeBI188KA38iYGPurUE778kZ+4w2C55m1n
	 fAVULrMamWmYaugWA1W70+12iVf3ny311Lbncil9cTHB6XubtMHXx5crzC72aaU666
	 oDR7Sp+wFX5uw==
Message-ID: <d1437d773ea682e85cd9f7197453e466ac362fb7.camel@codeconstruct.com.au>
Subject: Re: [PATCH u-boot, v2019.04-aspeed-openbmc v1 1/1] ARM: dts:
 Aspeed: Add Facebook common dts
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Patrick Williams <patrick@stwcx.xyz>
Date: Fri, 17 May 2024 11:00:08 +0930
In-Reply-To: <ZkawtsDBMGT-rTJx@heinlein.vulture-banana.ts.net>
References: <20240513144917.952612-1-peteryin.openbmc@gmail.com>
	 <fe42afa01a7980d8934f437fbb01e2b27d46d7d9.camel@codeconstruct.com.au>
	 <CAPSyxFQ0DWMMAV87NUW-wmt8hudeK2PSDdgWCuiTbthDwAd=vw@mail.gmail.com>
	 <ff7a6703c15a93f5f776caa836f0d0ccf870415b.camel@codeconstruct.com.au>
	 <ZkVxdHBLOG2BeRui@heinlein.vulture-banana.ts.net>
	 <242c8e796123208e3a3d133a292b8409a03c0e89.camel@codeconstruct.com.au>
	 <ZkawtsDBMGT-rTJx@heinlein.vulture-banana.ts.net>
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
Cc: openbmc@lists.ozlabs.org, Joel Stanley <joel@jms.id.au>, Peter Yin <peteryin.openbmc@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 2024-05-16 at 20:19 -0500, Patrick Williams wrote:
>=20
> I don't currently have a lot of faith that if we sent a trivial "add the
> new compatible" that it would be accepted in a timely manner.

Well, I'm responding to the patch because I intend to help you get it
merged. I'm trying to keep on top of the patches people send these
days. Can we give it a chance?

>=20
> > >=20
> > > Should we do something like "facebook,ast2600-standard"?
> > >=20
> >=20
> > I guess I'm trying to guard-rail the discussion from the position of
> > the compatible strings should be documented in the DT schemas. Is this
> > something that would pass review upstream?
>=20
> I don't know?  We're so far removed from upstream at this point that I
> see that as aspirational.  (Everyone using AST2600 is using u-boot
> 2019.04, which was 5 years ago.)

Sure, the tree is not in good shape. However, that doesn't mean we
should go adding fuel to the fire?

>=20
> Having said all this, I would love to do things as "right" as possible
> while still being able to make progress.  What is the right step?
>=20

That's what I'm trying to figure out in this discussion :) Currently my
thought is "better to keep things concrete and describe actual
platforms", rather than "make up a name for something that vaguely
exists only in principle". I asked about upstream because that allows
you to escape my thoughts and drive the patch through on someone else's
acceptance of your proposal :)

Andrew
