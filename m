Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2D5894CACC
	for <lists+openbmc@lfdr.de>; Fri,  9 Aug 2024 08:50:52 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=RB1Jo8lo;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WgF116WBWz2ykC
	for <lists+openbmc@lfdr.de>; Fri,  9 Aug 2024 16:50:45 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=RB1Jo8lo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WgF0T63w3z2yQG
	for <openbmc@lists.ozlabs.org>; Fri,  9 Aug 2024 16:50:17 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1723186214;
	bh=5uYBr/CIFzaQRY37KqeUd1wsgmX/a2UIMBFZNNuBTCQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=RB1Jo8loP0WHItilgeXOat+Ciux4bQKTuLpUlFVjD67L82ztZP2C4gy4VIX4qY8Pi
	 x8zFWyXTlYIRDllnrkvf72F1sk7gn6ISfuVgVUIfhCt1QN60otToVUuJ8mTH8Mzyrn
	 Si9deqDZhvDkrMvo8jCN+/PrMuXH4fQ6xX9hMPtht3Qi1EKGzWTAiVnHpzdFxhhNwA
	 KHkoSBuRB0uc0oi2BhE4OCy/Moi9mFvy+bKej5wrqeVEIu9oKCMzehyjNVAlNYtUGe
	 eOxbCg3F2hTE66NDeTDTfCYVxN5JoynTgZ87pWlZFf0i8lmLSqjcVgF6Qhrt1cB8BU
	 ZfiGRI5XkWu4A==
Received: from [192.168.68.112] (203-57-213-111.dyn.iinet.net.au [203.57.213.111])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id CF87A656AB;
	Fri,  9 Aug 2024 14:50:11 +0800 (AWST)
Message-ID: <b54d11728eebb5307c1bf8ce290764bb001c725e.camel@codeconstruct.com.au>
Subject: Re: [PATCH v1 7/7] i2c: npcm: fix checkpatch
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: warp5tw@gmail.com, tali.perry@nuvoton.com, Avi.Fishman@nuvoton.com, 
 tomer.maimon@nuvoton.com, avifishman70@gmail.com, tmaimon77@gmail.com, 
 tali.perry1@gmail.com, venture@google.com, yuenn@google.com, 
 benjaminfair@google.com, andi.shyti@kernel.org,
 wsa+renesas@sang-engineering.com,  rand.sec96@gmail.com, kwliu@nuvoton.com,
 jjliu0@nuvoton.com, kfting@nuvoton.com
Date: Fri, 09 Aug 2024 16:20:11 +0930
In-Reply-To: <20240807100244.16872-8-kfting@nuvoton.com>
References: <20240807100244.16872-1-kfting@nuvoton.com>
	 <20240807100244.16872-8-kfting@nuvoton.com>
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
Cc: openbmc@lists.ozlabs.org, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello,

On Wed, 2024-08-07 at 18:02 +0800, warp5tw@gmail.com wrote:
> From: Tyrone Ting <kfting@nuvoton.com>
>=20
> Fix checkpatch warning.
>=20
> Fixes: 48acf8292280 ("i2c: Remove redundant comparison in npcm_i2c_reg_sl=
ave")
> Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
> ---
>  drivers/i2c/busses/i2c-npcm7xx.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-np=
cm7xx.c
> index 1af6a927b9c1..dbe652d628ee 100644
> --- a/drivers/i2c/busses/i2c-npcm7xx.c
> +++ b/drivers/i2c/busses/i2c-npcm7xx.c
> @@ -1783,7 +1783,7 @@ static int npcm_i2c_int_master_handler(struct npcm_=
i2c *bus)
>  		/* reenable slave if it was enabled */
>  		if (bus->slave)
>  			iowrite8((bus->slave->addr & 0x7F) | NPCM_I2CADDR_SAEN,
> -				bus->reg + NPCM_I2CADDR1);
> +				 bus->reg + NPCM_I2CADDR1);
>  #endif
>  		return 0;
>  	}

Fixing checkpatch warnings means you need to modify the commit that
checkpatch identified as having problems, not just add a fix-up patch
on top.

It looks like this change should be squashed into the patch before it.

Andrew

