Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E82ED4666CE
	for <lists+openbmc@lfdr.de>; Thu,  2 Dec 2021 16:37:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J4g7Z6M85z2yg4
	for <lists+openbmc@lfdr.de>; Fri,  3 Dec 2021 02:37:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=vqeIhOi2;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=TDSLJP5E;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.25;
 helo=out1-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm3 header.b=vqeIhOi2; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=TDSLJP5E; 
 dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J4g742mffz2yg3
 for <openbmc@lists.ozlabs.org>; Fri,  3 Dec 2021 02:37:03 +1100 (AEDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id C15BC5C01DF;
 Thu,  2 Dec 2021 10:36:58 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Thu, 02 Dec 2021 10:36:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=89Y6/Y7WPcGb9gQj9ZmqBvBy1iQ
 q/k1JYKmXoh/eyEg=; b=vqeIhOi2U3aFo5cadCO0ziMrgLCxNFIJs+jmQbZHi3n
 SqJ2cyGAim1s7LLvRq46WO6jBtL/MDu6E20RPPzoAmRN9Bl0S+duNjF6suF3kA9I
 RahCvjOHCGKihfaFXMGpE1nPNjd/vpSwAkESyKczp93ZqVJelj00aOxqmZWbncrL
 p/hzrks6OLSAbUW8CAyO+D/Uvq+WHYZ7mNC260JyD1oBkK3G/xh348zyiFISD0M0
 GXkgq71wJ1cuusBttezzKF/j+S4v0rQVDJBcBcU2fgiUUw/Ojwq+feCsCyMLF73o
 YZ0U3hmur9cg8ATNMkgg5IaikrSTASvVdiSfgwpf+dw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=89Y6/Y
 7WPcGb9gQj9ZmqBvBy1iQq/k1JYKmXoh/eyEg=; b=TDSLJP5EkdLi6GyZgGeJlN
 Qyx+miADgilMLnLjoRg8try+iD+jFNrjzsA+EmWeN4MNaZo5iA1DkumBDS9qzZjk
 F6jmV/pfJgzKll+5fFFtbt1pp7Del90VsgPgDIPAsFV7QjE0uOmeAp5ipbNJjx86
 6Uxa032OtPxepHu3TPGgyLL6Y7rGMtZqjfH9OurCcNIB4EDzjrj3z9Zh+499mAPu
 8KXzPuADSoPeTMxJjmDxsvMXqES8P2haYspO3BtlqGC0Qgf95elfmJsuEDkq5KA0
 n9Df2v3r0f2876mGx7+Kp+QnUd0gAtQi2qzURxZkijhw1QPUv+NvGPEOgULaevkQ
 ==
X-ME-Sender: <xms:GuioYaLVw5CRnj-Qb-KZ3dhEZBuo9z_3mhwQJpqCFcz_LXkqaaI62w>
 <xme:GuioYSKen0qSlty4_r2qYoKGikc1FgbHh4cjRfEPW9JlM4N8l8pp0x7WLq3RNDw7w
 jttoaxc3JCF2i4Cpdw>
X-ME-Received: <xmr:GuioYas4wWjZdoYN8fat7sPHb3IJxJUnVJgnRipdiqjxnpRRu-RyFi7NrEpZDTKgWRXd1Vp0JJhvNz_TThIZTekAqHWdNL-EZcvZ2g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrieehgdejkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculdefhedmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredttddv
 necuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghksehsth
 iftgigrdighiiiqeenucggtffrrghtthgvrhhnpeduffdvjeefteeiuefhgfektdeiuedt
 heekgeelueffieegffeggeegleeltdeiueenucffohhmrghinhephihotghtohhprhhojh
 gvtghtrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhf
 rhhomhepphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:GuioYfYutv-b40vTV0sdQFx5bqtjqCP4GNswA13QVcF0nrjzFE6vVA>
 <xmx:GuioYRbHzmnOyyXFQbVC7QPbYPoXKtoa2aA9cBT9lpzHEyFjNe1CIg>
 <xmx:GuioYbAkF_FNxE6q-9N_psyBfhH3NW999tzFCHknr_ncP67Xel0DzA>
 <xmx:GuioYSCgHhErpczKQ9JOnjfMNt-j6PGhtoyrTpdv9M8Oa1431VYg0g>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 2 Dec 2021 10:36:57 -0500 (EST)
Date: Thu, 2 Dec 2021 09:36:56 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: "Alexander A. Filippov" <a.filippov@yadro.com>
Subject: Re: Is BBLAYERS_NON_REMOVABLE obsolette?
Message-ID: <YajoGODkG52luR0T@heinlein>
References: <bf3a0a05af8f4307ad487f29e0c19da3@yadro.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="K+vW8wU+QCmL1CqN"
Content-Disposition: inline
In-Reply-To: <bf3a0a05af8f4307ad487f29e0c19da3@yadro.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--K+vW8wU+QCmL1CqN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 02, 2021 at 01:29:23PM +0000, Alexander A. Filippov wrote:
> It seems to me BBLAYERS_NON_REMOVABLE is obsolete.
> At least I haven't found where is it used.
>=20
> Yocto documentation said that was used by the Hob
>   https://www.yoctoproject.org/docs/1.5.2/ref-manual/ref-manual.html#var-=
BBLAYERS_NON_REMOVABLE
> that removed since yocto-2.1.
>   https://www.yoctoproject.org/tools-resources/projects/hob
>=20
> Likely it's time to remove this variable.
> As I can see it's copied to all layers and assume it's just copy-past.
>=20
> What do you think?

Yes, please go ahead and remove across the meta-layers.  As you said I don'=
t see
any occurrence of "NON_REMOVABLE" outside of our layers:

```
meta-amd/meta-ethanolx/conf/bblayers.conf.sample:BBLAYERS_NON_REMOVABLE ?=
=3D " \
meta-ampere/meta-jade/conf/bblayers.conf.sample:BBLAYERS_NON_REMOVABLE ?=3D=
 " \
meta-asrock/meta-e3c246d4i/conf/bblayers.conf.sample:BBLAYERS_NON_REMOVABLE=
 ?=3D " \
meta-bytedance/meta-g220a/conf/bblayers.conf.sample:BBLAYERS_NON_REMOVABLE =
?=3D " \
meta-evb/meta-evb-aspeed/meta-evb-ast2500/conf/bblayers.conf.sample:BBLAYER=
S_NON_REMOVABLE ?=3D " \
meta-evb/meta-evb-aspeed/meta-evb-ast2600/conf/bblayers.conf.sample:BBLAYER=
S_NON_REMOVABLE ?=3D " \
meta-evb/meta-evb-nuvoton/meta-evb-npcm750/conf/bblayers.conf.sample:BBLAYE=
RS_NON_REMOVABLE ?=3D " \
meta-evb/meta-evb-raspberrypi/conf/bblayers.conf.sample:BBLAYERS_NON_REMOVA=
BLE ?=3D " \
meta-facebook/meta-bletchley/conf/bblayers.conf.sample:BBLAYERS_NON_REMOVAB=
LE ?=3D " \
meta-facebook/meta-tiogapass/conf/bblayers.conf.sample:BBLAYERS_NON_REMOVAB=
LE ?=3D " \
meta-facebook/meta-yosemitev2/conf/bblayers.conf.sample:BBLAYERS_NON_REMOVA=
BLE ?=3D " \
meta-fii/meta-kudo/conf/bblayers.conf.sample:BBLAYERS_NON_REMOVABLE ?=3D " \
meta-hpe/meta-dl360poc/conf/bblayers.conf.sample:BBLAYERS_NON_REMOVABLE ?=
=3D " \
meta-ibm/conf/bblayers.conf.sample:BBLAYERS_NON_REMOVABLE ?=3D " \
meta-ibm/meta-palmetto/conf/bblayers.conf.sample:BBLAYERS_NON_REMOVABLE ?=
=3D " \
meta-ibm/meta-romulus/conf/bblayers.conf.sample:BBLAYERS_NON_REMOVABLE ?=3D=
 " \
meta-ingrasys/meta-zaius/conf/bblayers.conf.sample:BBLAYERS_NON_REMOVABLE ?=
=3D " \
meta-inspur/meta-fp5280g2/conf/bblayers.conf.sample:BBLAYERS_NON_REMOVABLE =
?=3D " \
meta-inventec/meta-transformers/conf/bblayers.conf.sample:BBLAYERS_NON_REMO=
VABLE ?=3D " \
meta-phosphor/conf/bblayers.conf.sample:BBLAYERS_NON_REMOVABLE ?=3D " \
meta-quanta/meta-f0b/conf/bblayers.conf.sample:BBLAYERS_NON_REMOVABLE ?=3D =
" \
meta-quanta/meta-gbs/conf/bblayers.conf.sample:BBLAYERS_NON_REMOVABLE ?=3D =
" \
meta-quanta/meta-gsj/conf/bblayers.conf.sample:BBLAYERS_NON_REMOVABLE ?=3D =
" \
meta-quanta/meta-olympus-nuvoton/conf/bblayers.conf.sample:BBLAYERS_NON_REM=
OVABLE ?=3D " \
meta-quanta/meta-q71l/conf/bblayers.conf.sample:BBLAYERS_NON_REMOVABLE ?=3D=
 " \
meta-yadro/meta-nicole/conf/bblayers.conf.sample:BBLAYERS_NON_REMOVABLE ?=
=3D " \
```

--=20
Patrick Williams

--K+vW8wU+QCmL1CqN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmGo6BcACgkQqwNHzC0A
wRmtmw//QgJ+QKGfJMCY2I5BdbH6HAoCnCGBz+DycIlUEo2u4M4hDVj7rky+c61b
frYZHzuuuhAqbnDq8LnHIKwxUtshsDHXw9ldtLxmro5eSMnjbuEMykxxeK6CtgVy
iHMw9CH63gzBMF3p6w39CseqWuVAwSYPqKH0LkRFSy7exs1bpjF6UroyVSJxf+B4
+VeCCewmOiL2OeesV7FK3C5vZ52B5JTgFElEEVWkBR2Lzb7WFnqA4acD8gc/b4/+
Q7brfKEivY35GLAJEZVLNjFE8Uwmn2yGDaescCQasouhkgjwgNWOm+auxNtJP615
mJwKXPhYs+U6gcFd9x+fJ6g78iVhesNJU6osPmk6EXaOya7/rSV+1PJyShjc686z
SU8rXuD8yTVirJ//4dlWVnsVm7glaGLcU7BJgdYekT3wT54sATrchZkKqmY9KWYH
jQlM0s4WOfQxvZLDDtDAZOUij4KRHNrYc187uPg67vUNEaNUMtrJjampfpSMYU0w
vkHxRGzIGgHzl3F1l71KZq/0rQTdlqhoTinFRkIvWeP5j5eIPu6Ju6gP3OAdZrQO
XqDg0gNtgVsy/ad1JHFIiDYKc02+keA7sRg6kLbIVfytVmP27ky7qsUf080N7BJx
Prw/r1mvD+FR3L3MbX6FO+5jVnQMUgyWM61w9EbyN+qzYDvxHZA=
=MATa
-----END PGP SIGNATURE-----

--K+vW8wU+QCmL1CqN--
