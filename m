Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 65B274C0B2F
	for <lists+openbmc@lfdr.de>; Wed, 23 Feb 2022 05:39:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K3NcC59MZz3bTH
	for <lists+openbmc@lfdr.de>; Wed, 23 Feb 2022 15:39:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=cbzMWlss;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net
 (client-ip=212.227.15.18; helo=mout.gmx.net;
 envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256
 header.s=badeba3b8450 header.b=cbzMWlss; 
 dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K33lJ3Sx0z2xgb
 for <openbmc@lists.ozlabs.org>; Wed, 23 Feb 2022 02:59:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1645545541;
 bh=v9/boqjlEcMyJId9CIqJT5C3HYAS1X5pmHRpj5+LSPc=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
 b=cbzMWlssQz1//PF81imE5fp0P7GhAfIzopBnTdtSgpTFKkIIK0dcRYGairYstDVtA
 fTumudGg1hHmC5mVNbopU7Y/ObW6RxAZQFDUXV2RNmrnd0O9CpQbZenoXTf5gC/lFG
 zgo/bvwWAlDR0g4fwesrdJpFarVh2oVqkacLEUyo=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([5.146.194.160]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N1fis-1oOZK92U6C-0123sk; Tue, 22
 Feb 2022 16:59:01 +0100
Date: Tue, 22 Feb 2022 16:58:55 +0100
From: Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: Tyrone Ting <warp5tw@gmail.com>
Subject: Re: [PATCH v2 05/11] i2c: npcm: Remove unused clock node
Message-ID: <YhUIP4pvoGBUohCE@latitude>
References: <20220220035321.3870-1-warp5tw@gmail.com>
 <20220220035321.3870-6-warp5tw@gmail.com>
 <YhN8OGIR9eSCus8E@latitude>
 <CACD3sJbMZ-CT4htPUBqyswghAC+j8PgJ_z-VdA38yC+6HFrF+w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="BFV9RJgjJXy7GXVr"
Content-Disposition: inline
In-Reply-To: <CACD3sJbMZ-CT4htPUBqyswghAC+j8PgJ_z-VdA38yC+6HFrF+w@mail.gmail.com>
X-Provags-ID: V03:K1:rkMLMEInh17Ve8XEjZGhyurP/kHhNyjyxMPqtUdDPcpxZOVYY84
 txLbQ0ex8B7LbDZXCEOuqWbWr/BgbINmZ/my9cXBi5qZrwiU1ImYy0D7ahISGOQrPnpwxLs
 3QEMMXU/b6q2CuXyXDJPG/F5COM7fxchIRgR0t00uAF+ZePvhRcIPT/xfr51YVNNo2cJIwd
 WpPA7p37qFwt1E8AOOVUQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Yajh5NqeYhs=:yyQF5KUIf9keFlVIDVev0x
 RMyiFIEKsJfAqDv8iScdFtsSbx9c/MXj/m38FFWZ+S5sl/fssdxvp4lXPZ8koIFyM9prrKW1B
 rRCJQyicu6pUX/BKEk+uMk3FQPgJMYSrLCcScT284aJmSxzNRFfpoYAroQzaBwj2tqEAALX7x
 DKICabara53MyEGB8jqDrOwXtiFzo/86prDPX4F+hRBYfVcTQwwseo9HhDRA8bZyKF1McWr09
 wtDWzBGUJuFBgiw2GUnaaUcYkLxoghz0vvrhp+hVa+hnzedDc2kei1Xg2cUYfjOe+nFyoQx+D
 Ms1XEO7kfmcfTGxxcbX+9VYs9Y5g85GkwZVucKV3ylfHJ0BwrYp+bYmcCAfQSslo25rduYcQs
 ypL76f1f0DeMRzxAAn8B1Qw7i9d28oaGWFaToXs3isj6uJZTmRbNi77grVgW2H2nU+wDMoP0U
 fwHUKD5RJxa6xB5o81FlTysBMFr50rPKJvV2mUbzQhJKh0qZXo949bfPhISF1eKTKag7U5zo1
 1yalgmzNtdIzQ1s3rQJk9r6yZT7D9RoKc4WkM08MDtmfZ+O+tzpfqJ25qhozdSZPwvvzwa6xj
 HrFawC4U5la7dxnK2jwE3lo5DBQAHq6Djy8l21wdYptKID9vE9gaV7u6m7XkYwaj548HogTj+
 7bD/iMmStloFWhX4gkb5ZQlfxHfGt+zhBHtS7mIywqt1fOBTok/lbCtZni+yBmxi3XryFrt9h
 cUbrpllS2XV9d0HYjFFs1NVHnm14FbqrIXl4pQ0THAtA27rtp3tYMpzM+vI6Aplf35fCYKK5Y
 4YppBHNBrKqhAK7MIUrMK4dExLZE5rOihrM8EoXcivXXX186d6jjqLsHjiMo7W3Mkt+mIRJF9
 C/7AWQ8RKq11RCbzuOBykJk9R9HlBcKRiTU0hOslaGyhx0C/H46KBmRrx2Nj1uLN+O/VAauRT
 QvPLVaP9V69b2JjrEKbx2CTILdWpBec/Tw/mQXVmtaqGP8JTj/yVI4/davAI7pNMHJT98aHgv
 UC1k7vyg5x7KWlg4n2X4A1WIj8UD14m2Iq5UFcExEJoUAdTvyjqwX2jWj+4YbN+ONRKzsPZFR
 GEvrUYzS4AsLnY=
X-Mailman-Approved-At: Wed, 23 Feb 2022 15:39:19 +1100
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
 linux-i2c@vger.kernel.org, digetx@gmail.com, benjaminfair@google.com,
 krzysztof.kozlowski@canonical.com, openbmc@lists.ozlabs.org,
 JJLIU0@nuvoton.com, christophe.leroy@csgroup.eu, lukas.bulwahn@gmail.com,
 tomer.maimon@nuvoton.com, KWLIU@nuvoton.com, bence98@sch.bme.hu, arnd@arndb.de,
 sven@svenpeter.dev,
 Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 robh+dt@kernel.org, Avi.Fishman@nuvoton.com, andriy.shevchenko@linux.intel.com,
 semen.protsenko@linaro.org, jie.deng@intel.com, avifishman70@gmail.com,
 venture@google.com, yangyicong@hisilicon.com, linux-kernel@vger.kernel.org,
 wsa@kernel.org, kfting@nuvoton.com, tali.perry@nuvoton.com, olof@lixom.net
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--BFV9RJgjJXy7GXVr
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 22, 2022 at 10:15:04AM +0800, Tyrone Ting wrote:
> Hi Jonathan:
>=20
> Thank you for your comments and please find my reply next to your comment=
s.
>=20
> Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net> =E6=96=BC 2022=E5=B9=B42=
=E6=9C=8821=E6=97=A5 =E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=887:49=E5=AF=AB=E9=
=81=93=EF=BC=9A
> >
> > On Sun, Feb 20, 2022 at 11:53:15AM +0800, Tyrone Ting wrote:
> > > From: Tali Perry <tali.perry1@gmail.com>
> > >
> > > Remove unused npcm750-clk node.
> >
> > You're not actually removing a node, for example in the sense of removi=
ng a
> > devicetree node from a devicetree.
> >
> > So, I think "Remove unused variable clk_regmap." would be a better
> > description.
> >
>=20
> May I modify the description according to your input and attach
> "Reviewed-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>"
> onto this commit in the next version of the patch set?

Yes!


Jonathan

--BFV9RJgjJXy7GXVr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEvHAHGBBjQPVy+qvDCDBEmo7zX9sFAmIVCBgACgkQCDBEmo7z
X9vfqA//UCqVrHlOZvzDu7L0EyOn3evdp8KqQUPYp/8FSJD0Cb/Ak6HAByo7g0F3
wss1Xu7kJvV5YDYJn92mCS6oyLH4av/702Ej4s6bfw5UudeW+Fe4tXiumerPTP+d
0Af6kNPoVAv/JPxLzLaWOcuPqvQ7mSI/dXkJ67YjdPZ9K1uI3tOcP77Us864kBxh
0BKcaDzcyuSeZXcw3fNMFj/wJAjemU3poSHsO6iiHaqJIb2BXQohyT8D+vX/VAVz
RP3LJVsJWZDHbvXtjlKpXiCOEc3u7URTMaKCCqnGR5hUW+groLKqiWI4iltMk9eh
M0OOi2PF9imId4UWTikbd6cB/0n/XUqQ5Cz3AF698sYiU/VVtsrEtekjH3Cabhj8
j2kbzkPwPV0xSqeKrQohj7ARPsppynPxdoNUCQ3ebV0zBNxwqYQ1zXqtNj75nB/S
ixt5cjacJ8/PW/3UYfBcvu2+gN3lVrILRi+nq584LI73NXOh0RHNlNI8qDaNB+MO
waBjT0bk5BrgNTV8LO6xKtvOEMHQiccqzqGU7EouAm+qeu8gj/TibSK+T2mandcO
17Wy6HHAZlwtGI/hSnlbTRF/+0y1RcRTQZ13iIPbiXU6QsFAEfDolgvDnHFTlwA4
FbqAG/lIgWA5PtPerENLQkRH2mcoth8gFNZEO/CkVpQhr8g5vNs=
=aOOj
-----END PGP SIGNATURE-----

--BFV9RJgjJXy7GXVr--
