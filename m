Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 804EB36FD64
	for <lists+openbmc@lfdr.de>; Fri, 30 Apr 2021 17:10:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FWwmN3Psrz2yxm
	for <lists+openbmc@lfdr.de>; Sat,  1 May 2021 01:10:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=caV3PXp9;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=fW7IeOZo;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.26;
 helo=out2-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm1 header.b=caV3PXp9; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=fW7IeOZo; 
 dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FWwm547qyz2xYg
 for <openbmc@lists.ozlabs.org>; Sat,  1 May 2021 01:10:28 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 1E4545C018B;
 Fri, 30 Apr 2021 11:10:26 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 30 Apr 2021 11:10:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=+6cyKiuQL8hSV3909zYWiyNhTHV
 PwQA8GeSRb68HrDk=; b=caV3PXp9+NtX7m1dkiVcWFOnL+3DWl4N3h+sNqhgSap
 tGaHhNmfxDapxZahKtqvywhVSlhKh7FyhhcUo2Hxe7ig7VkS4KLzGeGgPMYe6T3F
 SojyZ/sKqRC/HpRcUQi8qPonuTd4qCgRkgBLyx8Y7l5VoBTrYxjYx2CNDcfrxEO/
 LF3hBaNEdXWbGkhYMng1htBI8fZizk3XCz87+7zqvf9z8qjizxMjgdtteGDy0qLJ
 qGpxnkd6IDfDgZ0V2dETWv+XgDb/fdB1WhaYwkQdTCvNxnqRDLPPKihChiJj6JDf
 ByebP7TuR5kzD85/gXPEB27V0VAAz/wt/T3TboQgdOg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=+6cyKi
 uQL8hSV3909zYWiyNhTHVPwQA8GeSRb68HrDk=; b=fW7IeOZok5NeEXp8suSvl0
 MDdGUKWVALBsYljkkNpQDyj0C754Dm7ifH5p+BkyalGSRi2G/OoQ64+yJSxvPai+
 +xRuSA5mjSmVtRbvPyDtfi4dU1fIBeoFeEZ3f29u+r+N7YcJ1LOUE7KkCHTuR8BT
 KeqOQSFAMoWN0ZcdR2ZYXmQQm55rN565jAk0MmmJ11V8P8WZE+2RATzm2w7WBsQU
 vxKGZGEgTZsVNZNk42WkJt/7PL2luVQ4SLZbPyQG9s+fN9DF991DdS+oq+4Bvvh9
 nklCkVTfmDMoL2GbOn+Dolh2Z4AKLHbOJ2YQJIHpJCPAjQrTWCCGUdSp50VJ1vIA
 ==
X-ME-Sender: <xms:4R2MYJL2XB063CMfz3LLgIEJM5bmNngnyqda84DdM7PeLeXpfip4Ag>
 <xme:4R2MYFJEqjhG5HcOF3iaI_4Q9bCcWedLMz_109RrR3-ECO_Rv4myVOTf9ch3Zby0p
 86X3wIqgYktsp08vHg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvddviedgkeeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdljedtmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
 vdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepgeehheefffegkeevhedthffgudfh
 geefgfdthefhkedtleffveekgfeuffehtdeinecukfhppeejiedrvdehtddrkeegrddvfe
 einecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgr
 thhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:4R2MYBsb2ShBpQsUdMT1tDtd9pnKqvCZM-RySvPxHJP-M2SeKoIrVw>
 <xmx:4R2MYKY4kh7y3MlMheI-Gbks4msYI_jC7Sfw-YFv5ukhZWMbo48jiw>
 <xmx:4R2MYAYHc8ynyYHolXuwSiV5WaF8VfstTPo7FzQO-1s-wcwQAbX4gw>
 <xmx:4h2MYG3v_0uirxtlO3UoV8XGE922eAEJylOHRANnwHa52VGadt1pTg>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Fri, 30 Apr 2021 11:10:25 -0400 (EDT)
Date: Fri, 30 Apr 2021 10:10:24 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Jason Ling <jasonling@google.com>
Subject: Re: [pmbusplus] userspace i2c, pmbus interactions
Message-ID: <YIwd4CukDfVrOqQs@heinlein>
References: <CAHBbfcXj57K66ARd2_SQMCdNTPVtWk8Xrq0jn_k+WghjRcT-CA@mail.gmail.com>
 <YIwRqzb/50Yk9hZa@heinlein>
 <CAHBbfcVPYZyUaMH9eJYs49RkTJ8aeXg5LMHGJGD0Ftqqx9Skew@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="51K71zKA4J8qgGVq"
