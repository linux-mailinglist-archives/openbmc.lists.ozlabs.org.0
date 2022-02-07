Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F2D94ABDA8
	for <lists+openbmc@lfdr.de>; Mon,  7 Feb 2022 13:01:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jsl9L01Hhz30QS
	for <lists+openbmc@lfdr.de>; Mon,  7 Feb 2022 23:01:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=WUkDxhCE;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net
 (client-ip=212.227.17.20; helo=mout.gmx.net;
 envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256
 header.s=badeba3b8450 header.b=WUkDxhCE; 
 dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jsl8s2FvVz30Ld
 for <openbmc@lists.ozlabs.org>; Mon,  7 Feb 2022 23:00:59 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1644235224;
 bh=ny+4Ok9hjLmZqMdJOe+AHOHZyUc8dQTSBOKig5sw1Zw=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
 b=WUkDxhCEnOgHi9guAMa8VpNWsUNYQ9ylfHk2co/w4BFeE7z7hvrg4aglMTKohiJdh
 +6pdR+jeYSdTHrEEBT21mzjMQG9b4Yiy6d6CqAjXfDVEtnuhDb1CUDfFzOrsJTmWlM
 NNX0rrIzd0y/MrBW5+72cOw3QSb/K3pgz+xzvfZk=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([5.146.194.160]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N5VHG-1oO2ST3tkI-01709e; Mon, 07
 Feb 2022 13:00:24 +0100
Date: Mon, 7 Feb 2022 13:00:20 +0100
From: Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: Tyrone Ting <warp5tw@gmail.com>
Subject: Re: [PATCH v1 6/6] i2c: npcm: Support NPCM845
Message-ID: <YgEJ1M40AG9EuRPI@latitude>
References: <20220207063338.6570-1-warp5tw@gmail.com>
 <20220207063338.6570-7-warp5tw@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="LFTVFI5jLgkqvDDv"
Content-Disposition: inline
In-Reply-To: <20220207063338.6570-7-warp5tw@gmail.com>
X-Provags-ID: V03:K1:yg89WwvSEPrQ7hqxZPv4583IrZHv7A7T87r0LqD6PbFz3C7FN/u
 DCigsPCdor6D5A6cW9pbDSVK9Wv7zDCZff+OnUfqn03zB/IKN/kfRue1QlcueWxNEcDF7cq
 v7kUL6I1LDa0n/X7JpqTp/cVEV9z/uaWTnAp/M1NjLk7sw5xbBxX58aGYTsD5gpunxjgfA6
 1P2h57S5hXSollPCTcc1Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:8fYjpuUTdVs=:2HRW9Qcc8Ghko4L1byQbVD
 lmQ7pKccZZzOktEod4HjQC/E6jDMhwDGbyRtgVU0Sf4j7OBkxDUfOpmYI93BaCMI9vzvsSCFD
 JfQH+uIWV1CPxiPvuOl3SFC0i+0cqZ17luQNWqH8imhzzLwxuS7KXIWYLdtgwbE7VybSuIZR1
 voqbrdVjGNd0tnSpFgyuazpvvpT5To6xMnKVNZBuZA/9wDUc4pAZiiRQuHaQuuFDEdnkFlV/L
 Csfel/qt5978fj/frEdEBsUGY8EVIaR5UhtQGY6r1HyeWA6cjpPQ3a7WoDtFO1IPHD/MGXWiS
 f3XvSBL0r1fCSfJmhOzIFWEXG2aRY/14QNV7NjQwGyi1BGpTUK0dGrQG71Cr+oC/oxcUXM7oO
 vYTKndhedx4Aah3lvXvFjBDpqKG1WbZgdZsXslmGHpZg5q5eJJKNsQ+kPpticRlWreVFv0VWI
 pPD5tkzu+iwSrSXEBThmAzH4Kro62lSd7P7J3fJupbtFYjabuokC0mzhHHq6Ilk12L4zj6nn0
 4gFLb4t2jl969pYzy80DBcm8ylnpledOKttDYk1oyS2vlRRHyMUx0FkmHcq6982V1kzSHADJp
 eKyw0r8F1AgtvRM0wlywMNb56T6n05UVSK4uKIRWg3uyvDWemu3InSJSUdeOhokKzaH0eM4BY
 fWJs5h2g95mpZ9Z/ILWbcWq0ThSRE9R28DIYvnS+XxGTjtIDhYVtdoOGd/DUCFs3jFPAUngRf
 Y/GQ9r91dZNYfbpdIcSm16+uREm8tTCGgWDu3a0uhT1jWMZrFo23fp5FOrXidLFQfZhiJVpcr
 TGue+U3yFTPbD6zYzlRnhkjOFEughCCkmKS5XmE/sXQ08ZzAguUTvo6ilo1d4PhJWDvE3TbW/
 jtOu4YGjeENxCsmjO8vHSLUUMzLusw+FFPunKxq40Kh7HSY7b5ROsctYyKJMc0jeBpGg3IKz2
 LpsVGHevTX8b3NYlzs/mvFXhfbXORXLCrsEqzl8jatYjSNZOmqkue7D+9ayv3YQ2AVaJetn/5
 gTFPW3l6Ih0rNgigutZdWDeh26ct2uEt86X9/iIGAWWj3w+Og7Q4XcafO0BPFw1GEtin06IUa
 O7Zwmqt7vE/nZc=
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
Cc: tmaimon77@gmail.com, devicetree@vger.kernel.org, tali.perry1@gmail.com,
 linux-i2c@vger.kernel.org, benjaminfair@google.com,
 krzysztof.kozlowski@canonical.com, openbmc@lists.ozlabs.org,
 JJLIU0@nuvoton.com, lukas.bulwahn@gmail.com, tomer.maimon@nuvoton.com,
 KWLIU@nuvoton.com, bence98@sch.bme.hu, arnd@arndb.de, sven@svenpeter.dev,
 robh+dt@kernel.org, Avi.Fishman@nuvoton.com, andriy.shevchenko@linux.intel.com,
 semen.protsenko@linaro.org, jie.deng@intel.com, avifishman70@gmail.com,
 venture@google.com, yangyicong@hisilicon.com, linux-kernel@vger.kernel.org,
 wsa@kernel.org, kfting@nuvoton.com, tali.perry@nuvoton.com, olof@lixom.net
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--LFTVFI5jLgkqvDDv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Mon, Feb 07, 2022 at 02:33:38PM +0800, Tyrone Ting wrote:
> From: Tyrone Ting <kfting@nuvoton.com>
>=20
> NPCM8XX uses a similar i2c module as NPCM7XX.
> The only difference is that the internal HW FIFO
> is larger.
>=20
> Related Makefile and Kconfig files are modified
> to support as well.
>=20
> Fixes: 56a1485b102e ("i2c: npcm7xx: Add Nuvoton NPCM I2C controller drive=
r")

It's not really a bug fix, but rather an additional feature.
Therefore, I suggest removing the Fixes tag from this patch.

> Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
> Signed-off-by: Tali Perry <tali.perry1@gmail.com>
> ---
[...]
>  /* init register and default value required to enable module */
>  #define NPCM_I2CSEGCTL			0xE4
> +#ifdef CONFIG_ARCH_NPCM7XX
>  #define NPCM_I2CSEGCTL_INIT_VAL		0x0333F000
> +#else
> +#define NPCM_I2CSEGCTL_INIT_VAL		0x9333F000
> +#endif

This is going to cause problems when someone tries to compile a kernel
that runs on both NPCM7xx and NPCM8xx (because the driver will then only
work on NPCM7xx).

And every time another platform is added, this approach will make the
code less readable.

A more future-proof approach is probably to have a struct with chip-
specific data (such as the I2CSECCTL initialization value), which is
then selected via the .data field in of_device_id.


>  static const struct of_device_id npcm_i2c_bus_of_table[] =3D {
>  	{ .compatible =3D "nuvoton,npcm750-i2c", },
> +	{ .compatible =3D "nuvoton,npcm845-i2c", },
>  	{}
>  };
>  MODULE_DEVICE_TABLE(of, npcm_i2c_bus_of_table);

e.g.:

	static const struct of_device_id npcm_i2c_bus_of_table[] =3D {
		{ .compatible =3D "nuvoton,npcm750-i2c", .data =3D &npcm750_info },
		{ .compatible =3D "nuvoton,npcm845-i2c", .data =3D &npcm845_info },
		{}
	};
	MODULE_DEVICE_TABLE(of, npcm_i2c_bus_of_table);


Best regards,
Jonathan

--LFTVFI5jLgkqvDDv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEvHAHGBBjQPVy+qvDCDBEmo7zX9sFAmIBCaYACgkQCDBEmo7z
X9uI7A/+MWPp/zPHPaH3lYE4rWHKtXP/hbBmF0vkBrZkvhLAh69d3QhFSCURD+7b
aC2EGxA6Jmnnbq4iGi76fSAge1D6KiDCpYvi3QLRSY5h66nEyvnAs2JlZZXMfBkQ
TTCWSzdULh1ow8+IdwzTuQ/ngCNk+Dar1R8tsPvZjfgjNA+huM/UuBNP6c8XY/pe
r1gGazpuFO5IittQwGVqW0f7WVdu7gBGsuOBlpdS4xMGdw5Zp2XSmMXPjESEI6Tp
lCycBXLdhzEokfA76PhOuRSjn6V3fyZYlw/iIxLh/vISBD+XtAt9RuvvqHmxIlS0
T+rqm3Kdn6BPb6xYxdBt2lySI6838dS7CvAI4ntu42bGTM+xboOSXm7RTUT0/PRV
cGV3Uo3vx9fLNWVjxLhEbuMYyGY1AbE5UuORWkij2XilAWrwOqvFUWWu0Xw5UnaA
SaWSZHU7/9QP16BCwoVt5Nv2HiygMddN50dZFAzcy2oLXoChLFThcrc5KGKvfX/4
ltXWQ4XI+7riX9QhoD9HX2SLwTNaX1V8nHojvzbflb7UIvujg8VSu2uBq6hRElDe
BrBEbtEkFYVzs2zkULWGsp9bQGcwJF3gVEWFTpxuLWS6xFB3kJqPhVffoqxL4NbD
W3HqOmJArx3js3avkgpp3LzI8hAAYfq+yP3Fibsmc9Z89mU5rYE=
=8qyc
-----END PGP SIGNATURE-----

--LFTVFI5jLgkqvDDv--
