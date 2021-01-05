Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E70C22EAD5A
	for <lists+openbmc@lfdr.de>; Tue,  5 Jan 2021 15:28:43 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D9FGx35b0zDqjM
	for <lists+openbmc@lfdr.de>; Wed,  6 Jan 2021 01:28:41 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.25;
 helo=out1-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm3 header.b=Yi83Vj1u; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=IFYIMeIC; 
 dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D9FFt5G3WzDqM6
 for <openbmc@lists.ozlabs.org>; Wed,  6 Jan 2021 01:27:46 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 51A185C0105;
 Tue,  5 Jan 2021 09:27:44 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 05 Jan 2021 09:27:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=aKrFQ9Vp7Vz3V/kn0qU0ancV++0
 mkmzfRV85aQ5jT3s=; b=Yi83Vj1ub8vLcf3QXOP3zlHDiPFWwFFrmcNMt/bMGui
 mUcu4KH6YZR/YN+73gqFtLPuPSDUhh+iwN6aGnLx/8+h14Rr9DuZAhDUVgpkxoyY
 yoy5bglWAgANAGAEWffwMdiWvS51Cnezd9IpIW2shQ4Q2OQZkAoNpB63R2mScmZJ
 g0yMV1itXgUfOMriO5lqcmJGB31YnR0fEL6VRHS6eRC1tTIlOOxjnDA9T/VXqOGn
 Za6l1APy91XvDLiNd12QKplh9sN+Y59dhpTfpd/qqVV4KoZmmhe2n1tpy5Z4DgXf
 WaeOTqZyErEqdG+g0y2u1HPi6Bwi2OICQpCByBAMiJA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=aKrFQ9
 Vp7Vz3V/kn0qU0ancV++0mkmzfRV85aQ5jT3s=; b=IFYIMeICXqfybs0YtL6NoU
 M/mVko+Mfzc3sicxEmGeC1LjspSvFYAmGN6Z3eOYz8E6gtO9NmE6He+w4UXXbc2X
 pQRyL96w673AN7oaxHV313/3Wk8wwc5E0DGH3oE0xYngisii/6RV057UvMwpreXw
 nJcMBHraalxq9ja8hCM1MgnQnuYuxtWk0PJ79kX6hGIHW8UIbRGIF0F3MWLo4CPN
 ND9vBLJI0z4HMCYTmvomPNyHx4VgM+6EcpPPzyohlrYZOufp8yt0YjXmRB433Hid
 dCgogMZLp1MVNjZxSz2kZzio36q9mRxswBe+74wauZHqOZZPAAUOn3L/QLQvEtIQ
 ==
X-ME-Sender: <xms:X3f0XzPyEaTvc2QxHTTvt8jSXQvCjIL0fgBb3jXS1BXEqylPFVUn8g>
 <xme:X3f0X98NOMQ5WQ6ytqR6jutqUm0_mrJqp3BvZ_AkBlRK2hbbIrbInBU2PiY8gX4Xv
 K-DqWm29KE4EdXeTLc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvdefjedgvdekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdlfeehmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
 udenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecuggftrfgrthhtvghrnheptdefjeetuedtfeelfeeiieevveek
 geeuvedtveefiedvhfeiueeugffhkeelvdfhnecukfhppeejiedrvdehtddrkeegrddvfe
 einecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgr
 thhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:X3f0XySaSAt2UchF0h4p5yJyzLuukqWWKxSzChI7tctYbNEnq348gQ>
 <xmx:X3f0X3tleZ6QJn5DcS9thXzXSCtAzvCsB_f7x238sWcReq-9uNsqOQ>
 <xmx:X3f0X7d7hP5n3GXBxY7fRtGKx1_I_IU6AUN3HzpBL_za9wd64VOlXA>
 <xmx:YHf0X7lXmVdyL5EDKSon8s3sLp-XCSKO31LCfoW9g08Yerwu3SMR9Q>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236])
 by mail.messagingengine.com (Postfix) with ESMTPA id 54D651080059;
 Tue,  5 Jan 2021 09:27:43 -0500 (EST)
Date: Tue, 5 Jan 2021 08:27:41 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Matt Spinler <mspinler@linux.ibm.com>
Subject: Re: hardcoded median function in phosphor-virtual-sensor
Message-ID: <X/R3XZNHmYpz74mu@heinlein>
References: <7be00c72-db17-c751-470e-eb92f18f8bb3@linux.ibm.com>
 <CAJTGxZG36whmooeOvMcwkhj5aQtvr=s8QFCGXYNSX6Up6WMJhg@mail.gmail.com>
 <c4ced4dd-0b20-9c22-6dfe-99b22e51d0ab@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="bACZCm7q3dUpFOdH"
