Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DF88552D038
	for <lists+openbmc@lfdr.de>; Thu, 19 May 2022 12:13:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L3lzw02JXz30QB
	for <lists+openbmc@lfdr.de>; Thu, 19 May 2022 20:13:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=Wym7vJ+4;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net
 (client-ip=212.227.15.15; helo=mout.gmx.net;
 envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256
 header.s=badeba3b8450 header.b=Wym7vJ+4; 
 dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L3lzQ29Mzz305T
 for <openbmc@lists.ozlabs.org>; Thu, 19 May 2022 20:12:48 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1652955149;
 bh=OPdP5IIMcN9fBxqMri4kI953iSbKa5P+IdL25Vzrksc=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
 b=Wym7vJ+4MH8ZqHKuSB8e8hDDvFm8IeDztTxsz8DMGmFK2VZ72EV7FLuQxAiQBBcrP
 PM7Kp30BM4IPHM9b4ynQb4GTDOg1IeypiCfsNYFlm78nf5wJkitBKaj8c3l4iZ5r+K
 Sv1iCR8kc6t7BpXW6ZNnX6ZDZQC0b2/ScvNRF+9c=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([5.146.195.3]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MAfYw-1o2ehh2Bjc-00B7l7; Thu, 19
 May 2022 12:12:29 +0200
Date: Thu, 19 May 2022 12:12:28 +0200
From: Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: Kun-Fa Lin <milkfafa@gmail.com>
Subject: Re: [PATCH v2 5/5] drivers: media: platform: Add NPCM Video
 Capture/Encode Engine driver
Message-ID: <YoYYDPHPjSUefbAg@latitude>
References: <20220513033450.7038-1-kflin@nuvoton.com>
 <20220513033450.7038-6-kflin@nuvoton.com>
 <YoOje2L13q7d7KeI@latitude>
 <CADnNmFoa6=BWs74oQxEtP4TO-mL_vc0py4+4V1wjdtetW4Vy5w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="OETo/OdLKGpLORLY"
Content-Disposition: inline
In-Reply-To: <CADnNmFoa6=BWs74oQxEtP4TO-mL_vc0py4+4V1wjdtetW4Vy5w@mail.gmail.com>
X-Provags-ID: V03:K1:GXL75oMM104pMaA0156vPkd1685uZ4OdSHAyF6TOOXcGi7Facg+
 KHVn2WswayORkpSpMAFN8jqdA0HJKNToBwaxjqib46spLsHHwBaTZ+2xbBxAVg8lL5CN9zz
 4X1EAyLHY6IP1J8+ntwdBiXSJKl3AiwQDVoAi10ZiHq7mxphyAHGYDyoMl90WHJ3ZvstMxl
 +cZz+bfsSUxCFNxcMyY8A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:oM9aJgrAhB0=:iMl4+K42OCw82rNHjDHRgl
 wqftQnjGOzcNaCpejU3YcQ0eVcXInRg7Z9UMU9tBm0jT/8L4lo1zFcVXoa3e/X2zX8nD7se85
 z6QUW0JTrUKDgVI9c8FyBdbeIxSd5BcgSv2CaCjf7JynCb6KGLsG0kex0j5vX3iN6LhEbrGNS
 vjTsWRlSPN2H3UvMDg2leY+V5+1EzJeFhSTUlfWrghr/s8XzA6tTHLvV0ZGd+8UhQS6TEi0Q/
 d230vT4/T+wK/kRVG/VRLXTZMQGsAUkqL65FvYazqQHE7DvN/IkIaAxTqvzbtjL25BT2KScml
 PduJGLMKO5NcmuHoYjyVKZ3NjQs9WYSY52hYZDvnhF2sftD2gragCnMpVVUA/CsHtZFu17RHL
 ztQCscTZRjEX+wMpxFL+7d/lU00vkW9zlJUKop+KWMOZXtRBu8S/8ZGnsu/xmh2IYWE06qM1E
 rq3vXx1RQvZxTc5lgqi2ctLbxFPGv/NmCOkdhlVLIQtVRUgQbAciEnmmwwJwZMqkHK5dADENy
 PRXWDJCqvIwiH0hV9YWdaiFP9zC/QeF+w0s87eA4Cr/zA4+6WqqZxbZPOnX7drSx0aT1h95qp
 KkayoIzb+bXnwBy0izbbejPMVQQnRKK3+ViFbnoBYd+X6iDK+X9ZGGTmLBh/eo31ElAVi3BgM
 Kz/hOODSRrBuSVruiwq5vFQA6TEVUMCPnt0NESYGPO2BCE+SqeMS8BYZjW1KfKzD3qEr1ZPTb
 DGu+Po7Le+QpACbQJgbbYGr3Q4FKsivpgpYWMbC1jVLOhA8K4Y4ljknmfUrUvF+49FU0aIt1P
 xZOZXVOyFNKtscQ4fSEwIcLt2K1lR1cX0ZUzeUj0JWLGdLndDRm9piqe9Irv6Jiz7N9ZfA6Iy
 9ZB2RkWyIeJARPgmLAKZaYbMs7MWO9hmgC/6grFOUtEk829NeEmAEZ64C2+Lz7aO5ww7KY3HY
 4JjgXeh4jw9ma+iAKOFV5QuV+rnYwGNevkkEB8x5SIJu1Rq6TjFOrDgHKt01ax025Yw9T5cxP
 32eg9WxIinsLB7JZDEq6P0SfMgEyJOfcHiPyNohTPyfjsXyoMcUnqkzq1NwYpx8cMadyY34O4
 d2StwsxLCB9ztJCg8+XdSX9Vor35/97sxVelCfWmDj4YohXihIxCNiedw==
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
Cc: CS20 KWLiu <kwliu@nuvoton.com>, tali.perry1@gmail.com, tmaimon77@gmail.com,
 avifishman70@gmail.com, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 mchehab@kernel.org, Marvin Lin <kflin@nuvoton.com>,
 linux-media@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--OETo/OdLKGpLORLY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Marvin,

On Thu, May 19, 2022 at 01:39:01PM +0800, Kun-Fa Lin wrote:
[...]
> In this architecture, for the case of WPCM450 (though it's in EOL for
> several years), I'd prefer to try to let ECE be an optional node
> instead of separating ECE code from this V4L2 video driver. However,
> this patch series could be the base version and keep reviewing, and
> afterwards we could make another patch for optional ECE, is it OK for
> you?

That's OK for me.

I will wait until the driver is ready and merged, and then start working
on WPCM450 integration and making ECE optional.

Regarding WPCM450 being EOL, I'm aware, and I don't want to hold up your
team's work on newer SoCs. But I personally find this old SoC interesting
and I want to share driver code with newer SoCs where possible.


Thank you,
Jonathan

--OETo/OdLKGpLORLY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEvHAHGBBjQPVy+qvDCDBEmo7zX9sFAmKGF+QACgkQCDBEmo7z
X9t0LRAAranUgQMvjypAouXTtgrde1IicjtSlp9n9g9lrRSuwJ3SPyYfI1OCr7Ac
shd7clvanfcZq0Ti//rGDn+DnYsLv5OVWpUKx8mKBLtiRkmDl8DIcvupdDQPqrux
7BPO9DLkj4QpgHym+4/2PLffEXVNkjpaf8uxRCnGmMrkMCgtaJSU+0f4txR+P5dF
vKOfp0mz/VJfoX4zMSGqjd1WbStTTHAhx07XOOZtzmuoxkTIfrQNZoo77KBb4Wzk
gqXIAGJhO/MOoJ4npzJeR2aKALVjGk48Xq1nxQDAFYnf4AkV1BW3LsbGWT3nt0hN
suMVMqLhAeSFP6pH1vxSw0u5VZJ5NPXM6Brwp1q9caV4kL+GZuguutKBEWVXodrT
JuOLz05JSp2osTS4029je9dXmF9IFoIAKFR7DpMERgAAekim0tBlllO2ITbuu6Dh
bd1VKO6RKJgaf3UOzJ7iTh+wkyc+HHnc+6KUgas7J//ThY+6w1tRK2y1Zl+1h3fc
3pdRUOSvFM2aDo3+Mx33LAK85tI19o09cn2PirukmmOLh4C2FDg11ByZkS9pDq+H
HXMXvB0O4UHhwYPN/XN/4mgYgA4CuRDuj+MGgnCYy7x/AZ5AVHC4Eg3MlFBCpyaJ
d7jL9dW/xxUv6zlW3vvTFLpWjPL9+6dxK8WN8knFmsoPJfsNSWM=
=DvvF
-----END PGP SIGNATURE-----

--OETo/OdLKGpLORLY--
