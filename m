Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A82930A90A
	for <lists+openbmc@lfdr.de>; Mon,  1 Feb 2021 14:49:16 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DTq6x4X7hzDrTL
	for <lists+openbmc@lfdr.de>; Tue,  2 Feb 2021 00:49:13 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fuzziesquirrel.com (client-ip=66.111.4.29;
 helo=out5-smtp.messagingengine.com; envelope-from=bradleyb@fuzziesquirrel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com
 header.a=rsa-sha256 header.s=fm1 header.b=XL1m7BVq; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=e7SymJYC; 
 dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DTq5l3HZSzDr3r
 for <openbmc@lists.ozlabs.org>; Tue,  2 Feb 2021 00:48:09 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 54C325C013C;
 Mon,  1 Feb 2021 08:48:05 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 01 Feb 2021 08:48:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 fuzziesquirrel.com; h=date:from:to:cc:subject:message-id
 :references:mime-version:content-type:in-reply-to; s=fm1; bh=RAu
 FqUZgSN4bGHpRuboLggKYJXODHh9NLkIEAER134k=; b=XL1m7BVqbyMH+vtRcq9
 TmhzBFXQOzDHIo85N7sXUWGonlzn/hD8Fjes18ry8fJy4XvsQkibwjY/FPgF0rgE
 uu09B3LJewrzT+C1B5CnCjJDvl3Am75bN5LWYPc02nhtOFJBB1wRB1oLAg0crFFH
 7fOAwasvYxjaR60f3FoicslHmFVOM2tG2hzLIr7AVyI3z3BO4zNyigm7FuACXZIW
 z29AqYbVANYchX3Yg7rA/hmBAsLR2pFGzLWnpXYz1Dp1e/GdH78BDJDHLyewxpNs
 u9T6gdwROeVGfTxKBDo9EMTsbquEm2ooQeUU/ktBWbhGw4Pqm9RArmpnwixmEXQx
 2Ow==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=RAuFqU
 ZgSN4bGHpRuboLggKYJXODHh9NLkIEAER134k=; b=e7SymJYCcj8l3VjmTGcRAL
 nL7b1AJLZRkQhLheUndIzHUpYR6HrKrYUbXHT9mrLC44iVHkxMQbwEHlIKcNn6Gy
 zMWlyZMdw75MORj8nwJQmpa3BQHnPgO1TBdRAkgD59x/Mu4weda+QB91Q67MULaO
 2xp0jhBqsqTOLnD8GsigwbdfU2BJgjPwHREdLB8Y1zSG6vPN4EC6Pf5cAhB3wmqW
 houYxCF1OSuCBlOXBmhBZf+PHl/XmvIoSgeHZ4eFZw0hx0WM90UkbwLLO6ccMcJU
 m+RW6KvRgAQZjCBlDN5dFqvjKEGG0Z08c2eOlL//g9yLbrr4htiD9644eGWIF9kg
 ==
X-ME-Sender: <xms:lAYYYCSMVnqs_w80uFW27rMWzHGRv5_GLVO6DyyghhjqRKMsC11G3Q>
 <xme:lAYYYHwf6IlNYsdI74H5fSr7l4eyshcTxZHVVxeyV7peqb8bwB8gsNhNSQPP67D6y
 ZU3nYOTaIot9cpToes>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeekgdehiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehrrgguuceu
 ihhshhhophcuoegsrhgrughlvgihsgesfhhuiiiiihgvshhquhhirhhrvghlrdgtohhmqe
 enucggtffrrghtthgvrhhnpeegheejgfeutdffteegfeefheeileejtdefgffhgeeuhfdu
 veejleefkeejgeeiueenucffohhmrghinhepghhithhhuhgsrdgtohhmnecukfhppeduje
 efrdduieejrdefuddrudeljeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhep
 mhgrihhlfhhrohhmpegsrhgrughlvgihsgesfhhuiiiiihgvshhquhhirhhrvghlrdgtoh
 hm
X-ME-Proxy: <xmx:lAYYYP0nz8nKQ-0nt1OHL7xn_BataIOM73Nbp_ZcszEmBGsN5q9I6A>
 <xmx:lAYYYODAQJMWNG7QZ9ft9nvHrnj6lJkvC4HRGlufPNyUGnX5dWS-Ag>
 <xmx:lAYYYLgjnyphFMJQM9XINb2--DDOmxEZ69eT-CEJT7Woc_0SrTB59g>
 <xmx:lQYYYLJnaMC9eYmkkbQ6kqq48liYbB4I5yIB9ntmw4wL6DAtCWht0g>
Received: from thinkpad.fuzziesquirrel.com (unknown [173.167.31.197])
 by mail.messagingengine.com (Postfix) with ESMTPA id AB3CB24005A;
 Mon,  1 Feb 2021 08:48:04 -0500 (EST)
Date: Mon, 1 Feb 2021 08:48:03 -0500
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: "Thang Q. Nguyen" <thang@os.amperecomputing.com>
Subject: Re: create meta-ampere folder in openbmc repo
Message-ID: <20210201134803.ok4bt3hd5xcrirjo@thinkpad.fuzziesquirrel.com>
References: <d5302c4f-c0c4-0bde-2a60-e943a2f41788@os.amperecomputing.com>
 <0e2507bc-f8c5-85c4-cd39-4c603a729f4c@os.amperecomputing.com>
 <da62c090-c6a0-1844-cc2b-44846b83c89d@os.amperecomputing.com>
 <3eff5596ee50878be8623c021816977f42111ea4.camel@fuzziesquirrel.com>
 <96568613-294f-8a3b-9aa9-7918b5df2d9b@os.amperecomputing.com>
 <20210130161537.gj6jhwvsnwgdkofa@thinkpad.fuzziesquirrel.com>
 <94d1598b-0dbd-17ad-3326-c581d583cc41@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <94d1598b-0dbd-17ad-3326-c581d583cc41@os.amperecomputing.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Lancelot.Kao@fii-usa.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Sun, Jan 31, 2021 at 08:01:08AM +0700, Thang Q. Nguyen wrote:

>
>Hi Brad,
>
>I just see 3 commits in the meta-ampere folder while we have 17 
>commits in github.com/openbmc/meta-ampere. Are the remain still in 
>sync?

Oops - I'm not sure what I was thinking.  I pushed the remaining commits 
- please let me know if anything looks wrong!

thx -brad 
