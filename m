Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF1454EA422
	for <lists+openbmc@lfdr.de>; Tue, 29 Mar 2022 02:24:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KS9LC5s5Nz3c2C
	for <lists+openbmc@lfdr.de>; Tue, 29 Mar 2022 11:24:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm3 header.b=GV8iKIgk;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=MfUF/QO1;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.229;
 helo=new3-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm3 header.b=GV8iKIgk; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=MfUF/QO1; 
 dkim-atps=neutral
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KS9Kf66yWz2xWc;
 Tue, 29 Mar 2022 11:24:05 +1100 (AEDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id AA157580367;
 Mon, 28 Mar 2022 20:24:01 -0400 (EDT)
Received: from imap49 ([10.202.2.99])
 by compute5.internal (MEProxy); Mon, 28 Mar 2022 20:24:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; bh=YVcOcYXKVU4PEK
 ENIKD3lZlfbqMF8OkXUPWQPtT0ZzA=; b=GV8iKIgkifB/LyajStlhIzzaA2PqSU
 rEPGZBnWRziuDMlxEaU3fjhl0DHmyiueo1E3rsDwPrq1dyaythjr8LeJ4NZ3kmFH
 v7J0UO7b64vG5VRtrXZ/OicN/3vDmtLy+M6As/zf5/EYH2TO2OF+YIkppderpdcN
 ocuY8KYW/dUFglcgTgXnC/6f5bvCH2TNkniwuNDGczxXDBDNnP2nHRX3u9u0y3Go
 2HHhDpJUS8OMLXTkUmRtrROlDXASYpEdp57tTxY7G7Ci6RHcafVgGiKZGpjbHNDZ
 //P9ySL7tvarTkKke+QN7H1PCcvhD3CsMcxHphO+TJq7W+71Q2wgIxYw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=YVcOcYXKVU4PEKENIKD3lZlfbqMF8OkXUPWQPtT0Z
 zA=; b=MfUF/QO1w2kk8LobJGDnDjGmGT9HUgvaIsBRcZJH4NP16C60y/NJslTt7
 orhhkgHh49rbOiH30mg+9nD++QY3WWgzSB2sDT9Qr4nBx6DPKrUBtQOsEMz/dHsj
 tnZTX8+5b3lvOKKTTCyQClpi0fsj22EquswXftZXPkMfoj2QCv1jAapgIQLAxfMF
 S0z3hjnx7eO2S93c8UZottn5LmdiG0YcFFuK5zB8/ar7yCvc0Jy0dFV5KjDfSzzb
 3LrydgytiTwdKd8S3tKaPDcolfNGWpjEyPMA80KKZ8LEsNOU94avhhnY8yVPYBI+
 z15/ibq45vK+JxVduu76w45M0nzjQ==
X-ME-Sender: <xms:oFFCYs9K0yagZswp7rFBq_h4vFfHgzOKyc_TzBu90N89g92vvi8M3A>
 <xme:oFFCYkvw9h1jnh95ii6UH3c9xPcsfcQHqQiMHfK2AbFZHDfMquci3iY3KqTCG7jHE
 woyrhqOfmB1RNSngg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudehkedgfedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgfgsehtqhertderreejnecuhfhrohhmpedftehn
 ughrvgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtf
 frrghtthgvrhhnpedvgeekheegfedvhfethefhudetteegueeggfeiieegueehkedugedt
 kefglefgheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:oVFCYiAKjCQA5Zb05U61crJ5MlOJCJLgZQqyWNA7a6PSqL49ds9rcQ>
 <xmx:oVFCYsd7HLs87jVXkH1pk4ddv_005tSApo64HS9hBsjced9RxeZQlg>
 <xmx:oVFCYhNCDSxTTbHGsk6l4iYUYPZLYU9gbpl7DI-t2s9QTshCOjdDqA>
 <xmx:oVFCYjVxoE5j7ipqETgwLEOiheaMjFzqbcptYMrhCgrHpWjYJYVlwQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id E057EF6043F; Mon, 28 Mar 2022 20:24:00 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-4911-g925b585eab-fm-20220323.003-g925b585e
Mime-Version: 1.0
Message-Id: <d5e6c96b-5882-4602-93cb-b08a65bfa37e@www.fastmail.com>
In-Reply-To: <D9AFAC3C-46CA-4C40-8559-FD6934411CAB@goldelico.com>
References: <20220328000915.15041-1-ansuelsmth@gmail.com>
 <YkG2RPrtPaBNXb7a@latitude>
 <D9AFAC3C-46CA-4C40-8559-FD6934411CAB@goldelico.com>
Date: Tue, 29 Mar 2022 10:53:40 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "H. Nikolaus Schaller" <hns@goldelico.com>,
 =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 "Ansuel Smith" <ansuelsmth@gmail.com>
Subject: Re: [RFC PATCH 0/1] Categorize ARM dts directory
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
Cc: linux-aspeed@lists.ozlabs.org, linux-realtek-soc@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, chrome-platform@lists.linux.dev,
 linux-samsung-soc@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-arm-kernel@axis.com, linux-rockchip@lists.infradead.org,
 linux-sunxi@lists.linux.dev,
 OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS <devicetree@vger.kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-actions@lists.infradead.org,
 linux-unisoc@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org,
 Linux-OMAP <linux-omap@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, linux-renesas-soc@vger.kernel.org,
 kernel@dh-electronics.com, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-oxnas@groups.io
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Tue, 29 Mar 2022, at 00:20, H. Nikolaus Schaller wrote:
>> Am 28.03.2022 um 15:21 schrieb Jonathan Neusch=C3=A4fer <j.neuschaefe=
r@gmx.net>:
>>=20
>> Or maybe bcm instead of broadcom. Not sure which is preferred by
>> Broadcom people.
>
> Maybe it should always follow the list of vendor prefixes as we are=20
> talking about DTS?

+1 (if we're actually going to do this). That would neuter most the=20
mistakes and discussion and can be extracted from the dts files=20
themselves.

Andrew
