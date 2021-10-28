Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E2A8D43E2E2
	for <lists+openbmc@lfdr.de>; Thu, 28 Oct 2021 15:58:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hg6c05DWZz2ymc
	for <lists+openbmc@lfdr.de>; Fri, 29 Oct 2021 00:58:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm3 header.b=k7ICC1lm;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=lykclemA;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fuzziesquirrel.com (client-ip=66.111.4.29;
 helo=out5-smtp.messagingengine.com; envelope-from=bradleyb@fuzziesquirrel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com
 header.a=rsa-sha256 header.s=fm3 header.b=k7ICC1lm; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=lykclemA; 
 dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hg6bY72qtz2xDf
 for <openbmc@lists.ozlabs.org>; Fri, 29 Oct 2021 00:58:33 +1100 (AEDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id D40375C01B1;
 Thu, 28 Oct 2021 09:58:30 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Thu, 28 Oct 2021 09:58:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 fuzziesquirrel.com; h=date:from:to:cc:subject:message-id
 :references:mime-version:content-type:in-reply-to; s=fm3; bh=nxi
 c9QhYjcXu8K2z2x2E3eZa9EmMgZJzVMAUnxBnZgU=; b=k7ICC1lmS+zfWa04wiY
 J0zJ+TKWz4PuaA5/UJWevj20n8ypSI+lNRlj332x2Wcr9NHwKSPY75IeqXsFm1nX
 WpVCkw2STYubjH+Btqc40zrkfWZjJI4oKT4y6pp9A7OX69dsMVGG8GMh6WVtFZmR
 BwixuanEFdYr/VrbCV4rtJ2bqBTloXPxumHbKWUIk3iCOlxRvrV+nqs0i+Pz1XcD
 AnEF5LuegEpwTDw+oOPB4lh3z4ZlaAHHhy5sVWFndO7O0m8134Bh98wqgtQZW4Vy
 2gIUE/OK1tVwzcrT4lNLWgWslrKYuD7HPuiGOZhqVf3WqL0CeKYoVNrftlyt2NSg
 hnQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=nxic9Q
 hYjcXu8K2z2x2E3eZa9EmMgZJzVMAUnxBnZgU=; b=lykclemAhRpJXIUSXCnrXN
 8GkoEHd4nPleCyEU53p0aZzuxex9PzxKvjIg7ECchqkdTPuZWmYQeN5cpDjW0xdQ
 v6nTWPDCPLA0VR7i1AjasK0+fuo0LzjhpJirFGxKYKfaUw2pOUEEyk56AD1oKdsk
 voUaZZExnOxmz/XlIkf7WisO5AES6q+MYkkJWSEI+TIuJ4GQkG6U8mJV2PwzAfta
 lCHk08wxzcYm/U405iy9Fm08JtzhCZXRSKGNVG9XzrDWCaCOUTJPH8wJfIQP8RGY
 cAUpTY70l39CjVdwYmlZ/YggcTdoLzja8ktD1KLeTVDf7KTNgrO1xy6cz1tluvLQ
 ==
X-ME-Sender: <xms:hqx6YcS-Ny-9IC_t8znfeX5niBQEeIYwVWGg1ivz3LwUsgb-0kBSAw>
 <xme:hqx6YZxtxkzEBIHc3tr2M5TuXMNeGyGPPQUOUpdSvWG2U9gY7yK23VFyXzH8PkXY0
 -rN_2LYvTw03kSQ0Nc>
X-ME-Received: <xmr:hqx6YZ0rJ0Lt4CZLEIJQfZqGIYWK_NSN6ubsAHgJ4Fuq7txWdhShQSXQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvdegvddgheelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeeurhgrugcu
 uehishhhohhpuceosghrrggulhgvhigssehfuhiiiihivghsqhhuihhrrhgvlhdrtghomh
 eqnecuggftrfgrthhtvghrnhepfeffhfefheeguddtvddtueeihfduieefkeefieefkeef
 udefueevudelgfekffefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
 hilhhfrhhomhepsghrrggulhgvhigssehfuhiiiihivghsqhhuihhrrhgvlhdrtghomh
X-ME-Proxy: <xmx:hqx6YQAMfPu_Y_HqbKyokv1WzBwLxsvIN8RsKpjcsTaJfvkF3EADgg>
 <xmx:hqx6YVjg3NLS4WZZbmo3nzJmh9XLdTcjXJU8jSM2TjGy8ASu0sve_A>
 <xmx:hqx6YcoxodtozCk0KZhPREv-bojl8TrXfgqDxFsjkKRu6hFivFcucA>
 <xmx:hqx6YVdYSTeA5HyHXaR9Avm3LSD8ZREAV7stP40_BQlnScObPHJuKg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 28 Oct 2021 09:58:30 -0400 (EDT)
Date: Thu, 28 Oct 2021 09:58:28 -0400
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: John Wedig <johnwedig@google.com>
Subject: Re: eStoraged repo
Message-ID: <20211028135828.kqx3zmw3vfn73diu@cheese>
References: <CACejXs+LALZsTbVazgLjOP-K2d89sgTT0jVLpTKiFECfZdcYjQ@mail.gmail.com>
 <YXlbNoBeD/yE/bg/@heinlein>
 <CACejXsJK1+D+HqxZGgrfeEtVVwY6bQ_HzSTUuR3F_9YAgZPV+Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CACejXsJK1+D+HqxZGgrfeEtVVwY6bQ_HzSTUuR3F_9YAgZPV+Q@mail.gmail.com>
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
Cc: Brandon Kim <brandonkim@google.com>, William Kennington <wak@google.com>,
 John Broadbent <jebr@google.com>, openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Oct 27, 2021 at 04:38:15PM -0700, John Wedig wrote:
>Hi Patrick,
>
>William and Brandon (CC'd on this email) have agreed to be the initial
>maintainers for this new repo. Let me know if you have any other questions.
>
>Thank you,
>John

Done!

-brad
