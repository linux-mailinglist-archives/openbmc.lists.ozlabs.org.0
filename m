Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C94043E273
	for <lists+openbmc@lfdr.de>; Thu, 28 Oct 2021 15:43:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hg6GP0pblz2yZ2
	for <lists+openbmc@lfdr.de>; Fri, 29 Oct 2021 00:43:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=vYng+++k;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=UpCYj3DV;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.29;
 helo=out5-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm3 header.b=vYng+++k; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=UpCYj3DV; 
 dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hg6Fv45Cgz2yP9
 for <openbmc@lists.ozlabs.org>; Fri, 29 Oct 2021 00:43:14 +1100 (AEDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id A316A5C00DD;
 Thu, 28 Oct 2021 09:43:11 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Thu, 28 Oct 2021 09:43:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=PxXEytPEEsY1HxptDcbziX6nU3S
 wAyx6eLamy3AM7PY=; b=vYng+++kAzjdkqjpxyayL+U5V/1HjpbLNLSFGj647UP
 S5ws7opHBKB3oR7IngjziogKg8QgbYj9lZi8TX4gQRirHnfvq7+RhQKfoH9nmHrP
 fy05giby4U46JVYb5nco12hBGq2nemLjRfPIr9yVZ/qRLWFDi8VbQmPqsMgEUYYN
 YMU9kwgQvlqAjzYe96lVzufy/ln9U0JgE/1cgxP0XKou8lpErXlhyBlIiIGLCUcY
 ldyWp9WwviL2tV6c72D1X7eNOrCmu6oxbrO9G/ZhRd6Ia5WVAlWqi1nnaU3vNE/v
 gD/v4LERds89ijRUsOncgpELQVJMV5v7s3VcNGkF5/A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=PxXEyt
 PEEsY1HxptDcbziX6nU3SwAyx6eLamy3AM7PY=; b=UpCYj3DV5iaT50Yx0BR1/5
 fb40SBFOZDBKGHFfRVetPaYKj+PrGBpi7CrrHRB/+tZNkAuofTO8ZdZThWd0oywZ
 MaNpsQDWytsFNQJyHYT3gug9wC17eBft1Sf4ldwKYFsWyQmky8WnikvW0+t3Kyw6
 OgtNjg193jNLXTtnL9ZesUpXewAk0lQDaL/HhRHlGPoiOPDHNAiJV11CbdPYFrMN
 B9bH7Jf2WY1/KLa4jOE5redZx/wQPHRctZsUX97iqTnB8JOuf1FKhvm81IlxZCxB
 GBmuOMJCncGrDTW/DHj7aTjpgMoWQuFVb6ntvcxNGB0t8rkY3iVm+jWco+MzankQ
 ==
X-ME-Sender: <xms:7qh6YZeVCFc9R5hFIh5lJQMnUlNypLAC3PD4fUttoRlhywABjI9CTg>
 <xme:7qh6YXN3N-ZNs2cn2v2kLPrqncanfGhNrObNk0Z3Z9rDadMgevf_0fIZ9aP7keDFu
 6esN3yLHI6-7m6oPw4>
X-ME-Received: <xmr:7qh6YSiGU6qo76D-JhrnTeNNgA82OPAx9-J64-nWxu9JkXUeXYSmxbYJ1NNpGoiqF7cT26dGQV-1g8srpzrXYQuZYLMVUw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvdegvddgheelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdlfeehmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
 udenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepfeffffdvgfdtledufeelfedvffek
 vdeffeeuleevudeitdegueevgfdtieeuueevnecuffhomhgrihhnpehgihhthhhusgdrtg
 homhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehp
 rghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:7qh6YS972zFceopSKnByfex668rGYZOlGQKnSQftwFNSdelmWRGW2w>
 <xmx:7qh6YVtxt_iy6aKrOEiu4iYfb-oCqwt22WY83xa_4j1ObhTfUVM6nw>
 <xmx:7qh6YRGivaB8yLpBQ_I_W2KWrU9l8R8_0ICt20JmgBie1TSOta2CQg>
 <xmx:76h6YfKcv2chnbadSZ4SJiRQPSFQvvNoNERfwVISNjt_RjOsvy6m0Q>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 28 Oct 2021 09:43:10 -0400 (EDT)
Date: Thu, 28 Oct 2021 08:43:08 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Joseph Reynolds <jrey@linux.ibm.com>
Subject: Re: Start using github security advisories
Message-ID: <YXqo7KhqQ5y/ZM5p@heinlein>
References: <62b15edd-110a-3574-66c5-d11299bbd38c@linux.ibm.com>
 <67C8A5BA-9FD5-4804-B5CA-C2687FC17889@gmail.com>
 <20211018184958.zajwqmloxsyxmxv2@cheese>
 <cd2f6175-475f-0e5a-0b65-4f7a12959ab6@linux.vnet.ibm.com>
 <DM8PR11MB56387B6B7713360A95C7959090859@DM8PR11MB5638.namprd11.prod.outlook.com>
 <79311a65fd6e30f18b0fb038b1906fe5ec015466.camel@fuzziesquirrel.com>
 <f53a303274f21127c3214d9aabfb0793b5a499af.camel@fuzziesquirrel.com>
 <b738b432-8416-d26d-2a89-d61e4187db67@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="BbJvhgrFeDyTgDwF"
Content-Disposition: inline
In-Reply-To: <b738b432-8416-d26d-2a89-d61e4187db67@linux.ibm.com>
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
Cc: Bruce Mitchell <bruce.mitchell@linux.vnet.ibm.com>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>, openbmc <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--BbJvhgrFeDyTgDwF
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 28, 2021 at 08:31:37AM -0500, Joseph Reynolds wrote:
> On 10/27/21 2:42 PM, Brad Bishop wrote:
> > On Wed, 2021-10-27 at 15:29 -0400, Brad Bishop wrote:
> >> On Wed, 2021-10-27 at 18:29 +0000, Mihm, James wrote:
> >>> Brad or Andrew, Can we proceed with the creation of security
> >>> repository so that we can run a couple of trials on security issues?
> >> Hi James, thanks for the ping.
> >>
> >> The only reason I haven't already done this was this comment from
> >> Bruce:
> >>
> >>>> I believe we want to make sure that none of security advisories
> >>>> get sent to Discord, wouldn't want to accidentally be going to
> >>>> something like #gh-issues.
> >> This was a good point and I'm not sure what to do about it.
> > Hi James
> >
> > I created the security-reponse github group and the security-response
> > repo just now and made it private.  Please do some testing and make sure
> > issues don't find their way into #gh-issues on Discord.
> >
> > thx - brad
>=20
> Thanks Brad!
>=20
> The plan is to write the first issues from real-live but low-severity=A0=
=20
> problems which are also common knowledge within the openBMC community.=A0=
=20
> Meaning: there will be minimal harm if the problem is disclosed.
>=20
> - Joseph

I want to reiterate three things:

    1. In Github, security advisories are different from issues.  Security
       advisories are suppose to be able to be collaborated on in private
       without the repository itself being private.  Only when you are read=
y to
       reveal the security advisory can you switch it to be public.

    2. We have two webhooks for Discord now: one for issues and one for code
       changes.  Security advisories are not currently covered.  If you mak=
e an
       issue in a public repository anyone can see it, even if it isn't cov=
ered
       by a Discord webhook, so "limiting the awareness by avoiding the Dis=
cord
       webhook" isn't really what you want anyhow.  You need to make sure t=
he
       information you want to be kept private is private (and again securi=
ty
       advisories are suppose to be the way to do that).

    3. Having a private repository means you cannot report any security
       advisories (or issues) in a public way.  Today if someone goes to
       https://github.com/openbmc/security-response they get a 404 (unless =
they
       have explicit access to the private repository).

