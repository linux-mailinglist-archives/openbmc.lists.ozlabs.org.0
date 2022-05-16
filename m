Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AD18F52843E
	for <lists+openbmc@lfdr.de>; Mon, 16 May 2022 14:34:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L1zFm4R8Rz3c7L
	for <lists+openbmc@lfdr.de>; Mon, 16 May 2022 22:34:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm3 header.b=cACBC8vD;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=fRwrVJW6;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.25;
 helo=out1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm3 header.b=cACBC8vD; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=fRwrVJW6; 
 dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L1zFD5WR4z3bsG
 for <openbmc@lists.ozlabs.org>; Mon, 16 May 2022 22:33:35 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id A54CF5C01BD;
 Mon, 16 May 2022 08:33:31 -0400 (EDT)
Received: from imap49 ([10.202.2.99])
 by compute3.internal (MEProxy); Mon, 16 May 2022 08:33:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1652704411; x=
 1652790811; bh=z3jH7bU6ja+05lC6SX96mbpSl12BhebXNE1kWGUErYI=; b=c
 ACBC8vDqKhpLh+CZ6I+RhEdZkG7nx3bxBPeCH2Xfnke76Mi2kUP/5WSk8Romejn1
 Z9Zy6LGl5/VN0Y3glUIEPqz4KYQfqhw3cSARxgbg9cYvJ61S1zrq37Y1t8yhKDA0
 ZAgd3uxpH+zqksQOa9FKKFxzALKAD2QvkTmoSDZAvu8P5qT+0t6NHtLAH7RvP2xc
 AqCwdGvn8Ncz/crm8dxm7E8zo3vu1Vvxv3iNPKOknk/48HYu3kzNwu4NN6IpbXkg
 sVpGF5qKAyE8vQp7nKFEfY8VMhaiHJeF0HmSe8rGjXAjqTwO/TZNUtwfveFi+05p
 +Cilz/e9/15paXFGaQGdg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1652704411; x=1652790811; bh=z3jH7bU6ja+05
 lC6SX96mbpSl12BhebXNE1kWGUErYI=; b=fRwrVJW6xuSB8Au6E+x7CcM3MNZ2X
 mcMfcW+1zf0tnDATU6LFGBumF37u9mHdiZaX9AQgpI0eF3C3ePJWT2OgzZuH0DDb
 iath4UU5BSOY5tP4osAfvVrqvE/HkRIqwgXiosZSY5221kNp1FFsJBmM0tz2wMw2
 +2MtrAoMGynWZeonZCDvR3qFD1zNkK3VHMd9cnGOuc/9ko2dy85IxVOLKsVnMvNs
 14Qi3cD52MfOSoGbFX1QWW/74AS+IOtkNLOa/6x+GFdRvxl8bEOuCRT68lFT4AaY
 55cyWKXAxk8N61SUSv+QxYknqjM+Vl2go/Njx+kNLk3F1fxHpgneyRbhw==
X-ME-Sender: <xms:mkSCYgmJ312dC099spiLbLZ3_-sW2z13a4ZiHzukJOyqfHnGG69K7w>
 <xme:mkSCYv2KjTc-2wRTe1FB7hriAS-ylAJabLeB7MK7PU4N2AUnL1lg_5MtoJrBzLIam
 WOy5dMzvc3CtwGA3w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrheehgdehvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvvefutgfgsehtqhertderreejnecuhfhrohhmpedftehn
 ughrvgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtf
 frrghtthgvrhhnpeelkeetiedvgfekueehteekueefgfeuffdvieduieehgfefleeihfeg
 hfelvdeffeenucffohhmrghinhepghhithhhuhgsrdgtohhmpdhkvghrnhgvlhdrohhrgh
 enucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgu
 rhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:mkSCYurTv1AMTXQXtnu2OIi1cJ4kz9b4XaRSE6UA3h0Q_cPiZfcYUA>
 <xmx:mkSCYsnirEZFtIC2VCt21K0rfGSBTROkK0TLnE2F8YynMGhuvzjUiA>
 <xmx:mkSCYu3p7AYbXeCz5HtE3zmauzMiLGT5cdb87UcbNzQfCMLZ2MNLLw>
 <xmx:m0SCYnnOEwNmzcZl_CI27sZQKkjPN1QjylDU084mMIzIvS0dD0vj3w>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 8F14B15A0080; Mon, 16 May 2022 08:33:30 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-591-gfe6c3a2700-fm-20220427.001-gfe6c3a27
Mime-Version: 1.0
Message-Id: <361f8b4a-9b98-4f20-a54e-0ccecf302cd4@www.fastmail.com>
In-Reply-To: <b978e205-66f7-e585-4cf0-6f3946fd1050@kaod.org>
References: <20220516062328.298336-1-pdel@fb.com>
 <b978e205-66f7-e585-4cf0-6f3946fd1050@kaod.org>
Date: Mon, 16 May 2022 22:03:10 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 "Peter Delevoryas" <pdel@fb.com>
Subject: Re: [PATCH v2 0/5] hw: aspeed: Init all UART's with serial devices
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Jamin Lin <jamin_lin@aspeedtech.com>, Zev Weiss <zev@bewilderbeest.net>,
 irischenlj@fb.com, openbmc@lists.ozlabs.org,
 Cameron Esfahani via <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9_via?= <qemu-arm@nongnu.org>,
 Joel Stanley <joel@jms.id.au>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Mon, 16 May 2022, at 16:48, C=C3=A9dric Le Goater wrote:
> On 5/16/22 08:23, Peter Delevoryas wrote:
>> v2:
>> - Rebased on Cedric's irq proposal. [1]
>> - Added "Introduce common UART init function" patch
>> - Added "Add uarts_num SoC attribute" patch
>> - Rewrote last commit's message for clarity
>
> Looks good to me.
>
>> I tried testing this by running acceptance tests, particularly the
>> boot_linux_console.py file, but I had to disable the raspi2_initrd ca=
se.
>> It's not related to my changes (A/B tested and it fails on upstream/m=
aster
>> too), but thought I would mention that.>
>> I also manually tested several machines:
>>=20
>> AST2400: https://github.com/facebook/openbmc/releases/download/v2021.=
49.0/wedge100.mtd
>> AST2500: https://github.com/facebook/openbmc/releases/download/v2021.=
49.0/fby3.mtd
>> AST2600: https://github.com/facebook/openbmc/releases/download/v2021.=
49.0/fuji.mtd
>> AST1030: https://github.com/peterdelevoryas/OpenBIC/releases/download=
/oby35-cl-2022.13.01/Y35BCL.elf
>>=20
>> [1] https://lore.kernel.org/qemu-devel/20220516055620.2380197-1-clg@k=
aod.org/
> I have quite a few images which I run manually. OpenBMC is providing
> images, Aspeed also. Joel did a small tool for the IBM rainier :
>
>    https://github.com/shenki/qemu-boot-test
>
> Having an automated framework for Aspeed machines pulling images
> from different places would be nice but we cannot put all under
> QEMU.

For what it's worth I run this as a smoke test before pushing updates to=
 openbmc/qemu:

https://github.com/openbmc/openbmc-build-scripts/blob/master/scripts/tes=
t-qemu

Andrew
