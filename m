Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98B3D477A15
	for <lists+openbmc@lfdr.de>; Thu, 16 Dec 2021 18:12:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JFJb835ySz3c7v
	for <lists+openbmc@lfdr.de>; Fri, 17 Dec 2021 04:12:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=I4xojFEk;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=Nm9zzzAu;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.20;
 helo=wout4-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm3 header.b=I4xojFEk; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=Nm9zzzAu; 
 dkim-atps=neutral
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JFJZf3lPxz2ynM
 for <openbmc@lists.ozlabs.org>; Fri, 17 Dec 2021 04:12:25 +1100 (AEDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 13F8232007BE;
 Thu, 16 Dec 2021 12:12:20 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Thu, 16 Dec 2021 12:12:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=4Ls9Rtq36Y4fduSylXz+PE9Wh68
 nzgBTlpUHTRrJmVU=; b=I4xojFEkTjm5R5f0jRFc9pJvKO3Yr6YOUnHJgVsW/Un
 XxKJt9SbjmY5W2GsMntT/jMVAnh0ukarp1iYUCQAyZbJ4lA3oKL3oEZrvzHFUr0M
 oxR4VYvcBjjv9zMgF1QIfPedDGJn+6VUp2sWQfEj+QPrjJh2wllBj3Hkdn74tZYe
 ZffMeBHuNmTfROZx19H5/SYQKOwSNfvjWZh6hlBt1Z2CB2hEf73xrjhkw7qKlnok
 f4KLlYeXvHEDBX40QIc3zY95JoSmfGZN7XWWk3kTON2h+xvg4lrSLI13XREHWeS2
 qiSz9/dKBht0SdI1jvVP5gwzHm0SCxrNbHoomttQ4WA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=4Ls9Rt
 q36Y4fduSylXz+PE9Wh68nzgBTlpUHTRrJmVU=; b=Nm9zzzAuRgaU8Qzzkx6x9L
 WVx54kfYPNil727QLZCsuc97XAqoKYP3ypj1mDXGzqyrAxUPtdKaYX0XpcWa3P/3
 8aNsd14c2HoVaowSU2f3z57VxbKiV331JRMR7pBYqbTYwv62h5W5tAXBNEhh+Uxr
 sLeg3wYgi8vqDsYTOUwjuwEQQxa1YxWAI7URLV0T63psBBE2X14EKkwLmV9Jqx3L
 nBkiLJMEjksSofEQEmP41pewICmivK3yUc3ljihPG37gwnXBQYKJH2gI/4+Zqvxf
 bgnoaDDYul2Ml1eRef4lOpUPnj0/vbGdSLjqib5dttvDaqz47ujK9LSt7ET1AbvA
 ==
X-ME-Sender: <xms:dHO7Yd--sdIGvDis0qxfQeIdpW-PAaxpAkVIcZbg6T6OPBBh0Pbszw>
 <xme:dHO7YRu7tAb_iI4EBH1zF_ga_5UnhmdwWVBd5f6YfZ5RJAJbFraXX7zO-gNkvw_RI
 eFAcf-8_mI2MZA40qg>
X-ME-Received: <xmr:dHO7YbBEUhlmnVYjzpLM9AqoypsEgE1PC8CcnKMOb5Zqoq5rqdCChiVfvR1P5TrZfjAlEs2ud-Eat0Kg_mls41iEMrHo-ICy>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrleeggdellecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculdefhedmnecujfgurhepfffhvffukfhfgggtuggjsehgtdorredttddv
 necuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghksehsth
 iftgigrdighiiiqeenucggtffrrghtthgvrhhnpeevheekieegvdegvefhvdejveeivdfg
 geevhfdvkedtjeehudegudfhteelheevteenucffohhmrghinhepghhithhhuhgsrdgtoh
 hmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgr
 thhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:dHO7YRfL4OiG97vRmd14gRrgvxroUnI2PeEiugzjUbf9BQ02hbqpJg>
 <xmx:dHO7YSPnpIWsdouHGWUqjxLEwzk8DzRm7iEvIPK4qXpT4LRGS7mjyQ>
 <xmx:dHO7YTl4Cv4hsfNJvl8D8mOkJbgwqBqWvm8M9t928Fw1Wia9CxpGdQ>
 <xmx:dHO7YcVHAcIuvEVXL4DZIhWuc9LW379mOD4ZQ8iFVUGp096MEqV7vw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 16 Dec 2021 12:12:19 -0500 (EST)
Date: Thu, 16 Dec 2021 11:12:18 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Deng Tyler <tyler.sabdon@gmail.com>
Subject: Re: Run unit-test during development
Message-ID: <YbtzcvbSwTjGzfcH@heinlein>
References: <CAO9PYRKmup17BSTLNLdBMO=-HjQ2Lxw+Gcw7+0VY8DKVMed9GA@mail.gmail.com>
 <YbduMfjuc7TXT6Rw@heinlein>
 <CAO9PYRJD0MJsuY8M_80yJci-nT8idKL7VhSXJzvX_JS1wreJzA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="4HmPnhNcEnoW02W2"
Content-Disposition: inline
In-Reply-To: <CAO9PYRJD0MJsuY8M_80yJci-nT8idKL7VhSXJzvX_JS1wreJzA@mail.gmail.com>
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


--4HmPnhNcEnoW02W2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 16, 2021 at 01:53:41PM +0800, Deng Tyler wrote:
> Hi Patrick:
>     Thank for your kind reply and that's really helpful. I am trying to
> figure out the meson subprojects system but still encounter lot of barrie=
r.
> I run unt test using command "meson buiildir && ninja -C builddir test" in
> my development environment but never work. Could you help to cite an
> example in current openbmc repository? Do openbmc contributor run unit te=
st
> by meson subprojects or run-unit-test-docker.sh when they are developing?

I can't really comment on what other people do, but I can tell you what I d=
o.

1. If the repository supports Meson, I always attempt to build / test using
   standalone support (ie. meson subprojects).

2. If 'meson subprojects' doesn't seem to work, I fix it to make it work.

3. If the repository is anything else and it isn't too much effort, I try to
   port it to meson.

4. When all else fails I use 'run-unit-test-docker.sh'.  I often execute it=
 with
   an alias I have: `NO_FORMAT_CODE=3D1 lf-ut`[1].

---

Do you have examples of meson+ninja failing?  I'm fairly certain it works f=
ine
for almost every repository I'm listed as a maintainer on.  I've also used =
it
(or fixed it) fairly recently for: bmcweb, phosphor-logging, and
phosphor-certificate-manager.

Maybe you can point to what failure you're seeing in that case as well (you
can upload a log to gist.github.com )?



