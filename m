Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E6308FC0E8
	for <lists+openbmc@lfdr.de>; Wed,  5 Jun 2024 02:45:38 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=GidK7bLO;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vv7zg3j7Dz3dDn
	for <lists+openbmc@lfdr.de>; Wed,  5 Jun 2024 10:45:35 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=GidK7bLO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vv7z511lPz3bqB
	for <openbmc@lists.ozlabs.org>; Wed,  5 Jun 2024 10:45:04 +1000 (AEST)
Received: from [192.168.68.112] (ppp118-210-171-248.adl-adc-lon-bras34.tpg.internode.on.net [118.210.171.248])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 0A2D62009F;
	Wed,  5 Jun 2024 08:44:59 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1717548302;
	bh=oZBc4p7G+vlNUP7gz3/uXLlfQ8pBY3a6rPhlcPdPikI=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=GidK7bLOM2RKqCOwHM2pnGspYQCEx8ExH3tOkMg9EbkmKlGOsz6iKC4o/8fFNfc22
	 O1X/JSmO5N+NlwzWgg2PgVdOsCx0fOwXWFU0GgQliaGleOeCw/HgmbzXFREbzOFLdD
	 /LRxM7JBvznWjCp7zduq/upO9H8EmTajVlGGPiEXt4n31ikceXEDFWh4YGrX/o1hFM
	 Xv7gvEvqRVo0FLLLrKzsjY+NCdugg/VrE4EsExhtwwsTLx0OVOP2yj17ylPM9rVGm6
	 pXr3dWmmCdQHy8S9Iqd0v9MpXtoaM8rr9tGEdkvZ2nlOLbgaRBvDf5SbHz53J+vEF9
	 BYKabWtUgHl5Q==
Message-ID: <3a486664a9985e749a4fb68a1801d6af2c92af5c.camel@codeconstruct.com.au>
Subject: Re: [PATCH v1] ARM: dts: Aspeed: Add Facebook Minerva DTS
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Patrick Williams <patrick@stwcx.xyz>, Peter Yin
 <peteryin.openbmc@gmail.com>
Date: Wed, 05 Jun 2024 10:14:57 +0930
In-Reply-To: <Zl91dAo6NXDSQA3E@heinlein.vulture-banana.ts.net>
References: <20240604095720.2902647-1-peteryin.openbmc@gmail.com>
	 <Zl91dAo6NXDSQA3E@heinlein.vulture-banana.ts.net>
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
Cc: openbmc@lists.ozlabs.org, joel@jms.id.au, peter.yin@quantatw.com, yang.chen@quantatw.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 2024-06-04 at 15:13 -0500, Patrick Williams wrote:
> On Tue, Jun 04, 2024 at 05:57:20PM +0800, Peter Yin wrote:
> > Initial introduction of Facebook Minerva
> > equipped with Aspeed 2600 BMC SoC.
> >=20
> > Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
> > ---
> >  arch/arm/dts/Makefile            |  1 +
> >  arch/arm/dts/ast2600-minerva.dts | 66 ++++++++++++++++++++++++++++++++
> >  2 files changed, 67 insertions(+)
> >  create mode 100644 arch/arm/dts/ast2600-minerva.dts
>=20
> Is this targeting u-boot?
>=20

(if so, please add 'u-boot' via `--subject-prefix` for downstream
openbmc patches, to help us route them to the expected repo)

Andrew
