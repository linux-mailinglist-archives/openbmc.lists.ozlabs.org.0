Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B25393142F6
	for <lists+openbmc@lfdr.de>; Mon,  8 Feb 2021 23:28:39 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DZLK105nrzDvWg
	for <lists+openbmc@lfdr.de>; Tue,  9 Feb 2021 09:28:37 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fuzziesquirrel.com (client-ip=66.111.4.26;
 helo=out2-smtp.messagingengine.com; envelope-from=bradleyb@fuzziesquirrel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com
 header.a=rsa-sha256 header.s=fm1 header.b=hxBMzJpH; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=IJtrpAhA; 
 dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DZLJ63mTjzDvVl
 for <openbmc@lists.ozlabs.org>; Tue,  9 Feb 2021 09:27:50 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id D6D9D5C0148;
 Mon,  8 Feb 2021 17:27:47 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 08 Feb 2021 17:27:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 fuzziesquirrel.com; h=date:from:to:cc:subject:message-id
 :references:mime-version:content-type:in-reply-to; s=fm1; bh=84m
 8NVXWcPl0VTZTdNJLYu6unD711ST9kCxViedPaoo=; b=hxBMzJpHBRP0OXb17Dl
 2lc4LoOaJQy3ZHDKNED0jlUh/hNN74RTSImX1rFx1NH+YCN0qDaLvHXsWsDbKgGF
 1yi1BhH9bMTgVZgv2DwwAUKQBbOCseksTuMtamyqpmNDSXL/4c3Xfq1NLgisvw6N
 q/P7q9fbmeJjFLvGwHEzzutoiQ0X3oPvwnDvMgiD5/+/5am8kZ95AMHf1gdYCOCA
 Hcry0cZsnbiD4GjShulJAKA71N6jwtmeUFBvTMlZ3AhT5qv4hmykRElWMpnSygG5
 Ew1gVHsXWVsGMIC2o8/pADfnzfdbgDTlAhzknhuZVKnFGp2gL1ZVKgxIYTdC5mn3
 eBQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=84m8NV
 XWcPl0VTZTdNJLYu6unD711ST9kCxViedPaoo=; b=IJtrpAhAJbweHtqTfKNAHi
 CgDFFTLZyiWRVVbvSgwi4vKPG/8mslWj6HY2kSuOS28OLJ+NbylKg0eZoVGinDDm
 8qCM36gJ5P215oHY3OypsAjcQVGA714JLGKV4hqZeOOTUewREE7v0U8SwWWLkEGl
 uQqCnnJP8m2J6Dk5m8dGep0upqoscZgB1CtRee/wVr01trQYfKmHXJcyOYyvIFb8
 C7matX6eZIIjA/cqkOjJZki1mbbqNauFsgA7ZkgqXZxXFIpobj/uzB47qSbcsnq8
 4GvsTWbKFQaW7vtwfC29RIkmFhluk4hOIvaiFYyBlwLZgv65wRYXYWVTaz4MaQZg
 ==
X-ME-Sender: <xms:47ohYNLoqomzDFbQoB9587XqUe4PllxUtnEjrW-Qop9qQsevK3CiOQ>
 <xme:47ohYJLpfzDRC7gF9q-pfSii0inO1fed15NmrwWk4SIGuWhYqEajzNlOOrFPkfLd0
 bzucBIXj1xoFjTurgM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrheefgdduiedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeeurhgrugcu
 uehishhhohhpuceosghrrggulhgvhigssehfuhiiiihivghsqhhuihhrrhgvlhdrtghomh
 eqnecuggftrfgrthhtvghrnhepfeffhfefheeguddtvddtueeihfduieefkeefieefkeef
 udefueevudelgfekffefnecukfhppedujeefrdduieejrdefuddrudeljeenucevlhhush
 htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsrhgrughlvgihsges
 fhhuiiiiihgvshhquhhirhhrvghlrdgtohhm
X-ME-Proxy: <xmx:47ohYFv3R3jPwaZxOMKXBBpB-0y2Iq8kE1LEUSubcSbKqr-yooNIAQ>
 <xmx:47ohYOZ_pxUyEAsitBNzwnKLSoDdiiZkONRzbgS06yFoUUo-hABVJg>
 <xmx:47ohYEbdhU1mbSR4fD8k0DtV3Si6pRQtyTEwU2-icIHgCfUrmVYspg>
 <xmx:47ohYNCEXKEnpg9lzNY8WTheeASY7VIm6cu8V92NbkhRKMoDdFO_-g>
Received: from thinkpad.fuzziesquirrel.com (unknown [173.167.31.197])
 by mail.messagingengine.com (Postfix) with ESMTPA id D36F81080057;
 Mon,  8 Feb 2021 17:27:46 -0500 (EST)
Date: Mon, 8 Feb 2021 17:27:45 -0500
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Thang Nguyen OS <thang@os.amperecomputing.com>
Subject: Re: create meta-ampere folder in openbmc repo
Message-ID: <20210208222745.zq5anx4y2br7wsnt@thinkpad.fuzziesquirrel.com>
References: <0e2507bc-f8c5-85c4-cd39-4c603a729f4c@os.amperecomputing.com>
 <da62c090-c6a0-1844-cc2b-44846b83c89d@os.amperecomputing.com>
 <3eff5596ee50878be8623c021816977f42111ea4.camel@fuzziesquirrel.com>
 <96568613-294f-8a3b-9aa9-7918b5df2d9b@os.amperecomputing.com>
 <20210130161537.gj6jhwvsnwgdkofa@thinkpad.fuzziesquirrel.com>
 <94d1598b-0dbd-17ad-3326-c581d583cc41@os.amperecomputing.com>
 <20210201134803.ok4bt3hd5xcrirjo@thinkpad.fuzziesquirrel.com>
 <53126da0-c452-7c64-c3d4-735f38e518d3@os.amperecomputing.com>
 <20210208221222.42tgcozztspf3mru@thinkpad.fuzziesquirrel.com>
 <BYAPR01MB46786DC69D7FCF46045FD1FB8D8F9@BYAPR01MB4678.prod.exchangelabs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <BYAPR01MB46786DC69D7FCF46045FD1FB8D8F9@BYAPR01MB4678.prod.exchangelabs.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 "Lancelot.Kao@fii-usa.com" <Lancelot.Kao@fii-usa.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Feb 08, 2021 at 10:18:49PM +0000, Thang Nguyen OS wrote:
>Hi Brad,
>I still not have the permission to trigger Ok-to-Test after adding myself to ci-authorized

Oh - right, setting Ok-to-Test is done by the OpenBMC CI user, based on 
the group membership, so you don't need to set it manually.

thx - brad
