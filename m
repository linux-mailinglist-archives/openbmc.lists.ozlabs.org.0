Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C9165B61C6
	for <lists+openbmc@lfdr.de>; Mon, 12 Sep 2022 21:35:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MRGyf099wz30Bl
	for <lists+openbmc@lfdr.de>; Tue, 13 Sep 2022 05:35:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=ASHTuZpD;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=hJgqtLAV;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=ASHTuZpD;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=hJgqtLAV;
	dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MRGyB6rYxz2yxF
	for <openbmc@lists.ozlabs.org>; Tue, 13 Sep 2022 05:34:42 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id CBD1F5C0126
	for <openbmc@lists.ozlabs.org>; Mon, 12 Sep 2022 15:34:34 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Mon, 12 Sep 2022 15:34:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1663011274; x=1663097674; bh=7nz5ogd9PS
	X0BkhqijXSpQZqOb9+7PAAlXiQRAqR7E8=; b=ASHTuZpDSEyyk8J4Vccx3M1Cwk
	VqDK5s37b0Bzlj6hjNnDa9/zx9l45fGPeEXDIwZxr4j1Tp/gP1jX7Zzo2zP3ohFb
	7yOhGNTeIvHOjJLA01beiT9Y06ov6TmmBSqCCYaDjwcvoO0OA96uV3Ut6a3G2KCg
	47QsqZqxzQrjMwccPfZLTyadphDXMCLUGwRCmgUvpH6ZoDJpAAavWc2YUQejAZFG
	wTGHDklYpnP3+zQouDmpP77OY/kEHkpx9lceCr2jKmtKMnAUejunQntV/+NsOwzk
	Qng0QiI9Sn8AbJTyhcXYyIXqTNxzCaMJCi7q8tiexzv1/liGEXwbiguJy+KA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1663011274; x=1663097674; bh=7nz5ogd9PSX0BkhqijXSpQZqOb9+
	7PAAlXiQRAqR7E8=; b=hJgqtLAVu8XVM4RJ4YNuRMWmkzTiY+rk1qst9ztdBRYc
	awjEOo2i20NCiGANtV24SLwn8vjdo8SXO11CIZQtqi/8YRsmzdH3blVu6E0/8wXp
	M8Fgsj8LJHLnfOwHX5v2UzGEDr5Tashwc9P9ogG158wQSya/7pEjEe1hWhGO93dD
	FK4IqIdy3AAu5216X57lCzb+t+2j2TPtGdWNg2p6a/8obZg+hAU9Fn2dBXqNWjir
	qn/ZRjdbow95AoulvTAxLmOOQnFs9zsVCMp5lreEKEJPbaMC3YfX5aPZ9l3BEVyj
	xWmgdPDj5L/roUcdo9883SSqkbLEsuarfkDrnj1m4A==
X-ME-Sender: <xms:yokfY-Ulk6S2Q3b59CSpitF3o-dnR7O7zVt27zLj3jNJxClg7icbRw>
    <xme:yokfY6n8xBMkl77hKed9VpT66WS-JjJku4BzuIRBGmN81TrpcF4RrMwzFwLW-5K7l
    n_5hwWStxdcGXuIYK0>
X-ME-Received: <xmr:yokfYybCC9dBMiTLHNbIJRsanDFH8DRxXdP849WAU8hJdXOB8d9tWgjrxaYhIqQA9eLvztC3osFLKlpnP7Qwx5JKObvcY88h>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeduvddgudegudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enfghrlhcuvffnffculddvfedmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredt
    tddvnecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghkse
    hsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpeeiuddvfffhueeiteetfffhgfek
    keehjefhffefveeltdduieelffdugffgteffgeenucffohhmrghinhepohhpvghnsghmtg
    drohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhm
    pehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:yokfY1U6W1RPxK8geBn2H2gyL4Q_TjB_XN3KfxhHpR4wiWItTeVvnw>
    <xmx:yokfY4n435n4iRS-2WDheXXejTyq2E-h2Q6xPt0wafKlYRiyymGr8Q>
    <xmx:yokfY6eE2iold1utmR73iQdlYP8xU2dj1hjbEJlLA1FDhklVXdZRXg>
    <xmx:yokfY6S7gtDuR2HQFg-4uzwZ_YP0tpStnAzUA3rypnwyHKy7gMNLFA>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openbmc@lists.ozlabs.org>; Mon, 12 Sep 2022 15:34:34 -0400 (EDT)
