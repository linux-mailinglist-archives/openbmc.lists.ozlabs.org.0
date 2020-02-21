Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 44DFD168818
	for <lists+openbmc@lfdr.de>; Fri, 21 Feb 2020 21:11:21 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48PMzV3HDpzDqn4
	for <lists+openbmc@lfdr.de>; Sat, 22 Feb 2020 07:11:18 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.221;
 helo=new1-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm1 header.b=dQOj6DNh; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=vTXqGxqD; 
 dkim-atps=neutral
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48PMyb0SZczDqlm
 for <openbmc@lists.ozlabs.org>; Sat, 22 Feb 2020 07:10:29 +1100 (AEDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.nyi.internal (Postfix) with ESMTP id 3A4557488;
 Fri, 21 Feb 2020 15:10:25 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Fri, 21 Feb 2020 15:10:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=5RGWQ+iMIjwJJsnYXgKV8+tnrGD
 hJtQBHNtY2Owd7f4=; b=dQOj6DNhsYE8OUlfxYFl2zjh7GoFLtQ2jyUCG9qs90D
 Vc9ehGiivFb7Vez2HmonGgbo6+tk3sAyym0v00oShX8STVNCnKTSO6bjkQLHggdc
 y5lNDdQyNoFI8nQAOPOASIQJbS+RDAflXcWv9i9Pyx9yJrSEDYnBWqKcM+KKQZmU
 qEOwBLDyTrqqszAb31DE6NxGlz10W8cag/1dH9icCBQyZV8iUSlh7K2Z5oMWgrpQ
 f0iMgyq7e9bs5i7c6FBBv6UOmDVU9c9gWMhuIkmsiZkrPjSTBXYP9kcTP/yOxMix
 yU8iFfUb5nKIEuCwWzbKsnbsffvDXFWkIS97HhbuR3Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=5RGWQ+
 iMIjwJJsnYXgKV8+tnrGDhJtQBHNtY2Owd7f4=; b=vTXqGxqDbr8QYWg/zd0RSQ
 xITqS1+lxMQKy4LTUU4WPXyaJmo2DVlhXQzd24yRv7F4tkYHxVfVJqJnznYb+Vmr
 JNNh0Z9IcsbTD7558O6Fp9cvfuGoY3qF2YIT9eZR7jTwHiuz2HofBrJwcq/fXIkD
 89uRA/7enHPgEYuKEi1nhrlARJSp1sqCpkTMOk3Nuo8MQS64nUlD6aLz/yChgLug
 ED4QJRHzQ2Dolnn8v7BWtPskCNXaGbTOtIwgbOD1AL2wQRaMt+QgbRaFuuwVKbBy
 NfKI9Z7NjU4kKVIzfuEBpnbhvpEzQKzyCdocW/k/bYMD6B6t0cp8jBpCgcBf+ZIA
 ==
X-ME-Sender: <xms:MDlQXoorlDpm9Tn98AmQtjRKqXNrShJWT8ppqM7WUeQDJ8k4vQNYqQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrkeeggddufeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdlfeehmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
 vdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecukfhppeduieefrdduudegrddufedtrdduvdeknecuvehluhhs
 thgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhessh
 htfigtgidrgiihii
X-ME-Proxy: <xmx:MDlQXidaIScCYg5gE8X2m34KC-Btjx_r0uoj6LRA74NbssxTAYfllQ>
 <xmx:MDlQXmTMc-CiWPhWGFAMRZ9fRTv-Rc3n13VNlPs-rASe5lwTA0ikNw>
 <xmx:MDlQXjY6-jIxPuQMg1aB13VqzYOOxQZGMA5rmXWb8m8NubC1TgTESQ>
 <xmx:MDlQXnnvYriF_r8qxz0eGD1TDnBVFcEQIJSIjv10RFFCos_kmrGA8A>
Received: from localhost (unknown [163.114.130.128])
 by mail.messagingengine.com (Postfix) with ESMTPA id CD98E3060BE4;
 Fri, 21 Feb 2020 15:10:23 -0500 (EST)
Date: Fri, 21 Feb 2020 14:10:22 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Alexander Tereschenko <aleksandr.v.tereschenko@linux.intel.com>
Subject: Re: Security Working Group meeting - this Wednesday February 19 -
 summary results
Message-ID: <20200221201022.GA67957@patrickw3-mbp.dhcp.thefacebook.com>
References: <b9170918-0937-714a-470e-cb41e1e74b63@linux.ibm.com>
 <f4d9d6f6-277e-8c8b-6b5c-d0577eaa82cc@linux.ibm.com>
 <20200220162633.GB41328@patrickw3-mbp.dhcp.thefacebook.com>
 <2b30dde7-3415-8c7a-2001-28793e938339@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="AqsLC8rIMeq19msA"
Content-Disposition: inline
In-Reply-To: <2b30dde7-3415-8c7a-2001-28793e938339@linux.intel.com>
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--AqsLC8rIMeq19msA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 21, 2020 at 01:19:25PM +0100, Alexander Tereschenko wrote:
> On 20-Feb-20 17:26, Patrick Williams wrote:
> > Can we put something into bmcweb to detect its own
> > certificate has expired and generate a new one?
>=20
> The idea here is to discourage any prolonged use of the default self-sign=
ed
> certs at all, as they don't provide full protection from MitM attacks.
> That's why the 30 days validity period was suggested (compared to current=
 10
> years) and discussed during the meeting. Adding an auto-regeneration feat=
ure
> would be going directly against that idea, so I personally wouldn't vote =
for
> that.

