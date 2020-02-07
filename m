Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 88733155FE7
	for <lists+openbmc@lfdr.de>; Fri,  7 Feb 2020 21:42:29 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48DnKt5F78zDqjN
	for <lists+openbmc@lfdr.de>; Sat,  8 Feb 2020 07:42:26 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.224;
 helo=new2-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm1 header.b=JVvgG4XI; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=2FYcpziU; 
 dkim-atps=neutral
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48DnK85BPwzDqgl
 for <openbmc@lists.ozlabs.org>; Sat,  8 Feb 2020 07:41:47 +1100 (AEDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.nyi.internal (Postfix) with ESMTP id 6CA835048;
 Fri,  7 Feb 2020 15:41:45 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Fri, 07 Feb 2020 15:41:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=MvlKBGvLQm7mI6io4VhQ/uRr+r7
 KkJte76MH3K3RxTs=; b=JVvgG4XIH6Urj2DgHEPx0NVKyNJdelLzj6veJ+AZ1cf
 OoHT1uuWBTK/k5ZlldfItDckjNtD01pn2/g6wG4Ty0V0kuVUbP/e1mm3AP1JQ7l0
 0ltLprfHCi/Uh+7M5hes10KPwrk+21prgTKORAPyVhYCyzamzAUqY7tSn4EzT2Oh
 7DjDtBDuzWNARpZvpT2kW8bVuR99aPS9XZFxHnDk8gqpdGr4g4JvTRAcD17gCGX3
 O9cFWwj1myS+VgRZP1Wki6IQR+KW64YBqL4T6fMvl2xlSu8Ujtbusi20JepOrGs+
 +IcAwzDOkUFFJHFZyHBhJ8OgONRaX9QfIrAuRnCiX7Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=MvlKBG
 vLQm7mI6io4VhQ/uRr+r7KkJte76MH3K3RxTs=; b=2FYcpziU5V9kzHK01H1VWl
 Yp6ZoY8EMDW5Xf0MttPQRe7vnkKtVG0teKjmVgnjkKGv81Dq4mxawoKExFwLdVzy
 XFW7zvxhCp8chuI33fMLHy9aGLhdvhFWdGrZCTbS2oxU9DnMUP0d2jAxs3V/sQav
 2cHdAcXvwHB153BuB2mP3C0ioi2fJDJbeUFU/3dpRAcvSse8TiFAfkotnNTAzUFC
 i1drMapHx23rtAJ0nBS9uMcDAWtalc7Vj7peDPV/+5vVFjw+TDvXxzRYxkDsQVL9
 /DRiuRwhaPeRK5fob5CSd0CnsBa4sFnK1Owi2BnzgewCKKGaMJ/xGi3GUJ6k83Yw
 ==
X-ME-Sender: <xms:iMs9XgZha_DwT1KVFXgOjKkDjDOy-IA7dnLQ_844-G68tTcwWb80oQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrheehgddufeelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdlfeehmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
 vdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecukfhppeduieefrdduudegrddufedtrdduvdeknecuvehluhhs
 thgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhessh
 htfigtgidrgiihii
X-ME-Proxy: <xmx:iMs9Xj9mCWucCj1yfi-KycIhnEUuV3uF9VXPQZLJdAbP16dn6I65qw>
 <xmx:iMs9XivfmCBUo0wC2vAGfOu3YToVbHYFDRcT4fSRUXf66rUns2W1FQ>
 <xmx:iMs9XjkMFFkWheGfWqKObyuvLIvUj3JxoBi1W-CHgNrIVL4wvJU2zA>
 <xmx:ics9Xn30XtypWMIJXyUg5iq7QaIpaEnWnjGdxgMIybx2y3Ms_GSagw>
Received: from localhost (unknown [163.114.130.128])
 by mail.messagingengine.com (Postfix) with ESMTPA id AC1023280060;
 Fri,  7 Feb 2020 15:41:44 -0500 (EST)
Date: Fri, 7 Feb 2020 14:41:43 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: krtaylor <kurt.r.taylor@gmail.com>
Subject: Re: Community support - where do want to be in a year?
Message-ID: <20200207204143.GC38734@patrickw3-mbp.dhcp.thefacebook.com>
References: <CAG5OiwhNq55Om4=NU8F7SSebDqMQpKhHuhAC-aFz=QKBLM6Wig@mail.gmail.com>
 <20200207163045.GA38734@patrickw3-mbp.dhcp.thefacebook.com>
 <c35f31e6-29fc-223b-08f1-7357457f813e@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="V88s5gaDVPzZ0KCq"
Content-Disposition: inline
In-Reply-To: <c35f31e6-29fc-223b-08f1-7357457f813e@gmail.com>
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


--V88s5gaDVPzZ0KCq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 07, 2020 at 11:58:16AM -0600, krtaylor wrote:
> require channel logging, we'd need everyone to be comfortable with that.

I already have my znc set up to log everything.  I wouldn't be surprised
if others do as well.

A long while ago I intended to publish them in an archive but never got
around to it and never found a good way to render them on a webpage.

I have logs starting at 2015-12-08 but with a break from 2018-08-23 to
2019-01-04 when my znc went down and I didn't notice it for a few
months.

--=20
Patrick Williams

--V88s5gaDVPzZ0KCq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl49y4UACgkQqwNHzC0A
wRmS3A/+K8foWw1hYZnGcsqwKXuoKfPNoYAtZwwWO+Bu5tOUTlf5i2E4DAqvMtoe
ybQI5783h8ETSA+AU+LVbbDcFR6s742ID0t6AgpgQB8b3X5rcjnl9Yp0U8/5BkR2
gwc6jYmingyfkc1v/px+1JJEgMJOblL79+OTepzoUAGCMhC+MhO07Y2N7shF8K20
rmGAkR6N7TDbWCw0XBlERJYSHXGU9xbDZYyOGsRarn7v2NTmuYxuSme06PDZZPaw
PqmFVR89fw16TrobmvbcEBPBCXXG2ilfQAw2VUdvtd4X1o5FrhZ7xVQj7cWD9Uqw
yexELYrgnACXlIxJgC+u7JbBFYRdqY91+Z+7XJ2UG/MDDYwDDqc3+bHgk8K/pIcV
0CTB3D7Kgurovj8sSFg78ZPx/kcsX1c9suACNdsVUVeoEpgvmmoiQ9e/x48hbMHk
pymgth/d2UxjaCL9HHCvL6eK9VEV6bA9Ck86v7IdSqF6va375CWHlYrjHH79ZXd7
a4riMy2SHixdjUfL4hXLs9mwrKq5dPlPw/EyaCcp/oIP3mCnXU07Z8Nk76tJ5Nvs
Hg7dVj3B6ayhT47KmwayrS2FrW3pOgP1lKUkrd7n+W1YY+5WlYtVpwx6LkE82HUI
/gGDhX0U/4G6wT+ry81jO5DAGQfdErapqbCBUqkf6YN/my3BRAQ=
=1Sqp
-----END PGP SIGNATURE-----

--V88s5gaDVPzZ0KCq--
