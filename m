Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0430D41B78C
	for <lists+openbmc@lfdr.de>; Tue, 28 Sep 2021 21:27:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HJqKP4JBcz2yZx
	for <lists+openbmc@lfdr.de>; Wed, 29 Sep 2021 05:27:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=VoRLHiCq;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=rB3eM9vh;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.20;
 helo=wout4-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm3 header.b=VoRLHiCq; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=rB3eM9vh; 
 dkim-atps=neutral
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HJqJv4SjXz2xYR
 for <openbmc@lists.ozlabs.org>; Wed, 29 Sep 2021 05:27:27 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 321743201FA1;
 Tue, 28 Sep 2021 15:27:23 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Tue, 28 Sep 2021 15:27:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=jA4J9l4wDfsQsRJ7hms2W81N91B
 AKoaPvWqoyA0NOdc=; b=VoRLHiCqefjRl1u4aazPcfCnIwYHE0KDGflQS0jjHFP
 phm3/LadQiJjN1VTsb7ESTEZ2FA1yrHpmhI9gAz2GxRtVhmJv6xLtkHMGl0VzJ54
 V3+FiN5Woapi1bwkcXrySGDSfH/lySh0ilbbTUBTx70hA7FLOnFPHZEiimn3gk5w
 LFA/TWaIil8YAMWE3RjFsKbmBCWnhXygJNwJW+0Tm3pA97NwvTbcRUk154Tk03lA
 pcDqdyMuSwsLp0K56seZquaKUxhqUQXYEN5d0OQPNtaAZj2RZuln9u36E0MUhAIm
 tcbFwJczzLS81RPokfF0LFElYc0F4wQPmN3c3rvNibQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=jA4J9l
 4wDfsQsRJ7hms2W81N91BAKoaPvWqoyA0NOdc=; b=rB3eM9vhgF/04eV/rIHzze
 qCdkuEGil+JPWILjMcPDxg05Dvr8t9NjcrWMId+1N+dmjp+yWsOVGttrQs8MxVak
 UnGfZAOyvYPU4cTi+3AoCpiW0/grNuec3TJl+I02Dh6HG/Ez2rPXW18wlqnmT/p3
 yeymCkFGpvXMqV/dssriOzYuuBVvvydf9cW15F+aUbuphuj3tH+TvXW9Y6r9gmKT
 J7bYl0QEAJ+4KBjzm8lNTG1C6yV6KvhRlcoWVWenRyZJYju9unLprHSUwkkVi1XK
 ynkolqtSjlUUyfZYfiOYNUtNRAtU6HOcmVCow/jpxVTtOrj7kjWLqDn5JFzxzJgw
 ==
X-ME-Sender: <xms:mmxTYbH097rtOZx49zzYxbXJXZHJ62pMBrY53BnIFB99FiWN9R8IXg>
 <xme:mmxTYYVRjLoMADkW9MxXcmkma5lY5bazXBzKByS3BvCxC7LThwNHJi79xkt6g6i7B
 mQt3VZWGd9iYp3fNVg>
X-ME-Received: <xmr:mmxTYdKL-PJpcPFQBmR2gXZKk8tKWEPetO4Ck0KdXL4icFRXfUw6gpQbpXf7t9BgbUdmwN6GWbnQcn9Ux2OMgeEWfU93tg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudektddgudefvdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enfghrlhcuvffnffculdejtddmnecujfgurhepfffhvffukfhfgggtuggjsehgtdorredt
 tddvnecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghkse
 hsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpeefieekvdejjeehteeggeegfeeg
 ffetuefggedtvddugefguefgfeejvdeuvdevveenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:mmxTYZGg7QduY6KPxb8mVGcuIrHXXeEfRtixljt5ilD_fRPrF_T7tA>
 <xmx:mmxTYRVoX95GWF4RJJu2SBTuPTcTjZgBXxgxFFNOslhY-e38nslr5Q>
 <xmx:mmxTYUPLZBAXWIMheosJjTNTr7X3vTYBU0-0pqc98DAPQN3dZIUP1A>
 <xmx:mmxTYSeRiHwK-LTfL9PL4k_wZYlcZDIeKxbwf2KAypRFYPeaJdWmxw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 28 Sep 2021 15:27:22 -0400 (EDT)
Date: Tue, 28 Sep 2021 14:27:21 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: "Zhang, ShuoX" <shuox.zhang@intel.com>
Subject: Re: BMC clock unable to sync time offset from RTC
Message-ID: <YVNsmYWIlHaNntqI@heinlein>
References: <DM5PR11MB1547467F272C74A8063A24B8E2A89@DM5PR11MB1547.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="pvqmbzx7EEh5Qm+1"
Content-Disposition: inline
In-Reply-To: <DM5PR11MB1547467F272C74A8063A24B8E2A89@DM5PR11MB1547.namprd11.prod.outlook.com>
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


--pvqmbzx7EEh5Qm+1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 28, 2021 at 10:52:18AM +0000, Zhang, ShuoX wrote:
> Hi,
>      I have a question and need your help. The time of bmc has always bee=
n UTC time.=20

This is by design.  By default, we have the BMC always use UTC internally. =
 Any
alternative timezones are exposed only at external interfaces (such as the
webui).

Some people statically configure the BMC to another timezone, but I don't k=
now
how well this is tested.  There is not currently any code to support dynami=
cally
changing the timezone of the BMC.
=20

--=20
Patrick Williams

--pvqmbzx7EEh5Qm+1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmFTbJcACgkQqwNHzC0A
wRm9fxAApHetcRgkRGoEE2QHz34a/7eBkDy+Kd/Ll+y4ve4u1b41MfZW5N6cy/sn
nXo86RuglWAGwyweEPl48rIPPPaI0rWIrFQAmydiSVIJS+8JS7o7rTWDjm09jCZ2
ZRer9Ow8f1u6JrTLYVwKvg3hZIsfGDyeuWDDhPGeuF2eyWkhL71tmMo7MPQkt0jK
DZzRM9NGt4jsZ17477SfeZiBW+cD/OanibWs/DLQkFP9kUpmsrZt6W+CTF/gQlDI
5GBr9Pn9hzSD5BMWDniFjnnvPffuXQ+5Xt20RLE07oUg6MEOafeMHNE51W9oD+mE
9/dj391D2V29sU/TycTEErN7KlKWx3H5wnTZt4X1DufCtfvoY3L+UEsedwT7SLuR
IF0I7H3kQFs3hCnnQz2+aHJU8CBR+63HyBmRGSBrtY205Tjy9gHfH+tvnyI2Pwzw
H+uQKIyp+AsSxxsU++FFZ4tH5kNtPoOJEon2m05B7D30IWTy/ozeRLvnt19QOWWz
wSYYbYR7zwT9/SLQC4O+0n9JKXca93KN44dQXal4MONIZOjA93wlqB07PY1er5bk
WX1zx2z8CON4WDb7QEhb8txRDp+yQu/YYAEm4PrsbCNtjxb/SOdO8ekabDawRvKm
15hQF7ABEr6S94sR8Ro6C1lpL/VAGxHB7IVDxZOFn/XVn9ZG2Tg=
=9wmb
-----END PGP SIGNATURE-----

--pvqmbzx7EEh5Qm+1--
