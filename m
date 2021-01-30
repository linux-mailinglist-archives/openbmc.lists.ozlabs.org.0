Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AC15F3098A3
	for <lists+openbmc@lfdr.de>; Sat, 30 Jan 2021 23:20:57 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DSpZD3stnzDrgk
	for <lists+openbmc@lfdr.de>; Sun, 31 Jan 2021 09:20:52 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fuzziesquirrel.com (client-ip=66.111.4.27;
 helo=out3-smtp.messagingengine.com; envelope-from=bradleyb@fuzziesquirrel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com
 header.a=rsa-sha256 header.s=fm1 header.b=HcnXahx6; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=OU2TbENq; 
 dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DSpXf3KZxzDrP2
 for <openbmc@lists.ozlabs.org>; Sun, 31 Jan 2021 09:19:29 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 9B6955C0153;
 Sat, 30 Jan 2021 17:19:24 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Sat, 30 Jan 2021 17:19:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 fuzziesquirrel.com; h=date:from:to:cc:subject:message-id
 :references:mime-version:content-type:in-reply-to; s=fm1; bh=R+N
 V41vWLJzV9tEnBxi6nSXKWkg7qO4tl340Y/sItAk=; b=HcnXahx6N6kldhPYS28
 unqJWeoybeM5RxMSYa1kx7CyeuSBFU0v9RHvHjcEfFoiNTmw+PX5TlieOFOPRW8C
 +inbrM3arCNNuCTgj446Bc6z+JZTK6nKWR7KUBa0uLhP0iTmglfbokIb8p9C9fl+
 dm0SXJnY+ZLPucRcVGM5A/3d5oZ38oOSGdmvOKv4Y87Abk2NL4dED+5DcHO4XG4n
 39ktFQbxAvPRiDK3hEQKmyQATW6nNwm9FXm06iYvLiRYNQ0H/t9WU6aolGvD+Fdk
 OLbvDbWtUvxbp36Uwj3jhDi9Ofvpp2M8S36AHyF4ci3b1v+H0xTxs7gC6OC9N0uW
 UcA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=R+NV41
 vWLJzV9tEnBxi6nSXKWkg7qO4tl340Y/sItAk=; b=OU2TbENqKqZavVIPtXPgXo
 BQE+ZSwxJiddPpkZAnIsnw2BlW5TYfDJyq/kbizWDKW3o1r+MnpMsoAAmJqs/QWq
 rQLXOtXBr5K6HNPe2w9vJoJRq0PUQIUwy6q9XNUQjIspviUevwLD8frtRIe1CTcY
 DJg3/KNpfxnwC14TaqVlsIqkAP4QWlySTUF4iWfWLOdMI2jyb6t9/PbcPKoZPogu
 +eRddZjEjt8fL0r1JdRnO3o1Kw4Gfz0d7uct7OvrJi8i2UMRKsp7uxP0QR2QEmBQ
 lNhS9hvle2sgrJuV8EHxF6IPmMHz/L+udd5Wv52GizxWn2IIykrLSD1uJYiVc95A
 ==
X-ME-Sender: <xms:a9sVYCnyxdiEoRU9V5UPDdOpNXzbHWhQrTBMdcRDDOfFrEsyKaX-9A>
 <xme:a9sVYJ0NmzcGRrma9Tpi7p7z445z5-fLieyQd2H56bckRn2L-mb1FilXjNqaNI5KB
 EE6bfgYHjfCeWfo76o>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeeggdduieduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeeurhgrugcu
 uehishhhohhpuceosghrrggulhgvhigssehfuhiiiihivghsqhhuihhrrhgvlhdrtghomh
 eqnecuggftrfgrthhtvghrnhepfeffhfefheeguddtvddtueeihfduieefkeefieefkeef
 udefueevudelgfekffefnecukfhppedujeefrdduieejrdefuddrudeljeenucevlhhush
 htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsrhgrughlvgihsges
 fhhuiiiiihgvshhquhhirhhrvghlrdgtohhm
X-ME-Proxy: <xmx:a9sVYAoyXKV3R78QNAAP_hddzkkUvTF-WOd43A3YvBP3WedJ2y35ow>
 <xmx:a9sVYGm2UU8RkGR6T8L5oS1LL6YGRJY7-u8UikAsZ71fyZrX4N-oow>
 <xmx:a9sVYA3FvKIA0o0ab6nUlhxxqFvVRuFKdjAH3CFgcHmQJ6ctlWEPHw>
 <xmx:bNsVYNy2eegCmgqxtVXWnYPOE8PF97brjiujgefwbEhFFEDNPCICqw>
Received: from thinkpad.fuzziesquirrel.com (unknown [173.167.31.197])
 by mail.messagingengine.com (Postfix) with ESMTPA id 498031080059;
 Sat, 30 Jan 2021 17:19:23 -0500 (EST)
Date: Sat, 30 Jan 2021 17:19:21 -0500
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Brandon Kim <brandonkim@google.com>
Subject: Re: Upstreaming downstream Google BMC repositories
Message-ID: <20210130221921.wiug63hn326miwoh@thinkpad.fuzziesquirrel.com>
References: <CALGRKGM0A9DHYuHrKrCLS8U0+YnbMCgVHWEXjbMW7Juhq+r=Zg@mail.gmail.com>
 <2e3f9acc-cc58-6f71-2e42-e046109dd5ec@molgen.mpg.de>
 <CADKL2t5ajasf9NzFbTwtT0=W7ZO2jcfD5V+tk5VVSrkZTuLNmw@mail.gmail.com>
 <711a5031-c774-4b03-6a6e-1f14d8699789@molgen.mpg.de>
 <CAH2-KxDdHqNXJ0uLd7QNt76MUHbt8WQd52+biaZavN4Tzb2=Vg@mail.gmail.com>
 <X/y/es6hNBbWR/bq@heinlein>
 <CACWQX839PL=5eYtRsmD_ZZ+OgWb_xZeuVvxOxzt7Ye1dc2Kt4Q@mail.gmail.com>
 <CALGRKGOBTW-MY_wXKvh26Dow0xWoUh4TGwjXacZFs2Y9RJneEg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CALGRKGOBTW-MY_wXKvh26Dow0xWoUh4TGwjXacZFs2Y9RJneEg@mail.gmail.com>
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
Cc: Paul Menzel <pmenzel@molgen.mpg.de>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Ed Tanous <ed@tanous.net>,
 Ed Tanous <edtanous@google.com>, Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Jan 14, 2021 at 03:17:57PM -0800, Brandon Kim wrote:
>Hi everyone,
>
>Wanted to ping this thread to see if there were more concerns on creating
>an openbmc/google-misc repository.

I finally created this today.  Apologies to the Google team for the long 
delay.

-brad
