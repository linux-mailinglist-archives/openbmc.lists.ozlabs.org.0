Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DCACF1CDD7E
	for <lists+openbmc@lfdr.de>; Mon, 11 May 2020 16:43:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49LNvz75R1zDqTh
	for <lists+openbmc@lfdr.de>; Tue, 12 May 2020 00:43:11 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.21;
 helo=wout5-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm1 header.b=oLL83tcJ; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=ep2qc8P5; 
 dkim-atps=neutral
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49LKSJ2wk9zDqkp
 for <openbmc@lists.ozlabs.org>; Mon, 11 May 2020 22:07:27 +1000 (AEST)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id 7B0A3513;
 Mon, 11 May 2020 08:07:22 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Mon, 11 May 2020 08:07:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=3lEwEUinYXyrszT6l8Sx4gIg7VE
 Nydub12KhoCqY6ys=; b=oLL83tcJBArxQ5Y/WLzVP6crmM+zlEIW0YVhNtmvhXb
 FaeN61db452tmqGGdm+vSEo1Iz14X29qzU87Qwyx0tlj2Wl38ZKpMmiuszI8bdzl
 r9Cfxuo5O7yT8BtmYtMSOsG/v1f5P3NkK7tVua243Wc5RE3DJs3yteUr5x7C20Ye
 HmMYDtUundRKu/hYAW+ROSdQ6llSho1S/c522VaMZBH7LHU36A41aEKyZWW5/GVz
 oqeC2Lz2f0YTilMXgot1rBhGQSKCZn7UVrWeegjC/6FJdxKjctKK9hyEUQZXRT4k
 5gnhNCjh6XhbFtiyHT7EENLXeNeT4KMjuAdEN0LJHKA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=3lEwEU
 inYXyrszT6l8Sx4gIg7VENydub12KhoCqY6ys=; b=ep2qc8P5fxZa4IHgHjpWzU
 FU5qS/HTOuviT+YvR2ot7QGZBtELqseXzsXHAaOgzeEdu34472zHd+kG9QslP6KX
 pvW6gIryx8UPJkNwXUSKypmrr0kbT2ThajX4bjqW11LMg4Py+ZwjnbngSAgryJLW
 NrzSCqqRqq0YkjXxj9UtkVCm3mgAqLyh6NGphQ04i6I1aODUvatOymEENYluIE2N
 wFV1UrIzt0WPTPYtPq426N7Bh28H/BmDRs1MnJ5LwfyB/PkKGWwIHTlBEDcvV/aN
 z5nuErKhjvhzKEqJqeIQzmquc++1qOMiFcgEDstTHTy1M/KG6qlDHKV7mGigT0Gw
 ==
X-ME-Sender: <xms:-T-5XhdS0qJ6e5pGJ6vj5kagKjXNnDBQXhDZJiKRu7tJ0Yvfto9Zag>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrledtgdegvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculdejtddmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredttddv
 necuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghksehsth
 iftgigrdighiiiqeenucggtffrrghtthgvrhhnpeduudefleeuhefhleehjeejgfeujeeh
 hfdtledufeehkeduudevkeeiuddugfegkeenucffohhmrghinhepohhpvghnsghmtgdqph
 hrohhjvggtthdrgiihiienucfkphepjeeirddvhedtrdekgedrvdefieenucevlhhushht
 vghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsth
 iftgigrdighiii
X-ME-Proxy: <xmx:-T-5XpDl7FvaxNzu3IN6cPGSolBbrBuaU9onywR4OcKBjAASf2lMvg>
 <xmx:-T-5XpUJhoBIDZ08eWfKlDC61r06jrbd4FVAO61Qr00wKwByUOiFSg>
 <xmx:-T-5XmUcb8_26rsqVcqvPgqZetQY9qEys0iJ0bvyp1_wch2J7ybbcg>
 <xmx:-j-5Xqn8DOJheOHZdo7U86bBQ-pfWpzLWaYb3el2zEc5Q-pBqEXaOA>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236])
 by mail.messagingengine.com (Postfix) with ESMTPA id 1330A3066284;
 Mon, 11 May 2020 08:07:21 -0400 (EDT)
Date: Mon, 11 May 2020 07:07:19 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Sunitha Harish <sunithaharish04@gmail.com>
Subject: Re: Storing host data on the BMC
Message-ID: <20200511120719.GA10214@heinlein>
References: <CADeuMvXQfS01sdwpiM+POkaqdVesj64XGDqPWAPreo_TPbuV8A@mail.gmail.com>
 <f4df91bd-d60c-5f4b-ef08-2e3fdd163b4e@linux.vnet.ibm.com>
 <843851ce-b802-05af-2949-c3aa828aead7@gmail.com>
 <ec87d606-9fa9-014a-bfa4-e56f94f6747e@linux.vnet.ibm.com>
 <342b5672-2adc-a6d1-f60a-085847d69584@gmail.com>
 <43685475-b4fb-6d09-a248-01a52ca382fa@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="sdtB3X0nJg68CQEu"