To me, if bmcweb is handing out an expired self-signed certificate that
is a bug.  I don't think we should be so heavy-handed to decide for
others what "secure" means.  We can certainly propose best practices but
we should not force specific behavior.

I'm not suggesting that real certs aren't better than self-signed ones,
but some people have a well-isolated management network in a data center
behind locked doors.  They might decide that the likelihood of MitM attack
there isn't serious enough to devote engineering resources on a
certificate distribution scheme. (*)

We should keep in mind that part of the original motivation for this
project, and what keeps certain companies that don't market
general-purpose servers involved in it, is that they weren't satisfied
with the constraints being placed on them by the standard offering in
the industry.  If we become too heavy-handed here, we also lose that
advantage.

> > I know self-signed certs aren't great, but the minute I have more than 6
> > systems I'm not going to want to follow some "BMC Admin Guide" to update
> > certificates by hand.  So we're effectively forcing everyone to develop
> > some kind of certificate management infrastructure, without providing
> > (or pointing to an existing) implementation.
> I'd say that in such context, you'd be using one of the configuration
> management systems (Puppet/Chef/Salt/Ansible/homegrown scripts/whatnot)
> anyway, as that's a standard system administration BKM, so IMHO that's a
> reasonable assumption at the OpenBMC project end that it's not going to a=
dd
> any noticeable burden for BMC admins.

Fair.  But again, others might not feel that is a high enough value
problem to devote engineering resources to solve.

(*) Please don't read this as an implication into how my current
    employer's management network is or is not designed.
--=20
Patrick Williams

--AqsLC8rIMeq19msA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl5QOSwACgkQqwNHzC0A
wRk5yw/9H04Do5pxfCLUdroq/rGVOl1E2Lj+dDJdv8CJb3a2oRhJYTIUO2SecrGd
SlQYusw+eU543E8Zgw04zqzKC2qkE/YuHUerChqoD4LpY+XhMZpVQm7/lfWY6t4e
7+uCRxRrOwQYu1FduV00GtHvNJpDxB5cHLngLLc58CD5FS9iCYJUtR9Fd03JxfOd
KECmzqQ3uYPPkafZlq+bb8MbYAshEYP56/NDGwV3j5j0M+ooLCHti45QCedzg/oi
aZzOF0UcUZB/5o48uBi7x2vbaBXF4ejdLYu39TFsXtL/94ZoNbKlXCrNI3ZXlha7
ZD3gARjAfqQnMO6vhlItciyZkKGIpu5bAgTUofb3bogUGjpwBDw2EDa5FqqD2UJp
8mX4T/oWv5Tq/mqztoq6SMKaWFfPzXct1ioyHyDMOd4zeJbuH0cAwV9wqAzpmr6I
eEZ5HNCPOqzmJVtwqdVaFC57j+mHOofLkmGs91eGiW6mdcjXTcNerRpqatoRGehq
tKJPA4Y7boz3QpXAj5rLNS+hFPCKXDAgVEGqU72BK/Yz5H2IOTG/SbyzpkTIf12j
J5dCh+cs4XYsghh/4GjHzROiCeIEt+8ZFoUnPifh3JvO3VqyAk/bX/qyD26sW+jp
UGfEMtolQqPmo6xbzJhIfFN9nT26T7p/fhmuu/0b6jYcpLoLd0g=
=v9mH
-----END PGP SIGNATURE-----

--AqsLC8rIMeq19msA--
