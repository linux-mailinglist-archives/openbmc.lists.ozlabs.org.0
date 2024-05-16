Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 875EA8C7EFE
	for <lists+openbmc@lfdr.de>; Fri, 17 May 2024 01:37:35 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=RFK293Xs;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VgRMx0Wvvz3fn5
	for <lists+openbmc@lfdr.de>; Fri, 17 May 2024 09:37:33 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=RFK293Xs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VgRMK52Vcz3cXt
	for <openbmc@lists.ozlabs.org>; Fri, 17 May 2024 09:37:01 +1000 (AEST)
Received: from [192.168.68.112] (ppp118-210-171-248.adl-adc-lon-bras34.tpg.internode.on.net [118.210.171.248])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 08322200E0;
	Fri, 17 May 2024 07:36:56 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1715902618;
	bh=3yUjFkQE52Z8p4HU/E/W+djGiZb/uTyx/XqbXcO/ENM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=RFK293XsEireZRuSMjWfrtrSuRUl/ATPv6dvbwXjE6V+7c4aSyFP4zF9RXovXSdgH
	 xNzrIp/Gh2B6SuQUqVhDuf2FBtkqU/6PfQrMazhIMezDkyJ7Mjvl1zeztw6d7J9ZRU
	 37fPnS9tVnc/P7MuM/k1Fs7OJGreiCPpFZa0lpIQRf7oA2AaLVBhQMq5hCDWDIVWRf
	 MU6/QdYar9k+BKMT6Nt+CnZDj0WbCIVwUpKs5//RnApp7vARRXn96iC+wtEJSw8oBY
	 WCmZXqmfPK2qkoqwaSEGjfpIVIGxb1buxR6VX9lYWz4tzgSvzOLhQnhRWTEUZoisfn
	 6GxVrsXkrKOEA==
Message-ID: <242c8e796123208e3a3d133a292b8409a03c0e89.camel@codeconstruct.com.au>
Subject: Re: [PATCH u-boot, v2019.04-aspeed-openbmc v1 1/1] ARM: dts:
 Aspeed: Add Facebook common dts
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Patrick Williams <patrick@stwcx.xyz>
Date: Fri, 17 May 2024 09:06:54 +0930
In-Reply-To: <ZkVxdHBLOG2BeRui@heinlein.vulture-banana.ts.net>
References: <20240513144917.952612-1-peteryin.openbmc@gmail.com>
	 <fe42afa01a7980d8934f437fbb01e2b27d46d7d9.camel@codeconstruct.com.au>
	 <CAPSyxFQ0DWMMAV87NUW-wmt8hudeK2PSDdgWCuiTbthDwAd=vw@mail.gmail.com>
	 <ff7a6703c15a93f5f776caa836f0d0ccf870415b.camel@codeconstruct.com.au>
	 <ZkVxdHBLOG2BeRui@heinlein.vulture-banana.ts.net>
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

On Wed, 2024-05-15 at 21:37 -0500, Patrick Williams wrote:
> On Thu, May 16, 2024 at 10:30:30AM +0930, Andrew Jeffery wrote:
> > On Wed, 2024-05-15 at 17:41 +0800, Peter Yin wrote:
> > > Hi Andrew,
> > >      Thank you for your reply, Do you mean something like this?
> > > compatible =3D "facebook,harma-bmc", "facebook,minerva-bmc", "aspeed,=
ast2600";
> > >=20
> >=20
> > Right. It removes the nebulous "common" concept that might be upset by
> > future changes.
>=20
> I agree that just "common" is probably not appropriate because this
> device tree only covers ast2600-based platforms.
>=20
> We are trying to design our BMC hardware such that at a u-boot level,
> the same device tree can be used for most of our platforms.
>=20

Seems sensible, but does this common design point have a name?
Otherwise it feels like a "coincidently similar" relationship, which
seems a bit ill-defined. Better to enumerate the specific platforms in
that case.

>   This is
> partially so we can avoid having to add new changes for u-boot for every
> new platform.

Not having to write new drivers or define drastically different
devicetrees feels like a useful goal. I don't feel tacking on a new
compatible here is particularly onerous (not that it even matters in
practice if you select only this specific devicetree in the u-boot
build).

Just wondering if we can avoid nebulous concepts, and rather keep
things concrete.

>=20
> Should we do something like "facebook,ast2600-standard"?
>=20

I guess I'm trying to guard-rail the discussion from the position of
the compatible strings should be documented in the DT schemas. Is this
something that would pass review upstream?

Andrew