Content-Disposition: inline
In-Reply-To: <43685475-b4fb-6d09-a248-01a52ca382fa@gmail.com>
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
Cc: openbmc <openbmc@lists.ozlabs.org>, dkodihal@in.ibm.com,
 suryakanth.sekar@linux.intel.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--sdtB3X0nJg68CQEu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Sunitha,

Intel has already made significant progress on this problem domain and
we seem to be fairly converged on the design direction [1,2].  Have you
read through their design proposal?  Are there any oversights in their
design that would affect your needs?

Their design has been on-going for months now.  I don't think it is
appropriate to start from scratch on the design discussions unless there
is something fundamentally broken about their direction.

1. https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/29320
2. https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-dbus-interfaces/+/=
18242

I thought there was even some implementation started in bmcweb for this
feature.

On Mon, May 11, 2020 at 11:44:35AM +0530, Sunitha Harish wrote:
> Hi,
>=20
> Gentle reminder for the feedback.
>=20
> Thanks & regards,
> Sunitha
>=20
> On 06-05-2020 12:53, Sunitha Harish wrote:
> > Hi Deepak,
> >
> > Please suggest which other approach you think is better here for=20
> > Origin attribute?
> >
> > When the interface is set as DHCPEnabled=3Dtrue ; similar to the Origin=
=20
> > attribute , the IP address, SubnetMask and Gateway will be set by the=
=20
> > host. So we would need to consider this usecase also as a candidate=20
> > for the new approach.
> >
> > Thanks & regards,
> > Sunitha
> >
> >
> > On 05-05-2020 12:29, Deepak Kodihalli wrote:
> >> On 05/05/20 12:12 pm, Sunitha Harish wrote:
> >>> Hi Deepak,
> >>>
> >>> As mentioned , the Origin is the property which will be set by the=20
> >>> host once the IP address is applied to its interface. Its a=20
> >>> read-only property for the out-of-band user. But its a closely=20
> >>> coupled - related attribute on the host setting/BIOS object.
> >>
> >> Hi Sunitha,
> >>
> >> What I'm trying to say is - we shouldn't make this coupling. The BIOS=
=20
> >> settings table is a group of attributes that can alter the default=20
> >> behavior of the host firmware. The Origin property you describe=20
> >> doesn't fit that description.
> >>
> >> The host "sets" several things for the BMC, for eg the host firmware=
=20
> >> can tell us functional/presence states of FRUs which the host has=20
> >> access to. Everything that the host "sets" this way isn't a BIOS=20
> >> attribute. Once you decouple this, I believe we can think about=20
> >> options other than the two you have suggested - since both of them=20
> >> involve making the Origin property seem like a BIOS attribute, which=
=20
> >> it clearly is not.
> >>
> >> Thanks,
> >> Deepak

--=20
Patrick Williams

--sdtB3X0nJg68CQEu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl65P/UACgkQqwNHzC0A
wRmC3w/+NKOx3z30dL/WvxvB6XzZhdZwcHpOuKdimRguUFAqmDy4RlAVsQBdTdp6
s/6f7s2CoivyuR3qx7BawlKSB1c+X07oOgJjTrXcTQriIeXV50MnSDiXQBuZrdqt
AWaj3Jei+B+E6hTGfG9IPPN6CTdmyjqj5sj7XhPTWGhWEGtRU8QQ9ps/ddtOS1Al
WoA9YruZmIM60jLsDRMJaYrNYXRup6AAGQLSkWMaOcr17fj57VEJchMi89bZxruB
DjV9omR5/cqR8Y7fVs6VqaUvTE8f3VXhSl5vTdTpQR4BG7EJCfEW2CaYcN9qeQAR
tQCDtQxqX2YDY25SsAIw2HLganjovGDolaJvxFc6QA/YYDwW66PS6tN/O79ao/RG
lBByhpuKXJnegQ8I4Zd1ALAgEHQ6BHqJEozz3Ju4w6H/UImibQDfpikeLf+Dc6MX
FZkbW1WC9VOMlODfQhttJZEOFWL+I37WbtaJ3sQUh9UuUI2vLKdNChOvl5GbfeDM
FR4AXY0Ypu2SvXLWjumlf2+/68Z6WKhzksRJSZBd96d2prxqRTPrjJw+T6SXZKJf
/w1QR4bZB3VhYoudTAe1cd/yBFxeFPfPddHrclFBdc/I0Ur6j22JNf0eN/VbDZHn
Js3k54LzPIn4glSplt8sezBkG56a41RVJ+fWRZNJ0H3fhTjlJe0=
=UWiv
-----END PGP SIGNATURE-----

--sdtB3X0nJg68CQEu--
