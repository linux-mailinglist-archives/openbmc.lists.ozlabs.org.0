Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AF92D1EC570
	for <lists+openbmc@lfdr.de>; Wed,  3 Jun 2020 01:07:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49c73Z66P4zDqSP
	for <lists+openbmc@lfdr.de>; Wed,  3 Jun 2020 09:07:22 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.28;
 helo=out4-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm2 header.b=LveYnaqz; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=ew81Obqz; 
 dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49c72r5j8RzDqS3
 for <openbmc@lists.ozlabs.org>; Wed,  3 Jun 2020 09:06:44 +1000 (AEST)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 7FC035C00EC;
 Tue,  2 Jun 2020 19:06:41 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Tue, 02 Jun 2020 19:06:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=B7mUQe/m/QAwuYQEUvNnMsZaYMG
 jnigK7346HO98J3w=; b=LveYnaqzjnrLgz8xgf4HXws5QcUwoKNEV3HFT+qdGyx
 UyFdCO70an173r9aJxYa2KrU7pp3FGI/h6WxbvaBRgUU0LJTkTDxqMM5Jr5ADXOx
 eLkmRYwr+Q+WQFg6iBQc24utZMHJ43vSjyKnB5ubdCnhgXNaiXvP6OaavNlxH47t
 KBkmASBkJy/YBsDEUwHglF9T71HHNv4i/gvfygRq+lzfRTqlChEkGLP+yhDvF4Yx
 3Vz7k4TKyqDRy/ZrI9FQBusCAL6aq0+qs5ZJPSNnCsHWffq8oXam3C0k5fwdCLAs
 EkVvADmgfog4KNQU+HuwOo20SKcvhsGXmGvCbDIqrow==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=B7mUQe
 /m/QAwuYQEUvNnMsZaYMGjnigK7346HO98J3w=; b=ew81Obqz2QzNeh5KtGee9C
 yM4eYpUaIRwqJRyMer6XcdyUtSm6m/UGeDJGzr7jGKWmeFKT4FlNr2Puc9Nm2Izs
 El8yVTnJzh9nvziaOuxvERcSrROXhi1YCGIt8RfT/VzX5ULCZVwJUkPh7WFOLnLn
 T8Ts2Z5cI5kKb5C50KF+FNQ13k3LQ1ku+6rELqnE0pKfhJWW7QSIJKTM24OogEAr
 OvviRmFqePY4zHmD+qeuNGNUn+v5c7WTt/HJtVdX499NwUYfAYXD2NGapgj7aVqN
 FTv5pANka8YGj/llP7sDxECa3CwXcYHBF3I6B1k66F8CpkrmMe4zRGfVnnjNfGDA
 ==
X-ME-Sender: <xms:gNvWXtEigkuZtmvLaPS4ZS3WdTzoYAOgXkXe4W4CQcQIlMuUbuyRXw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrudefkedgudehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucgfrhhlucfvnfffucdlfeehmdenucfjughrpeffhf
 fvuffkfhggtggujgesghdtreertddtjeenucfhrhhomheprfgrthhrihgtkhcuhghilhhl
 ihgrmhhsuceophgrthhrihgtkhesshhtfigtgidrgiihiieqnecuggftrfgrthhtvghrnh
 epkeduuedtfeeihfehfeehfedvjeeujeeikedtteehledvhfelheekgedvieevkefhnecu
 kfhppeejiedrvdehtddrkeegrddvfeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrg
 hrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:gNvWXiW1UrAT0vs6FPo0YSkCytZRG14JA-JwSXs6-UXFsWbaTbqFTg>
 <xmx:gNvWXvK2cm1H9r-ZFDP5OeqBUDZRuIoqaE9Bkw6aJK0lXl_8Mita9w>
 <xmx:gNvWXjG9MHI1BBhZXRSSdn6_MpbaO8lwCnqdo3h5elWcwbhw-NtrQw>
 <xmx:gdvWXkcAsUJsVBAx_lF4my6L1s6cOHqjhz127qnqrxsSaThdMXdX2w>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236])
 by mail.messagingengine.com (Postfix) with ESMTPA id A197D3060FE7;
 Tue,  2 Jun 2020 19:06:40 -0400 (EDT)
Date: Tue, 2 Jun 2020 18:06:39 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: William Kennington <wak@google.com>
Subject: Re: OpenBMC Logging and Error Handling Dos and Don'ts
Message-ID: <20200602230639.GK17541@heinlein>
References: <4c4aa12b1ffde80ebbf49ad78b6046889f4226c0.camel@fuzziesquirrel.com>
 <CAGm54UGorGfE-0FKj_+o3faU6sO-DW5jRoqPxFzx0VKwuD6Juw@mail.gmail.com>
 <CAPnigKku77Tc60TAAb_yTJaWNePYWM204BF8erJS7CjhxrAPRA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="AYsPlKobQGgtCvjI"
