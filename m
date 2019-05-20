Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A31F2299B
	for <lists+openbmc@lfdr.de>; Mon, 20 May 2019 02:57:25 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 456gTr6zRWzDqHX
	for <lists+openbmc@lfdr.de>; Mon, 20 May 2019 10:57:20 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.27; helo=out3-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="aFx5ZxSs"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="vctxmIpM"; dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 456gTF3CV0zDqH2
 for <openbmc@lists.ozlabs.org>; Mon, 20 May 2019 10:56:48 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id D66BB22616;
 Sun, 19 May 2019 20:56:44 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Sun, 19 May 2019 20:56:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type:content-transfer-encoding; s=fm2; bh=0f/8Z
 B1hn7qwuHg5MgozKQdNFXf5lSHBAcpvTflQ9ZI=; b=aFx5ZxSsWHvrBA9cX6P4T
 lCJkn/0opcA1SHz57nLZtf3Fyhg1w8cKvE+Q4Rm1mF7APmt56BtnhzJUp/S0080i
 WCPSA5YbL5b/zzcaM2LF9y64StvRvMcAnNz9GQiuYtVlR+CVyoR6hQMdQDcoHgeC
 oTnwNgnsLPfpm5LhDOAUb3BNhbTWV9oW5wwTHxRSVfWyK5Czqusoho7N1OKJKZFx
 jVRHGoEkzkk7XeY6EGd+Fzt6rGR0jqwB+Rd2u3r5FVVcggEGcvF98KYf/7nCs9Af
 pSlfa0h0Upd3LDviLle32OcUCtBYMI5z6UJ434aMuQyIHxKYoL2xBCrCmeK1Q7Ii
 w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=0f/8ZB1hn7qwuHg5MgozKQdNFXf5lSHBAcpvTflQ9
 ZI=; b=vctxmIpMIFsUA4CPmHXex/G253hYqZmipwDmytsx9FPRYbp+bSi07hZSX
 mImXI9knMYWOVey6TFaISiO72J5B0AeKK2uNLSrwSmpEqaT3xaI+eQfFTbQ5gKuN
 sri2+mmq7KgPMwnqPa9ns3b/8/6vsfxclL4hfiB1xJNwIUJarMABxchWZjELNQ5h
 oeuoaj4VkMKM9rRgNLYtAwNBj6e/qbTyTfY1/Q/t12vGm6AcPutRkbYpi++ZBxdw
 V4BR538zaUoBq7eCXBTvEJs+IiHPars5dFHxPBiqS+kX/xktcgaM+zxwW0os9tal
 fPQnabSaUbHAFhLU0yXbnBLrrhA9w==
X-ME-Sender: <xms:S_vhXEW7H6Y9JFHCvBlp659hbnlzTZ8v0WmBWrUEWC37Z8OPRE-SPQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddruddtjedggedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgfgsehtqhertderreejnecuhfhrohhmpedftehn
 ughrvgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucffoh
 hmrghinhepghhithhhuhgsrdgtohhmnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgu
 rhgvfiesrghjrdhiugdrrghunecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:S_vhXDSvQIwx5wJkT4qe8Ovmn0Lm8Yc1JbQldUV17-6QKofLlgsgMA>
 <xmx:S_vhXMbTrRLuc9OLYXwTic2SnaU6oXWefJUISJPq0UNRvFSHo86A3g>
 <xmx:S_vhXEBba0vAe2T-mUZRGYpQvXBJi6hxmwc3qDvWG-EJHbk7y_Eu-A>
 <xmx:TPvhXAxKv4OlnkQxQAQk-j6tcj6wWQoynaS-ChlC7F6JUFyC9yJh5g>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 22A6B7C390; Sun, 19 May 2019 20:56:43 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-549-ge400f56-fmstable-20190516v3
Mime-Version: 1.0
Message-Id: <10007aac-28a5-47d7-be66-a8f9cd4941b1@www.fastmail.com>
In-Reply-To: <f1bb8a3f-7e98-7b13-2ccc-1b58262e9bde@kaod.org>
References: <20190516161148.31062-1-clg@kaod.org>
 <005d7fc6-ce77-4209-b37e-5aaefb066ebf@www.fastmail.com>
 <f1bb8a3f-7e98-7b13-2ccc-1b58262e9bde@kaod.org>
Date: Mon, 20 May 2019 10:26:42 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, openbmc@lists.ozlabs.org
Subject: =?UTF-8?Q?Re:_[PATCH_qemu]_aspeed:_add_support_for_a_witherspoon-bmc_boa?=
 =?UTF-8?Q?rd_with_128MB_flash_chip?=
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Adriana Kobylak <anoo@us.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Fri, 17 May 2019, at 15:56, C=C3=A9dric Le Goater wrote:
> On 5/17/19 1:00 AM, Andrew Jeffery wrote:
> >=20
> >=20
> > On Fri, 17 May 2019, at 01:42, C=C3=A9dric Le Goater wrote:
> >> Some Witherspoon boards are shipped with a mt25ql01g flash chip
> >> holding the BMC firmware.
> >>
> >> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> >=20
> > "witherspoon128-bmc" is not very creative, but I can't blame you for=
 that :D
>=20
> he.=20
>=20
> Should we introduce a machine option to set the model name of the=20
> FMC flash chip ? I think I tried that in the past but at the block
> level and mainline did not like it. But we could try at the machine
> level.
>=20
> Anyhow, it's a good way to debug flash issues on real HW.

Eh. I'm not fussed by a new machine. I wouldn't do anything for the mome=
nt.

> =20
>=20
> > Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
> >=20
> >> ---
> >>
> >>  It helps in tracking https://github.com/openbmc/u-boot/issues/18
> >>
> >>  hw/arm/aspeed.c | 11 +++++++++++
> >>  1 file changed, 11 insertions(+)
> >>
> >> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> >> index efc97df00de0..f26215ab5524 100644
> >> --- a/hw/arm/aspeed.c
> >> +++ b/hw/arm/aspeed.c
> >> @@ -441,6 +441,17 @@ static const AspeedBoardConfig aspeed_boards[]=
 =3D {
> >>          .i2c_init  =3D witherspoon_bmc_i2c_init,
> >>          .ram       =3D 512 * MiB,
> >>          .num_cpus  =3D 1,
> >> +     }, {
> >> +        .name      =3D MACHINE_TYPE_NAME("witherspoon128-bmc"),
> >> +        .desc      =3D "OpenPOWER Witherspoon128 BMC (ARM1176)",
> >> +        .soc_name  =3D "ast2500-a1",
> >> +        .hw_strap1 =3D WITHERSPOON_BMC_HW_STRAP1,
> >> +        .fmc_model =3D "mt25ql01g",
> >> +        .spi_model =3D "mx66l1g45g",
> >> +        .num_cs    =3D 2,
> >> +        .i2c_init  =3D witherspoon_bmc_i2c_init,
> >> +        .ram       =3D 512 * MiB,
> >> +        .num_cpus  =3D 1,
> >>      }, {
> >>          .name      =3D MACHINE_TYPE_NAME("ast2600-evb"),
> >>          .desc      =3D "Aspeed AST2600 EVB (Cortex A7)",
> >> --=20
> >> 2.20.1
> >>
> >>
>=20
>
