Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 664F62F32A5
	for <lists+openbmc@lfdr.de>; Tue, 12 Jan 2021 15:08:14 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DFXV35sWmzDrQX
	for <lists+openbmc@lfdr.de>; Wed, 13 Jan 2021 01:08:11 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.21;
 helo=wout5-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm3 header.b=CWDCreci; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=JzerPZhl; 
 dkim-atps=neutral
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DFW5d5hcqzDr4Q
 for <openbmc@lists.ozlabs.org>; Wed, 13 Jan 2021 00:05:23 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 14A4F1A5D;
 Tue, 12 Jan 2021 08:05:13 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 12 Jan 2021 08:05:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=ii1XQsVd5PzGa6b8TFoDd4yh1M5
 APCmjcLsaPNiLrQI=; b=CWDCreci34oeQBdGbZSmqSKc08fCKnm8C0RVYwSymci
 0Y+XpdFrAtUfB6mAwtVZNjtHbFv9A2r6axGtzsxTfBtTFWjP7nbD84HR8ROOe3mG
 2zesThPDZbkw9Mb43hnSrj8o4+Zm0W8uYZYDU+LJ7DE4thkYU/BSmLXXo0dNw291
 4/DAA/9Nke+HMtX56uj+lP7t9pVbHiVgzHtjaXDJhbncjI0sS5ZvMhe+tNanAwI+
 D5uyGHM+qWBrZzr8UJ6LTLcSuwlrvhpCEsM9EV76C2JTiyJdS/L9ZlZSG7fe5eE8
 bwnEcUCA0XecL5ZEiywW0H1oA5e5Oekn+eWRmkzUjHw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=ii1XQs
 Vd5PzGa6b8TFoDd4yh1M5APCmjcLsaPNiLrQI=; b=JzerPZhlapfpYAD1C7s1tj
 kSQnYmCFQjkSmpMU1Zvks36JfTIRP/mi9i99NZis0GzFFDFgAww/RIottg+l3O3a
 de+U/wygtvpewKszjjj/IrI/MXKjE73lPaYuF313Q3DzqJqHn0d/Er0irvzQQUpd
 xDnbeQf9eqXZXiJD+41LuD0w+UFpOXE9CRkfP7eEHdNlWH5M/z2Bb71QinfqgC5B
 YkimMP0mZBw9QGLFlXc22ooJyHI1Hwa9V8o+zUr657jP+fT4Ro2DBd0BgRIWhdAu
 YwSr9fHywmk37fRTEHxm/F309wUFzHucQkGn5vKfga9ocpmg+lbssf0EqQNjeNbA
 ==
X-ME-Sender: <xms:iJ79X8NxBHDo4J2JcR_lmTm3dJCfom9ZyEgNNMIqPyj1ZwzHHuTRJg>
 <xme:iJ79Xy--0_EncMnCC1D1j0DE-5D-A-COyLyOQIUn7nIdAJr3NiyF4MQXUU-VSG1pP
 keqAF5AfcyOjzKLUKI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedukedrtddtgdduhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculdefhedmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredttddv
 necuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghksehsth
 iftgigrdighiiiqeenucggtffrrghtthgvrhhnpefgffehhfehteevvdeftddvkeehveei
 hefhffffleffledvleeggeelkefhteekvdenucffohhmrghinhepmhgrnhejrdhorhhgpd
 hfrhgvvgguvghskhhtohhprdhorhhgnecukfhppeejiedrvdehtddrkeegrddvfeeinecu
 vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgrthhrih
 gtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:iJ79XzSMukCQRLdZsGMUXTjPOX5KmsQakdXMTJd_lf8iZ6QVAARd_Q>
 <xmx:iJ79X0vWN8ZTuZlKdoISckQTt-CDMdQHgLBoavjcPmrgugBADjI3Eg>
 <xmx:iJ79X0dktWOYwOecSjNU2mDJBBL3r0b68Yyv5gASVbTtsvW2NEARog>
 <xmx:iJ79XwFAeeSW6X8XCEzTYt68ZypqmoUM6Tzbxi_Q1Zto_Y0KJDknaw>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236])
 by mail.messagingengine.com (Postfix) with ESMTPA id F00E524005D;
 Tue, 12 Jan 2021 08:05:11 -0500 (EST)