Date: Mon, 12 Sep 2022 14:34:32 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC List <openbmc@lists.ozlabs.org>
Subject: Re: Yocto changes to TEMPLATECONF location.
Message-ID: <Yx+JyMUlGHdVmbw3@heinlein.stwcx.org.github.beta.tailscale.net>
References: <Yxtir+PEKipZyPXU@heinlein.stwcx.org.github.beta.tailscale.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="61pv7A7sYPT/sqF4"
Content-Disposition: inline
In-Reply-To: <Yxtir+PEKipZyPXU@heinlein.stwcx.org.github.beta.tailscale.net>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--61pv7A7sYPT/sqF4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 09, 2022 at 10:58:39AM -0500, Patrick Williams wrote:
> Hello,
>=20
> An upstream Yocto changes is causing us to move the location of the
> template config files in our machine layers.  These are the
> `bblayers.conf.sample` and `local.conf.sample` locations.
>=20
> I have made all the necessary changes (basically just file moves) in
> our tree[1] and some minor changes to the `setup` script.  If you happen
> to use `openbmc-env` to set up your environment, you will need to
> adjust the TEMPLATECONF environment variable accordingly (look at
> `setup` for an example).
>=20
> I have also updated any references in docs[2] to avoid usage of
> `openbmc-env` and `TEMPLATECONF` and switch instead to recommend `setup`
> workflows.
>=20
> If you have any machines in a downstream fork you may also need to make
> similar file location changes once we pull in the next subtree update.
> These might be helpful for you:
>=20
> ```
>    $ git ls-files "**/*.sample" | \
>      grep -v -e poky -e meta-security -e meta-openembedded | \
>      xargs -n1 dirname | sed 's#$#/templates/default#' | \
>      sort | uniq | xargs mkdir -p
>    $ git ls-files "**/*.sample" | \
>      grep -v -e poky -e meta-security -e meta-openembedded | \
>      sed 's#\(.*\)/conf/\(.*\)#\1/conf/\2 \1/conf/templates/default/\2#' =
| \
>      xargs -n2 git mv -f
> ```
>=20
> 1. https://gerrit.openbmc.org/c/openbmc/openbmc/+/57049
> 2. https://gerrit.openbmc.org/c/openbmc/docs/+/57050
>=20
> --=20
> Patrick Williams

The conf-notes.txt files also needed to be moved.

```
    $ git ls-files "**/conf-notes.txt" | \
      grep -v -e poky -e meta-security -e meta-openembedded | \
      sed 's#\(.*\)/conf/\(.*\)#\1/conf/\2 \1/conf/templates/default/\2#' |=
 \
      xargs -n2 git mv -f
```

https://gerrit.openbmc.org/c/openbmc/openbmc/+/57094

--=20
Patrick Williams

--61pv7A7sYPT/sqF4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmMficUACgkQqwNHzC0A
wRnRtg//QT18gKwgi5ll76FAvW2Zkhh5uGREX0EPRrmHb6BMMkQbB7Ity/Nltexf
s4zXGjygvQdC/uewFQu68o7Ez45gJqhIlEOVQmpaPl9TaZDubjWRiQxBaNRq/L1c
12DrBjpqGWDbZVrJYsEzBMi1Fz62cWm4sQB0LdGdEE7ha8n36knhQCtXNr2xXeVN
WvpvLZEeMglv70TVQsXt+UX0rnsI/NI9YuXhzVxnjcO/OCD6Q0QMdd9ieffcOXiJ
yNIO0LcIwRwL2s6alLu7dBrtbZmxzErRzn0WQ8qFyzjDWZuQqKoil5X5/CeS/gAJ
Yza3XQ2uABIdgUsn3kunXxC7cHtEo2H1UYAFAxRdH59iW2ZvWy8pSTTwTnvXCDRj
1LkYadg9MSy12qjv97lc+jcJIsj5pkcBkpT2c7RL5l6RGEeHA4fqIXLKfD+WVYJ1
1VT+DEwff7oUS0zdSKN0ugwXYPVFE0CReWiCoUX+WbZj85tlgI2a9IEnK9XPmtvE
j7ulzXrKwddZU59Y/a4zV4k8Sg1v1T9rlHo4NKWfKDbrpuBs65jfU/xR9xjGUKy9
fjue+uWZr9HpWaFfOlqKPZvGA60reFVoDR/6DLUdIU/30lQ3tCbZuF9RLH0WWKS4
6khQpg37KGpllEI5tICkq4gKUAhp16/kwBYAhPgnBFIlaZzlzUY=
=yVh0
-----END PGP SIGNATURE-----

--61pv7A7sYPT/sqF4--
