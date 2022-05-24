Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ED57531F97
	for <lists+openbmc@lfdr.de>; Tue, 24 May 2022 02:10:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L6ZNG29PRz3bly
	for <lists+openbmc@lfdr.de>; Tue, 24 May 2022 10:10:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm2 header.b=vvAh8qAU;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=obz3h5ac;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fuzziesquirrel.com (client-ip=66.111.4.27;
 helo=out3-smtp.messagingengine.com; envelope-from=bradleyb@fuzziesquirrel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com
 header.a=rsa-sha256 header.s=fm2 header.b=vvAh8qAU; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=obz3h5ac; 
 dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L6ZMn6Mc7z2ynL
 for <openbmc@lists.ozlabs.org>; Tue, 24 May 2022 10:10:13 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 1BC7A5C03EC;
 Mon, 23 May 2022 20:10:10 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 23 May 2022 20:10:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 fuzziesquirrel.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1653351010; x=
 1653437410; bh=rb5KXPTtPVfw9Sv317xynMpf27mnMmIBoWWXKHvIj/U=; b=v
 vAh8qAUYEOLxiNwpXazfkovXS0hNZVPfoiSrNc9Og9UHzabB3h8MlqBQceoSJYYZ
 uzpqwP+j5inh02c+J7rCaETOik/ow9QnB1NGewaMx+kkDpvFsxlxpY0/8H5KiwWF
 1A1ETQkST5j0pI8+f8TcvS+Fdget4KeQbmLncHrLwS1l4G6rn/Oo2Y2Ah6BzYq8o
 bgoYubN41ciELGuySkTl0FYpjaFoA05+eFOme6GkQTyVgoszSivUVWqwZ9UU6xYl
 ANpV+iYSUbA2qZhowtUg+x/axGGE762sUgby50Hw1lvutmi+IuOm1na2i5BY/2vq
 M5Va1LM/CcYdhoLg0rtRg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1653351010; x=1653437410; bh=rb5KXPTtPVfw9Sv317xynMpf27mn
 MmIBoWWXKHvIj/U=; b=obz3h5acxykzcAu9CJoHCpe4WTt97lvOSAJH1fKZnMM0
 YHg50u/kMVJnD4Qc+ZnyXieYRpi5q42Nf5Chg779r/eKr9oXnBavAfHe4XmJGjEb
 9NmOdk9+h5xSVUJ5wpSMxrsnRDkspmQksUWHDTE8YXxPH+4ohdKTbZsE0s3Yz5V1
 5L31AzalLcGQNXHo7Vchi+LLcoI88cSgwzVe2qz1+rS/9o0gLxmjeXPL3nut8bAi
 PMkNYIx+tFWb9zHT4uw6/Wyro5IwFKiu+TuKuvesRVjdWyyzEbs3SYzthDZVc4Xi
 lBqehfmYZYEW24zI8jn0CRcFJRoMbbH2cZvVyCUpOQ==
X-ME-Sender: <xms:YSKMYlvdhFswdUOi57sZJToskMLPxBbIEYiXvzo1eN6oni4k2Qaicw>
 <xme:YSKMYucdTJjvholVqyS7u-jdTG-BsHNIdMKNmd4l3hRIpjSrswRSyKDQVsTzzbiNz
 e3I144HXNeaazU7EKk>
X-ME-Received: <xmr:YSKMYoydmhVyU5JBHrXtE-qhQ4t-v5dFJ8DQQ2tQFNlqRnhH3Dtxo2mW>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrjedvgdefudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeeurhgrugcu
 uehishhhohhpuceosghrrggulhgvhigssehfuhiiiihivghsqhhuihhrrhgvlhdrtghomh
 eqnecuggftrfgrthhtvghrnhepffdvleejtefgveelfedutdegheeutdfggfdvteevkeek
 leevieegjeeffeeuffejnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhush
 htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsrhgrughlvgihsges
 fhhuiiiiihgvshhquhhirhhrvghlrdgtohhm
X-ME-Proxy: <xmx:YSKMYsNIVAYRUjczUMwuV5VGKqQ2ei7wssI5npUTpu73-xZ87-UvUw>
 <xmx:YSKMYl_xSdXBlj6GwEki_yPu8QBcECb1aAWZc6XCdndkkaXvRgRqYQ>
 <xmx:YSKMYsW70aVDtayhejPrBjmBcS_mvS4xou3XiCwAu76AY1OkIOoa3A>
 <xmx:YiKMYnIr-Au_tZUQeTYvl4D4bhMJWha78C_h8GdfC_8lewumtqgxPA>
Feedback-ID: i02c9470a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 23 May 2022 20:10:09 -0400 (EDT)
Date: Mon, 23 May 2022 20:10:07 -0400
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Patrick Williams <patrick@stwcx.xyz>
Subject: Re: Aspeed SPI driver upstreaming
Message-ID: <20220524001007.k7ujvebqis6qftgh@cheese>
References: <20200106232722.GB1233@patrickw3-mbp.dhcp.thefacebook.com>
 <31ec66fe-9ff9-b28b-3b83-a6c0a7959f30@kaod.org>
 <20200109164317.GE1233@patrickw3-mbp.dhcp.thefacebook.com>
 <20220516181824.ntp33kv75subztsa@cheese>
 <YogD2/rKlWGUrBjH@heinlein.stwcx.org.github.beta.tailscale.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <YogD2/rKlWGUrBjH@heinlein.stwcx.org.github.beta.tailscale.net>
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
Cc: taoren@fb.com, openbmc@lists.ozlabs.org,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Thanks for the reply Patrick.

On Fri, May 20, 2022 at 04:10:51PM -0500, Patrick Williams wrote:
>I don't know the details here.  There was some dispute between the MTD
>maintainers and work that others were doing in this area that has made
>it difficult for us to get additional patches in until someone refactors
>the Aspeed driver how upstream wants.  (last I was aware)

Right, this work has just recently been done: 
https://lore.kernel.org/lkml/20220503060634.122722-1-clg@kaod.org/ 
(thanks Cedric, IBM, and anyone else that helped!)

>I am not using the aspeed-spi driver in these conditions.  After
>initially setting this up we did some testing with the TPM driver and
>realized that it wasn't working.  It turns out that the Aspeed hardware
>is incapable of bi-directional transactions (bytes going out MOSI and in
>MISO at the same time), which is required by the TCG TPM protocol.
>We've ended up having to use the GPIO-SPI bitbang driver for talking
>with SPI-based TPMs.

Good to know!  Thanks for the information,

Brad
