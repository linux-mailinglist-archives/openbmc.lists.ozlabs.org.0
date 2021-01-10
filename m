Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ACF32F0969
	for <lists+openbmc@lfdr.de>; Sun, 10 Jan 2021 20:52:09 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DDSCp1sVnzDqMW
	for <lists+openbmc@lfdr.de>; Mon, 11 Jan 2021 06:52:06 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net
 (client-ip=212.227.15.15; helo=mout.gmx.net;
 envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmx.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256
 header.s=badeba3b8450 header.b=QY57g+zO; 
 dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DDSBw1G77zDqMW
 for <openbmc@lists.ozlabs.org>; Mon, 11 Jan 2021 06:51:16 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1610308171;
 bh=4jedAEiq6gILXUEMM6V3DYxQgpNYeIULCAh8llHg6Hs=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
 b=QY57g+zO4IOGmroPE7IQ2TJM1C0Noi1Ptf5hL2144n0S1BWewkqf1V/+O58LPmRi3
 eyTqVCZQmdUe0VbQx0Vna9ieLW7L1+O7vV/lKJ7DzufXcaMR5mxXtFjU2nFUT9aCAl
 E9EY/XebFX+AH6a9NW7k+r43jyFHTe662QJjIN6k=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([37.201.215.57]) by mail.gmx.com (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M7Jza-1ktAPP0glI-007jUs; Sun, 10
 Jan 2021 20:49:31 +0100
Date: Sun, 10 Jan 2021 20:49:29 +0100
From: Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: arm: Convert nuvoton, npcm750 binding
 to YAML
Message-ID: <X/taSbQ2emVZpQ1R@latitude>
References: <20210108224008.705687-1-j.neuschaefer@gmx.net>
 <1610299126.020227.785276.nullmailer@robh.at.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="mp887TxO4rsrDQEV"
Content-Disposition: inline
In-Reply-To: <1610299126.020227.785276.nullmailer@robh.at.kernel.org>
X-Provags-ID: V03:K1:3BlkdPGCxzQH3HH+T2AfqriaBKfUsuB41nYoCaxxghKbJZkAoQT
 Yyqy4Ad4xZpXKCmEF6wEdq7rpfYWsR93Gf4QuU8bpaXWh3zt5kZn1Yj3o2okxuZgdti+Kw1
 r+WbmV2UkyCJiQOrm4wxZ/0B4VRc+oDMzk3yjCUxFoSVhpzGV/+ifYG2/wRDXvtP34iKIiD
 x5Bn0aWwX0rNXH8gzajqA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:FwtleX0Z/cE=:KnBP9HuUJ5ybQFYbwalZbu
 SS5QA2006ZIuQZgYMA0kjlCASl6VilSQZxQWNWEKzaOTtMa0zqdpzsEQi0HV+0N1nGAglDDfZ
 +5Ec/k6zG2GSCiKPY5iwxRqNTYLXIDU/pIERgSq9nF7Fv7HSBrTzET9vf1fPOkTWCXWKqcjJb
 jAnXdRU3MABrE8mrz3z3x6acWnMvb5jQkUMxNIU+oMhshXTcJR8n6MaW29JPH1IDjf/p7PTZp
 wz7/wEz5r4XViR/hEm8PBaEUrrDYEqsOtKwArpxSVkPjyS5RypaNamNAyaFfHxImVUc1Gjb7t
 lEA0HM2gwttv7cI76lJ2bMpO9m4iMhk0c0ViX+5PCOAjSbz0sH9qRaJaixl+sRdkBmDPwOJwQ
 p/za4M28nKTcpNdnsx8Nj268PUBSxP9sWuyBOu7Fu79R/wbh5bc3Q2f66ZtDdHQkH8RC6R5o0
 siNhDcRGUKhu6KXs26OalteuJDudpx82Pwq6D6neA8SmInLM4MI78j+stlTNZu6k2LjAIepc8
 KHFwz/BGo0l6t3eTkS47jOWkV0cPkxZlx397ZPsCt8OGkjsqU6owtKyPIHgLdyK3hYknpWyp2
 e4VjbVHjkYv9aEZGJOWqTIqXC+HS2bBQUh9934j3zCk/V4Xo8GuQ/NWDSeD2gNgySubiyEaR+
 7RnVohQc88lbUPnAIbfSFQcQNs4xrbw0QwqMBq5e5mizuE1MmNlutwNT97B65n67MhdkbF1UZ
 8L77GKBHMbzRGU5plkHMDzU1yYwrrSdDNMFA2yETxiYDBGlqhgduB9f7I0t9ZAbiC4qi0rrHE
 JFyYH0CFl85Su88eoDqxcSOj636MawlXPtGb/NW+cqgWQk/w8CnS/dZHjvgRFmS5SIADtZdLz
 IJiIn2aRI29hDUa25DAg==
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
Cc: devicetree@vger.kernel.org, Tomer Maimon <tmaimon77@gmail.com>,
 Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>,
 openbmc@lists.ozlabs.org,
 Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Tali Perry <tali.perry1@gmail.com>, Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--mp887TxO4rsrDQEV
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 10, 2021 at 11:18:46AM -0600, Rob Herring wrote:
[...]
> My bot found errors running 'make dt_binding_check' on your patch:
>=20
> yamllint warnings/errors:
> ./Documentation/devicetree/bindings/arm/npcm/npcm.yaml:20:13: [warning] w=
rong indentation: expected 14 but found 12 (indentation)
>=20
> dtschema/dtc warnings/errors:
> ./Documentation/devicetree/bindings/arm/npcm/npcm.yaml: $id: relative pat=
h/filename doesn't match actual path or filename
> 	expected: http://devicetree.org/schemas/arm/npcm/npcm.yaml#

Sorry for missing those. I'll fix them in version 2.


Best regards,
Jonathan Neusch=C3=A4fer

--mp887TxO4rsrDQEV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEvHAHGBBjQPVy+qvDCDBEmo7zX9sFAl/7WkAACgkQCDBEmo7z
X9sd4xAAuq5sPwkoYc3oIsalhvbmdmotFlhUcI6LokfTRpIsYBqMNxHGwpHC6cOB
piN/lWL0fddGIfhDX8xd6D4JM00fU7j2BVfiSNAMsFY/DwzzamA6tsYwbaJGP7AN
DQXt3XbA+G6jYurEu71zyoXvqlWyvoJ208RzSqS8VfC2Ijwhx9+F/h5cNUSsEp3d
JoU3FHOieOaHmoxteyIgXRVSbiKEPOPNDi0XRP323SMp5yCKx0WwulfTcBu9Qp+t
6AKXhovI9KUgSyScUKmtFaEcYXOShzNY2Xz/bIKz68DRPUbqzumHWganiTIVo1rT
7W0kwz5kktSIHwJNKOzUoid7+g3jX+ZyrRBQOCY582NIBHrOsX2WbLTephN9PRsW
lrO66TD/Ky+ynLhBwtWrwxnSHwV6y1ACbrHBeSNrUxF8leFwjs3J9vnIlcC4xY1G
5htvxsWvZV1HVmdiwtSUDduihGqatd0jACQugaQyJsGasrfeA9/Fgp2nRUiRteM9
uRP7K2pQuWekkLAwnToGOFl8mIAhV4KqkbxPighlRjf07jxRvmMq2a6fh9foO2km
X6+0Z3WHte8tWJavcMVMzDAgeKMNkdUdrKmzlMH7Dez4Rrnh0Jxh/ET6gz07eF7K
QXlMZm1b1TeOUtASl6SYBN58swg3wh7vWIj/Nv7Gn5jnDddVg3g=
=1Get
-----END PGP SIGNATURE-----

--mp887TxO4rsrDQEV--
