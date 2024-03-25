Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1C54888E9A
	for <lists+openbmc@lfdr.de>; Mon, 25 Mar 2024 06:23:53 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=QuR2iUge;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V31Yz42jLz3brL
	for <lists+openbmc@lfdr.de>; Mon, 25 Mar 2024 16:23:51 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=QuR2iUge;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V31YQ1tW3z2yst
	for <openbmc@lists.ozlabs.org>; Mon, 25 Mar 2024 16:23:22 +1100 (AEDT)
Received: from [192.168.68.112] (ppp118-210-177-226.adl-adc-lon-bras34.tpg.internode.on.net [118.210.177.226])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id AA81E20173;
	Mon, 25 Mar 2024 13:23:19 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1711344200;
	bh=TPTOcPeky17Uxo+pfLt+QvA73D1OhTfX2wHJVymbUyk=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=QuR2iUgeL1OskoFiJ5+TthvjDnxJ0OwPmEBSQObmzwXzA8DiGozEHKc6/8+qDuCc1
	 cfgAZLZYPs37LPEfB+vY5NN3mSroqiZ3onjTFH02jw66nI+O/JrvOKIsMmXMkcWxyX
	 N3x2o3BQ94uzOptrLNJbynzdLUvxLAtNEgDVsPI4MMImPDC8Rb7+k3iia5RI1I2ohW
	 /+fwho7VetSdraQV9wQYz9i61yW+dh6cGkyXGvZw2WpWHBOV3JOAQaxi0ThToQaiaY
	 45+DAhdNOoHDFBYVPE0kcTfOjeXhFBOSLcs3r4TPm3dUPyhF1aM3aH274D05IVWJNT
	 BdD0YKsmX5oTg==
Message-ID: <4f1e62b5953a8870617792b5e8308171c60e00fa.camel@codeconstruct.com.au>
Subject: Re: [PATCH next v1 0/1] Add new bmc dts for ASUS X4TF server
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Kelly Hung <ppighouse@gmail.com>
Date: Mon, 25 Mar 2024 15:53:18 +1030
In-Reply-To: <20240313102725.2067651-1-Kelly_Hung@asus.com>
References: <20240313102725.2067651-1-Kelly_Hung@asus.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
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
Cc: Allenyy_Hsu@asus.com, openbmc@lists.ozlabs.org, Kelly Hung <Kelly_Hung@asus.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Kelly,

On Wed, 2024-03-13 at 18:27 +0800, Kelly Hung wrote:
> Add bmc dts to ASUS X4TF server, we also submitted dts to linux place.
> Please refer to here, https://lore.kernel.org/lkml/?q=3Dx4tf.
>=20
> Kelly Hung (1):
>   arm: dts: ast2600-x4tf: Add new dts for ASUS X4TF
>=20
>  arch/arm/dts/Makefile         |   4 +-
>  arch/arm/dts/ast2600-x4tf.dts | 161 ++++++++++++++++++++++++++++++++++
>  2 files changed, 164 insertions(+), 1 deletion(-)
>  create mode 100644 arch/arm/dts/ast2600-x4tf.dts
>=20

I've backported your patch to openbmc/u-boot v2019.04-aspeed-openbmc.

Andrew