--=20
Patrick Williams

--BbJvhgrFeDyTgDwF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmF6qOoACgkQqwNHzC0A
wRl5yQ//fKu0yPzFu4sr6FS9cChOUdfdtpQLV+2AGoFoSCc2ludS0ZTMKtxSg+II
RH32yf/ycTZ630vp5A7FrXi++9rFNDjFaRkOGiSCfIOgf7rcxHapoTT374v00mev
q8rgoCrLC3m/ibmybZbMGUAFqr984XB1TWUpQtKQXnRbgKFP/q2Rc3TbLIUgByw2
MBz5+GKkvb5TGWuWZ7k7PKFdUgzzMewF2+GkLPbx7qsKkdxLmN/LDYzKxB4zjNj2
fNbBTDGh58PE17TueNnyCYR0AIisWI+t0VqUjumZlP2/uh4BS2E1zY5DURCROjzr
DIdSqB63V5ySJco6ZHvugfnPpsR78RFrPdkUTCFtbv3oKc91/DaWp83FwLQJGTgc
Bu/f22TON/u0cE6ib6It9Y8bYOSPaeY6J+NNO1AHzk9oLdPhvkwr5/6fRfiPPtAX
IygzUYj05z3cM9vykV+DIwBPWjYFFI6jYJUQ9HOYRNBIfjAjJkRxc4xJ5qUkBTlU
qpKxUFh0omJu7fy6FK7DGNc16YmoCtnJOd1Q+sjKZVi5Pc+2dT6lijx9Ho+xVhEk
Ism5Y2Rd2fGmiAE1cr+kvH9xFIA8wp/+TdYD/Rc+MaUEuB8lOH8biIzMVbFVnDtV
yENQGRoaopk/fwRa5LFqRW0mUpTPPOmsnUphkHyymwYcKY+l/mM=
=1D8e
-----END PGP SIGNATURE-----

--BbJvhgrFeDyTgDwF--
