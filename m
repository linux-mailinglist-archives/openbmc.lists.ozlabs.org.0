Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AC5B2210DD
	for <lists+openbmc@lfdr.de>; Fri, 17 May 2019 01:01:39 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 454n3g3z9qzDqRZ
	for <lists+openbmc@lfdr.de>; Fri, 17 May 2019 09:01:35 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="EJd0ZG2q"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="HJW+jbQy"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 454n323NQgzDqNK
 for <openbmc@lists.ozlabs.org>; Fri, 17 May 2019 09:01:01 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id A698F24E0E;
 Thu, 16 May 2019 19:00:57 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Thu, 16 May 2019 19:00:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type:content-transfer-encoding; s=fm2; bh=i+rmg
 fvInPFuvlBIzJOy3k/XeAcHRSbLvL4msZ6husE=; b=EJd0ZG2qb49551ynsCRsT
 3d6rcjtbBdQf6OlbvwhbX76YUOwxE22ld1uVbuzCtxfdJ2flNd0L2W/eCXuFIBlo
 gYUeeNX4h5dbaafeKFMVn+wMDuFjivck2M038YKexUXjTj37tR6WItTz1l3jdYyY
 xqBnj2ehQOcuu+cJPG4Ip+Ev13fWjhYyyNbDcvJQTL4JI1WBNPPFK/2tIb8GYW9C
 DF3jBxOcplPaFnJU+XNI0QzF3B0PF9WxRXEKHWG2uPup/ypcXQAvFKtIcxuPI4Zq
 59XqctLZTn1xGz3s4KCetlUVkizYqxx/fv/OHS+RgjNLA+sUkqa/w64wp31AvpbE
 w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=i+rmgfvInPFuvlBIzJOy3k/XeAcHRSbLvL4msZ6hu
 sE=; b=HJW+jbQyw2HKtLsm6Ji2lZWVYFv8td+QNFmIKigjnsRwze1wVOe/OnNYp
 USvENIFwg6/cqyxRQg2qTRoEJ/pYM7WS+yKufyMTRt132WIU1xJb7EVCh1eY8jL6
 X2rZX6rf5sJbAiUmNs5nWCQ9rpLPoDGpVBa0J3vIEN46R//0Y1LDYKseofJv5MoR
 Y08s6zikfs9QB0jSgkyDna7+yeehhf2rKH+OkvTNZVXdoe5NIhNcAGDMSGpQZqAR
 KQ1ct2poa8BrIq4V8QzdmByryaHEF3Fsfdn2gMTmUMfL96bZ16Qi4JhJCcJGHl+x
 PPWs0T5LNe7OUgpcQnYHItbWcBGSg==
X-ME-Sender: <xms:qOvdXIpdHnSFBBOmSWpJu8xBJQ9HZpNQY6-DevAq-A_J_GHrVHQzZg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddruddtuddgudejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgfgsehtqhertderreejnecuhfhrohhmpedftehn
 ughrvgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucffoh
 hmrghinhepghhithhhuhgsrdgtohhmnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgu
 rhgvfiesrghjrdhiugdrrghunecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:qOvdXAvW4MxwWgeLM-XmDNhTE08ClQXbXIyUUcdXIXMv4LN-m0dhcg>
 <xmx:qOvdXHRMmIs-EXeazPFyJLqBoUcZ-B5uhr7_KcUmancECQfGZf3jSQ>
 <xmx:qOvdXKmwIV2zOWoIc3LGsb3kf2tDOHiPe01I_xT6SsAFfNvAuQYkFA>
 <xmx:qevdXGQcMGFZom1rdiDbza_6xbBrhb5O4wD1ntp_wFCy_fFugCFxWA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 788387C3E9; Thu, 16 May 2019 19:00:56 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-549-ge400f56-fmstable-20190516v3
Mime-Version: 1.0
Message-Id: <005d7fc6-ce77-4209-b37e-5aaefb066ebf@www.fastmail.com>
In-Reply-To: <20190516161148.31062-1-clg@kaod.org>
References: <20190516161148.31062-1-clg@kaod.org>
Date: Fri, 17 May 2019 08:30:47 +0930
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



On Fri, 17 May 2019, at 01:42, C=C3=A9dric Le Goater wrote:
> Some Witherspoon boards are shipped with a mt25ql01g flash chip
> holding the BMC firmware.
>=20
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

"witherspoon128-bmc" is not very creative, but I can't blame you for tha=
t :D

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

> ---
>=20
>  It helps in tracking https://github.com/openbmc/u-boot/issues/18
>=20
>  hw/arm/aspeed.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>=20
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index efc97df00de0..f26215ab5524 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -441,6 +441,17 @@ static const AspeedBoardConfig aspeed_boards[] =3D=
 {
>          .i2c_init  =3D witherspoon_bmc_i2c_init,
>          .ram       =3D 512 * MiB,
>          .num_cpus  =3D 1,
> +     }, {
> +        .name      =3D MACHINE_TYPE_NAME("witherspoon128-bmc"),
> +        .desc      =3D "OpenPOWER Witherspoon128 BMC (ARM1176)",
> +        .soc_name  =3D "ast2500-a1",
> +        .hw_strap1 =3D WITHERSPOON_BMC_HW_STRAP1,
> +        .fmc_model =3D "mt25ql01g",
> +        .spi_model =3D "mx66l1g45g",
> +        .num_cs    =3D 2,
> +        .i2c_init  =3D witherspoon_bmc_i2c_init,
> +        .ram       =3D 512 * MiB,
> +        .num_cpus  =3D 1,
>      }, {
>          .name      =3D MACHINE_TYPE_NAME("ast2600-evb"),
>          .desc      =3D "Aspeed AST2600 EVB (Cortex A7)",
> --=20
> 2.20.1
>=20
>
