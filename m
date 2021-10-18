Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E01A4326DE
	for <lists+openbmc@lfdr.de>; Mon, 18 Oct 2021 20:50:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HY5Y1648Dz2yws
	for <lists+openbmc@lfdr.de>; Tue, 19 Oct 2021 05:50:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm3 header.b=T5klUbmt;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=PjGqp/IB;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fuzziesquirrel.com (client-ip=64.147.123.24;
 helo=wout1-smtp.messagingengine.com; envelope-from=bradleyb@fuzziesquirrel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com
 header.a=rsa-sha256 header.s=fm3 header.b=T5klUbmt; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=PjGqp/IB; 
 dkim-atps=neutral
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HY5XX6VyMz2yn9
 for <openbmc@lists.ozlabs.org>; Tue, 19 Oct 2021 05:50:04 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 84E1F3201D2B;
 Mon, 18 Oct 2021 14:50:00 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 18 Oct 2021 14:50:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 fuzziesquirrel.com; h=date:from:to:cc:subject:message-id
 :references:mime-version:content-type:content-transfer-encoding
 :in-reply-to; s=fm3; bh=lBBiA5hHhRokOF95xCtjRLyeuxRoENwNJvFOHrF9
 uaA=; b=T5klUbmt3iAg9nO25yx1aVRCmXRjWqKIgUi8gxjsad6mXpDCTj2SK0jN
 g+Jlc/fPMjmwiMfJxHYWa0IfiLR8tlBZ9L2ZUp9r3TUgr3Ky1QqzvBpiij3mcfhK
 qYqtkdAbna14NBgDZ5bgfcW+D/VdS6cBjkvOX9w4QMgnYbNpyAYwhN/8+yc8Avwy
 Q6b1kwJ5ch55LsE1l/XK++9a49S7Bj0IkLSlQ5+XUbG/l5PHWtE7pRZmwSC3QtFC
 XcnTJG5l+nKvzXBgSeGSkl2IdnA34aOQsTKZwfRHwVh6Nx3bZ9NYbnYeDIEyR1Cs
 ZWyJzu4r349ZsMn0bOST5s4tH54mog==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=lBBiA5hHhRokOF95xCtjRLyeuxRoENwNJvFOHrF9u
 aA=; b=PjGqp/IBocXw+gnmY24cTu3WGCJMEbBIUDWkrOclmxeMe/pS1J/w5jYeA
 LoXZMOJluDnUrrYjPhWNVf5jY3cfbMcDQWALt7Qd+/WZiFVomChRlCcNs2ayF61Y
 CYfUDqhyEXpXkDGbWr37+gPmcGoTp1iVNnt88fPKagyhjgLtvE8vJC+iIZ63OKlm
 6gRyEyLsJYDoMyKHmzP9Ii3HHmjmrLaEB34ej0dpC3YSoB1BrCd0a1ZcuWpEU7n9
 c+gr5ngFZyFH8yz/VFYjetCD4x8dcJ4jR3vQuupbifWiNtDqaC9l6GsGaOkIildR
 HTjt1lqsQYltLs0mWSgrGKxnkQ4zQ==
X-ME-Sender: <xms:18FtYR7CPtnOtH5Y0HbFQaC7REOvbaS38c1POPJ6ym5mOOssu9g5dQ>
 <xme:18FtYe62vSF8Ko8aIRI_h_Fx9TogsrXfFIKEBXtgDD2iwJxbNxNBvqfuGNJ6hyVWA
 Cu-xSWPA6-nlQPq_SU>
X-ME-Received: <xmr:18FtYYcP6c7qo33kiUcadqXKO1_Ph0WppiSzZi5eNYnyBLBs7dD6KGMk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvddvtddguddvjecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpeeurhgr
 ugcuuehishhhohhpuceosghrrggulhgvhigssehfuhiiiihivghsqhhuihhrrhgvlhdrtg
 homheqnecuggftrfgrthhtvghrnhephfejueelieeufeffheefiedvveeiveeihefgkeel
 teelkeeiffegfeffudeugfevnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucevlh
 hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsrhgrughlvgih
 sgesfhhuiiiiihgvshhquhhirhhrvghlrdgtohhm
X-ME-Proxy: <xmx:18FtYaJShiTFC7v7VoaWksmg-ihmocP0D-qCsUQUZV2EGHmMtBLc4g>
 <xmx:18FtYVJ_CiF0IBfT7B3AFserEs72FsMPubKU6w6ZXaV3ApbT9jfZ9w>
 <xmx:18FtYTx-WnzBDlT1fFr1XBlX0Bp5xkVu1SS8Hz1CL5-6IYDDqoe5dA>
 <xmx:2MFtYThQZM2f6O-DssWQ8jllggJztbc_1UqXgp5E_JqkT5AEvoKpwA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 18 Oct 2021 14:49:59 -0400 (EDT)
Date: Mon, 18 Oct 2021 14:49:58 -0400
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Andrew Geissler <geissonator@gmail.com>
Subject: Re: Start using github security advisories
Message-ID: <20211018184958.zajwqmloxsyxmxv2@cheese>
References: <62b15edd-110a-3574-66c5-d11299bbd38c@linux.ibm.com>
 <67C8A5BA-9FD5-4804-B5CA-C2687FC17889@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <67C8A5BA-9FD5-4804-B5CA-C2687FC17889@gmail.com>
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
Cc: openbmc <openbmc@lists.ozlabs.org>, Joseph Reynolds <jrey@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Oct 14, 2021 at 02:12:20PM -0500, Andrew Geissler wrote:
>> Per today's Security working group meeting, we want to start using 
>> [GitHub security advisories][].  I think we need someone with admin 
>> permissions to github.com/openbmc/openbmc to create new advisories. 
>> Then we'll want a group (team? perhaps security-response-team) with 
>> the current OpenBMC [security response team][] members.  (I have that 
>> list.)
>
>Looks like you’ll need admin authority on openbmc/openbmc in order to 
>utilize the security advisories feature. I wonder if it’s better to 
>create a openbmc/security repo and we can give you and the security 
>team admin of that repo for this work? This would also provide a 
>potential location to track github issues for the security team.

This was my thinking as well Andrew.  I'll create 
openbmc/security-response if I don't see any complaints in the next 
little while.

-brad
