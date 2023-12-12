Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD6E780F94A
	for <lists+openbmc@lfdr.de>; Tue, 12 Dec 2023 22:26:51 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=WHE1LrPx;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=ZALAVFOT;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SqWs515zGz3cSM
	for <lists+openbmc@lfdr.de>; Wed, 13 Dec 2023 08:26:49 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=WHE1LrPx;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=ZALAVFOT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.19; helo=wout3-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org)
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com [64.147.123.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SqWrQ17PTz30Np
	for <openbmc@lists.ozlabs.org>; Wed, 13 Dec 2023 08:26:12 +1100 (AEDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.west.internal (Postfix) with ESMTP id BEA423200BC5;
	Tue, 12 Dec 2023 16:26:06 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Tue, 12 Dec 2023 16:26:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1702416366; x=1702502766; bh=sSjdHmzFkJ
	HMntNe3VnS1LhRCtKo8QqUyWAhXCZ70P0=; b=WHE1LrPxW/c8rB7vEZM04GO8ip
	5VHrTmH2EiuzMtpXi7qK9BjH/yXJ/BnnZzBa27ERwWfjNJi8pPSZ6RaHD13SD6V+
	4J/XoPBmGyiVUPbN+2zX3v3l6VDiyOJfgYn5nT3qLOAqoQB32pBtCziufVBaPH2Y
	8771hbBxGdnpIrkR/ufUQx1xU3QzVEFouPT93JtzXrLWcamYKhR1fuT7jQ5xtDKL
	iUFb4VaWsYc7YQmp5M5LvlAlIWALtX522k5Dd0BWDWAYOMTTuf9vK6UolxT/j3tV
	gPa0RGQh7mkFnJUKjE7xeFPLCcSV32aH1QrXV+IemzsNiID1VcnCn7PsNaQA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1702416366; x=1702502766; bh=sSjdHmzFkJHMntNe3VnS1LhRCtKo
	8QqUyWAhXCZ70P0=; b=ZALAVFOT8V9l0RR7qnrNk6F2hxjLrtUESIUurcE6THSA
	9fmIEGOsicjxGlHgesaFVwHKsw700LnGCveDE3v47Y9o1GaLoc1rctCKtYTc5Epy
	M63aLuY3M3NHpIaefxUdVqu37ylFH5tAjJ9EkDLHVW1LbhDYKCTvAFML3Ib9B1/k
	7Q4XPrdraHLupRAlVETeJcNN/zCBySpCetTJHgXF1zspH6Yk6sNGZX22g13hn9SV
	G0Eop9vSJPuNlhHCcfdmeqPG1EZ9kiL7EgPLhbQfWUbqLdWBBT4bBvzWP5GkJHNU
	yDInIAlSmWEuq5xBrpA9imoS5YFCuG3E8MpAQOnTBQ==
X-ME-Sender: <xms:7c94ZaZDzlyY1pev1KPioF2qwKEDY5yrNBWLiCm6a_HqcR7HbltFlA>
    <xme:7c94ZdYNmG2Cr6cZF885glHShTnh6puvmRyfsMX59abrykm3dMdDcsABZ3-5ydXNo
    gaDiZGWnvP4tDzzcoU>
X-ME-Received: <xmr:7c94ZU-A1JLtmg6VEOOebYSjj_Wdi1cApuXbB9Bc-TMrLEEwm1fqKphraPMmmf88pkGTtZa_fJ9qPmCXQFVd1VPUAuH5TQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrudelgedgudeghecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecufghrlhcuvffnffculdefhedmnecujfgurhepff
    fhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomheprfgrthhrihgtkhcuhghi
    lhhlihgrmhhsuceophgrthhrihgtkhesshhtfigtgidrgiihiieqnecuggftrfgrthhtvg
    hrnhepueefheeuhfdvkeevueegtdelheevteduleduffeuledutdejvdfghfettdetvefg
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgrth
    hrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:7c94ZcoHeX_10ufp_vfouJFsAnkn_ogLVEv64uPC7IjJBAVgdDjeBA>
    <xmx:7c94ZVqRA5p6j1MkY6dJq-oeB6go2e6hhJU3XB1377wWfEwGVe4u3Q>
    <xmx:7c94ZaRb-lPtsUUMRccqIPPGGuTWoRbV7sLuoIR0SVaqHMWZmPbIAQ>
    <xmx:7s94ZUS4za0w9W-o_5zc2-rEkQDEaR8K6EofwLlLxxg9cHgX_vNj-A>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 12 Dec 2023 16:26:05 -0500 (EST)
Date: Tue, 12 Dec 2023 15:26:04 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: Re: [PATCH dev-5.6 1/3] net/ncsi: Simplify Kconfig/dts control flow
Message-ID: <ZXjP7D8bqdjfNre_@heinlein.vulture-banana.ts.net>
References: <20231205234843.4013767-1-patrick@stwcx.xyz>
 <ZW_HqYQADoCeFvYc@heinlein.vulture-banana.ts.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZW_HqYQADoCeFvYc@heinlein.vulture-banana.ts.net>
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
Cc: joel@jms.id.au
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Joel,

I realized I used "5.6" as the prefix on these when I meant "6.6".  Can
these be picked up as is or do you need me to resent?

On Tue, Dec 05, 2023 at 07:00:25PM -0600, Patrick Williams wrote:
> On Tue, Dec 05, 2023 at 05:48:41PM -0600, Patrick Williams wrote:
> > (cherry picked from commit c797ce168930ce3d62a9b7fc4d7040963ee6a01e)
> 
> These patches were cherry-picked from the net-next tree and thus are
> tentatively going into the 6.8 tree.  I've applied them onto our 6.5
> tree, but they should apply cleanly to 6.6 also.
> 
> -- 
> Patrick Williams



-- 
Patrick Williams
