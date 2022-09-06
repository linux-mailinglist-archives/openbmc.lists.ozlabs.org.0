Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FFE45AE922
	for <lists+openbmc@lfdr.de>; Tue,  6 Sep 2022 15:11:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MMQkH3VDWz3bWM
	for <lists+openbmc@lfdr.de>; Tue,  6 Sep 2022 23:11:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=k9A+NKGJ;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=c+VMu74y;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=k9A+NKGJ;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=c+VMu74y;
	dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MMQjt0NKRz2xHM
	for <openbmc@lists.ozlabs.org>; Tue,  6 Sep 2022 23:10:42 +1000 (AEST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id 26E5C5C0102;
	Tue,  6 Sep 2022 09:10:40 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Tue, 06 Sep 2022 09:10:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1662469840; x=1662556240; bh=Uy6W5lQ/9t
	RzurkZCSsHBZGBT4wPVl5Bkmx5xCpOoHU=; b=k9A+NKGJgxd18KLcttKQBRqeHa
	sDLFZG4QWwQ+8hm0COXtycl8g+Uzu5g7b8JsJZv5Vxx7xyI6TMKNAdaR/bMSp0uQ
	JPhuOBWGHXMBJLDvsoj51fqfmGfPRHzY0KynigHXvU7deVp7gyPlZpzpvHhVYP8t
	As3/MECCmtuz1f2+D8JusYAg/7PmIJzm1XJ+jkoAiiNn7kf/3uxKXUZI8IcDSXU9
	HV38fWFw2Q/45GvG1lCEteqjVh0Okl1pggZB1JlZhIxgieV5oR43SlNbN8x4mbP6
	wUOvKChjNHUhAcZyE2ALI+/MbEyFgZFm5BdJHl62Vpir3Mfkj8Hp88HZlkhQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1662469840; x=1662556240; bh=Uy6W5lQ/9tRzurkZCSsHBZGBT4wP
	Vl5Bkmx5xCpOoHU=; b=c+VMu74yu0r110X/rjdkI0E/uLU/dDF1Dgs3AP7cPlRn
	Ff+5ufIFh/gidwmjQheGJJR4/SpTQfimsOaO3w1JGHnJclJwcpo7NqOo+h6xNVSL
	Q5uRwbI/qpJgThLiMq3CfPUlC77qqWyyHGBkW+VXF8oZddTwMBeptIvg3iwYo62P
	9WmvvUxUUMBOgX820OQt8O8m/5PB779oJBgBz5CuBsEpJYewXpX1f8TqVDajSc3E
	Ct1E166E3oMRFRRZGqMu5032Q3gM4pX5lhO6q5YJH2VczqnjCjaA7VdI4re+CCsp
	MfUKczpemB9ln5Un1/XojiegUGOPTyh02I9MZjRyIA==
X-ME-Sender: <xms:z0YXY1rcsppe_voHh2NiCoWj2aqjQYec-mIaaSL6HGv7G5DW4qvKkg>
    <xme:z0YXY3rKDgeOjlpBSDDVpsLS02UTlZSdvK3Kz7JHp6I9ieonMMvw0GF6Bo7bY6rZs
    LE7vktSCJNNw9SGhAM>
X-ME-Received: <xmr:z0YXYyMqDredj8H_WqI73DMX3Ep24og5B7eqqCty8fs1Anu6YwxYqdee9NyyHOOzkrY9SK51ZtwHrWFReoz6BSBnECDUHMiw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdelkedgiedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    gfrhhlucfvnfffucdlvdefmdenucfjughrpeffhffvvefukfhfgggtuggjsehgtderredt
    tddvnecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghkse
    hsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpeejjeetleehleeijedutddufffh
    ueeufefhfeelheevgedviefgffehudelheelhfenucffohhmrghinhepghhithhhuhgsrd
    gtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhep
    phgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:z0YXYw7PCiI40ItkHIZEkpETIo6u-F4eIipf8DFIFr8MYGjsHY_3KA>
    <xmx:z0YXY06BzHXWFU9B-3RC7lkUJz84pioeOhd7xG0he1axRg7xGIksog>
    <xmx:z0YXY4i-DT0DKo9dX2Cotw6Yt9pdgnnHYqkNjalf1z_SOJb31b6-AQ>
    <xmx:0EYXY0EqvRJE6TxldAqRXPJAbR-6J8Kl6LS4rb-8FhWcfF0AzB2PkA>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 6 Sep 2022 09:10:39 -0400 (EDT)
Date: Tue, 6 Sep 2022 08:10:38 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Thore Sommer <mail@thson.de>
Subject: Re: Security Working Group meeting - Wednesday August 31 - results
Message-ID: <YxdGzrpB1jKSQnXI@heinlein.stwcx.org.github.beta.tailscale.net>
References: <e093dea2-ca08-fd8d-3151-2e858164f633@linux.ibm.com>
 <c0f6cc7e-6c7e-fe22-498d-2c3cb7851b73@linux.ibm.com>
 <YxCWpNZ+O89B+ulA@heinlein.stwcx.org.github.beta.tailscale.net>
 <16276.1662067381@localhost>
 <CALYC-5TDj4Vas=Z6VooCWFKi+XFWwdTqe0tQmiyWaiLXYyV4Sw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="H1tEnD0e/y2o5B7o"
Content-Disposition: inline
In-Reply-To: <CALYC-5TDj4Vas=Z6VooCWFKi+XFWwdTqe0tQmiyWaiLXYyV4Sw@mail.gmail.com>
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
Cc: openbmc <openbmc@lists.ozlabs.org>, Michael Richardson <mcr@sandelman.ca>, Joseph Reynolds <jrey@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--H1tEnD0e/y2o5B7o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 02, 2022 at 07:07:58PM +0300, Thore Sommer wrote:
> > My understanding is that keylime is being rewritten in Rust.
>=20
> The Keylime agent is rewritten in Rust and the plan is that it will
> become the official agent over the next couple of months.
> The tracking issue can be found here:
> https://github.com/keylime/keylime/issues/986
>=20
> The server components are in Python and there is currently no plan to
> change that.

Thank you for the info Thore.  The agent is the most important piece to
us on this effort.  The server side (verifier) typically has a lot more
flexibility in what software stack it can run.

--=20
Patrick Williams

--H1tEnD0e/y2o5B7o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmMXRs4ACgkQqwNHzC0A
wRkOCBAAgbQzjG/l3hzusQnjXjoJIygOJ5fTYg1PrX+HOUBD23Y1uQenlK0TWuSK
7GudakILCK09z5wqNEU/nHTBN0dTHyZ0Qth6rRDQLTiaDyAeSoMbv1N8rN6A+wY2
ybW3JDgQSlItJYF62SBC/cCjCGhUWPDhmpLTasiXiCG7y/10R9t+VQTqUWo/b8W6
dHWBq0+ZZx9HmbCzyxEHIHzs7DR/CPhWY5CsOg+CTMqxVCrLQ1Vr5pRbuqa6Wr7W
A3ZKee4eZ8roAncWNY68z29TR3aocQO3LJh0TM99FrtFIFhgZgBUwe4iL+nDj0Xc
FIzZ5mREiwYfOiXaqj+nNSCYBPet+4YicSCYi3tsKdrepOfPN4vrDa63EmX6nJGo
cgkkLufZQdmlFXSvDHxVDLYWY3+xoY/dckART71RjsIrbFf2c905SryRpN3617U1
QxUStHz3TWi0lnR4RJhMmSEeEiXCZS+J6f9FweCaKBURPSEDshBLOCfhN6k7cPCw
Ky1IuUCy0Wgbnp8bbfYmpq5OZWXudyW7KZ4/lw2yDHTDl4fNVqb2MUDyM3kdq98v
EyVoTvEFHS6myZXXPS5xcZGIJ4TPu2eigybhMZfJkIwaN7K5Uia7XkcxbpUiLqjK
Vp25vD/juieKiUHDX4wv0v5zqAgLPHwKGCqrvqosKJl8tAzKhQk=
=2fke
-----END PGP SIGNATURE-----

--H1tEnD0e/y2o5B7o--
