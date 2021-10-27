Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9079543D608
	for <lists+openbmc@lfdr.de>; Wed, 27 Oct 2021 23:51:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hfj7J2qJSz3c50
	for <lists+openbmc@lfdr.de>; Thu, 28 Oct 2021 08:51:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=bWF23xRV;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=YDTH+Jrj;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.29;
 helo=out5-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm3 header.b=bWF23xRV; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=YDTH+Jrj; 
 dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hfj6s14KNz30Pj
 for <openbmc@lists.ozlabs.org>; Thu, 28 Oct 2021 08:50:45 +1100 (AEDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id CD8B05C00B3;
 Wed, 27 Oct 2021 17:50:42 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Wed, 27 Oct 2021 17:50:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=1sAbElsdrkgQYfIA5Z15uSjuP/k
 DHIqG2KhuvfHbPDU=; b=bWF23xRVfIrJ9U+E/Mm4uA7qE/3AX8K1VXHc2FxsP81
 neF9pwXLtYEGbgPEzb0L+uG1FsYiF9xbaijVg8n8VEemx2j5U3iMQIINXUTfAb1S
 qqnIJRNKCA/FX35eKBScWGtSWlSDOcIu+Kcn9kve42s1nof9SVYP18iw/5YjiAd4
 YBhLGrFHS23dLoJjVtsxle0TqPwBpOZlbuCjUYmdUVcDjo7kJFoAV8h9taoMqtel
 iRn3/wOJjbGG2aqG6E3ScbHj/Sg3KD/bFZpfoD7P3x2JqOp6m2ASgrNq+2hT5Y+n
 2kG1exHyL0dfcFwqRIfX3BLDaFwClJKu/OifZqSYxQg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=1sAbEl
 sdrkgQYfIA5Z15uSjuP/kDHIqG2KhuvfHbPDU=; b=YDTH+Jrj+5Fhz9Tb0un3iD
 Akz0Eg3eqIGx4DOAH6Lt5H1vl19am1AMCDPrh0ClKdV9qYZaeGhZ3Ly0n5smTJ9p
 H/dUZ0kmnug9yPpDg9g9sgTtcSrOcjAhWZkOnx6NIoKzfiYRV+rA2+TfPzTTatg1
 NRmPAikN+pDMvBGF5I7C6zJU18GkOcAAse2LCWc3qM3LAL2hoApSAPUQBN8cO256
 UKQfGTXP8oLPBbAo1XX+/vIvdTy6BkjwHnO1G+jD4Fp3U1mkPQAn8sRLK0f1UM30
 9Q8vCTxJ/xuDBA1FKFNFt30MMY9cviVsK+8whAR2NE8cnzxzsfVqnIl3wcfwIlLg
 ==
X-ME-Sender: <xms:ssl5YQdd7Xh-56jA9bu8aNzfvBrUsSkelnLcX0xvOfHb3r2UgfSU4g>
 <xme:ssl5YSMCD9tnPdv9BJY5dcN5AuRz7Y0lbOgF_dpJa6o5YUlxGM5EkiAftfVGT8yo3
 o6JEIauWuHAp-gQkpE>
X-ME-Received: <xmr:ssl5YRiz8woNmn-ZnMGDmpDrNAfi8tDGIVVy_JvIq6p-vZlGKj5SsBErFCfmQWbILaTmIQNPXZK4tKrxIugiulZZzw2icuBZEIUiyHwWlptcnA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvdegtddgudeiudcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enfghrlhcuvffnffculdefhedmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredt
 tddvnecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghkse
 hsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpeduudefleeuhefhleehjeejgfeu
 jeehhfdtledufeehkeduudevkeeiuddugfegkeenucffohhmrghinhepohhpvghnsghmtg
 dqphhrohhjvggtthdrgiihiienucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhep
 mhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:ssl5YV89rsus03PbP4HZ-4_4VhwXX6nHT4RzVOisEHC5lLHacw6axQ>
 <xmx:ssl5Ycs_K3ZdliB9X4xM5ANtVAl3TiGaxZy9B00E3xzKdSLs4_JQqA>
 <xmx:ssl5YcEnxYXrHWrvmBNMwkgNQdDPY8cceDPhCCsqr2PtEDAZ8Of_NQ>
 <xmx:ssl5YYJkqDV4RlHkNzLCpMHUarOT5FwSAutuKzazyp0qqo1ErbRkaA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 27 Oct 2021 17:50:41 -0400 (EDT)
Date: Wed, 27 Oct 2021 16:50:40 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Adriana Kobylak <anoo@linux.ibm.com>
Subject: Re: [External] Changing the os-release BUILD_ID back to its default
 value of DATETIME
Message-ID: <YXnJsAbwy6AseLct@heinlein>
References: <E9902E4C-0786-400D-8920-9D1FDCBE001F@linux.ibm.com>
 <CAGm54UF4nADhYJPWjgr-ie3z2vGzW6aBvdsyQpJ4dsddgA3FLQ@mail.gmail.com>
 <CAPnigKnnvoiQyroWRyFc4Ps+AZ4XNyr5VsmuDwCOh=2YvHEE0g@mail.gmail.com>
 <80FD1EF5-EA89-4FE1-8075-B07E9122FF8E@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Uh+HHm87xErqZtex"
Content-Disposition: inline
In-Reply-To: <80FD1EF5-EA89-4FE1-8075-B07E9122FF8E@linux.ibm.com>
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
Cc: edtanous@google.com, =?utf-8?B?6YOB6Zu3?= <yulei.sh@bytedance.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 William Kennington <wak@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--Uh+HHm87xErqZtex
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 25, 2021 at 03:17:06PM -0500, Adriana Kobylak wrote:
> Thanks everybody. Changes up for review:
>=20
> https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/48204 <https://ger=
rit.openbmc-project.xyz/c/openbmc/openbmc/+/48204>
> https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/48205 <https://ger=
rit.openbmc-project.xyz/c/openbmc/openbmc/+/48205>
>=20
>=20
> > On Oct 12, 2021, at 4:45 AM, William Kennington <wak@google.com> wrote:
> >=20
> > Personally I would rather have deterministic builds and don't like
> > arbitrary build timestamp injection into images. But we can announce
> > the plan to change this behavior and adjust build processes
> > accordingly.
>=20
> Sounds like a plan. To keep the current behavior, I tested that adding a =
os-release.bbappend with BUILD_ID set to the current git command would buil=
d the image with the value as it is today.

I don't actually have very strong opinions on this and didn't realize right=
 away
that this meant we _weren't_ making a change.  I avoided weighing in before=
 to
just be another "+1".

Shouldn't we attempt to match what upstream Yocto does?  Doesn't doing (mos=
tly)
nothing cause us to not fix the usability issue that keeps getting raised a=
bout
the code-update flow not accepting a simple rebuild?

I don't believe that you can currently make a 100% reproducible build as it=
 is,
so I don't see this as a hard requirement to deviate from Yocto and if some=
one
does want to avoid a changing BUILD_ID we already give them the tools for i=
t.

--=20
Patrick Williams

--Uh+HHm87xErqZtex
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmF5ybAACgkQqwNHzC0A
wRnNRg//UfPY64nww13jkB80yuGDQx9IeknN4O5BclEj9abMeT+0OXP49DlWQKXn
oANBKskpyA6bPk2UXxspFtWfvmBkqNzAzE4otAjlfWrVMeSO6z9zfvCbzKBj5xOU
QhV1Q25R9tXaJlEDuKepa4mHNNOcBt3fEMSKZkWSIhLUvuF4sDg2BsYgvbu++cD0
7zY0OI7L5oD7mhrbW19Jy/Zlw0eAaCo3nQTPecvsD2FsnN72QqLn6JKs0bC7EtSP
9KuoP8tY04wBaaZ8veWaNSHe3ic3OETdLI4r96weVUZaNkw1bTAZPk1460ciQfxb
Xceb9kV1iy8KCOm9dwOqgISzGTI0Oj0Q4JN47cJmazHfzrd+p5Zv814omeqdW57O
1ArPnD0utotcJSZuHHtTnffH2qhECPNiJBhqtR9VS27NLfnaRc11hO1/4rfZDMnU
cbcChSonO2hE5RKCw5ORfy1lSBmeUzKU8/LwYgQ4wCANuGPEtiltEftyB9Iohr9k
ESZsSm3z9aukzniJLRhCLuN2PPwYE2xmPeHjTbzdGVJaxzHSyBWA7LqYD1/4mhvJ
kt239uonSMUJATySspugTlqFeht2wN3YyoMuqc39KtNYX9IiEsuhAOO9JQp8wDow
iTsDUKKoXC7k/gp6TKpa48872jwuE08pmUTp0ew20lP3yWNvAS0=
=NaKu
-----END PGP SIGNATURE-----

--Uh+HHm87xErqZtex--
