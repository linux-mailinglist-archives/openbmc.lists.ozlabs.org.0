Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BDCCBD757
	for <lists+openbmc@lfdr.de>; Wed, 25 Sep 2019 06:25:12 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46dQ2Y3m8qzDqP4
	for <lists+openbmc@lfdr.de>; Wed, 25 Sep 2019 14:25:09 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="ItYjP81L"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="h3qnbQoU"; dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46dPvd6W5DzDqD1
 for <openbmc@lists.ozlabs.org>; Wed, 25 Sep 2019 14:19:09 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 692AA22274;
 Wed, 25 Sep 2019 00:19:07 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Wed, 25 Sep 2019 00:19:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type:content-transfer-encoding; s=fm3; bh=kNu/a
 QQjYtLVqquU1Cb5DxXnpIy36B3GSnLoBl/TZyY=; b=ItYjP81LonxD79kK413wT
 h0soeAdwCM6lM+UMtFbUwyTh+pmU1S8tHSjFv3DjaApX5CymLuuLcRlXKqTHXtYg
 27fHZOyYTJAefzYvT1Jfv8XN/yh1jKxcd9nq8UpouxPwHjLKW7C8IOJxi0LQdJc4
 99WGvvwvu0fnx5sOsSaCfDLboM5gqq3fwjsBZRhkTak0Ej0nGAs2gE55aRUr37Os
 7GTcGPV1Md5IYo/pxY5HglpCdcS2DuZX8MKee/7WWNX+GImUUl0irvykEdBIT7Fx
 Lt3Fuw1c3WfYIDU2o6/KBoOE0X4rRjgvwCWuVudxYXqPf2xjxH3XW/L1A4W9Elpx
 Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=kNu/aQQjYtLVqquU1Cb5DxXnpIy36B3GSnLoBl/TZ
 yY=; b=h3qnbQoU67BpWnLcNrwBiJHFEDHWXk0tdBz+3kQjwQSmRDow2EMUQqQ/W
 l5SJFbP9n3PbzgbSIAqZ5PNu/dIMb5nyEQ7vGYAszxR3CkX8zRizzAYbPrBidldA
 DSlZrkQ/X1w34G7jvrUv2l8DwSma5OyERk//OLhT5OlVzcH6qxNpLj/0JXlivnLu
 cu9n4rfLBEUsDQPwDKYNW63PRZcU15M8kZK967DyBbCoo7LBUmO3GrECEFz2c9Sq
 I+xejw3/Rq/PLjej9ffnRyEo/5naWL6wJ2Qy1FrwXjcpEp4P9Hq6QSVT6DM+x0NE
 BVlORjDw5dYqjBh8g96dUstpeTzXA==
X-ME-Sender: <xms:u-qKXVHXyTCvh3MHQIzOPg8E3u8HorGWOcGfm6wohK6yWyrb8KisoA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrfedugdekfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtgfesthhqredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecurfgrrh
 grmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgv
 rhfuihiivgeptd
X-ME-Proxy: <xmx:u-qKXVN94keOopGBJlQmu1GTxq6nGkgiWCPNZfvz4x8Yb9l84NZb8A>
 <xmx:u-qKXe-uuv3HYyycVuYLE0z5OXyL932yfE25tqW-mOg8r7KngNwfLg>
 <xmx:u-qKXZRD5bUkTPHdnfdnXMZgucGsNQPqfl5GS-4LUsuHrovMr8_N6g>
 <xmx:u-qKXesKEvbvJR-7Ae7s_y7dZC8ZroC1nMCl6X9174qK8JpFVWIaeg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 01C1FE00AF; Wed, 25 Sep 2019 00:19:06 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-305-g4111847-fmstable-20190924v1
Mime-Version: 1.0
Message-Id: <6e217a0f-6f60-4b0a-92a5-4e1dfc2332bf@www.fastmail.com>
In-Reply-To: <FE94089C-4420-4D02-920F-C9BFFDE35F5D@fb.com>
References: <20190922123700.749-1-andrew@aj.id.au>
 <20190922123700.749-3-andrew@aj.id.au>
 <FE94089C-4420-4D02-920F-C9BFFDE35F5D@fb.com>
Date: Wed, 25 Sep 2019 13:49:49 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Vijay Khemka" <vijaykhemka@fb.com>, "Joel Stanley" <joel@jms.id.au>
Subject: =?UTF-8?Q?Re:_[PATCH_linux_dev-5.3_2/6]_dt-bindings:_net:_ftgmac100:_Des?=
 =?UTF-8?Q?cribe_clock_properties?=
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Tue, 24 Sep 2019, at 08:50, Vijay Khemka wrote:
>=20
>=20
> =EF=BB=BFOn 9/22/19, 5:40 AM, "openbmc on behalf of Andrew Jeffery"=20=

> <openbmc-bounces+vijaykhemka=3Dfb.com@lists.ozlabs.org on behalf of=20=

> andrew@aj.id.au> wrote:
>=20
>     Critically, the AST2600 requires ungating the RMII RCLK if e.g. NC=
SI is
>     in use.
>    =20
>     Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
>     ---
>      Documentation/devicetree/bindings/net/ftgmac100.txt | 6 ++++++
>      1 file changed, 6 insertions(+)
>    =20
>     diff --git a/Documentation/devicetree/bindings/net/ftgmac100.txt=20=

> b/Documentation/devicetree/bindings/net/ftgmac100.txt
>     index 04cc0191b7dd..c443b0b84be5 100644
>     --- a/Documentation/devicetree/bindings/net/ftgmac100.txt
>     +++ b/Documentation/devicetree/bindings/net/ftgmac100.txt
>     @@ -24,6 +24,12 @@ Optional properties:
>      - no-hw-checksum: Used to disable HW checksum support. Here for=20=

> backward
>        compatibility as the driver now should have correct defaults=20=

> based on
>        the SoC.
> This is still used for IPV6 as hw checksum for IPV6 packets is still=20=

> broken in ast2500

I'm not removing it :) I think you've made the same mistake that I've ma=
de
in the past and interpreted the '-' as a diff marker rather than the bul=
let
marker in the text.

Andrew
