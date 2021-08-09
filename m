Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AF663E5016
	for <lists+openbmc@lfdr.de>; Tue, 10 Aug 2021 01:46:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GkCQm1027z30F9
	for <lists+openbmc@lfdr.de>; Tue, 10 Aug 2021 09:46:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm3 header.b=R5imBT5X;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=TCsbWAcN;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.21;
 helo=wout5-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm3 header.b=R5imBT5X; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=TCsbWAcN; 
 dkim-atps=neutral
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GkCQM3s85z2y6F
 for <openbmc@lists.ozlabs.org>; Tue, 10 Aug 2021 09:46:03 +1000 (AEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.west.internal (Postfix) with ESMTP id 4BD87320090F;
 Mon,  9 Aug 2021 19:46:00 -0400 (EDT)
Received: from imap43 ([10.202.2.93])
 by compute2.internal (MEProxy); Mon, 09 Aug 2021 19:46:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type:content-transfer-encoding; s=fm3; bh=RvUDH
 Dk76s6z+07SSUcmjUTqrOX0tPGVB8Pl3VMxN/Q=; b=R5imBT5XB5i5256mL/dwR
 G43ZiiRAZguaI21zy33dK2xjNRli7WLWS6pWBYQEzIs7f5XVEYZEtZY/X+engqVs
 9mRG6J1SXTVcaTsq9yb4oq5oHP54XtXkrhaLZF60IVZD1qYNJyqkG00LDU+5thwr
 5cJizLFjX5ycD7i1t+NVKf8TXCLyMBCgYxTsXthm+YMQ45PXxmNWAEnpGxn6n4Gz
 eSo1tPjNoobO7PUUIkxrlT0ZVZbPrwaUrDSnu4jpyZUPgAW09Z+JUO47BDIQibUn
 VU3enFhNwUvronlIUTw9wR8hKRhxjLYvPAdAc16PZW+xGh7yA8+2mgSHikOhUItV
 w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=RvUDHDk76s6z+07SSUcmjUTqrOX0tPGVB8Pl3VMxN
 /Q=; b=TCsbWAcN432k+TThPdW+RHjXO6coFZBHB8/D/CkH/DJYvry17X1V6TzMC
 XOCecrOTkn/19lw7Om+zqob4Pb533+llXgXLk0U+rZlvjypTY2sd5Soo32EsyVk/
 xnjsbCsYBpzTLWk6C5FhH53d0TKvQRZTCdQ8VyAk3aGTCbPLIQ86p9OByeASDpkQ
 MjvwmX6SaOfL+BoDgIVVA194lBZTKwh7Iytfcbc9Wa/Qk+jTsRQCH8fY8wLKMH29
 +BNUH+7cVKsHMc3eW5Z52JTQBLSkU3Nf6VYFfWWCjusCSI8oDgt1177Mttk3m6dF
 /bTvjTbxoZ9OO3MOd1FYimZjYboXQ==
X-ME-Sender: <xms:Nr4RYQ4-fGIP4YhhAx59QvcDRym4pVTaG_RlpMXcGn0PCR-lFQ8Cdw>
 <xme:Nr4RYR4chS_844uRk0D4TBLXb2c1kZb7SQo-Be7bc04NK3aLanje4vyo_LGcBRE01
 A7FmYDHk0upzihnrg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrjeekgddviecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtgfesthhqredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhephffgkefhudeghfejudfhtdfguedtfeehjeevteffgeduudetjeeijefh
 heffgfefnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucevlhhushhtvghrufhiii
 gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:Nr4RYfdE-Lkwz4X667uufTH0bo01sQ5cLxiPJxNDyQmmMAZR2DXh9A>
 <xmx:Nr4RYVKzQkcj4bntI7-y4w7uqYxFzoC-DqPXBEZbB23aLUQukPC-cw>
 <xmx:Nr4RYULKXewr49gMsxb1CGdavpODosD7DNblU_kFOPUNRdy3vzaUNA>
 <xmx:N74RYc9CzQNRtTroi0H5q5hOa5Y5gIP02URcFGu5E37Ou8Pz1iyU7Q>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id F1F88AC0DD0; Mon,  9 Aug 2021 19:45:57 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-552-g2afffd2709-fm-20210805.001-g2afffd27
Mime-Version: 1.0
Message-Id: <66dc4dc8-74ca-4ccd-94fe-6d819f71226b@www.fastmail.com>
In-Reply-To: <f5ec563f-6bbc-9eca-1ee0-77e2c04c4ec9@linux.alibaba.com>
References: <6fa87e93-863e-94a6-651f-8d6126557553@linux.alibaba.com>
 <863f7fca-7088-450e-a855-92261ba56b9d@www.fastmail.com>
 <f5ec563f-6bbc-9eca-1ee0-77e2c04c4ec9@linux.alibaba.com>
Date: Tue, 10 Aug 2021 09:15:37 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Heyi Guo" <guoheyi@linux.alibaba.com>, openbmc <openbmc@lists.ozlabs.org>
Subject: Re: Question about NVMe MCTP in dbus-sensors
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
Cc: Zhikui Ren <zhikui.ren@intel.com>,
 Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>, "Winiarska,
 Iwona" <iwona.winiarska@intel.com>,
 Vernon Mauery <vernon.mauery@linux.intel.com>, Ed Tanous <ed@tanous.net>,
 "Thomaiyar, Richard Marian" <richard.marian.thomaiyar@linux.intel.com>,
 "sumanth.bhat@linux.intel.com" <sumanth.bhat@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Mon, 9 Aug 2021, at 16:03, Heyi Guo wrote:
> Hi Andrew,
>=20
>=20
> On 2021/8/6 =E4=B8=8B=E5=8D=881:42, Andrew Jeffery wrote:
> > Hello Heyi!
> >
> > On Fri, 6 Aug 2021, at 14:47, Heyi Guo wrote:
> >> Hi,
> >>
> >> We can see that NVMe sensors in dbus-sensors relies on MCTP to get
> >> hardware information. It is using libmctp interfaces to initialize =
MCTP
> >> and SMBus.
> > To be clear, it's using a fork of libmctp that implements an SMBus
> > binding via a fork of the kernel that exposes a I2C API that isn't
> > upstream.
>=20
> Could you point out where I can find these forks, including libmctp an=
d=20
> kernel? So that we can do some initial test with the current=20
> implementation of NVMeSensor in dbus-sensors.

The relevant forks are under the Intel-BMC Github org:

https://github.com/Intel-BMC/

Hopefully the Intel folks on Cc can give you pointers on how to get it g=
oing.

Cheers,

Andrew