Content-Disposition: inline
In-Reply-To: <CAHBbfcVPYZyUaMH9eJYs49RkTJ8aeXg5LMHGJGD0Ftqqx9Skew@mail.gmail.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--51K71zKA4J8qgGVq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 30, 2021 at 07:52:36AM -0700, Jason Ling wrote:
>=20
>     2. How does the availability (and potential recommendation of usage
> >        by our community) affect the effort to ensure that all i2c and
> >        pmbus drivers are upstreamed?
>=20
> Well, this library is meant for userspace usage. So i2c (hwmon?) and pmbus
> drivers would continue to be upstreamed as per usual.
> Motivating use case for userspace i2c transactions are pmbus firmware
> updates. With adm1266 we tried to upstream sequencer configuration update
> via the hwmon/pmbus driver, it failed spectacularly. So we have to do it
> userspace.

Do you have pointers to the discussion?
=20
> >       What is it that makes you want to write your code using low-level
> >        i2c and PMBus APIs directly in userspace instead of writing or
> >        updating drivers and using the various high-level user APIs
> >        provided by kernel subsystems?
>=20
> I speak in the context of hwmon/pmbus but these patches were simply
> rejected. A lot of times the device you want to upgrade is also the device
> you're gathering telemetry from.

I think the "is also" is the part that gives me concern.  Generally this
means binding/unbinding the kernel side of it, which isn't pleasant.

>=20
>        I see you mentioned "pmbus device upgrades" and I know the PMBus
> >        subsystem doesn't currently support firmware upgrade paths.  But,
> >        there has been LKML threads about it and what I recollect was
> >        that it wasn't "not allowed" but just "not implemented".
> >        Shouldn't we be focusing our efforts on enhancing features for
> >        the whole OSS community rather than building our own different
> >        library?
>=20
> Fair point but I don't see them as mutually exclusive, use hwmon/pmbus
> drivers where they make sense and work for you. Switch to userspace for
> stuff that gets strong pushback from hwmon/pmbus maintainer or stuff that
> just doesn't make sense to put into a driver.

My feeling is that we need more definition on what that boundary is.  As
long as we are really only doing stuff from userspace when there is no
other path forward, I don't have much concern.  But, I've seen too many
cases where someone has tried to write an i2c-driver-in-userspace
because they "didn't like working with the kernel" or some similar
excuse.

What is something that doesn't make sense to put into a driver and why?

--=20
Patrick Williams

--51K71zKA4J8qgGVq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmCMHd4ACgkQqwNHzC0A
wRlXEBAAhlC4SzRD8+8/u0AeJxX+FNY6TTPL5LUminK3txIpjWh+QxlLS5PfxzQn
J/7O1FKv5NatVUAopO6TjlaOBhD6VJ2MZJTNUox6eQu2HyVHnkUHZtaklBDGzzlZ
dOOufvv8DXSTfregjL/xwkodK92DJr8Nj7mVXNxG9MIV8w9B09eo/TQgi3xuSERZ
AMjCdlhP0u0RcmufamveylaRfCFWNe3pXrlC7eC+aIvOxPn80ARfQY62/RT5c4jI
ltJXUvJ4i/4F1W2MXc85XVNZSPsfI9dh5SwwPu6vjfwnAVu2D+ICwVyasaQ6Utih
Rrd8U+SKgc75SgNA8spEMDt6wxmBFSIzykaYoKqdWNzZWS/W5BbblmhAe5JSF2B4
qQ1skJCQsggVW7T0J3Tib2/UvZnmJURyd+wEdteSmoPPyLfHyL2IhaV7wrSH3TjC
UlnkY+VdewmNVKOmqvbZ/x2Yd3AmypY7Sy14DTEBB+PLQD7WHzynoOS7QVmyHAK/
Jl1+E6ElsKqUwPE7SHOUdrBQrhA3h+TFJlsaqcqIvCYHeO2KsginalLfoRBHMpdr
3n9D7RftCSj3QlTNlVHA1qNu7EytUFWzlf67RuHt73I4Nv4nC5xlxkRn8HO2uu9q
XK4EiBI0dWAbOyh4kpvOSqP4Ajoznw2n5ieDtE1gaGr/TqhH4os=
=uGrn
-----END PGP SIGNATURE-----

--51K71zKA4J8qgGVq--