Date: Tue, 12 Jan 2021 07:05:08 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Sunitha Harish <sunithaharish04@gmail.com>
Subject: Re: pthreads at bmcweb
Message-ID: <X/2ehAMgWkmUZoAr@heinlein>
References: <5181a536-a026-2f91-7335-f6a75b4694ab@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="mUOAws8mYi+Kp+XU"
Content-Disposition: inline
In-Reply-To: <5181a536-a026-2f91-7335-f6a75b4694ab@gmail.com>
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
Cc: openbmc@lists.ozlabs.org, apparao.puli@linux.intel.com, edtanous@google.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--mUOAws8mYi+Kp+XU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 06, 2021 at 01:32:11PM +0530, Sunitha Harish wrote:
> Ed's suggestion is not to use the pthreads, instead implement=20
> alternatives to do the same job, so that the binary size is kept=20
> minimum. He mentioned: /"//Considering that's a ~30% increase in binary=
=20
> size to support one line off code, and most systems are already at their=
=20
> binary size limit, no, that's not going to be acceptable. We can either=
=20
> patch boost to use this=20
> //https://man7.org/linux/man-pages/man3/getaddrinfo_a.3.html=20
> <https://man7.org/linux/man-pages/man3/getaddrinfo_a.3.html>//or we=20
> could build our own resolver type that calls that underneath. This was=20
> based on a quick lookthrough of solutions in Google. I'm open to other=20
> ideas here". /

Since we're using systemd and we have the `resolved` feature turned on,
why not just send an async dbus message to the resolved.service?

```
$ busctl introspect org.freedesktop.resolve1 /org/freedesktop/resolve1 | gr=
ep ResolveHostname
=2EResolveHostname                    method    isit          a(iiay)st    =
                            -
```

https://www.freedesktop.org/software/systemd/man/org.freedesktop.resolve1.h=
tml

--=20
Patrick Williams

--mUOAws8mYi+Kp+XU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl/9noMACgkQqwNHzC0A
wRnl/g//U4pjZ8gay+/LYrke11YcgXsMRzfWgZGFpKXCVpmsEUpWdzFR1oo99XZ4
kLEA+gj0UkG6Kt1xH58xC9Wm/cZZa7BuTx0pyHN+EDXRZGSFhiLlYYxtQ0b+xULn
k9Sgf8w+OzczWpVCwRxrjRlbu6owUqkSsZRTSoP0spgpPYFI1+ZK+X9j28CNjjZX
hEprZF8PswedSdIXR+a5bmESSUNtCVbw1htRbD7cOOw1H8HAOpLW54oLAagMyjxW
qg22rKnzhrUlUdjfgtwN+PB+gmw5FXC1MgGO7omAsH+3hz5GgsHSroPtv5XAlGQR
evm2vdC1qeahca/zzsjwh5qhhiMSd8yjychaXdiGei7RjSYATQ1CcJSpgQkwtWTS
01Th8v0+o08OQY9RiSgBFmd92X5X72lK1cFEVSOa+IPHI7acbUzs/SRVW5BxuP97
mxM97/NM+tUoYnzDKIMDFW9nHrWUXVx0W9OXsRiTZzdYcmQMhMjpOBTp3MD9viU6
56AoKNEOpjQm8MvG2YCJBUfzKr9gHCICOlaXL7BjAjBnkw5HxVfKw9htvlg7BLt3
r4WVJFYStcJHxlYT1UGebTL5oq+h8UGwB2+kZUwNZ8NmSPYQbbMg1C0kmg/u8q14
fEP+nKa4vkmnzbmB3RP3F1l6jy+Ekv45w1en/MI/PcN9oqiweeY=
=9dRe
-----END PGP SIGNATURE-----

--mUOAws8mYi+Kp+XU--
