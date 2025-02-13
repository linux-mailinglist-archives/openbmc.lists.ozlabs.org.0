Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E277A34F07
	for <lists+openbmc@lfdr.de>; Thu, 13 Feb 2025 21:08:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yv5pL0fl3z3cVc
	for <lists+openbmc@lfdr.de>; Fri, 14 Feb 2025 07:08:10 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=202.12.124.151
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739477287;
	cv=none; b=YF4uLoxFDyzEwT3aGoHL79GcHLx4/TmZZfBHQ9N56Sf8TPUzxc92UMgBQln2dxEM8z8cdfzhYRQNv8qVF+uDsmdhCP+RDtwv9A0T1+D1nOtmDQng1TxBxd3Grli43qdCNO7uQyIAV9jEE8Cu3aS38y43NoUm1Yqle49IaJ0iaoIORHn3EqKpl1innpygRue61+D9PNddYTCGuYGXNB97KW6UHr31gvqKYiOKqrz+5hTiJ9NN0t858EIdv51wc4mQvS+w0L/U3ZomQjhbFkodDxPVdXA0JKUyIiDYAzqpZvikcdzDfDfs61TpOXZ6IFfXCuE5bOj+EFRfEjaBvPC1+g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739477287; c=relaxed/relaxed;
	bh=MNFWum91DhmHRg6b6DQC9WJ3iYneYnHqPeq3pG3Wbgk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VvORnF+MLb5y0R9346qMFq3FKfTJMrwlz8hC4hEN0XQkJ1LkAUHlaEp75b7gk/DrK1vetZBZgwei66uqmSAWH4au8OPBFS+Ho1Ny0XhpfpRTqIQL5MCybq0QPHcyrPAc6P4RsVHMBuF7feyt2HKCPvstj60MrWxsbSz6xqfIPax3M7bpYPnaFnAPRhK/qrupVvAZRiImDw73uuCCnvLV+l4syAAc1tTFhDl1mxdGidnaN62+97T5coxFJYCGHtdcDDTDY4lS6GEltNGp9zEn+6tT6OXxa347EUX/90uUQ8q5Ca+fuWsTvO3HAUvXlGUNKjklyWoGo0hehDvH/hdS5Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=stwcx.xyz; dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm2 header.b=CJb5Lv0J; dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=0/SHxB9W; dkim-atps=neutral; spf=pass (client-ip=202.12.124.151; helo=fout-b8-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org) smtp.mailfrom=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm2 header.b=CJb5Lv0J;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=0/SHxB9W;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=202.12.124.151; helo=fout-b8-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org)
Received: from fout-b8-smtp.messagingengine.com (fout-b8-smtp.messagingengine.com [202.12.124.151])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yv5pD2b7Hz2ypW
	for <openbmc@lists.ozlabs.org>; Fri, 14 Feb 2025 07:08:03 +1100 (AEDT)
Received: from phl-compute-09.internal (phl-compute-09.phl.internal [10.202.2.49])
	by mailfout.stl.internal (Postfix) with ESMTP id B62EB11401BB;
	Thu, 13 Feb 2025 15:08:01 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-09.internal (MEProxy); Thu, 13 Feb 2025 15:08:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1739477281; x=1739563681; bh=MNFWum91Dh
	mHRg6b6DQC9WJ3iYneYnHqPeq3pG3Wbgk=; b=CJb5Lv0JaPvLMJ39WzSLV+D847
	Ie/BudbwgY+efbJGvkzp9vwBWVHqixUw3Dd3TcHxKc5t0czc86MZ8cc1j6A5z/3v
	qZCmG11ce29jF6uoaaW2RvQG6z7C1dX5Za+RF0jrcwBELJvH9WfJybx7UuUpx4C/
	s0IybDD5oo82xDxIlpifPlcRlYa7etHf7I12zzAAUKI6ahYa5KfZal3owtvxTNfZ
	p2vAKlEOSJxhwIyc6++c9PFD8bbDt8kuTIP3b2kcCG6oZ4T3bv+cwnNw2umsdAqO
	NDxhAstL/JcDg+11LgO9UeT+fL5PGo/ryCU/clODKRodvkBhZmr7QpAzPk0A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1739477281; x=1739563681; bh=MNFWum91DhmHRg6b6DQC9WJ3iYneYnHqPeq
	3pG3Wbgk=; b=0/SHxB9W//JJtoaLZkEvWj3wIAzx9X8xQ2Ecr2+Whj3tQb15Asd
	TGjlj3a2J2lPl9Wenogd4chTDxcf4f9R2e/qYfnkYgZGASTdJfCMo1X8nVblePYJ
	C8e/Lf7DSWifuXzV4wq8Q9uDutF7nzCBtmyAQkca5UpyFwI8lIyN0M9FoEFJb30n
	LRiJynkbQUDRjAzQOBLR86jf9XzGE5JWC2/TDQJHWpHiE9SuRCW0hVgtG2hHuMZ6
	Eu0sBl73xSL1FSuQgNgS0Aa54OKNYXmPVojdaDaPksQa9mAdljjd2F9TVWBq4+nE
	rLA8FzD1Nb2aR+TO8EaN/TTTLKynDtpntFA==
X-ME-Sender: <xms:IFGuZ0HzIbLcVN13aKeqoQO774OoyVESFK2qrxoBuO2NooxxbaKXNw>
    <xme:IFGuZ9UU4z5oj7G8oVXMQ7wcrBfu4__H_iY3NIPUnimxr_fqrXZATWApANByfcgk1
    GZqu3kYlL-kd4vDBTI>
