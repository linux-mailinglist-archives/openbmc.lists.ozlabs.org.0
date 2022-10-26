Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E518D60E823
	for <lists+openbmc@lfdr.de>; Wed, 26 Oct 2022 21:03:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MyJ9Z63J2z3brJ
	for <lists+openbmc@lfdr.de>; Thu, 27 Oct 2022 06:03:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=CU9aoRRO;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=collabora.com (client-ip=46.235.227.172; helo=madras.collabora.co.uk; envelope-from=nicolas.dufresne@collabora.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=CU9aoRRO;
	dkim-atps=neutral
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MyJ8s2Gt0z30MT;
	Thu, 27 Oct 2022 06:02:37 +1100 (AEDT)
Received: from nicolas-tpx395.localdomain (192-222-136-102.qc.cable.ebox.net [192.222.136.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 355D1660238E;
	Wed, 26 Oct 2022 20:02:22 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1666810944;
	bh=hAnnqhU56lH8Vk85cdRoCxfbM5AG4OzZQZbMnMwTO9g=;
	h=Subject:From:To:Date:In-Reply-To:References:From;
	b=CU9aoRRO3PJ36AjirUZW1W0uIypmEU+vhtGIbgRjWi9mL+VuysWMAD6KYR8XF5LeG
	 JN1lm3pDv5V9MH3OaF8ZRVyNc5TjnWrlZ5F+F8jq21FZJ0oF44VHRFzuc6SbnCy1B4
	 g2HVGfN7UcAbOS9sePF2iOBlFIVC8sT6hjlUJJCg+Uc+z0mP8QiDauMpHI8rFaChv8
	 ICvMxugpYon57LfQnF74DNcCJ47GLRej5rgw4mM+OKXS3fxUiuSXiLS/9AqyFbN7kW
	 Xp5kj7QymrMX6HqTD73qh5I8NvfWMao1cOBQtdoS/Z3voPOdop24mR39KOYpC5xGZ0
	 tQXub7eKvzz0w==
Message-ID: <4e3a4e1961afa77b5658357cc7fa0f289c7409fe.camel@collabora.com>
Subject: Re: [PATCH v10 3/5] media: Documentation: aspeed-video: Add user
 documentation for the aspeed-video driver
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Jammy Huang <jammy_huang@aspeedtech.com>, eajames@linux.ibm.com, 
 mchehab@kernel.org, joel@jms.id.au, andrew@aj.id.au,
 hverkuil-cisco@xs4all.nl,  laurent.pinchart@ideasonboard.com,
 xavier.roumegue@oss.nxp.com,  ezequiel@vanguardiasur.com.ar,
 stanimir.varbanov@linaro.org,  sakari.ailus@linux.intel.com,
 ming.qian@nxp.com, andrzej.p@collabora.com,  linux-media@vger.kernel.org,
 openbmc@lists.ozlabs.org,  linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org,  linux-kernel@vger.kernel.org
Date: Wed, 26 Oct 2022 15:02:13 -0400
In-Reply-To: <22c85f42-a4d7-c6cc-5f1e-346c88c29dc5@aspeedtech.com>
References: <20221025090203.5623-1-jammy_huang@aspeedtech.com>
	 <20221025090203.5623-4-jammy_huang@aspeedtech.com>
	 <8a8f7c818688bda7c75d2f4fb5f8f0d6f89cb965.camel@collabora.com>
	 <22c85f42-a4d7-c6cc-5f1e-346c88c29dc5@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36) 
MIME-Version: 1.0
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Le mercredi 26 octobre 2022 =C3=A0 10:42 +0800, Jammy Huang a =C3=A9crit=C2=
=A0:
> Hi Nicolas,
>=20
> Thanks for your comments.
>=20
> On 2022/10/25 =E4=B8=8B=E5=8D=88 09:18, Nicolas Dufresne wrote:
> > Hi Jammy,
> >=20
> > thanks for the addition.
> >=20
> > Le mardi 25 octobre 2022 =C3=A0 17:02 +0800, Jammy Huang a =C3=A9crit=
=C2=A0:
> > > Add user documentation for the aspeed-video driver.
> > >=20
> > > Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
> > > ---
> > > v10:
> > >    - new
> > > ---
> > >   .../media/drivers/aspeed-video.rst            | 61 ++++++++++++++++=
+++
> > >   .../userspace-api/media/drivers/index.rst     |  1 +
> > >   2 files changed, 62 insertions(+)
> > >   create mode 100644 Documentation/userspace-api/media/drivers/aspeed=
-video.rst
> > >=20
> > > diff --git a/Documentation/userspace-api/media/drivers/aspeed-video.r=
st b/Documentation/userspace-api/media/drivers/aspeed-video.rst
> > > new file mode 100644
> > > index 000000000000..798a2588b175
> > > --- /dev/null
> > > +++ b/Documentation/userspace-api/media/drivers/aspeed-video.rst
> > > @@ -0,0 +1,61 @@
> > > +.. SPDX-License-Identifier: GPL-2.0
> > > +
> > > +.. include:: <isonum.txt>
> > > +
> > > +ASPEED video driver
> > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > +
> > > +ASPEED Video Engine found on AST2400/2500/2600 SoC supports high per=
formance
> > > +video compressions with a wide range of video quality and compressio=
n ratio
> > > +options. The adopted compressing algorithm is a modified JPEG algori=
thm.
> > > +
> > > +There are 2 types of compressions in this IP.
> > > +
> > > +* JPEG JFIF standard mode: for single frame and management compressi=
on
> > > +* ASPEED proprietary mode: for multi-frame and differential compress=
ion.
> > > +  Support 2-pass (high quality) video compression scheme (Patent pen=
ding by
> > > +  ASPEED). Provide visually lossless video compression quality or to=
 reduce
> > > +  the network average loading under intranet KVM applications.
> > I think some of the information disclosed in the following quote could =
be
> > summarized. Notably the part about the extra buffers.
> >=20
> >     Aspeed JPEG Format requires an additional buffer, called bcd, to st=
ore
> >     the information about which macro block in the new frame is differe=
nt
> >     from the previous one.
> >    =20
> >     To have bcd correctly working, we need to swap the buffers for src0=
/1 to
> >     make src1 refer to previous frame and src0 to the coming new frame.
> >    =20
> > But before I push you this route, have you considered using a dedicated=
 pixel
> > format instead ? Here's my thinking, the output of the JPEG encoder is =
no longer
> > "compatible" (or at least won't yield the expected images) if used with=
 a normal
> > JPEG decoder. By differentiating these two as dedicated formats, you wi=
ll only need
> > 1 vendor control, and you avoid the potential risk of software bugs mix=
ing them up.
> > Also note that there is other JPEG based vendor formats that exist in V=
4L2.
> >=20
> > Let me know what do you think ?
>=20
> Yes, I also add a dedicated formats, V4L2_PIX_FMT_AJPG, in this series.=
=20
> In [PATCH v10 1/5]
>=20
> media: v4l: Add definition for the Aspeed JPEG format, I add the=20
> description in pixfmt-reserved.rst.
>=20
> After this series applied, the users can choose either of these two=20
> formats by VIDIOC_S_FMT as
>=20
> per their preference.

Sorry about that, I have skipped too much. The approach seems fair then, ca=
n you
state in the doc that these control applies to V4L2_PIX_FMT_AJPG in some wa=
y ?
(just a little cross-reference can help). The confusion with normal JPEG is
easy.

thanks for you patience,
Nicolas

>=20
> >=20
> > Nicolas
> >=20
> > > +
> > > +More details on the ASPEED video hardware operations can be found in
> > > +*chapter 6.2.16 KVM Video Driver* of SDK_User_Guide which available =
on
> > > +AspeedTech-BMC/openbmc/releases.
> > > +
> > > +The ASPEED video driver implements the following driver-specific con=
trol:
> > > +
> > > +``V4L2_CID_ASPEED_HQ_MODE``
> > > +-------------------------------
> > > +    Enable/Disable ASPEED's High quality mode. This is a private con=
trol
> > > +    that can be used to enable high quality for aspeed proprietary m=
ode.
> > > +
> > > +.. flat-table::
> > > +    :header-rows:  0
> > > +    :stub-columns: 0
> > > +    :widths:       1 4
> > > +
> > > +    * - ``(0)``
> > > +      - ASPEED HQ mode is disabled.
> > > +    * - ``(1)``
> > > +      - ASPEED HQ mode is enabled.
> > > +
> > > +``V4L2_CID_ASPEED_HQ_JPEG_QUALITY``
> > > +-------------------------------
> > > +    Define the quality of ASPEED's High quality mode. This is a priv=
ate control
> > > +    that can be used to decide compression quality if High quality m=
ode enabled
> > > +    . Higher the value, better the quality and bigger the size.
> > > +
> > > +.. flat-table::
> > > +    :header-rows:  0
> > > +    :stub-columns: 0
> > > +    :widths:       1 4
> > > +
> > > +    * - ``(1)``
> > > +      - minimum
> > > +    * - ``(12)``
> > > +      - maximum
> > > +    * - ``(1)``
> > > +      - step
> > > +    * - ``(1)``
> > > +      - default
> > > +
> > > +**Copyright** |copy| 2022 ASPEED Technology Inc.
> > > diff --git a/Documentation/userspace-api/media/drivers/index.rst b/Do=
cumentation/userspace-api/media/drivers/index.rst
> > > index 32f82aed47d9..46a494e00b72 100644
> > > --- a/Documentation/userspace-api/media/drivers/index.rst
> > > +++ b/Documentation/userspace-api/media/drivers/index.rst
> > > @@ -31,6 +31,7 @@ For more details see the file COPYING in the source=
 distribution of Linux.
> > >   	:maxdepth: 5
> > >   	:numbered:
> > >  =20
> > > +	aspeed-video
> > >   	ccs
> > >   	cx2341x-uapi
> > >   	dw100
>=20

