Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E35E5F7925
	for <lists+openbmc@lfdr.de>; Fri,  7 Oct 2022 15:42:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MkTxf2r2vz3cBw
	for <lists+openbmc@lfdr.de>; Sat,  8 Oct 2022 00:41:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=DYWR1BqP;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net (client-ip=212.227.15.15; helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=DYWR1BqP;
	dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MkTx22K8Fz2xGn
	for <openbmc@lists.ozlabs.org>; Sat,  8 Oct 2022 00:41:25 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=badeba3b8450; t=1665150065;
	bh=SE07BGJgeqNx+3iiaFg+pgbMFcWT8d8fc4FeN0mD91k=;
	h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DYWR1BqPU5KwiQw52TB8eGXtK126vlYrZ2oTFrskv4s5/6w/kCCgtRknu4RW6wtsy
	 dTn5E7K1v8tjHLz7W2SGwiOFUeD3I48/OCBSfJxNf5o0IfeaXqxvjltc04h6BrQZjm
	 scUE/H1v1BI7sK2G//DLyW8obSHzp599dhNBUcYU=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from probook ([95.223.44.87]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MBUmD-1otgA206L1-00CwXm; Fri, 07
 Oct 2022 15:41:05 +0200
Date: Fri, 7 Oct 2022 15:41:01 +0200
From: Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: Marvin Lin <milkfafa@gmail.com>
Subject: Re: [PATCH v1 0/5] Support Nuvoton NPCM Video Capture/Encode Engine
Message-ID: <Y0AsbVvZA+VQVfcP@probook>
References: <20221007025413.3549628-1-milkfafa@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3ZUt239hMnxMzPCy"
Content-Disposition: inline
In-Reply-To: <20221007025413.3549628-1-milkfafa@gmail.com>
X-Provags-ID: V03:K1:2G9fstZIo2DgcMGnZGA4k8/8EFvyYkMhunnuIqC9zX3Pb6YE2AH
 JVYZwO7hNsP9s88JvGU5JtgH0W16ZoDTMYFItkb8Tfm8hSrgJMwtvo8RepS1MkF8cvZGwW7
 JeskMNGB0HLWjn+e2XTo/psLQhpogysJE273J5/13QQznRO30swgBQihmErktd7539ZYBdI
 YmsmUsTENzZmTHmwWXtwQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:X1v2xfMGgtI=:vULl7NBZiS6a5+Glr/rBCO
 5RQO0ho6QwELVI2lIMdXceaI2HU5R9navt/q4A+3obX1vdaxqUNz0gRhV+t+eSuoDBRm8BbDD
 P9lcl7fofdCfQuymQR5449NX0hkb+l4PWAUkdB7h6WMEphT4JplCxykfkMg283sLxxoVz6yQX
 Rxjbny9YNhAq7LRU+gzPxRk8zQZgjrNvOXVf/ibWiYw2diyC369WLQc0GrE44D5XdwPYwpkiT
 AbtFUnOvwiX0l9hfqy42IcaVF4TpAgW6e1NN9WsU/tNK6YG203S2QooPOYz0D37dL1yspKakM
 kYfy++/qaLqD2RxTrTC+TldjANxHLJOSsdF+18c1FwtExCZu89ChYDHLSugYjVWl1ikrgbFwz
 MC/V31wmIyPdUraoHJFO/c57lyKig6OoPUsWRrQWPVuuyRxt1LpKoqnvf8ICZI5DJcmRmgnim
 7U5Ka62muAidg9yPKvHRd8nPnsTBZA+ACWv8pBlv3yVpCccVzgQES4VpyhhvZv6QyugRiOAf4
 HwGYjDXJvXhZPzHHe3uwdFFlvxKvNWgpa9UUACmq4EpGZhPxbNks+VN2Ed/Kx6tt6Flxdhaoz
 /iZFOzgp+5Jr9IF3CyBddwjwNPOW82otfygAgok5fAsUvnw0/IKIAWefM/7yhb6+DO2ehp01x
 gWx6ktAAnF7Ma/o3pKrjUOrepuoqMnoEqNvHh0bE8XmhjJCQBdkC8CovYeDUV4ULzPX0M6DcQ
 qVoj7GI0S74EYFPIJ7yi1nUGAX4QhbR1fCy9zq60oQA/1Q/d3+XZgogd3ue51fD/N4OABuctq
 SYKDOhiBEFQInMiaWNPZ9uI+Ibh87e0qMptd1lNjPY4p9p6pePfn/nM40qD6xnoGAtW7OA18n
 lgzKL0/NJocXp/wW54965TnBjS7CRyr2XbLYQKB8Rgu6beBTzM0WaOPgbN1cFGn8sX0uvveKF
 osdxVgg/5cqjUCBoGM8YZU/ePfzwsPYFb64tu5kmIZojd3/APVT9VxuHoq0H+UAHNzjNfKvD+
 bA0UChrlV1Ax1j0o/nwJDxc4XacBLfuDyfDs35J4SlOQph/odHykci4Oboyz/kKhoCAnoQKXq
 sXPko5GQXYhOIxEWNCqhhFT0NkWPHzG47VCFXMCnaCVu0v/6L5xAOrgVxTbv6AAUwyDgCpont
 sodAqJeFFqAUz+YfM26ANIhFsM8uD1n0GyEPZANY4vwpR2qE3BpQ2nFj6igD3OuC9ZKUPq0fK
 kcazNcfzi9h4hbt48wtwjlvXEC4VZLJNDfekoxY8GdMeWAVnEZPDWTYfa3jANBc8n2/9WIwXI
 IJl3Ri2uBVPNw4sqtOKN4hcMDZAA0UvKKiy3ohIQuqD7pJqh6D2ZLuGoCUhGEHu3Q7jaJCs2Q
 TDciDGyd3S3wI09vGyJhl5ifxj+8ykTB3kHjTQTogQkYFI8ZnHx+rEHuoMXFFb3Xwy6cuihR0
 ikM3phwmgK5VfU5tKF1/a+Wdz4tlBkYWkkDvhk0Gdd57vkUIJowETLFkiHO7twl/SDu4eGESg
 crYqiLbMJWVomiTzfKh100hFCVaYxP2suIU223JTCcsbp
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
Cc: andrew@aj.id.au, openbmc@lists.ozlabs.org, tmaimon77@gmail.com, kflin@nuvoton.com, joel@jms.id.au
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--3ZUt239hMnxMzPCy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Marvin,

What is this patchset's relation to the previous patchset "Support
Nuvoton NPCM Video Capture/Encode Engine"[1], which went up to v5?
Why is this patchset at v1 again?


Confused,
Jonathan

[1]: https://lore.kernel.org/lkml/20220826024124.22747-1-milkfafa@gmail.com/

On Fri, Oct 07, 2022 at 10:54:08AM +0800, Marvin Lin wrote:
> This patch series add DTS node, dt-bindings document and drivers for Video
> Capture/Differentiation Engine (VCD) and Encoding Compression Engine (ECE)
> present on Nuvoton NPCM SoCs.
>=20
> VCD can capture/differentiate video data from digital or analog sources,
> then the ECE will compress the data into HEXTILE format.
>=20
> HEXTILE compressed format is defined in Remote Framebuffer Protocol (RFC
> 6143) and is used by VNC features, so we also add a patch to support it.
>=20
> Marvin Lin (5):
>   arm64: dts: nuvoton: Add node for NPCM Video Capture/Encode Engine
>   dt-bindings: media: Add dt-bindings for NPCM Video Capture/Encode
>     Engine
>   dt-bindings: arm/npcm: Add dt-bindings for Graphics Core Information
>   media: Add HEXTILE compressed format
>   drivers: media: platform: Add NPCM Video Capture/Encode Engine driver
>=20
>  .../bindings/arm/npcm/nuvoton,gfxi.yaml       |   41 +
>  .../bindings/media/nuvoton,npcm-video.yaml    |   87 +
>  .../media/v4l/pixfmt-reserved.rst             |    8 +
>  MAINTAINERS                                   |    1 +
>  .../dts/nuvoton/nuvoton-common-npcm8xx.dtsi   |   19 +
>  .../boot/dts/nuvoton/nuvoton-npcm845-evb.dts  |   18 +
>  drivers/media/platform/Kconfig                |    1 +
>  drivers/media/platform/Makefile               |    1 +
>  drivers/media/platform/nuvoton/Kconfig        |    9 +
>  drivers/media/platform/nuvoton/Makefile       |    2 +
>  drivers/media/platform/nuvoton/npcm-video.c   | 2095 +++++++++++++++++
>  drivers/media/v4l2-core/v4l2-ioctl.c          |    1 +
>  include/uapi/linux/videodev2.h                |    1 +
>  13 files changed, 2284 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/npcm/nuvoton,gf=
xi.yaml
>  create mode 100644 Documentation/devicetree/bindings/media/nuvoton,npcm-=
video.yaml
>  create mode 100644 drivers/media/platform/nuvoton/Kconfig
>  create mode 100644 drivers/media/platform/nuvoton/Makefile
>  create mode 100644 drivers/media/platform/nuvoton/npcm-video.c
>=20
> --=20
> 2.34.1
>=20

--3ZUt239hMnxMzPCy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEvHAHGBBjQPVy+qvDCDBEmo7zX9sFAmNALEYACgkQCDBEmo7z
X9tEUQ//ah7H2sRU/JkR9xPpNPh7QfDmlmjxeTdHByfdjirmBVN7ANZx5Ol/xXkb
GCDeyZix1SDahTgt37hZz8Al59htv87HM4RdMYd4wNJiiTcTIQUDv3cXNHewIEAo
Sq/7hoNqI1N9ODWXUDdcqVkkh+1ic7zZJ2xifnD4qUeHFx+cfqFlbhOSOa20dnOa
vWEXOoo2Co7JZV3NCEWYcaLT4n8a0eH18WiAyVrIaUq320DN8gSaONiC82mUv/fX
SnKpABZ6EXBTCdg3zFic87IsBEQ2KLLpGhw+MymiciJLzxB0Hmpo7bS+5fefw7SV
py3VxpiQe/7monR5xHoH1qpQpl54Ij/PdQ+ipz2Capop4AI0rJu8OC4nHv25jOM5
zEbZNdge3Rf5XS+8b54PyiWFZAixIjYUqxBazMpwpwcxLCI5xTFc4h2SwRZRyHoV
vWlB9S2laSHUQAW8omWy2lAzYzhOJeOubrato2QikDUjArQ+fckYHwnArnGsPmbF
G4AmL6tI1jkYO4Lep8jls/thbox/L7tpuHeCxCXiM8NlpnEyvFqpIkj0IjMkufSg
VQ2DtTQh+NPhNUObQlzZ3LbyCWzG/aBCLBK71SL99fNavkZeR3OJ/1Jv10M9N+1N
9GznalIaSsTWbANZ9b5Nl5OZKVbv1Z33TUej9N3DTeoDKCw63ko=
=I/uz
-----END PGP SIGNATURE-----

--3ZUt239hMnxMzPCy--