X-ME-Received: <xmr:IFGuZ-KUI63YxwwMlFbkGQH27Iq59HWxcxBG28AMfM7Mv4qLZ4wRoriGMR8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdegjeeikecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecufghrlhcuvffnffculd
    ejtddmnecujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhep
    rfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhesshhtfigtgidrgiihii
    eqnecuggftrfgrthhtvghrnhepteetiefgfeegtefftdetueeltdduveegleegkedvkeeg
    udekudefhffhtedtuddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
    hilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihiidpnhgspghrtghpthhtohep
    vddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohephihulhgvihdrshhhsegshihtvg
    gurghntggvrdgtohhmpdhrtghpthhtohepohhpvghnsghmtgeslhhishhtshdrohiilhgr
    sghsrdhorhhg
X-ME-Proxy: <xmx:IFGuZ2HcJDEfw4xqoYb7ILTSECo-ZruRLm9IxjdtfPDjx9g5KkGSeg>
    <xmx:IFGuZ6W_YI5hjsZuVg7F3ZSvgQ6m6fj1AEuQj8VbfNCqrflKteikQg>
    <xmx:IFGuZ5NzYs6SawPVCbzyaFO-AYld4DPH43fn7kmb2v3rm35BjRfRZg>
    <xmx:IFGuZx3Z4svulSoAU1I1pQ-_GpJeixXdO5sO4qST8G74ol-AgKjs7Q>
    <xmx:IVGuZ3g8JFyuPHkcjBsY1UYJU9s5g9pHZGEOYjJhf6Tt6deLQawAQ05W>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 13 Feb 2025 15:08:00 -0500 (EST)
Date: Thu, 13 Feb 2025 15:07:59 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Lei Yu <yulei.sh@bytedance.com>
Subject: Re: About meson clang-tidy issue on some repos
Message-ID: <Z65RH3gxf7x1QYKF@heinlein>
References: <CAGm54UHxNhSkzC84hS7fh_s-DpdOuii0g2O=GU4Z1aPQ6YMgKw@mail.gmail.com>
 <Z6v8ivnGwbt1QCDk@heinlein>
 <CAGm54UG-6wUB7LfC=GR2bJorD9wV-nNYaU5se5+FOL-w17kDyw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="3upQtSNq5zTA5lJ+"
Content-Disposition: inline
In-Reply-To: <CAGm54UG-6wUB7LfC=GR2bJorD9wV-nNYaU5se5+FOL-w17kDyw@mail.gmail.com>
X-Spam-Status: No, score=0.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FROM_SUSPICIOUS_NTLD,PDS_OTHER_BAD_TLD,
	RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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
Cc: openbmc <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--3upQtSNq5zTA5lJ+
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 12, 2025 at 02:23:28PM +0800, Lei Yu wrote:
> On Wed, Feb 12, 2025 at 9:42=E2=80=AFAM Patrick Williams <patrick@stwcx.x=
yz> wrote:

> It's not a "fix" but a "workaround". It's always possible for a repo
> to have a disabled-by-default config.
> Instead, it's more like a bug in meson clang-tidy, that it is not
> expected to check the code that is not configured to be built.

No disagreement.  I also see this as a bug in meson, but don't really
care enough to debate that with them.  If we can fix all our code to
still be successful, we might as well do that.

> Agreed. It's a meson clang-tidy issue.
> What is your comment on this? Which files are expected to be checked
> by clang-tidy?
> a. **all** the c-like files in a repo
> b. or just the files to be built
> c. or ideally, the c-like files (including .h/hpp) configured to be built.

(b), just the files to be built.  I don't understand how you run clang-tidy
on code that doesn't have compile_commands.json entries.  The whole
point of that compile_commands.json is to pass all the same -D
directives, etc. to clang-tidy as you would to the compiler.  There is
no compile_commands.json entries for header files.

--=20
Patrick Williams

--3upQtSNq5zTA5lJ+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmeuUR0ACgkQqwNHzC0A
wRmCQg/+JYmaiI6F842tpau+wGgsyBaF7EDHcEUNhTBi18gEIt3R+09+kTLqoe6x
8KIA+BP/3C2UaNkNffiDgME8/dkmMUxe4PU8BDwBrbgeQkCPnRTuveF2/gJcTBOw
8uukZgiLAiBva5XKYrtcG9tLt08r7jLv1l9r6ScHa4HgDy8gm2QFWH9FjooNJt4k
rfuOHGRp+znSV6OA3Rs5cZX5p+PsDMlG6M0llvvWlASUasakAK4gECEY5YnDpnDv
qRCJ4GTgUf+U2Lld3BKhKmLYYncHPTVyeCSaUqDzxXFvWShNX71UhVFw7hI8jR1m
SnJkgkqyp833fOfVbnSus4Dj2MMY3lD6464ji2JmmPIMtHC/SwtXXxCJ2ErKYuHG
ZN0PdtapQNFozxYCfAYsiKq3M/vkqedgnmYjZTI0inTONCrtVn60yGK1We5EmNQ0
WyI1BG+x+y6mNfuKlE1AfWF9poMd1eMY+WcqwDfS06Nst6jxv0Svq72HG7JK6t52
9Xg3/AvqgEuQ00hWV7nIBzDNnC7TY7g0Y7P7LlK9BCYZ+sosDi74q8NbgZFat+na
rdolIInkh5QVXLlRrQ1FFo0TQrHgKNjW/fnXSFfZH4XoVGPs10aymo9J/N0g9F9H
TRO/7RfPPWgXmYLdDyOFuoKuYft0ySWHczSzkb8rBwuUTHZ049U=
=wBof
-----END PGP SIGNATURE-----

--3upQtSNq5zTA5lJ+--
