Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E51FD3376A5
	for <lists+openbmc@lfdr.de>; Thu, 11 Mar 2021 16:15:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DxCFP6gHlz3cZg
	for <lists+openbmc@lfdr.de>; Fri, 12 Mar 2021 02:15:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=LMcl0z4J;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net
 (client-ip=212.227.15.15; helo=mout.gmx.net;
 envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256
 header.s=badeba3b8450 header.b=LMcl0z4J; 
 dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DxCF76ZFPz3cJ6
 for <openbmc@lists.ozlabs.org>; Fri, 12 Mar 2021 02:15:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1615475724;
 bh=3MuCYAd6N7yB81hhbCXNSkIdDWEBq396zeTdmwrQ8MI=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
 b=LMcl0z4JNhv9EIUVD8fSbPuP+FBV8lMdcztkZvi0R4qqx5nUZtL2L/jrFNF3LvzXD
 aLUidRdD+MJLlm8QhAIaHB116jNRvLQY8OiSShcVDUJDNyqCN0Oh3PGfnMpSYtnx0H
 oEHML4JPwtIGPhasC5C4G4uyWDBti5QaF/cf7NZo=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([37.201.215.134]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1McYCl-1lst291umL-00d2eu; Thu, 11
 Mar 2021 16:15:24 +0100
Date: Thu, 11 Mar 2021 16:15:23 +0100
From: Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: Tomer Maimon <tmaimon77@gmail.com>
Subject: Re: [PATCH v2 RESEND 2/2] ARM: dts: Add board-specific compatible
 string to npcm750-evb devicetree
Message-ID: <YEo0CynZ5X8tMylL@latitude>
References: <20210303154622.3018839-1-j.neuschaefer@gmx.net>
 <20210303154622.3018839-2-j.neuschaefer@gmx.net>
 <CAP6Zq1hwp+wJpbN496096q8izRRoU2Jg+OKugcSk+BcXWfME9A@mail.gmail.com>
 <YED/zzV5kb35k2vb@latitude>
 <CAP6Zq1h5QK0_3gBek3QNN_cb6tGFJJXU_D8UPJOqnaDbsQAkxw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="boiCNNVZ39FMb+0t"
Content-Disposition: inline
In-Reply-To: <CAP6Zq1h5QK0_3gBek3QNN_cb6tGFJJXU_D8UPJOqnaDbsQAkxw@mail.gmail.com>
X-Provags-ID: V03:K1:6vLihh2S+F7saU2HwNrs8j1CfmrBwnxVRD2NCYnR4RMVesOzzqp
 jneuthTPUBItLgGUbQA/3AT6ygHEYpjD24QotjOsmc7ZMHDxEVTUnWLV9GZHyl7iSkwSK16
 38zmm9d3cD4x/L/uxADjuUWF/oUcSHtJnRh6ghEsXoIXTltIM4gje7CtvFfS6xGN3vtJ5U/
 qWHMgsBPph6pKOKXEWdaA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:dIuN6dI2zjE=:xHgIUqVDXzGExR5n9tVOgs
 Uq/+WNuJIZmsBsFV7CDfCXqJ36ufjsXmOST0CmrJ32qcAZnCqPM4Fkj31nmiOj8asW5sl3afX
 jyZMxD0x50jFeDY/NV1iQxPSZfYPe6qU5bdr4kHWxs7XCFPalvHGsB2ElAJKMtu8R1anx6ufu
 OwvwFIox1lXL3/yTYl6M/9ZceV1Az7vse/JI8N0K5wTUrVPAcusqaEGdydJgSwSNzjGOMu7uV
 R5UmiWZxn8gYR2Zun/tjGQj712HO/ylUbffOF71TFSrXdRaN/g1Ai3SsNVK2iTlDNYrWzgMdO
 QlNCuMXjQsihT2LPI+ZmGjImDdEgRNwTDfGAV2Tu8u/vxc4/mvc6KFioZaIRT1tJlDyLVrx2/
 hbMJHukLTpuVfJLj/DuJjbHDP7+YuOlpyF5F8mO1cjOJpsFGoeOe8V7HUUZnaMf+gFvLf41Fo
 5yLs9X/cFlWXSsb/lIdgy4ygaQa7Y+/jocsXKhj+VFduEBiR+DPsu3AZVKiMatMMxdFUvjkpJ
 4Ofz2dDPtHqsykzAycAe5i5pZBIqZ7CscNbW6MloIuhY23KrEkDsd7EU8BD9fl80GkT6zrhL0
 njXkPsuwzus/xaLKixp8RSeyGS+/ykC0ViCFcnZKJf5hO2tVkiIZPBFSY3I9M01k5LnZpSyNy
 mY4CHVVuPNIoMgCIScG4hoU9DXG6txp8gA+kaoZ5U5e8uAAur9+j3zSTVFQWAdOeCru16BHO8
 /9nUNytOifgVysPKmRkTqD0OV/jFm886sI3PSLa8zlwedgI82xwwB7/4vN68xQusm4CgivKhF
 JOXsGpIbMXHrutubyccdczvt8YdQr9czrcrCBvArUOuA5MqIige7LNO3l3jxrQQD65n8dMKSp
 XZbm2He3HanazFsR4Vvw==
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
Cc: devicetree <devicetree@vger.kernel.org>,
 Benjamin Fair <benjaminfair@google.com>, Avi Fishman <avifishman70@gmail.com>,
 Patrick Venture <venture@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Tali Perry <tali.perry1@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--boiCNNVZ39FMb+0t
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Tomer,

your in-line reply got lost in the "> " lines, but I found it anyway.

On Thu, Mar 11, 2021 at 04:11:59PM +0200, Tomer Maimon wrote:
> Hi Jonathan,
>=20
> Thanks a lot for your effort!
>=20
> On Thu, 4 Mar 2021 at 17:42, Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.=
net>
> wrote:
>=20
> > On Thu, Mar 04, 2021 at 05:21:36PM +0200, Tomer Maimon wrote:
> > > Hi Jonathan,
> > >
> > > Thanks a lot for sending the patch,
> > >
> > > I think that when it related to the SoC EVB it can stay with the
> > > genral compatible name nuvoton,npcm750
> > >
> > > you can see it also in,
> > > https://github.com/torvalds/linux/blob/master/arch/arm/boot/dts/aspee=
d-ast2500-evb.dts#L8
> >
> > To make the single compatible string match the DT binding, I'll have to
> > write the binding a little differently. I wrote it like this:
> >
> >   compatible:
> >     oneOf:
> >       - description: NPCM750 based boards
> >         items:
> >           - enum:
> >               - nuvoton,npcm750-evb         # NPCM750 evaluation board
> >           - const: nuvoton,npcm750
> >
>
> I think it should be like the exemple above

If I specify the devicetree binding like above (which I initially did),
it implies that the compatible line in nuvoton-npcm750-evb.dts should be

	compatible =3D "nuvoton,npcm750-evb", "nuvoton,npcm750";

not

	compatible =3D "nuvoton,npcm750";


This is why I suggested rewriting it like below:

> >   compatible:
> >     oneOf:
> >       - description: NPCM750 development board
> >         const: nuvoton,npcm750
> >
> >       - description: NPCM750 based boards
> >         items:
> >           - enum:
> >               - vendor,foo-bar-bmc
> >           - const: nuvoton,npcm750


I will send this new approach as a patch in a few days.


Thanks,
Jonathan Neusch=C3=A4fer

--boiCNNVZ39FMb+0t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEvHAHGBBjQPVy+qvDCDBEmo7zX9sFAmBKNAMACgkQCDBEmo7z
X9tVqw//d78aQEHzqrMmTFjpknPfzV0jICAFnC3gHY5Fz+YK4Ff47meK8UDdxmrv
SHZbL4OoQfqxKRWICSMklYLNp1igbJ7wtr5r5c5yog7Vc80ToGQRyG4d06wdYl5Z
cjj8kQcNiKiqiCdAJXrzDdZHXePfmd4CjZok1zHC6rrYrBMjrMYEdAnUU+9JTfU8
gB0/Gt4cPyurybY62bgTF1s4WWHqdmFuBt4ZNL2H983jDdgEgI7vZOtoneBTarpM
XIUkCXv1jdxuRqs+G8Ln4liO/C2xyn7VrnVzdhdMohIaZ+CeE8z2iUoa+pktBwHM
+jIEg5EjZ9CjrQGa2t4DvL8PcSUSLVmwPetjiRJ0b76KQhVsUP6HvRyKOlGKF4Q3
V7rrjCSW70m7mZl5pokQRU2AcpGSWtkoJ7XxfMLFJE7Bdzsn278nRUo5IGr38M/r
9yCpVtc+E9DlpUPDavyJIEMn1R7q+fPM7Y/Sdks1hGTO+EiqzuUReH6ilzF2TIQo
pPBkoNdvDwfwA4DzCcZiz3vjPpG90T0hLqaZv00J7HBvcvnGz54jvFyJqqagAfbB
ZWRtBra4l5XtW84+FGo0nOVwRik45F0pwsui0tFzsqLPDvLhX0XW2upsFXZnUOBz
Vzy8RZw3uhbIEDogQx1vUof2AyAUUWjdE/1LA2aw7ZTyNxF3Jq4=
=7rtB
-----END PGP SIGNATURE-----

--boiCNNVZ39FMb+0t--