1. https://github.com/williamspatrick/dotfiles/blob/fb542abf99c944051544990=
f69a6d20c82d2a904/env/30_linux/lfopenbmc.zsh#L76

--=20
Patrick Williams

--4HmPnhNcEnoW02W2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmG7c3AACgkQqwNHzC0A
wRli+g//f7i/3Cx6x/PKn0KvzpHrDR31qxsqHkgi9ODeU6LNcnnDfEeUeMFQdVR3
0OXAndfwT1D2kTc3+ExOSJdKOkCrcysOjce3Uszx9wjX+zEb9iccNCvvrCpr/BqH
B8cOKEfYrmmzpTSqjMfdT4Wnw1zyBrh1rmCkOW18bzluf/LWiV6UwpPHYFf5j9VJ
eXmLnXJW5q7vQoNEcShJmMq1P0CfOd9enGQEMtyGknTRmtbN7bzshwcTPpyf0llG
aoH4wS6rG0Zc0MeTu5YA5KOKgFwgKgdgijVceVtTX0u/hlJ94q1QD5t5H+rCZGAB
ozuO/n2XA9KjMEURJphGb6aYjgzYveAcKFFgMCzC4kOr0EWiIkhz4cmk9kQOVHM2
kJsqXp/KV36M3tGuyvKh+Dl408zHiyaMpWJynFK5rTQUkNBa65PAtzTtk5a0Pivg
bVmOMrpwp+YJ7Nqwtq5ADYAGAoPOqDxVGZQoB92+V/optkntVpt2UajPRSjUNf/S
m1XrWq8qysTfkHK/zJ6X/q6YtgIHJvAjbtfl9PfqGjZpbvWeB6FjSdC2+T9SNTsZ
DggHW70h91fxpiajNtAhQCZG+drBuy7s3ZqNnry195XRffmtk/gObNK5j45Dhwko
cXWj6s7w8+73PJjSMr7nEkjvKUaBWKuZK4pvXOaTgOqUEshIM3A=
=DEno
-----END PGP SIGNATURE-----

--4HmPnhNcEnoW02W2--
