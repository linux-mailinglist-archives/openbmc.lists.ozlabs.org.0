Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 354778AA5C6
	for <lists+openbmc@lfdr.de>; Fri, 19 Apr 2024 01:26:32 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=bA31r1wB;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VLDS60HCdz3cX1
	for <lists+openbmc@lfdr.de>; Fri, 19 Apr 2024 09:26:30 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=bA31r1wB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VLDRW159fz3cND;
	Fri, 19 Apr 2024 09:25:58 +1000 (AEST)
Received: from [192.168.68.112] (ppp14-2-127-66.adl-apt-pir-bras32.tpg.internode.on.net [14.2.127.66])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id CC2AA20154;
	Fri, 19 Apr 2024 07:25:53 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1713482756;
	bh=n2UHL99uaGsfsj1oKBoMTKFPOIfdpWMIG66YRfhg+Og=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=bA31r1wB447iXQ2yDGpqa1bbUh9uR+qnkVQ/92tPZS3uNBn4D3mV8iP0iU6upmWEG
	 WFmUVk/uQGTuA/cPGu7vOtQdHb3Al21lTpu7p3mVyhkyJdmVD3Qwlws4vdFb/IrjAJ
	 zfrM/02NxB30VXsDXV7mDXMYpVR4GPc++0utrCaNcu99+iiqdyDvXlIQcN4Ceuh8Ja
	 sjaTKQrws3SspkZxw7rG5KgJQTFWhODLC3Dugpdj+IqdBoRzVc+XyPZW7Atn5Zp9qO
	 yxn/XAjCflkO2FaU18NbvszRaBxaUEsHpqbJQTFK1cPyNLpFVC7OaR4sOjMc0eOvTz
	 W1J5wGfQCwsdw==
Message-ID: <1583360debaee14a988e4019cf30250f6eb4d8da.camel@codeconstruct.com.au>
Subject: Re: [PATCH] peci: aspeed: Clear clock_divider value before setting
 it
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: "Winiarska, Iwona" <iwona.winiarska@intel.com>, 
	"linux-aspeed@lists.ozlabs.org"
	 <linux-aspeed@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org"
	 <linux-arm-kernel@lists.infradead.org>, "openbmc@lists.ozlabs.org"
	 <openbmc@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
	 <linux-kernel@vger.kernel.org>
Date: Fri, 19 Apr 2024 08:55:51 +0930
In-Reply-To: <7520ac6ef7afae66f9b1636e5806ff2bfd93584d.camel@intel.com>
References: <20240417134849.5793-1-iwona.winiarska@intel.com>
	 <7b0ef5c90138e8c1d1829de249a480709170141b.camel@codeconstruct.com.au>
	 <7520ac6ef7afae66f9b1636e5806ff2bfd93584d.camel@intel.com>
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
Cc: "billy_tsai@aspeedtech.com" <billy_tsai@aspeedtech.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 2024-04-18 at 13:41 +0000, Winiarska, Iwona wrote:
> On Thu, 2024-04-18 at 09:11 +0930, Andrew Jeffery wrote:
> > Hi Iwona,
> >=20
> > On Wed, 2024-04-17 at 15:48 +0200, Iwona Winiarska wrote:
> > > PECI clock divider is programmed on 10:8 bits of PECI Control registe=
r.
> > > Before setting a new value, clear bits read from hardware.
> > >=20
> > > Signed-off-by: Iwona Winiarska <iwona.winiarska@intel.com>
> >=20
> > I think it would be best to add a Fixes: tag and Cc: stable in
> > accordance with the stable tree rules. Are you happy to do so?
>=20
> Hi!
>=20
> Technically, the initial value of this register should be 0, but I've add=
ed the
> clear just to be on the safe side and to not have to rely on that.

Yeah, it could cause havoc with an unbind/bind sequence if people are
messing with the clocks in between.

> I don't think we're ever programming invalid values in the real-world sce=
narios,
> and because of that - I don't think this is stable material.

Right, I don't expect people are doing the above in environments where
stability is a concern.

Thanks for elaborating.

Andrew
