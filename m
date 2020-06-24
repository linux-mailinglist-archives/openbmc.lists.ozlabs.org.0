Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7416120696B
	for <lists+openbmc@lfdr.de>; Wed, 24 Jun 2020 03:21:03 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49s524460QzDqdT
	for <lists+openbmc@lfdr.de>; Wed, 24 Jun 2020 11:21:00 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.24;
 helo=wout1-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm2 header.b=Gp1ycczY; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=c7/DZeL/; 
 dkim-atps=neutral
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49s51G1LHpzDqNN
 for <openbmc@lists.ozlabs.org>; Wed, 24 Jun 2020 11:20:17 +1000 (AEST)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id C6944E04;
 Tue, 23 Jun 2020 21:20:13 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Tue, 23 Jun 2020 21:20:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=oe7mtxN9UlugV09Elud/XDr5qtW
 Wq20BQXdRPhDD69U=; b=Gp1ycczYNCBdnpROsbbRTlyfmUmU5YRQPM4n+6mgbnk
 OITVX1gpMGrFHxgAS5Atm5zNfu5UhahV7sCH1EqmbJ5d22Hnx6q/LZS1KwrQ9VKO
 rRT9XFeGiO1KEP9Gyn0zCGFXbbzeqnzwnlHv7ojRqNgg4y5QTo6KaBiFlYegwaek
 Usdf0jfwfSm7LVK+aL8FaVmu7A8xKHlQcQsVa6xT2rthq10QPQwhhS6cRcuiTUGI
 H/alPkprrFUGasPy5EltD6NTVkNe3ZMtuumUPYKrV/fMKwdUPJ376Hxuf+gF20AH
 +mz4wW6ivDB89XEk3rRImMYw96Z+z0Uc3AdGFE9UGSA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=oe7mtx
 N9UlugV09Elud/XDr5qtWWq20BQXdRPhDD69U=; b=c7/DZeL/CIrXb2mRSnQkni
 p2hviW8EDHdPRaOuZ+QdE7Xrr5J8FZ9X6C43oyR/ljsurhVcYURsTx2egCJa63S8
 Bvhu9HjIIs2Cx/nB6WAw72hA0BJWNWjoq1H9Lwc2JKR8iKVWd+4lhcUK12d+ApFl
 OpZ/aXBuyTYGcN68OHvZCXut7wvUZfP9tMBeQeW0EaiSFHCAPrFUj/UPqfcD41cH
 u6UsdarE7UCV2410cVRqcbTi5rZT34ALhGsrQpif2SAtmUMHjmlNF3O8thOO/60o
 1XWUYR1dw8t2F3PwVW8o87ls5trmP/en1xG2JnvIV71RFHOGy50mA0UZOw3B/ONg
 ==
X-ME-Sender: <xms:TKryXlP4dZxSO1zR3j4efq_rYkOIR2lDxLjuTSdZkFTy-BcGEWDqug>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrudekiedggeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdlfeehmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
 vdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecuggftrfgrthhtvghrnheptdevjefhhfehtdfffefffefggfeh
 geevfedtffdvteevieevhfejkeejffeugeeunecuffhomhgrihhnpehgihhthhhusgdrtg
 homhdpmhgrgihimhhinhhtvghgrhgrthgvugdrtghomhdpohhpvghnsghmtgdqphhrohhj
 vggtthdrgiihiienucfkphepjeeirddvhedtrdekgedrvdefieenucevlhhushhtvghruf
 hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgig
 rdighiii
X-ME-Proxy: <xmx:TaryXn9pz8ny_zZq5_SEXJyXJlESvSwhVlnEa7mXhEw3pMFIWMpteA>
 <xmx:TaryXkRdjKAmLCtxDdPP8fiSidjXA3EIqVLeBUpWMhZD3paxR5EATw>
 <xmx:TaryXhs6Iq8k9uaWw9_uQWjskPuvTP1_jcEOXNDX4-dB5WCSIkJ5cA>
 <xmx:TaryXlQY7vbSQ2hx3qi2KgcmNpfd0uus9_IKCmFTafpgMF9cmvGYJA>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236])
 by mail.messagingengine.com (Postfix) with ESMTPA id A8E7330675BA;
 Tue, 23 Jun 2020 21:20:12 -0400 (EDT)
Date: Tue, 23 Jun 2020 20:20:11 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Alex Qiu <xqiu@google.com>
Subject: Re: Feedback on Current OpenBMC and Proposing Some Improvements ----
 Difficulties and Issue Examples