Content-Disposition: inline
In-Reply-To: <c4ced4dd-0b20-9c22-6dfe-99b22e51d0ab@linux.ibm.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Vijay Khemka <vijaykhemkalinux@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--bACZCm7q3dUpFOdH
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 04, 2021 at 04:57:51PM -0600, Matt Spinler wrote:
> On 1/4/2021 2:54 PM, Vijay Khemka wrote:
> > On Mon, Jan 4, 2021 at 9:49 AM Matt Spinler <mspinler@linux.ibm.com=20
> > <mailto:mspinler@linux.ibm.com>> wrote:
> >
> >     I need a median of some sensor values, where this median sensor has
> >     threshold interfaces
> >     whose values must be defined in entity-manager.=A0 Since exprtk
> >     expressions are not allowed in
> >     entity-manager, I cannot just port the PVS's JSON config into an
> >     entity-manager config.
> >
> > I missed this discussion but why can't we simply use virtual sensor as
> > expertk provides median function and we have threshold support for
> > each virtual sensor. Please help, if I am missing anything.
>=20
> If you're asking why can't we just have PVS get its exprtk expression to
> use from entity-manager, and encode the median there, it's because Ed
> doesn't want exprtk in entity-manager config files (I'll defer to him on=
=20
> the reasons).

As part of offline discussions on this I said that having a one-off EM
config for median to allow you to make progress is reasonable, but I
don't think having a bunch of one-offs is a viable long-term solution
for phosphor-virtual-sensors.  Basically we're kicking the can down the
road until we have a better understanding of what kinds of EM/PVS
configs we're going to need.

> If you're asking now that the median function is hardcoded, why write it =
in
> C++ instead of exprtk, it's because the exprtk code would be so similar to
> C++ code (skip the bad values, put the sensors in a vector,=A0 call=20
> nth_element)
> that writing it in exprtk doesn't really buy us anything, and using C++ l=
ets
> me skip making the symbol table.

I would certainly prefer we use the exprtk code here.  You should be
able to generate (at runtime) a exprtk expression from the EM config you
specified below.

My rationale is:
    * Ed suggested that a long-term answer might be a few lookup tables
      / transformations from the EM configs to the PVS expressions.  I'm
      not fully bought into this yet but it seems like a reasonable
      direction to explore.

    * You wrote "because the exprtk code would be so similar to the C++
      code", which is why you *should* do it in exprtk.  The rest of the
      PVS code is already this way so why something different and
      require dual maintanence?  If the exprtk-based support code is
      missing some of these features, lets add them because others will
      likely need them as well.

> >     Instead, I will make a new entity-manager config that will have the
> >     component sensors
> >     along=A0 with the thresholds to use, with a subtype of median, vagu=
ely
> >     something like:
> >
> >     {
> >     Type: "VirtualSensor"
> >     Name: "MySensorName"
> >     Subtype: "Median"
> >     Sensors: [ "Sensor1", "Sensor2", .... ]
> >     ThresholdsWithHysteresis [ ]
> >     minInput: 0
> >     maxInput: 100
> >     }
> >

I would expect the 'exprtk' expression from your EM config to be
something like "median(Sensor1, Sensor2...)".  You should be able to
feed this into the existing virtual-sensor constructors and not have to
make the symbol table yourself.

Exprtk doesn't currently support a 'median' operator but it does support
'avg'.  We should contribute this upstream and add as a patch in the
meantime.

--=20
Patrick Williams

--bACZCm7q3dUpFOdH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl/0d1wACgkQqwNHzC0A
wRk1DhAApEahyOeZoL3Sn+n0XbibotinXygmbZYHniv0P12onNVlkIw67WtI26pe
MH/YGr3I9o0FAJb+3CIiHr01zPOBD+wPWCi+/KN3RjJ2G1MP8//PMlWiUMnevqlP
sA/mFyoCU0M0mAWDlY9X9iRcxjo4Fa2YXyzulKlEj1fT6g04cyX8VjUtTeYzz0Cw
A2qQ3qEMMXiMHYHqPhNQ6idypehrLq/v2FlMS3a1VGGf0a1/wouUvJ72bxflzh4R
33cqSCLmA9KOPyTlHBH9Xp2IBayJykzJ/qkg3HHPZBnvnxwNzcgkmpjWLML61c9k
5oim+UpwbvockPEhViEoAxbu2RnDNCM3zS1kBoPw2xUsWtO+NEjVc40izWEi3bQo
KbbnvEev8UtDb2sW00KsZ5q0INKdtC4Ew50Do+41ODYp42ViTUkgOYhtLc8vflQ+
3XxLjTJrn29CV8jaEYS4II5n+3nGmoj3JVXUcm6/JJfLzLCk1nNwQoeFrvhOASyJ
+QN9frhuEcJbFJzZEyBpD5MTmarXK3yJmbrUFOstIhwQBVfON32xk+K7IceJ3wuo
H1pe2NqOQr6kivAr1TTKRscUvZNdyGGRt6YwPhUQNLGt8FhpS5y7944iXMjKzbZE
f3CeFiQPbHg84S6o6IiJoJ6Ok+dRv86TaieQn1SP1m56rijucnw=
=rlXa
-----END PGP SIGNATURE-----

--bACZCm7q3dUpFOdH--
