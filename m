Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C9E816EA93
	for <lists+openbmc@lfdr.de>; Tue, 25 Feb 2020 16:52:53 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Rk3Q5nJmzDqRX
	for <lists+openbmc@lfdr.de>; Wed, 26 Feb 2020 02:52:50 +1100 (AEDT)
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
 header.s=fm1 header.b=fChomAJk; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=lIIMrm7Q; 
 dkim-atps=neutral
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Rk2f5qlrzDqCZ
 for <openbmc@lists.ozlabs.org>; Wed, 26 Feb 2020 02:52:09 +1100 (AEDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.nyi.internal (Postfix) with ESMTP id AFEBD670F;
 Tue, 25 Feb 2020 10:52:05 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Tue, 25 Feb 2020 10:52:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=B64/PTVklEchUYvMKBcD9DdI1fN
 xLWeMGCapw0G3cUY=; b=fChomAJkM+I51xNoLxgLrsYg1d3uZGN+AJWnsos6bUl
 iRcJjGS0qz10HjLh5IjbpLQFwUrfCGqMdVGusKpGlkGsEQM3YUTsVw3EDuAItU0L
 0pOuklJWTl/0TEZUB18xp02rKKdrwoDpECX9YNIiAmh+KFxOx3lQKHPwc0Rly9lv
 M22PPcjgyV+3kyWW9q9gUgiNyluOpqXSABA25HnyV2i5XNt6OkL4tCRZqk1+3npP
 ORz4hqdruSNN1e55M72NEObMgl83Bx4/OfvNkxXBIOOotKt8qfImWDpAwc7MAMXr
 2PfZllmQPXHs5Oq7y4hnxGAywA8RL+2bjDaqm3mwi2A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=B64/PT
 VklEchUYvMKBcD9DdI1fNxLWeMGCapw0G3cUY=; b=lIIMrm7Q89JqO8ovRficYB
 jxGLlukGs4D2BdLIiSCJWogg4giSJRtgM0EZz68a/UlROuz2l5m5IOmCwgBCvpIV
 /WpsxewiXVtM5TcvFFpYr4ABoAts0v0Qyy+i0UQwpUo0CbOiRoA8m0WOwMEMpvvR
 4lM/hkIodEEjDtGKlkaDDTKN+mgAGrBCFYh3LOvN0oIV/t6wYnKpl2w0G2DukzdO
 WUva9AQ/BHfjlouF7uSiqfznKN9wJsGHzSaMfodvQBeQhnj9Y0zPT0XJUMep+V8Z
 lOA+0F1bLfBzjT1jojYBdJgE1FQ3QLYeoLqudOndwjPnoBiCf4zQO8o4r9gNR9Jg
 ==
X-ME-Sender: <xms:o0JVXnBLnYCmgv24A5QcLLlTZ26dLgHPeme6mOpRdiZcuTjcqtH2Fg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrledvgdektdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculdefhedmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredttdej
 necuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghksehsth
 iftgigrdighiiiqeenucfkphepudeifedruddugedrudeftddruddvkeenucevlhhushht
 vghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsth
 iftgigrdighiii
X-ME-Proxy: <xmx:o0JVXrCh7TlyRn2qLo4w5iBqmES2De9PtvLZhgzBGIc-uHdXLyW18g>
 <xmx:o0JVXlPrd3UqKieO7yPfa0wllc5SwqPIFY-Vo-wm1Yji58X1ASitHA>
 <xmx:o0JVXvMRd3PPaMlA42FAwEZq35ClqslkB_17KwzF8YuuRslB18lplQ>
 <xmx:pUJVXiaZd-WztaSOZSwu1y6m87AQXKjy2cSCMMwc6ncrI4TBe9wmAA>
Received: from localhost (unknown [163.114.130.128])
 by mail.messagingengine.com (Postfix) with ESMTPA id 8CD553060D1A;
 Tue, 25 Feb 2020 10:52:03 -0500 (EST)
Date: Tue, 25 Feb 2020 09:52:02 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: "Mihm, James" <james.mihm@intel.com>
Subject: Re: Functionality vs Security
Message-ID: <20200225155202.GK67957@patrickw3-mbp.dhcp.thefacebook.com>
References: <62005ec9-e004-1041-7c5b-9272f8c2d854@linux.intel.com>
 <6F13EC73-E3F0-43D5-8E3F-1A8585918C2A@fuzziesquirrel.com>
 <99262b0e-fca2-71c9-ff1f-3526ed26efd0@linux.intel.com>
 <F59054FF-546F-4728-B569-CF94AB88CC96@fuzziesquirrel.com>
 <C599FC839619124CAC44E062ABB7DFE2D7BAF2D5@ORSMSX115.amr.corp.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="W/+CTqSGWdiRg+8j"
Content-Disposition: inline
In-Reply-To: <C599FC839619124CAC44E062ABB7DFE2D7BAF2D5@ORSMSX115.amr.corp.intel.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>,
 James Feist <james.feist@linux.intel.com>,
 Gunnar Mills <gmills@linux.vnet.ibm.com>, Joseph Reynolds <jrey@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--W/+CTqSGWdiRg+8j
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 13, 2020 at 08:15:29AM +0000, Mihm, James wrote:
> Exposing the REST D-Bus APIs via a network interface is bad practice and =
should be disabled by default. Just because it was done that way in the beg=
inning doesn=E2=80=99t mean that it should remain that way.
> Applications should be configured to be secure by default. Consumers of t=
he code should have to intentionally select an insecure configuration - it =
shouldn't be provided by default.=20

I'm not going to argue one way or the other with respect to the REST
D-Bus API.  I do feel like we're becoming a little too tightly coupled
to Redfish though.

When we first put together the REST / D-Bus API we did have discussions
on how to secure it.  There isn't anything inherent to that API that
makes it any more or less secure than Redfish might be, except for
missing code.  D-Bus has policies that can be used to lock down access
for specific users.  What we had talked about was creating these
policies based on roles and having the REST end-point do something like=20
'setuid' to the logged in user so that those roles took effect.

By writing all of the access policies inside the webserver based
specifically on Redfish requirements, none of that code is helpful for
any other management interface.  If those access policies were instead
implemented as D-Bus policies then we gain that feature across every
management interface available, with SSH being a trivial example.

--=20
Patrick Williams

--W/+CTqSGWdiRg+8j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl5VQqAACgkQqwNHzC0A
wRkn8A//ZNsWAd5rBho4mfTxEuW5fwBI9hhmYdSXJ5tKBL/3roXSizh3MowCTEnT
G99eeriXGgcCUDT974oPmYmTWlJ4LPourf+gRAWxUiivrivmoDIJp9gbHQhyS13p
27kpzntCiDX/1ipX+5WUGppyK2p71tfmVMRjSsNGsS4teTxUwqcEKJkplJXpd4gr
uOiyv7qEjUqMvZ08mkL4kC70M1Mq997vqJ1igsjcLJeaEudJI0pv9dFjmpYE27J/
vPQmSja++FJ8Vf9ErYAGvGif3xFpEQCzWmr5QsrB2fWEO0yVf98gDezR5n+x9WjO
brTd/I+U6ggAZUVUkfbisO3XJvIpYIY8uY3H1ykJMlXoqFazjTeGCKVe3m4Nm4ch
CQtdLzo1bf9bHWPih2cvcgTGqPd0XH/PNcZlISGSUrSYjxbA7Ptur41bk+OB2bq4
W0CtzkPdShgztQGyVcm8YS5/Npgs26Nqum2FMlC4fh+uBC34i5IiWBmahh2CdrOc
SegXkg4jN5WsQASEScFEDWVta4RYdkLiiiHAt46RrquJ5Y0htUpDPFXH+vIRsWTW
VhfiJhWUv8W02xAlU1APk3ZHJ01C1p6F52IQUNqej/XZJAhF9A/XhskYuIwj5F4S
sFOgyU170QOadznbPDUDBuo7Y92AAeby9hg9Jt8q2BL4BYeP7OI=
=xXzT
-----END PGP SIGNATURE-----

--W/+CTqSGWdiRg+8j--
