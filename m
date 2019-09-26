Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 56845BE9FE
	for <lists+openbmc@lfdr.de>; Thu, 26 Sep 2019 03:19:06 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46dxsM3jS9zDqjn
	for <lists+openbmc@lfdr.de>; Thu, 26 Sep 2019 11:19:03 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=64.147.123.21; helo=wout5-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="LdaAENV1"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="QptrFtc4"; dkim-atps=neutral
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46dxrp4wQWzDqg8
 for <openbmc@lists.ozlabs.org>; Thu, 26 Sep 2019 11:18:34 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 3EFEA63A;
 Wed, 25 Sep 2019 21:18:32 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Wed, 25 Sep 2019 21:18:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type:content-transfer-encoding; s=fm3; bh=0XgTC
 qTEMvZ+LX1HGYl0pwRdJZ20rCj52flyC4GWbWk=; b=LdaAENV1PsJoEKdO3Rvoy
 xHhKeRZEFqZA4KPM353ulFGFvdVcEt2lmk7NPtfixyXGRtVMFas/Utdht/Gyyl8O
 gn4z5at8MOruJfDMENT6qRrlJZEubob9M78t0q/IPGOm13gPJOc6WlD1VPLP5XjX
 QaObCApX3w8I8ELG3iRM5Ye7kMUyMhEF4s/BEGdnOX8jWEjjIw8Y95wFKKyD4n7+
 DP3dJzdCKPtItj8csRddzQ8NGbNMt4+10far0beeyqz8qRPGsyLq9afyDXvTlJG1
 hQWHaa0yZoyoXRnblTPtYYMOx0Kurt4xCt85U/UMLmQtjx03Ua1R8nB8IxETrWap
 Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=0XgTCqTEMvZ+LX1HGYl0pwRdJZ20rCj52flyC4GWb
 Wk=; b=QptrFtc4XWGNQU0BeqygXmiJq82ZfDU8pN1kXtU/joFadXmWiFFPqcDgn
 unoN08v9q2KhHWPZdQTejbWrUSTYLyHA8olFUlkxz6LZIQqfPC37V2k0EqAToN5q
 U2RI7tbb41dKATWozvUwFQmKfUdQyO2skhg/nozQE+jO/P2NnMaYYhTFzLGstrAR
 JvRwUiMDcXBq7nP0lj8m1mc3S/+4nmFbZS40dt2vJ5IFcCL4RIBOeuMVC5lNYIp+
 zpL2vB3LOx01zDDDHRNGrhPQGbcmorVwlZ52ZIXKmDrSUhY0u7zfetcqjVAmMfcB
 TMRKxVARkL5dBCPlWOjQOPTmYcNFw==
X-ME-Sender: <xms:5hGMXevoFK-vioaKP4c4ldWsKFGt_mQW9h9wzv8oNdaRpMT_sbDhtA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrfeefgdeggecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtgfesthhqredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecurfgrrh
 grmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgv
 rhfuihiivgeptd
X-ME-Proxy: <xmx:5hGMXRAqEsOI3OggkFpyDiJBpTIOAHFHlKhs9_iI2xz2Z0HZgn-Ndw>
 <xmx:5hGMXQO39ZWZJmA_Yx2OZ9vG3nhKPEItN_FpN2lKq09fuaaS1ewETA>
 <xmx:5hGMXaxyhDQxvo0LzcDM4fbmXS2qR0h2-HRttvR1_RitC7EgXm1_EA>
 <xmx:5xGMXZKtqBoHDjBYZep4H4sff_8dMH3UbG3auj7xFPDxu1mj_21NXg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id BAF72E00A5; Wed, 25 Sep 2019 21:18:30 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-305-g4111847-fmstable-20190924v1
Mime-Version: 1.0
Message-Id: <b7987fa8-c8a3-4927-88bc-5ee6774127b5@www.fastmail.com>
In-Reply-To: <20190925124239.27897-4-clg@kaod.org>
References: <20190925124239.27897-1-clg@kaod.org>
 <20190925124239.27897-4-clg@kaod.org>
Date: Thu, 26 Sep 2019 10:49:13 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, openbmc@lists.ozlabs.org
Subject: =?UTF-8?Q?Re:_[PATCH_linux_dev-5.3_03/13]_ARM:_dts:_aspeed:_rainier:_Ena?=
 =?UTF-8?Q?ble_MAC0?=
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Wed, 25 Sep 2019, at 22:12, C=C3=A9dric Le Goater wrote:
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
>  arch/arm/boot/dts/aspeed-bmc-opp-rainier.dts | 7 +++++++
>  1 file changed, 7 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-rainier.dts=20
> b/arch/arm/boot/dts/aspeed-bmc-opp-rainier.dts
> index 5e5bc78bdce4..713dc64064ad 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-rainier.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-rainier.dts
> @@ -475,3 +475,10 @@
>  		spi-max-frequency =3D <100000000>;
>  	};
>  };
> +
> +&mac0 {
> +	status =3D "okay";
> +
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_rmii1_default>;

This looks like a shortcut to aid development under qemu?
