Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02C7B478346
	for <lists+openbmc@lfdr.de>; Fri, 17 Dec 2021 03:41:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JFYCQ64DLz3cQc
	for <lists+openbmc@lfdr.de>; Fri, 17 Dec 2021 13:41:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=konsulko.com header.i=@konsulko.com header.a=rsa-sha256 header.s=google header.b=BV8ZmG+7;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=konsulko.com (client-ip=2607:f8b0:4864:20::730;
 helo=mail-qk1-x730.google.com; envelope-from=trini@konsulko.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=konsulko.com header.i=@konsulko.com header.a=rsa-sha256
 header.s=google header.b=BV8ZmG+7; dkim-atps=neutral
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com
 [IPv6:2607:f8b0:4864:20::730])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JDbBY1xd1z2ywF
 for <openbmc@lists.ozlabs.org>; Thu, 16 Dec 2021 00:07:32 +1100 (AEDT)
Received: by mail-qk1-x730.google.com with SMTP id p4so19861984qkm.7
 for <openbmc@lists.ozlabs.org>; Wed, 15 Dec 2021 05:07:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=u6EMw5ZGSr/ajzPY03HQykOPIlGoocjc13pH6VrRZjk=;
 b=BV8ZmG+7dJKebAFsIyM2oD9WjsIdzaEGzv7hfM5/4JmkjotbHu6HxxdMZ6hS4Gu98G
 c0v53jwTkEtwkhZNf6AOk+6A75ikwj5rrfeIAQRQtkMRvLHg8Pi/e3+YZSfq7yp00CIc
 OIiQp7MaY+oYQ9GQ820aKzB++db2a1/W9LjFM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=u6EMw5ZGSr/ajzPY03HQykOPIlGoocjc13pH6VrRZjk=;
 b=NclStAiQvSWachTtjcIz72ZwP9i8r5SxxTVxJmIYHnWfkkiqI/pneJ9bMSHwAkqVDG
 dksfCJd0OmjHNtiD7o8XUVuoUImcITdh+QRaMIb0/noDudsaOxs1MoYYI8UtnIek6SMm
 p1UZi0rgFfaDsB8oecnVtMc7i075PBnUl6Fphdgek1N8tyE6lBBP65nA5POS0sP5GYh3
 SUoUIOjRDUU4sp8x0QWTZRd3vLsAiCZBlUdX0R1xXwBGEddUkEt5s0Mn3Tp7Znh92R7R
 UWTIXmPoj3wQovHC7cSVWTCkLXQsIw7YTtxO9aPsJRwi6y4gssrAAXnEUWUVRC2OBL/2
 O5aA==
X-Gm-Message-State: AOAM5311ZZ13euAC6ceVTpgTbF9shDVMuW8J6OfNh0l5HT5pqfOcKSLG
 PH5kjpOOrriqFmOzPMDuWBLPpQ==
X-Google-Smtp-Source: ABdhPJwzbKQcRQgC3V43AB8YkYvGGlL0eBX6Eh6SI3YNXVExkNuWFISgLBEdpk5JLMtNjUiXGT1MvQ==
X-Received: by 2002:a05:620a:2955:: with SMTP id
 n21mr8185966qkp.641.1639573647339; 
 Wed, 15 Dec 2021 05:07:27 -0800 (PST)
Received: from bill-the-cat
 (2603-6081-7b01-cbda-b008-f6f1-3496-c51e.res6.spectrum.com.
 [2603:6081:7b01:cbda:b008:f6f1:3496:c51e])
 by smtp.gmail.com with ESMTPSA id q11sm1404513qtw.26.2021.12.15.05.07.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 05:07:26 -0800 (PST)
Date: Wed, 15 Dec 2021 08:07:23 -0500
From: Tom Rini <trini@konsulko.com>
To: Stanley Chu <stanley.chuys@gmail.com>
Subject: Re: [PATCH v1 8/9] ARM: dts: Add Nuvoton NPCM845 device tree
Message-ID: <20211215130723.GW2773246@bill-the-cat>
References: <20211215025800.26918-1-yschu@nuvoton.com>
 <20211215025800.26918-9-yschu@nuvoton.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="R6sEYoIZpp9JErk7"
Content-Disposition: inline
In-Reply-To: <20211215025800.26918-9-yschu@nuvoton.com>
X-Clacks-Overhead: GNU Terry Pratchett
X-Mailman-Approved-At: Fri, 17 Dec 2021 13:39:52 +1100
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
Cc: festevam@denx.de, tmaimon77@gmail.com, narmstrong@baylibre.com,
 lokeshvutla@ti.com, hannes.schmelzer@br-automation.com, lukma@denx.de,
 u-boot@lists.denx.de, sr@denx.de, michal.simek@xilinx.com,
 kettenis@openbsd.org, harm.berntsen@nedap.com, dsankouski@gmail.com,
 openbmc@lists.ozlabs.org, weijie.gao@mediatek.com,
 sebastian.reichel@collabora.com, ctcchien@nuvoton.com, pbrobinson@gmail.com,
 hs@denx.de, jagan@amarulasolutions.com, kwliu@nuvoton.com, yschu@nuvoton.com,
 stephan@gerhold.net, andre.przywara@arm.com, tharvey@gateworks.com,
 vabhav.sharma@nxp.com, fangyuanseu@gmail.com, seanga2@gmail.com,
 patrick@blueri.se, avifishman70@gmail.com, sjg@chromium.org,
 samuel@sholland.org, christianshewitt@gmail.com, mr.bossman075@gmail.com,
 giulio.benetti@benettiengineering.com, bmeng.cn@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--R6sEYoIZpp9JErk7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 15, 2021 at 10:57:59AM +0800, Stanley Chu wrote:

> Add a common device tree for all Nuvoton NPCM8xx BMCs and a board
> specific device tree for the NPCM845(Arbel) evaluation board.
>=20
> Signed-off-by: Stanley Chu <yschu@nuvoton.com>

Which Linux kernel release are these from?  Thanks!

--=20
Tom

--R6sEYoIZpp9JErk7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmG56IcACgkQFHw5/5Y0
tyz9KQwAhTVrgjHfrjQeeTOES7xkQZ5wGTmXPAICpp2aCmQ7YpeZlN330NZzoNlP
U10R1kSQuM6CNgGz1Ps+OqD4jQzMA3/4YbhtG4ayQPQ/CFWiUCU0Ey2wSucgG5mE
lab8nlgpsBs4qndnkXhzkDWulO52TeqiKg5hc5wGRsLAqgk2CBlyx9ffqYLb1ka1
tVX+XD6XR/xEVrRFYBw+3EckL9KnA10GNa0uK5F/zD+aXYO3/5SOo+LJ6yDEr6Mc
iw35GErFZoGQNsXU4zasPArAnd2E3XMPv7XwR4PQtR5ybdUwZul5cZAxJCiH8flC
d0KwM0MxCDsbZJrB1Me7cTKhXjaGu96ZpwUina0fShc6+6hyZzfKL/j1mwe4l+do
Zll27Rc0uRBpx7gz+SZEDCfngiP8XoVyzOUBk+xen0NyPpqHlXeQu0oV/Cdz2Hok
TadLO1HQ1f4mf3fRQlqp0QUaZkWDDrn0iBAiv1Z1ZUliOxzTy+fXFr1k1yXllc5W
4p6qBlgJ
=/lqB
-----END PGP SIGNATURE-----

--R6sEYoIZpp9JErk7--