Content-Disposition: inline
In-Reply-To: <CAPnigKku77Tc60TAAb_yTJaWNePYWM204BF8erJS7CjhxrAPRA@mail.gmail.com>
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
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>,
 openbmc <openbmc@lists.ozlabs.org>,
 =?utf-8?B?6YOB6Zu3?= <yulei.sh@bytedance.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--AYsPlKobQGgtCvjI
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 01, 2020 at 11:07:46PM -0700, William Kennington wrote:
> If you use the fmt library it would only require one extra temporary stri=
ng
> to be constructed and it works trivially with something like phosphor
> logging.
>=20
> log<level::INFO>(fmt::format("My error: {}", filename));
>=20
> It also has the advantage of understanding basic c++ types like
> std::strings and std::string_views.
>=20
> On Mon, Jun 1, 2020 at 8:33 PM =E9=83=81=E9=9B=B7 <yulei.sh@bytedance.com=
> wrote:
>=20
> > I have a bit concern about this. The existing phosphor-logging API
> > does not support this well.
> > Specifically, it does not support the "printf" way to generate a
> > string with the variables to log.
> > So previously we typically put the variables in entries.
> > I do agree that logging the variables in the MESSAGE field is much bett=
er.
> > But to encourage such logging, the logging API should be enhanced to
> > support the "printf" way.
> > E.g.
> >     log<level::INFO>("Something is wrong: %s:%d", xx, xxx);
> > is much better than:
> >     std::string to_log =3D xxx; // generate the message manually
> >     log<level::INFO>(to_log);
> >
> > Otherwise, it's really not convenient to write such logging code.
> >

Separate from this proposal from Brad, I'd like to work on a
next-generation of phosphor-logging.  When we originally implemented
phosphor-logging we were all pretty new to C++14.  I think there can be
some great improvement in the syntax of phosphor-logging now that we
have C++17 (and more experience).

The biggest change I'd like to do is in the way the structured entries
are defined, but I think we can improve the verbosity of syntax in
making a log in general.

Some example syntax:

// Current syntax (and I'm being especially verbose on the namespaces).
phosphor::logging::log<phosphor::logging::level::ERR>("Some message",
    phosphor::logging::entry("EXAMPLE=3D%s"), example_str);

// Potential syntax
lg::error("Some message", "EXAMPLE"_s, example_str);

In a code-review I was on, we had some discussions about how difficult
it is to create data that isn't in the "-o verbose" and I think William
and Lei are both referring to that as well.  I am concerned that a
generic format leads us more to unstructured logging, which personally I
don't like.  My suggestion is that we have some easy syntax to indicate
"also put this structured data into the raw message" so that my example
above the message becomes "Some message. EXAMPLE=3D'the string'".

I'd be interested to hear what "next generation logging" others have in
mind.

--=20
Patrick Williams

--AYsPlKobQGgtCvjI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl7W230ACgkQqwNHzC0A
wRl3qQ//Y9Zrtmxmdu0qoT9zBvi7UbL0UqJi/GcavHbUGoGQBiYZwYQ/CTbLBz8b
NSPibtpLcNf7zljD7rJ8tD0oKFRWvTqPtJlp2/OabgfNc5fpJwS28CjTJ5TS5ONG
7y1GREPmENB8biE1E1wyq0RCkM4XpOF+X2Fi5+aVErjCqX6uSYB+cx+cdKGg2xmC
DTavOUyJGdojJkVluYcG6Wu/mcZPjo5e6M4DhYjI6rfBMm02z0s6896+0zfhxlF9
i5kLyQ5NNqXkHmIQYazXoRMDgAyY65zS64Qnpm3Uca6cLtN1KI4g5qYiFVaLfest
OBABG7wH21HdEkO8bktwNtlfLb1AzgT/6dyzrAA/mNQ5iqO+D7GYb9KQSIyE+GeY
38GBS1Yk9iyqHTMNX4npyIE4MilqSUcqqU6X5CTR+JMlAEHoFZ7mjU+jtM/IAooa
OWAywtUGRwHOWNaHUgj44pYwz1QyUF8iyFtrTpQTwSNjlgKjcZiIrenQrfA9YS2N
xu/3S8R+z6ayGzKuvr7NTTB5pS/HoG0+j6zMxpsUHq4+d4IHfQfA9KMSB5GKFKZe
i0ZoQPNhrSEtH5s5MFT6Jcl4yfKKBaxTOhFeANz76sTURmqBzF9zdXY346qnAwia
LyUIYLdkt2/a+yFDXH4IgdshzZ6IN9SStI22yWC7RqGGp650oIA=
=BIG8
-----END PGP SIGNATURE-----

--AYsPlKobQGgtCvjI--
