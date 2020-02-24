Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 022DC16B110
	for <lists+openbmc@lfdr.de>; Mon, 24 Feb 2020 21:42:24 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48RDWx1c5szDqRF
	for <lists+openbmc@lfdr.de>; Tue, 25 Feb 2020 07:42:21 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.229;
 helo=new3-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm1 header.b=McBfTgMG; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=jUNxN1+s; 
 dkim-atps=neutral
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48RDWF2ByHzDqMw
 for <openbmc@lists.ozlabs.org>; Tue, 25 Feb 2020 07:41:45 +1100 (AEDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.nyi.internal (Postfix) with ESMTP id 707195EBA;
 Mon, 24 Feb 2020 15:41:42 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Mon, 24 Feb 2020 15:41:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=HVFK4gK4hkbsCRw6W6ufkPnrHw/
 1Zou4Ms+rLZaSz6Q=; b=McBfTgMGKsmvUSpTdwnyf97wkG05Pwru3jqNot2JjCv
 A38SseCNv563vagFKzbyJKCopBVunwYRDfWnYd1gwys9G1L1Fu8vb5VyiIXBBxHN
 lfWgsTTFbrh+ZSekmxKymMZAwJYpGgbBh5E2TIzgHxqfoaAfVwoLekxu2TZS+kpp
 tYVpvGS0NTG6kdEXL5IwA8rpl3itHni1LFe9sS3CR0/wkMIoVsbHrzoZYjY9+9Xd
 9GVMfd/s/w1Z6SjWUU64ZbH4orHTV7sU+mwXoj5S225HQvVIWx4AtYuDSiBg8+6I
 aFGi8uLPwq7eu1JDtuiRyFxsSqsbxlHpvU7W75TlFAQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=HVFK4g
 K4hkbsCRw6W6ufkPnrHw/1Zou4Ms+rLZaSz6Q=; b=jUNxN1+suU0w2nMGfFvLkc
 LUcKy3LzfVTipC7FeabQrGmIWUestcEYKT6fxa4+ycFVHLT37B/EPqpgbtddkJpN
 LtLcHonkP+ZMoiQqoaMUSOxKWybWJKhBrAYiXQMjNbsa8Wkcvq5JZHj9vjPkfpvi
 DhPcJSqGtqf872uYpDktHl77UgKWHCRBj1MtfNTBx1xqN9ggEKyj4V4RnJtXJU67
 j5DryzLkkwoQrcGNHGD6u78TFU2uqAx/ljUvngt8KJNyaRUr2PdUcwqyxoCr5hAL
 Kgbr09KsMylmS0n+qHV4ApoMvFDVN9wtvey7ChepIoGKucxPrcNB+3kZTzazcBJg
 ==
X-ME-Sender: <xms:BTVUXg03bvI6cOLhgM_47yxD4J7Q1ZudALuGGTfSKFrBAZI-wuTcOQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrledtgddugeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucgfrhhlucfvnfffucdlfeehmdenucfjughrpeffhf
 fvuffkfhggtggujgesghdtreertddtvdenucfhrhhomheprfgrthhrihgtkhcuhghilhhl
 ihgrmhhsuceophgrthhrihgtkhesshhtfigtgidrgiihiieqnecukfhppeduieefrdduud
 egrddufedtrdduvdeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghi
 lhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:BTVUXi7ar2JdifwaERY0r2xpj-m53dxngnzRWlZ37gCU_m6IEyOnFg>
 <xmx:BTVUXkTSkXM1tnMP9Sf9n98QNECBvDpxoSI21paoErHyNSNXR4crMQ>
 <xmx:BTVUXjr3czFywxX4uaMnRs7QxzP2b90PByItIE0Jh0W20ozu-R1TKg>
 <xmx:BTVUXpOjbk2AzFZq6G8X3FzLp2Xb3D5M4K-5xNQoP4ri7ZTVN2Q4NA>
Received: from localhost (unknown [163.114.130.128])
 by mail.messagingengine.com (Postfix) with ESMTPA id D597E3280065;
 Mon, 24 Feb 2020 15:41:40 -0500 (EST)
Date: Mon, 24 Feb 2020 14:41:39 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Konstantin Klubnichkin <kitsok@yandex-team.ru>
Subject: Re: AST2500 I2C problem
Message-ID: <20200224204139.GG67957@patrickw3-mbp.dhcp.thefacebook.com>
References: <1699551582274510@sas1-1199a7868807.qloud-c.yandex.net>
 <20200221202112.GB67957@patrickw3-mbp.dhcp.thefacebook.com>
 <3402461582318978@myt4-457577cc370d.qloud-c.yandex.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="f5QefDQHtn8hx44O"
Content-Disposition: inline
In-Reply-To: <3402461582318978@myt4-457577cc370d.qloud-c.yandex.net>
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


--f5QefDQHtn8hx44O
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 22, 2020 at 12:03:08AM +0300, Konstantin Klubnichkin wrote:
> If you have an idea where to look deeper, please give me a hint as I'm st=
uck...

Sorry Konstantin, I don't.

I can understand why drivers under the pmbus / hwmon subsystems might
get probed before the i2c, and before the owning i2c master is
initialized.  This is what the EPROBE_DEFER is suppose to handle.  I
don't know why it isn't being detected in the i2c-slave driver properly
and turned into an EPROBE_DEFER.

I suspect this is a simple state check on the i2c master object in the
kernel, but I'd have to search through source code myself.  For example
in the i2c-slave driver I'd expect to see something like (pseudo-code):

    if (!dev_is_probed(driver->master)) { return -EPROBE_DEFER; }

Or else, something in the devtree probe ordering code that would have
realized that `driver->master` hasn't been probed yet and ordered the
slave later automatically.

Maybe there are others on the list that write drivers more often that
might know better...

--=20
Patrick Williams

--f5QefDQHtn8hx44O
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl5UNQMACgkQqwNHzC0A
wRkEtQ//UkycPg08lGcp7FcyFFaicuoWxQ0MsvOf+j2hxp6UjWihUdUpoUMU8Tt2
r3CPXeeiAGkuMEAte4Pdv2dvDcsCQnxJBjGWT7jN6E372w3FuF8cIUZAs5kqqJQ1
gdrieOG5l9odPPlsgB0Nyl7aU5DQXPJCahflTV8nnDSzAWLuxduJFTSmmPAYz6mn
V5NRfZXbVrwsL7igXz6e77FIjHdLNzXSkfUwkd0pg7TxU/3/bP7nuQxNBN/4HwCs
jyr5WaQsY2F/AIf3bmwiCrRta6k/YjoSPS3pfJvXej4mwfKS9ts6Da8eBulcjmyi
LjKQvVVSh4Td2kVeNVn3+8juSvRsyjZ5Wbx2Lj8MQYIXpC/x08IxPC24kDnTmt2r
0qFlh7kBhNqBrtcxwqjQfLZVfhbh7QkH8ZuokWsE0dD+lIDo9n/Zn93FE5g0Al8u
b7Bd56PcPydyRLd00DvaVPDXV6W3CIQRvuGWzHIx1jqOMyIoXu6cjPFbqn6gletT
ZlsTK4BrKLs85Utx2Z6wJFUlX0Pk+1IuZ/AsENUKllIUu8yFYMIL4lp300pJbJch
+wA33RYVNSiV0QU39aroAPNMdP/q4nHckPc5O/VvoEolgBvbGbSZZCj+IrprkfzM
4tuJMWZKFpxw1nic+nMcSXNR8R7FIoGIYz2el3ao6EnatBRXA/c=
=2S4I
-----END PGP SIGNATURE-----

--f5QefDQHtn8hx44O--
