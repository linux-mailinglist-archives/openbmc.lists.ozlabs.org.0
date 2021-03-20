Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 29DC1342F92
	for <lists+openbmc@lfdr.de>; Sat, 20 Mar 2021 21:44:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F2t6f0x9Hz301D
	for <lists+openbmc@lfdr.de>; Sun, 21 Mar 2021 07:44:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=MzsCcUtF;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net
 (client-ip=212.227.15.18; helo=mout.gmx.net;
 envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256
 header.s=badeba3b8450 header.b=MzsCcUtF; 
 dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F2t6N2mTBz2xfb
 for <openbmc@lists.ozlabs.org>; Sun, 21 Mar 2021 07:44:25 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1616273041;
 bh=I1uxDkqVHbCR5GFqrDLurMaSGLta0rEs3GRT85AXsPI=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
 b=MzsCcUtFxDJcnbKACYU2oKKsK87EVr7b0IlG6b9q5r1wyyR2X2rN2HBXfHA+0Bm1L
 16Bxh+kfBcpvwSWsCSHVPBjd3n6lqFCoNtFLTtfByfmTJgy+F6HiXeSN/z9/jQ3+lm
 YyBdTUoECLThF9/DwoswUPJr61aci3LcMZst7KyA=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([37.201.215.134]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Ma20k-1l9MSz0vps-00W0d8; Sat, 20
 Mar 2021 21:44:01 +0100
Date: Sat, 20 Mar 2021 21:43:59 +0100
From: Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 11/14] watchdog: npcm: Add support for WPCM450
Message-ID: <YFZej3Eg6yfCeGwC@latitude>
References: <20210320181610.680870-1-j.neuschaefer@gmx.net>
 <20210320181610.680870-12-j.neuschaefer@gmx.net>
 <bd66894d-2ff8-f0cf-7fbc-cf4609094ef2@roeck-us.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="Wy8EjUemgdhkONYP"
Content-Disposition: inline
In-Reply-To: <bd66894d-2ff8-f0cf-7fbc-cf4609094ef2@roeck-us.net>
X-Provags-ID: V03:K1:z6wSN01V5RzuYpjYHcKMiN3aHNuJ+jErDxcJ+YqN6xL+k03BK3c
 6HM6wRMf5oj0qXdD6t3o9yhyfz6gGxYUM8dvJJ7eQomrhbeQCz+kyi7PrAvwY5fW5WUqYNf
 4Q9j05nHfNMqTxolzY137kzJt25TN/kbb0z5Df9k/OdkWGctWA0DXeFEsXSe/7/gc6yzEfN
 KAMaoSxIrfgGEb/IF7qBA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Lv1DmPc7Kdw=:kSZD6xA/UQCj6o/jl8YIZ1
 EVtHt0jue9Bl2V9Mmrj6R3b5MGYCU586DR2FSy7thVv9U/GzzVulCsvLYKMHplMINV9ekvZFh
 XlwJvIbAxaec0LmkNRAwm78LroNxEThL7eCes29JZ7OmRP0xb2DIuWm1Ej6CkkeTneOKRrx+1
 h4fiP32HZeHF8mw0aH+gkyc5TCdLDYVVtZs/WEjNDcvQWNDJaIWcX4cLBVbxlxSJ831KkjVmn
 w71JBHRu4jsXif5uIjWvJwzGlwy9mE33PzRoRQErKJSOdieHALBRDPsK59ShgpZRojUGmdLuY
 4ap36by0WGd4z2zxAfU42PctoXmQd+F5073Xo7IC8a/BKWko5wRd1j5jWtx+CfXgz61TDKmkZ
 vmxM1FkLWfI5m4KbKs7DWaHDsmCvpwRB6DJ6nTqDlEDskbaPZeD3n6VzUNdN2mwY1aw1aanTy
 OA867lEDdmXJ3u7OZhYrQD8LhI1eBnuke60ERqqRsVoX1w3OXA+PXcjIXkIKiK/1nLCeAVnwM
 rvEkEloygtODM4YKGmF9FQKxEpSJ4yhRdJNlMTbOxLCUcL9P9Tn1KZ4RNELzwUb6dtMiKfcHM
 F/wFkE1F6Ogvux2t4SCNoHxGzvWYlWqKZPU+i81PcU+LLngwHAuZU+2RSWXS3Sgl7oX1xQVCt
 Xoo+cA1U4W8vw6azIVZAMW50FEtERYY5/abJzfbF91SOi3riD3rCaqdwf24oETkJ/Bz0WHg9Y
 QUmYcjEmrrARFMI965ED+pHSagjqIooODe4L1IzN/DkLRNHwdUav11vteGzMB1clsx1uW8zCp
 X8rcpsr1D7mijnwNmQWkh0efO8isvUOc8ZKRTcNFzWTpy66ty7zSr0X5pxx/lcJlqL1VSlbWE
 E9tPLQptBkIymV9u1o+lCKfmw/OcQ2V/TCkFwQmbCTZ0GIIJGxg/ZcrZ11C11JjZluxA93RLD
 tVZy7gGnDFZ5aKSzGxPZKgrh5ltjdXc5I0zcsmtv+dDMcnPUYRZcPbs9nfm5eQglIOWDXUhpG
 jsbJo9Z7QXl/9q7P15on40TDRuwh98RleguptGH/3/wZ0JgcQzYVe5Lk6oa8PBMEiGreqAi8j
 PPGUmWCNZJcBb81Ayl5JNA/tHbKmxMl+kYRD0A9ZXevKgyVo8eYUjI3g6DCRLbbHvZx0ydZgt
 6rqVwKyjScqvkdV1sZvrjC4pCAJBdUiBfIUGD0GRfD4b7aoOWIjhpB55YHweEatQ17PG4EnPb
 JLqZhZe0vt3ywM0Wh
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
Cc: devicetree@vger.kernel.org, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Tomer Maimon <tmaimon77@gmail.com>, Avi Fishman <avifishman70@gmail.com>,
 Patrick Venture <venture@google.com>, openbmc@lists.ozlabs.org,
 Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 linux-kernel@vger.kernel.org, Benjamin Fair <benjaminfair@google.com>,
 Tali Perry <tali.perry1@gmail.com>, linux-arm-kernel@lists.infradead.org,
 linux-watchdog@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--Wy8EjUemgdhkONYP
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 20, 2021 at 01:24:31PM -0700, Guenter Roeck wrote:
> On 3/20/21 11:16 AM, Jonathan Neusch=C3=A4fer wrote:
>=20
> Patch description goes here.

Ah right, I forgot to add one. I'll fix it in the next iteration.


Jonathan

--Wy8EjUemgdhkONYP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEvHAHGBBjQPVy+qvDCDBEmo7zX9sFAmBWXoMACgkQCDBEmo7z
X9tPiRAAvkv6tfjOOgM95MG2HhT2PytoRTq2mFRgcZ2Hl+ZrPMtcm9nAEa3Lvz4e
Xuf+zBSF4iebdp5WY1paCHAvM+l23mn3F4HDldEWu7l9vFfysOvDxuaIeMVihC3q
g8cfx7DQfXAMe+R8sdyAbE52lR8ZVSzTWiYh2Lkb23t3zGvtoxtfvcG9IITpXyLP
SWiKl18uHRcMSHPEpB0blgBabE0BkO0Om1Tjsgi/h2Jahxwwio4unsyps/F7YAqi
N8zmr164rt8AIJlFJVED8xpkm/94VJbmJdqpMMsGV0i/itGVHQ4RSHdqe3G3nlWo
GxkJyGrXY6pFD1WfvdyG2SwyQ2zAwhtqn678sLZ8sc5uamkezzvp0AUofgoMSYI7
ebi+l421mQe6fPwyJSufFJ8pDoIa7ohjOJOSpM9wOoyzQSD5RQwDL+JY560PY80i
zN6VS/1/V423GRQxXW0dJ4UdEWtZlfm3r1mwfRFY8kW9SeiT7BVqVrrq0ydG86HN
jejPBByNfDjjtxdGcJhRBO5lwN1Li8d4fR4w0mw1FrBQXm1UGGVSAxsO1/iWRKqe
iEw2xCpVHICnOmQwO+mW4/blErFBuSw6nnQ77zHzgYJI1syy2sbBKKcO4vmq199F
lMr4mOvpuDxtotGlQcqpdvRZxpb2oBjNVohTIc/sl6v2CyNeZrA=
=F2JL
-----END PGP SIGNATURE-----

--Wy8EjUemgdhkONYP--
