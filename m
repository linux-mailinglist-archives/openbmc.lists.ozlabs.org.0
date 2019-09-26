Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 67173BEA48
	for <lists+openbmc@lfdr.de>; Thu, 26 Sep 2019 03:44:01 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46dyQ61RXDzDqZj
	for <lists+openbmc@lfdr.de>; Thu, 26 Sep 2019 11:43:58 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=64.147.123.21; helo=wout5-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="d2XGAdVt"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="q+UsxPJU"; dkim-atps=neutral
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46dyMv4GSnzDqdd
 for <openbmc@lists.ozlabs.org>; Thu, 26 Sep 2019 11:42:03 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 45628531;
 Wed, 25 Sep 2019 21:42:01 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Wed, 25 Sep 2019 21:42:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type:content-transfer-encoding; s=fm3; bh=yfKI9
 vC86NXkFYXlAh+uqqc7uHXJt2CpvREVLqT3DDU=; b=d2XGAdVt02ajjNPrPWbot
 krda7Wy6wj18jJoUhJdbsVuehOyTktzmNb7ToR7e1T7Ezxm0AUYWcKOenvB76pFO
 mQEhCiRtNWyHSZnWbRDwBt0ife0YVKZED+ugXas58nN0vVsxoz3gZ2CRelmpOX78
 A6k+kLIv9J7HcJiQWkWgzi4NoDRVRigz8a+TtggwDfX6GyTDtwRQgwTaTXa3xGbV
 Be0XFJI8wPu+ARZT6heWbm9+WWe/F6XM7U9MXYOCjuwSnjIL0IWzQ3sTI6sHX7b2
 KQQjx1BAoQK0OWEbpfvTYz4r5odhyn2mSJhhfRS2vt1CGi6lZlk6ZIH6t1QjZSSw
 A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=yfKI9vC86NXkFYXlAh+uqqc7uHXJt2CpvREVLqT3D
 DU=; b=q+UsxPJUjEaP1OBFKAYQjf8N/aD9Y5hLdO4QVWT8oePh7/i0QLyzdWpg3
 /ooNNBelweXG8abQ1f2vzHb8856MSVSoW7jaGEJjWOOY+TQyWO0Q3pMms0LVERB6
 HEDGD7DAXlq3l2ie6PAjSHcjNZa7qfdQWyYdZts/C2EZ7fpFs/F+KtFuhoSMc0jf
 jZf9QJtyHFXYqKisW+KVE8sLOzmW1Nzc1ueXuz0RWjeySyu9meQogsvxRmzxOKtI
 MR6gqH35PdAkQ/EWkVyhPpD2sNMEGYCJQTi/uXsr6pOZjEePI+he4efcqdcM4OEW
 6S/TOSPBxBUnmF9pZ1273SV8QnfNA==
X-ME-Sender: <xms:ZxeMXaDxspusrRqKoM1VMdTY_0lXiJpnTANHPvMjwQUQwbyqJRfeFQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrfeefgdeglecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtgfesthhqredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecurfgrrh
 grmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgv
 rhfuihiivgeptd
X-ME-Proxy: <xmx:ZxeMXYyW6zBC5QMXUOie55E1LhmxZsmVYIPiCZxWjveHzUL9KBJhcg>
 <xmx:ZxeMXYnOS3BEs430FLvHAqgooXjRuWQAmrCflzFAe7D43hgSSqGlvg>
 <xmx:ZxeMXdEPIS-VgSkIXnc2-adpYcj9cePpWAV1WgIEVoKIoB7hj-vbBw>
 <xmx:aBeMXbmcf9BmlBfMwo9yGEquH3_oiEE3WMHOsm6CamSy8w1VSArLPQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 9EE90E00AF; Wed, 25 Sep 2019 21:41:59 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-305-g4111847-fmstable-20190924v1
Mime-Version: 1.0
Message-Id: <533e31cd-6f00-4e49-9c01-1d12bf8dd78a@www.fastmail.com>
In-Reply-To: <20190925124239.27897-6-clg@kaod.org>
References: <20190925124239.27897-1-clg@kaod.org>
 <20190925124239.27897-6-clg@kaod.org>
Date: Thu, 26 Sep 2019 11:12:41 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, openbmc@lists.ozlabs.org
Subject: =?UTF-8?Q?Re:_[PATCH_linux_dev-5.3_05/13]_mtd:_spi-nor:_Add_support_for_?=
 =?UTF-8?Q?w25q512jv?=
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

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

> ---
>  drivers/mtd/spi-nor/spi-nor.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/mtd/spi-nor/spi-nor.c=20
> b/drivers/mtd/spi-nor/spi-nor.c
> index 0034e7751239..ff6b719fd267 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -2151,6 +2151,8 @@ static const struct flash_info spi_nor_ids[] =3D=
 {
>  	{ "w25q80bl", INFO(0xef4014, 0, 64 * 1024,  16, SECT_4K) },
>  	{ "w25q128", INFO(0xef4018, 0, 64 * 1024, 256, SECT_4K) },
>  	{ "w25q256", INFO(0xef4019, 0, 64 * 1024, 512, SECT_4K |=20
> SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
> +	{ "w25q512jv", INFO(0xef4020, 0, 64 * 1024, 1024, SECT_4K |=20
> SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
> +			SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB) },
>  	{ "w25m512jv", INFO(0xef7119, 0, 64 * 1024, 1024,
>  			SECT_4K | SPI_NOR_QUAD_READ | SPI_NOR_DUAL_READ) },
> =20
> --=20
> 2.21.0
>=20
>
