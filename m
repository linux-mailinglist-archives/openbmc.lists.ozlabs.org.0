Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7695B1A23A3
	for <lists+openbmc@lfdr.de>; Wed,  8 Apr 2020 15:54:42 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48y5PC4wHVzDqML
	for <lists+openbmc@lfdr.de>; Wed,  8 Apr 2020 23:54:39 +1000 (AEST)
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
 header.s=fm1 header.b=YEymZkUz; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=2IXIzNEL; 
 dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48y3fX4PCjzDqCW
 for <openbmc@lists.ozlabs.org>; Wed,  8 Apr 2020 22:36:02 +1000 (AEST)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 2882A5C0288;
 Wed,  8 Apr 2020 08:35:58 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Wed, 08 Apr 2020 08:35:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=sQLytWjd96x9yLvc87c9ZHYaJSl
 lU8lNqDd5EqeXBNE=; b=YEymZkUziIzbpaoPJVLXk22F7p1eYgIjBy5fr2A7rUO
 itt1tnNo4KtmpWtl9TuUTTni5tvTGSLkA20lae4sdFG41iZBO3ksKGMDE/frtUqA
 uMPtEkrocSJmpJZZNIIBMYgmMEGplp18DaQMIrXotZhbm+wTHPYQaQx0mxrx9sDq
 z1ePtGeVH7HrEgerb6zCKNJqnfiC5i0ZzY5YHoA6EJwp3hpJtRRgXk9adsAroAo5
 TelRlRq78Fx1MhN71aolqiSUCZEJw3sf9eCuckV9vMkLDVOsWqaSqcOwvR2wRsiV
 hBzg78CjbFlHXsKE6K8uZ7WywCEmHMxQ5dtzeYsY/Pg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=sQLytW
 jd96x9yLvc87c9ZHYaJSllU8lNqDd5EqeXBNE=; b=2IXIzNELmglAk+DMtyx5Pp
 Wlbt06QFAnT3KrEd/8OehoJPcoyJbkKdOZBVD/u1hO4ZU2NaR1cSsO0TMAmiQSAx
 yGP2tx0O5Aun0B1c1KSe/6aqP5hJfE6Kk84Ns4KjxJfSCCkaIMzYHS5GhG3Z6aCz
 fm9rqsiG7TX8agwuuJW9yNu2kKs5O3eynGM8ur31JeUEo/dCcWBEZv1i/XYw+xhp
 l/PtEfMqpksm8U3G2zUWMXgYtlsUCsqD+MviPybiQIPlFTWCEbtjyMsTeMLTTx0u
 WgoeMKECGfBqswmo+fyhFX2rTDnzpXTCFHXs+24AQtH8K0Mp/GavbZy/w5GWVsmA
 ==
X-ME-Sender: <xms:LcWNXuLXtOrZOerTqhCjyDstwlnYSS5Kb4NMbCbXPCixX2zeMCVM8g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrudejgdehfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculdejtddmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredttddv
 necuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghksehsth
 iftgigrdighiiiqeenucfkphepjeeirddvhedtrdekgedrvdefieenucevlhhushhtvghr
 ufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftg
 igrdighiii
X-ME-Proxy: <xmx:LcWNXt56F1I6PhFtjSGFI3gY70FhVv0Aim6OkiwyAvvm8ZUlKnGJwQ>
 <xmx:LcWNXhxAbD8uFNtAh9H7gHKV1LVE9Hq2R2bHiMrdyU1ZuJrqI02zzg>
 <xmx:LcWNXhb1Ea-lpb9s6AhDaiivCAx2mIjOeqBNvRC3URyASW4xq-iRQw>
 <xmx:LsWNXoUDaDR_8agh5vTMuepmkW2hA5HNYdsswT9gHMgFoKtpqv0ikg>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236])
 by mail.messagingengine.com (Postfix) with ESMTPA id 523883280066;
 Wed,  8 Apr 2020 08:35:57 -0400 (EDT)
Date: Wed, 8 Apr 2020 07:35:56 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Joseph Reynolds <jrey@linux.ibm.com>
Subject: Re: BMC network security audit tools
Message-ID: <20200408123556.GC5368@heinlein.lan.stwcx.xyz>
References: <eae5b3f6-8e08-699c-d2d3-3d6e9bcdbfe3@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="DIOMP1UsTsWJauNi"
Content-Disposition: inline
In-Reply-To: <eae5b3f6-8e08-699c-d2d3-3d6e9bcdbfe3@linux.ibm.com>
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


--DIOMP1UsTsWJauNi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 07, 2020 at 05:05:06PM -0500, Joseph Reynolds wrote:
> I intend to merge this into the [OpenBMC tools repo][] and use it for=20
> the Security Working Group's input to the [Release Process][]. I would=20
> be happy if these checks were sharpened and added to a dynamic scanner=20
> (but I have no plans to do that myself).

Is there anything we could integrate into openbmc-test-automation
instead?

--=20
Patrick Williams

--DIOMP1UsTsWJauNi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl6NxSoACgkQqwNHzC0A
wRmrIA/+MArufWeLN+nqQJsh2b7N/earHixxNjvyI//Kd7yfrFIQliBhTSaipasG
/afUUVROQa99szlaZ65GD6xGJ9MDe6IGcAaUQT8dEeFHA8HIUM6aYJOUVET4oZGR
7WnuCWRA2kviqA7nxruXegsmKYImo8XutpcgtX92hHEpekmkiA68lWV7VI0T/bY1
/7fynIKmV2rXh41pIs0sD2E9Rc3zp8rDfgzRNcalGUV+uh90GHvmc9sx3y7fj+gH
TvdXZnVl3ETuO8G2ugIfvKcZaRGrqACQkdXMV9AAW0i5ynO6NA0Jvwbt49TEBvRd
6AuGlyAVhnVIaYcSZ7ntGYJIpZffGbY5ityCPy5O3/VLXAcQn9eOkWy22L7gEjd/
xWqvNXtb9PdKfqQnAclHWbA30anQ5ymX5fK0yA3p8e88XBiHqQqSVRLGGtdqPELI
oA/e7G6aqbHBlWmTdupA6+459gm4OE81fVxsOXCBm+PUMaPXyk565d9ngjwXZUK1
SIWBonlkZm6gzPdJ7K3TyE+wPJPgzuTcPwjzva2RGSYf44N6DMcCxngc4bsxWpCY
fJmj4JOWst0Z/4gxUvICF3DqUXTR7JfktVvN1mOjffM3F/76yfprLXOiijq66VW/
Iib12CiPLq47dUdz/3leHilHuKjhs6cIPtW02DOBHE305XvugmQ=
=M1H+
-----END PGP SIGNATURE-----

--DIOMP1UsTsWJauNi--
