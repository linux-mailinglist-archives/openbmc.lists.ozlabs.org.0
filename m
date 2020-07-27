Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DA0F122F6BA
	for <lists+openbmc@lfdr.de>; Mon, 27 Jul 2020 19:34:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BFn3q3B6HzDqHr
	for <lists+openbmc@lfdr.de>; Tue, 28 Jul 2020 03:34:15 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.26;
 helo=out2-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm2 header.b=HvD/HvLK; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=JipDdiaz; 
 dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BFn2W2xN1zDqBH
 for <openbmc@lists.ozlabs.org>; Tue, 28 Jul 2020 03:33:05 +1000 (AEST)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id AA2B45C0210;
 Mon, 27 Jul 2020 13:33:00 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Mon, 27 Jul 2020 13:33:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=NkmKa3sLAlmWHAF+Qgr61Bx4kjy
 R3dRQb+Ekm4BDPoo=; b=HvD/HvLKKqABILlDFQmk0ddWcKcnMNKXIcGfGTnCjFA
 QIkI6bRbTjKZuTsTpKecgB6B+HMQJvoKlCYGL6X5rKvJlOInsdek8p6KLkzIf/K7
 ZPqqsePfFfxzxXwRcu4tdMsCCgH1c8I/zDtCydGkXjGCB1emInsrXTSA3mPJkj25
 51nOQJrNgKT8V0R6SFJvkDG7Ls0+WrB1ycBIweWbvxqI6TVqZjv8cpDkRHnlN16M
 UOG7KO8yrw44j6DoqhOmbKbQw4OraAawi9OLMIZXCrynGgTnEK0qpeV8HHJyyq6P
 p0D7tTBmCH5Q97rJd2e4YkwUk9wpWzZRXZQLVGadCJg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=NkmKa3
 sLAlmWHAF+Qgr61Bx4kjyR3dRQb+Ekm4BDPoo=; b=JipDdiazVV4K/6M6a4OXo4
 K5gyH3/xBtED2J7AGIpJt5cEbBHr3hVzgDiYbunmQL4CQ9oURgPcNiKWUXbDmKbx
 7WBjLRQkQWYzvoYz7FxKilBskl5QKZWaMHRyIYYYbtAbuqa8nlzRqjHCkQ4ogRnU
 +pVBjJHgTvIsTX2Ijkoa/9lzvk+ZeaaN+Qc6um6Zki25c0FCIr5E1BqEurhRPgFT
 6Genud+AaYQz+X1GeCXyQSTv/kuxGM+Vldp5Fw446KV5U+3YJVr4FpoSsorAk2NH
 IDb5l8OovoLbtt3SoGQU7zS9e9TbgAA1eEOwr5Vlfp+NDfZNQWUD6kgX9Rzv2h6w
 ==
X-ME-Sender: <xms:yw8fX46gbHOudqPX7sEqU0o3UPRfPU9J2At4LhPasW2jt7sDkIICSw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedriedtgdduudeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdljedtmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
 vdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepgeehheefffegkeevhedthffgudfh
 geefgfdthefhkedtleffveekgfeuffehtdeinecukfhppeduieeirddujedvrdduvddurd
 duudeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhep
 phgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:yw8fX54MXizMjv94j29vasS_GzjEVGTtFdMzVhenCdVLWhrnd9ceyw>
 <xmx:yw8fX3eraQBotNHw2-JmDROG-qjcoA8P-pkksMNM-iRmBKcyJrhmhg>
 <xmx:yw8fX9JXoqVaPuw2FrB6J46jHqn0n_Zn5BUZA6UpuakQj0Jm6dxjPQ>
 <xmx:zA8fXxVPj0vwYIHY7IF6_QtOMSgsKKr2flAgI3WVdWvRna4e-lrsSw>
Received: from localhost (mobile-166-172-121-118.mycingular.net
 [166.172.121.118])
 by mail.messagingengine.com (Postfix) with ESMTPA id 8FB5630600A6;
 Mon, 27 Jul 2020 13:32:59 -0400 (EDT)
Date: Mon, 27 Jul 2020 12:32:58 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Joseph Reynolds <jrey@linux.ibm.com>
Subject: Re: BMCWeb policy for HTTPS site identity certificate
Message-ID: <20200727173258.GQ3922@heinlein>
References: <d50417a7-3cc2-1674-b4d1-09283c4ddaf5@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="BouVgDkIlpb7X6Bk"
Content-Disposition: inline
In-Reply-To: <d50417a7-3cc2-1674-b4d1-09283c4ddaf5@linux.ibm.com>
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


--BouVgDkIlpb7X6Bk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 23, 2020 at 10:25:40AM -0500, Joseph Reynolds wrote:
> 2. certificate is good but expired or not yet valid - Use the=20
> certificate and log a warning.

I suspect that "not yet valid" is a more common case than might be
assumed on the surface.  I agree with the recommended action.

Many of the Facebook server designs do not have a hardware RTC available
to the BMC.  We have an RTC accessible by the BIOS and we also sync with
NTP.  That means there is always a period of time after we first plug in
the rack where the servers in the rack have a date that is way wrong.

It is reasonable to assume the date is just wrong and the certificate is
valid.  The clients can validate a certificate which is actually out of
date.

I'm less settled on using a certificate which is clearly expired, but it
is still likely better than using a newly-generated self-signed
certificate.

--=20
Patrick Williams

--BouVgDkIlpb7X6Bk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl8fD8gACgkQqwNHzC0A
wRnm0w/8CAhn6wF8WEgyLSMsWyxjyI4vcYRI4akHcub/n1LOfFsI4+g0KXuEcZGc
/LuniPfo38Phg7lrRjUQOwLYWUh/WspVRwIEBRceiFK2DgezRxOyjw3rJZdEvAAQ
dJN2FxzHyOdLS83Al5lPw68YU8AI94t+G6gded78GX5mT6sv4aSDmvRoTfaFfxqW
NnIGjg3Nw65H46ZCSL07+RDVTqy3VgCYln6+0I+2fhZvdmfxrocHR8hIMiTzTsMj
Dcj5wpnRV+wndqIk3WZAl3VnILG6svTUmDCEhHqu6BDA1URhWZM/0IIjGvhtrEv/
q7lcenyJzw+dSHJvglnEtDw3olUeHqV7icFUOjM2RnDpu2ilzaANPHWIYB/clYK6
X3512VzWJNUDO1pSWv088EnLlObpawCPNapLYTOgSzzIOMzpbZJ7hEVPe2TGBYS9
IrDrMWDJ8Aw9jiEiNqwOsDqij2+cmFECn4fmjVf21KrvqNpK7i9M5fZTxAIk/oKj
d+n/2IUoKdITQ+ch5FdPJpFMp/Si0d0YaCaEgIJsSIv8PlfqI05qrkqT8tIF1/AS
wsV56mm+SDYHMelfge5kYiHk7cbb3W/nxUgE2cmKEmi+hz79re2yxpdimD9+maXy
zQJhJ0c4kyzL4JnekkayWlRwlcmfEYxmmjSCNzBJqlk10AOtI1Q=
=iA4S
-----END PGP SIGNATURE-----

--BouVgDkIlpb7X6Bk--