Message-ID: <20200624012011.GA3922@heinlein>
References: <CAA_a9xJJn16M2p-wu7-cMsWK3+CEqMTccCg7uhWo1=MMbdxXpw@mail.gmail.com>
 <CACWQX80gd=eAb6PScrvD74S+6ownFEG9rw8ZfCfmrJSMuk7Cug@mail.gmail.com>
 <CAA_a9xJFQiYVoAkPOg_g+DDA+jX9N6VA-mOWusC1YuzYeEennw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="W/nzBZO5zC0uMSeA"
Content-Disposition: inline
In-Reply-To: <CAA_a9xJFQiYVoAkPOg_g+DDA+jX9N6VA-mOWusC1YuzYeEennw@mail.gmail.com>
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
Cc: Peter Lundgren <peterlundgren@google.com>,
 Kais Belgaied <belgaied@google.com>, Benjamin Fair <benjaminfair@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Ed Tanous <ed@tanous.net>,
 Ofer Yehielli <ofery@google.com>, Josh Lehan <krellan@google.com>,
 Richard Hanley <rhanley@google.com>, Jason Ling <jasonling@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--W/nzBZO5zC0uMSeA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Alex,

On Tue, Jun 23, 2020 at 04:47:36PM -0700, Alex Qiu wrote:
> For example, some of our FRU has way too many temperature sensors from
> hardware design, but we only need the maximum temperature among these
> sensors on one FRU to feed to the PID control loop or health
> reporting. It would be great to aggregate the sensors according to
> individual FRUs. You can see this sensor aggregation feature as a
> simple example in my demo:
> https://github.com/alex310110/bmc-proto-20q2/blob/master/downstream/card_=
example_g.py#L69
>=20
> We also encounter voltage regulator devices requiring current reading
> corrections according to their own properties (duty cycle and
> temperature). This correction is not preferred to perform within
> kernel drivers, and we are suggested to deal with them in user space.
> See "Read Output Current" in
> https://www.maximintegrated.com/en/design/technical-documents/app-notes/6=
/6042.html
> Example in demo:
> https://github.com/alex310110/bmc-proto-20q2/blob/master/device_xam2734.py
>=20

We've been discussing a very similar feature to what you're describing
here at Facebook.  There is a very rough design document at:

    https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/32345

We need to have both aggregation sensors (the first) and corrections
(the second).  The design document here allows both.

On correction, my understanding is that we have some sensors that need
an adjustment depending on a *different* sensor value.  For instance, a
voltage regulator might have some error based on the ambient
temperature.

--=20
Patrick Williams

--W/nzBZO5zC0uMSeA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl7yqkkACgkQqwNHzC0A
wRl1uA//UyW9c9MjOseRksljr7cLZaHFr7ekAHqSc2xQsAIobYoOB+a2lxbN8X8o
0tpLv6GnDeLM5itOrzawR9l9u2/L6tDCS2RRKzKshLgFEFPru0INTWD3tNxwvnow
3a4lwpnhOcorjRTOs+D2vphzlB58iDw4yIJbBEZZQ+ST04slVFW49KRJAIvOmg97
2gZfVeX0Q0HkprfzqbQweruu0fW2LmMB0VxDyqoVRCkpioV9ubCsQYrxUHJsur0U
mCyEuxor2IHdQf4YUJr4ro/TuLQGX0H0p76jeePF14dGFI464/JmTYGJJ07Q2tN+
IkdTYohqqKGeLTs3tokNaXOxPV/7n4bN7eT9bEZUwfq5b3btzdrDbETTgwfDW0C6
apjh/jOvyjHv1plcnATGTw5uZM7wvjrMNPFeuuHlTRPhljhz7mGYlF5ghoFdR0O9
rB+UOeN1qEuNxw5/UM/AD4VKkuBvqJgfhkuYyA4N5aIeGfpm8oT1cf6Ioj126KRa
/7Kp4eggUKsq5ZMvz4dfLfp3o/OqVrvi42L/Z8WL7sahrdQsuXF3DzndAvAbhfpS
ahGwRSPCi/WcvEBRz/8fpjiMYVXLu0jRpGpwjJ2mVN1i/cRAGZI564faRL+G98hQ
vB7AGQEaXjhTAkXCaJtBQczfKrAjmBtmVVKgg4PIRKMnfmZfUsY=
=q7v3
-----END PGP SIGNATURE-----

--W/nzBZO5zC0uMSeA--
