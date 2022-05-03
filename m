Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7138F51926D
	for <lists+openbmc@lfdr.de>; Wed,  4 May 2022 01:47:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KtGpY1svQz3bdp
	for <lists+openbmc@lfdr.de>; Wed,  4 May 2022 09:47:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm3 header.b=B+W0Q6gE;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=uRvPWdxN;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.20;
 helo=wout4-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm3 header.b=B+W0Q6gE; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=uRvPWdxN; 
 dkim-atps=neutral
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KtGp44p5gz2yZf
 for <openbmc@lists.ozlabs.org>; Wed,  4 May 2022 09:46:50 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 7FCC1320055E;
 Tue,  3 May 2022 19:46:46 -0400 (EDT)
Received: from imap49 ([10.202.2.99])
 by compute3.internal (MEProxy); Tue, 03 May 2022 19:46:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; t=1651621605; x=1651708005; bh=D03bJIDy5d
 S197eV1QEtKP5bF6LUOhPEnL6gabXn6PA=; b=B+W0Q6gEuHd7VadN7LBY5Oz4Ts
 xf7h7kKqExD4slf232j6/NW78kolDCFliutNdIKQ2FhgVU6bj94vvp8qLtr7fKj5
 OMJ5AxePbUdWcSwdg7lbIoqm1XgQxmVO8/ZoYgCizmopeSozAdosfbn5QM4Yk9eD
 RKeJpc54K8p+dX9hUQxuTMKd0pJSlDQZHibnkEaYiAAow/Wt+seoqmPqPTRc0rB6
 fUNUAMfwUcJDPy/MCZWY2SmqPWCkRwt8exvbtPG+f3iTpgmjse8pO3dtCwjFfI1L
 01dQ8JA4jyYxOYdpe5/m0Dz0bj8O2y9OvO10VOWTjzQfli6ExUuZvBrzl2DA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1651621605; x=
 1651708005; bh=D03bJIDy5dS197eV1QEtKP5bF6LUOhPEnL6gabXn6PA=; b=u
 RvPWdxNyOTFC9BX8Tg+Q0B1+kDBGz4EgGVsqB2WFkOEJpwekZzXTaOWgNqCtHi6z
 ZyGN5hGT0OUUIfpM4l3OrQf3ru4LO5DzU0n7mLCBTPGVP6bQptFo+WZw7tfrj3hA
 3gVdPRZLG2WiKQ0F+aOo6PjCqUZKnFY6/YSSb82AqpNbBlWycuS0PgY0v1mxX9PB
 7DvflP1Sxr4LQtFLdsnTsvoUP2dHNsienK5DpqGSvP57cAjb8FMOkHcB60mhqDcH
 GA585xnV989EZnQsTLUqvSPE97NitaUtRqlKsbtL2j+X450mpxgC0xHaBDLtQTVj
 MgGwPO2zVglAFghoErzGw==
X-ME-Sender: <xms:5b5xYtQ1SQT8nkWlHFQnF3rneYegH0hkY67zOHDqxOXLFFQ5Tzx5Fg>
 <xme:5b5xYmx_7ljzZ-YL2Hlc1gwox-jezjrare2e4Vkwv806wtY4MedCeYLFKKRYki2Da
 gyBs7w6A3TBNgmh6g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdekgddviecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhepkedvkeejkefgjeduffetteegjeekteetudevtdfftdeluddthfehveef
 teekieetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:5b5xYi2h9zqu7fSO-SZvFjjDqfY9snAcilo8uPOKL2E3rSD8eTHmGA>
 <xmx:5b5xYlB6nXYq7-jC6hZX-CFjimRGGJ_a5LuikXTAkkVSeMAC6H1_yw>
 <xmx:5b5xYmi49FoZmrwAwGZEAGUh6sk4L-TVF-HlKgrWBuWy6H6oix_7uw>
 <xmx:5b5xYqZ_K5I0Rm40EVPGF2HNmBruy-71IzejENeddcHvPjE_PSv8dA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 1E33115A007F; Tue,  3 May 2022 19:46:45 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-591-gfe6c3a2700-fm-20220427.001-gfe6c3a27
Mime-Version: 1.0
Message-Id: <3ae639dc-720b-49ba-ad07-879a009db144@www.fastmail.com>
In-Reply-To: <YnEZ3irWISTwEikW@heinlein.stwcx.org.github.beta.tailscale.net>
References: <16ba58d6-d06b-1c92-340b-e94119a47708@linux.intel.com>
 <YnBcJ6GPKIBpqYWN@heinlein.stwcx.org.github.beta.tailscale.net>
 <cfed9171-10fa-d8a7-e1e5-74cef23bc299@linux.intel.com>
 <YnEZ3irWISTwEikW@heinlein.stwcx.org.github.beta.tailscale.net>
Date: Wed, 04 May 2022 09:16:24 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Patrick Williams" <patrick@stwcx.xyz>,
 "Nirav Shah" <nirav.j2.shah@linux.intel.com>
Subject: Re: Running OpenBMC Daemons/Applications as non root using D-Bus
 Session/User Bus.
Content-Type: text/plain
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
Cc: openbmc@lists.ozlabs.org, nirav.j2.shah@intel.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Tue, 3 May 2022, at 21:32, Patrick Williams wrote:
> I think you'll find it hard to enumerate because our architecture is
> purposefully very flat.  I know the codebase fairly well and have thought
> about it for a bit and can only come up with one: kcsbridge (or btbridge).

IMO both kcsbridged and btbridged should be deleted and the 
functionality folded into phosphor-host-ipmid. The split that we have 
there is not useful or efficient.

In terms of what Patrick spoke about, that means even fewer examples.

Andrew
