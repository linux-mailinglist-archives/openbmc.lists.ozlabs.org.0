Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D84F43CB5F
	for <lists+openbmc@lfdr.de>; Wed, 27 Oct 2021 15:59:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HfVgX0phPz2ymZ
	for <lists+openbmc@lfdr.de>; Thu, 28 Oct 2021 00:59:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=D0rf2K/q;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=jLfy22Nk;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.25;
 helo=wout2-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm3 header.b=D0rf2K/q; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=jLfy22Nk; 
 dkim-atps=neutral
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HfVg22WTpz2xr4
 for <openbmc@lists.ozlabs.org>; Thu, 28 Oct 2021 00:59:25 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id E584A3201D28;
 Wed, 27 Oct 2021 09:59:20 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 27 Oct 2021 09:59:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=1WlhsCIxAjU5cFVPfqwT195DxtR
 cQ90HTb7d+kOG+5s=; b=D0rf2K/q1W0+0a9Q/ga+n3+QORKN/MIQAdwFk7wYbBk
 Vm/llLpBVsq13wQ2Rj/k9K//J4tWLQaVrysnQyV+rAC+nHAOQ9+Sk2g1jAcibsos
 rzj0kSS7u5GTv2u1GaNqHqWcrvW28YL1D7lzryp1NQPuVJzbWfKp2A2cOcBHo+se
 ZcQ1IMbUNpFAB0Ak9rkQcQY4CGQPByi5wAhmPhKasN+cGRzu3TWzpsVhuilp8XPX
 8lJC74OB5bVHv9qSJZo1cpaY3CG3r0AgJymwCqtz+4VmEmpKXSae+mIaB/cfD+jP
 jqhx8tI3Im8UIPdHX5mvNID2oWkfLyr0ROkiaMGgDdQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=1WlhsC
 IxAjU5cFVPfqwT195DxtRcQ90HTb7d+kOG+5s=; b=jLfy22Nk15lA98hkVqgHML
 GjJ0xPcLqL1I/XgXjgkqz6UIEx90T3TzkF7yl8w/+hg9F5zxonGtidzF6bO/Y+4I
 zFTrcaLsBOl4wWa3tnJhXrMzTtdtxnRw2C4HEXUx8n3aYFmndpsrcj5rfIRr1299
 2sIns/qbKXZB4f4mgOojO7Z0MXpG79zrMXCQTyt4E9cTW7uHKkbKk5yolsk9KdlY
 5cEj9fzFGQrzTC3Jg+ZMa+BxOg/bReGiLr+1FH+i/4lJvUZ/P2lCNDINLagWiXrY
 E3/RpidoK3C4EnMq2V5FQLQqj46czQJGUwcbpTh/YQ0Lkkf+/OsZAsyPvpYrsiKQ
 ==
X-ME-Sender: <xms:OFt5YUFcjhhWFnSHkehndW4aCk7GkGqJkC3o_40Wh2GcmtNEhwM1Ug>
 <xme:OFt5YdXJYQ3nIWRTX3RT5Div64ee-V8f8GxKUS4rVBsmEYHegMN4Q2zhbKjgZtdO_
 VdbR-HNpvjJrxbyMaM>
X-ME-Received: <xmr:OFt5YeKltEue5lvDEuyauhsRIgbcTScztbDufBd4Ifks1E2fJC6WCJNdvZLGeiwpAir_CJfVcqrC5AhiksOAfWiJSDxo7A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvdegtddgieekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdljedtmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
 vdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepuddufeelueehhfelheejjefgueej
 hefhtdeludefheekudduveekieduudfggeeknecuffhomhgrihhnpehophgvnhgsmhgtqd
 hprhhojhgvtghtrdighiiinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehm
 rghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:OFt5YWEZL7bPRMXz0dZ_bSNxrJMe3Vqp86YI-I07sb2kUEjsfi11Bg>
 <xmx:OFt5YaW4iqIIg-vrgyEfwyhnbiz033DuZUBRgqcnsM9YfpLJRK9H2A>
 <xmx:OFt5YZN496XVzzzpYO3Kt7cvgVlm5rj7DLdZgecNnIgy2-FWu1fzog>
 <xmx:OFt5YXhVNATiDe0t77-Nknld1nFw6nOTCUxgu3eanMDhdgSGInrvRw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 27 Oct 2021 09:59:19 -0400 (EDT)
Date: Wed, 27 Oct 2021 08:59:18 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: John Wedig <johnwedig@google.com>
Subject: Re: eStoraged repo
Message-ID: <YXlbNoBeD/yE/bg/@heinlein>
References: <CACejXs+LALZsTbVazgLjOP-K2d89sgTT0jVLpTKiFECfZdcYjQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="PPzHA1opnwhxtjEQ"
Content-Disposition: inline
In-Reply-To: <CACejXs+LALZsTbVazgLjOP-K2d89sgTT0jVLpTKiFECfZdcYjQ@mail.gmail.com>
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
Cc: John Broadbent <jebr@google.com>, bradleyb@fuzziesquirrel.com,
 openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--PPzHA1opnwhxtjEQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 26, 2021 at 12:49:26PM -0700, John Wedig wrote:

Hello John,

> Now that the eStoraged
> <https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/46573> design doc is
> reviewed and merged, can you create a new repo for this? Or what's the
> next step?

Yep, now that we have an agreed-to design I think it is reasonable to get a=
 repo
made for it.  Do you have someone in mind that could be the initial maintai=
ner
of it?  Since you're new to the project, I'd like to have someone shadow you
initially, with the intention that after the initial bulk of development is=
 done
you'd take over as the primary maintainer.

You could start with someone at Google who has been maintainer on a few
repositories already or someone from the TOF (or it doesn't have to be some=
one
at Google if there is interest from someone else in the community).

--=20
Patrick Williams

--PPzHA1opnwhxtjEQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmF5WzQACgkQqwNHzC0A
wRlc9g/+NHebhTaDsVsI1U+c52o0R+Lf1daonWnovGcesA/fOl7R2osNesQMXViX
Has5l4I2g/dkekznoL6mqFHQ2Cf/tejEglRbj3dmq7LGjmBpXbSImVq78uZArP3+
7ZLHpog1EnSmwXuDUJ3JaHCrVbcxGuui9k4E+xsbHfbW+q5+07glFsro552pjqDo
XyL/bzMNemiETiueceeKXDXF4Iys+pLeCz+sR0P6JYVp//z8PkhUCXs6yMvif624
fveeou4Zxi6TmqR5vOio0Ryd0/FkcFL4tVzXZwgxwrzm5/vbw2+YL/CrVNaFB3db
6u7DD+HFfWb2q/HxrcgzvTj6QKaE0RKbdcy+FLEHR408Xvk8rpJMbVMeSiiuJq6M
LRJ/Mv4ketcYt7nm/Gz5lX+4LDxYwJQ8T5Rb2DFZP4/Bdre1SWsEVSZVND29hBBt
LIcKUYL15m0ok3tClNJL6LN65n2RSVkPf3yDvVciIyoZ+HVHhL0rBpI7eQG57d++
h50/wgqV2oL83I4/G/SCDxvNyG76X/meQVrRzjt/nSrjg+eo9HWI/Lp01qcAm07u
pgBJ6D9G7MiPFtvpZVYuSc4N4tVM1y82+nGQ28qf1Zi1C9NDu6+vz9bB3xFSlIpy
0VmKFAnEl8DK8EvbNEDxiX6YD1vCiZNkzr8mSuXumer10enZuHs=
=MpAb
-----END PGP SIGNATURE-----

--PPzHA1opnwhxtjEQ--
