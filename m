Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2675F163576
	for <lists+openbmc@lfdr.de>; Tue, 18 Feb 2020 22:49:46 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48MZJR1BqRzDqWT
	for <lists+openbmc@lfdr.de>; Wed, 19 Feb 2020 08:49:43 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.18;
 helo=wnew4-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm1 header.b=lqJ/znH3; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=gtKBjvl2; 
 dkim-atps=neutral
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48MZHS1y3pzDqVp
 for <openbmc@lists.ozlabs.org>; Wed, 19 Feb 2020 08:48:50 +1100 (AEDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.west.internal (Postfix) with ESMTP id 20AFF640;
 Tue, 18 Feb 2020 16:48:47 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Tue, 18 Feb 2020 16:48:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=xaZRldY729EvfhT395BeIun8/ST
 78dyk38nyMJQsGj0=; b=lqJ/znH3tjKSpdmhIO2UTQRzxZPt4KV9HXJk48psc1O
 Rne3DfIYWf24mjvzTLL/eaAJ9fyKkkqG10LBjPOwsox9jBNyT90cRIdWidOuAt+L
 QtHslRn0vyLljbw+1/EEJU/jOPVsVGPN+O8QuDbjp33YC5EPNss6Lobe+IBzGN7O
 7qdcU2AVtMlGDWzydExuuArNLCOxep2tWRs4Busx2sHKtkUerh4wkPr9zLzOm3Br
 7vLbi8dUqmXjpd3qGhkff5krt7bngqfqeFsvmOQUuYW3NMcfg0gBiPdPE6OsSM+a
 iTZNrZnkBdRoQiGUyNzsbfDohw7i96d2sTrey+nueHQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=xaZRld
 Y729EvfhT395BeIun8/ST78dyk38nyMJQsGj0=; b=gtKBjvl2EnCwyzj4bTb1Ly
 NwA1ycfgouHYTvTECiKhWMINM2Z7jVBFLsllBj7rJVAwnBOA3Qv/1lmkU2rxPrfM
 3PZZvSE5E4tGwNvzn5KMzb1l8hPYDYjMbp0mqCjKbaLXz620c1orVgOeZDaxX3Sq
 J0JnvICGmP0RbRHOdOYq+PzNUW0DqP60B3Q+PneJxOH5SjFYsEt62I5EQQd7zUsa
 QpgrbxfYOY/kyx45qEJH6ayjBcIZo7QUX4XMOBvJVCdotQBmr3ZfaPJf706ESrwe
 4ak0tO6DfxwTL4zhZcra8Y+JUgyVHMxMcixfVCyUWHfeeb80BGS7Pqqc3KcAgxsw
 ==
X-ME-Sender: <xms:vFtMXmzMWk8AFmIeDX0kuyaBRLwS9p14LRbPcE1bnwph5JNR-ZBdxQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrjeekgdduheehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdljedtmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
 jeenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecukfhppeduieefrdduudegrddufedvrdefnecuvehluhhsthgv
 rhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfi
 gtgidrgiihii
X-ME-Proxy: <xmx:vFtMXun-jDrw3KX8BUSyS8J_y7GrNZLB3svir-w9cpAdf99YOD2HSg>
 <xmx:vFtMXrHo2LYFfH--hjvL5VKlcMqmq16he4YyKpSCfpm5pxdKEwGzEg>
 <xmx:vFtMXuW4KZX3W3uekW5br4-OZ8Ch0e4umsZaDToBII0uRyfKzrHvow>
 <xmx:vltMXsTE1DTdIO5D6-oKZ8D_6GvcW5bvuDcQiodQrZ8b7iqO3z2-uWacSo8>
Received: from localhost (unknown [163.114.132.3])
 by mail.messagingengine.com (Postfix) with ESMTPA id 6A0053060BD1;
 Tue, 18 Feb 2020 16:48:44 -0500 (EST)
Date: Tue, 18 Feb 2020 15:48:42 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: Re: Request for Feedback :: Time Mode setting in timemanager
Message-ID: <20200218214842.GE2219@patrickw3-mbp.lan.stwcx.xyz>
References: <68732B2D-EB7D-418A-86D9-3095223A31FB@linux.vnet.ibm.com>
 <5B7FD9A0-8A4A-4BCC-9BC5-77B5DEBCDD00@fuzziesquirrel.com>
 <20200218202507.GA2219@patrickw3-mbp.lan.stwcx.xyz>
 <25B4F046-9688-4F23-909E-A5D929349E84@fuzziesquirrel.com>
 <20200218205231.GD2219@patrickw3-mbp.lan.stwcx.xyz>
 <B85A545E-2557-41AD-AF8E-C516B18B066B@fuzziesquirrel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="IMjqdzrDRly81ofr"
Content-Disposition: inline
In-Reply-To: <B85A545E-2557-41AD-AF8E-C516B18B066B@fuzziesquirrel.com>
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


--IMjqdzrDRly81ofr
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 18, 2020 at 04:01:58PM -0500, Brad Bishop wrote:
>=20
>=20
> > On Feb 18, 2020, at 3:52 PM, Patrick Williams <patrick@stwcx.xyz> wrote:
> >=20
> >> oes this have to do with what is going on, on the BMC?
> >=20
> > When the BMC owns the hardware RTC, { Manual , Host } is the only mode
> > that allows the Host to utilize the RTC hardware without being subject
> > to the provider's time infrastructure.
>=20
> Would this be in a situation where the lessee can=E2=80=99t run NTP on th=
e host?

IIRC, { NTP, Host } is an invalid combination.  When Owner is Host, we
allow the IPMI commands to set time.  How the Host got that time, we
cannot control at that point (NTP vs operator).

--=20
Patrick Williams

--IMjqdzrDRly81ofr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl5MW7gACgkQqwNHzC0A
wRlEHxAAihzXDtXxnVhuzYgJwuXLztBsO1vEaGY9e1fXWmbozdSj7qm5sd4pS6Fm
qBEZfqGHvnzoLcX0kkMnyOlMYsQQT75aWb5Qz4lcMfk6Mr1Jy3vGfL26sL6/Hm3A
JjsupCM5lHSMojWWKdS92471zd0MKu4tpa+uOeFD9cDkeX2lCl1LFxUHrP2qRhkv
DqnpRQ0SlslQnL8kC6YM3W8JQvb6clbRcNrpo7BSYoVKnoOtWaUlrkJDqUMKrldR
IvtRSVTsTrQGaas9khasviSejZ0slur46EUtdeBah16DoSo6uKtD73Eij8XqrdaG
J0ByWZxiSq2XLJqCdQlluL5hvCvAKdeVj4ayxd86ypc5OrvNagu1L15cwPEWDOSw
WG4CXN3QDmd02VUYb2K0c7pIhzNVSeInB8xTFg28fdVOvESSBu1ksEmHH5n+uspj
5eOqtcy7VnxYGi6DBqdye6vkmPlgb5JRzbjiVgCnl2rfO5n/IR9+oi6v5ikEtvwX
2DaJNQ8AwksHWm6lN8pbWCuUmUpZpSApx5WkmCGYy3QGfOSXKYPgENbcJNzXqW/b
wqEP+7KDEKDn5FIin6hFYbG/B6Eo325yNKawt7ZthgylRCfgCGUXlEJ5jnxfr9QS
zE7ppPgM9muqPDKgr6ZtRBME3ihd8BUhZEhWQLRJRfLtooNm0bI=
=lapr
-----END PGP SIGNATURE-----

--IMjqdzrDRly81ofr--
