Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D1863112EE
	for <lists+openbmc@lfdr.de>; Fri,  5 Feb 2021 21:59:17 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DXSTG0RlbzDwmP
	for <lists+openbmc@lfdr.de>; Sat,  6 Feb 2021 07:59:14 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fuzziesquirrel.com (client-ip=66.111.4.27;
 helo=out3-smtp.messagingengine.com; envelope-from=bradleyb@fuzziesquirrel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com
 header.a=rsa-sha256 header.s=fm1 header.b=keERmY6b; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=oV5/CRK6; 
 dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DXSSD2ZHmzDwkt
 for <openbmc@lists.ozlabs.org>; Sat,  6 Feb 2021 07:58:18 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 132F75C01A1;
 Fri,  5 Feb 2021 15:58:15 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 05 Feb 2021 15:58:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 fuzziesquirrel.com; h=date:from:to:cc:subject:message-id
 :references:mime-version:content-type:in-reply-to; s=fm1; bh=x83
 dhe/o05sDIevJLq0e+nDpfRwnoI5Vr/JMmQdgsX4=; b=keERmY6buz9etbRXESM
 JWFq0+PjUb+zDF9Tw/wDU05Fl30uniIGkpA6VwpNqAIrnzy8+pLPjKdip3K3s78l
 OJ8eShP/q8/6BNHWTqbrV0RYnQLC+NEy6Jz8dxsYIx/btQLQBxUDoqXPOCN9GkKj
 HLOjYjxo+eepGKAlJZ8m25VSIPCuO7iLLNCLqFJlhdPSU5pucm8z1oPEWOwJ5mUZ
 qRzYRaYj+LFJDGA/Lx7SYY6+Ji6sfb9yEVsfGjgZXUSkidc1XjpbNBMkOAiBByLp
 O3cUG440HzC2LwT0vUT3/8DmP2BBbgJEKZYzkyD65OkAkHSgfRfz3c8QiPLsO1tj
 jbw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=x83dhe
 /o05sDIevJLq0e+nDpfRwnoI5Vr/JMmQdgsX4=; b=oV5/CRK6aJZ4wCfW1Gwx1y
 NOlna+V5kIzwnezDMYF4eYx35ah/gkXydE7GScyyJX8rbV7b83U7t7Hb67WrsH5Q
 bPSv6M/ThGA+JmJ+GKune3vAIB45B7osAgJzCmX/YYUag8ZchnyqqPfIe7BQxBXa
 NXdb/HeDrm0I+Vka1Cvk3VgXW35c0hutRkyJf8zGkY8l25OfsdUdoWXa21wBkh8w
 z8dkWQUyyliEJ1IhJcN4yEF0qCANAvX/QQ6MRMOUa9tJyPM5Pmt1oO41wg3YLkPd
 od3R9oNz2pMgwpDgoFA7hAocWJQ8L5QOgiN6rFycmfd+qRfHIRof5hDA1LbeDAtA
 ==
X-ME-Sender: <xms:ZbEdYCLEkG3e9kX_hHn5rexKm8pC1IJ9HtW_HTLiswTkTuylxyy9yQ>
 <xme:ZbEdYDzBxt1CKUSvwVVpFTphc-cRymVWo0k2fmI60OVBFs43qAoRlIAJhglfWgntY
 GpTHLIZY1WiwLwYul0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrgeeigdduvdekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeeurhgrugcu
 uehishhhohhpuceosghrrggulhgvhigssehfuhiiiihivghsqhhuihhrrhgvlhdrtghomh
 eqnecuggftrfgrthhtvghrnhepgeelleekhfevveeuieehtdeuueehtdfhgfegudelueeh
 tddtvefhffefgedtvdetnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepud
 ejfedrudeijedrfedurdduleejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghm
 pehmrghilhhfrhhomhepsghrrggulhgvhigssehfuhiiiihivghsqhhuihhrrhgvlhdrtg
 homh
X-ME-Proxy: <xmx:ZbEdYCsmXtzjBUeJ6xUveDeQJSmHzw7tvRYOM9htBjcnqG93Eug-RQ>
 <xmx:ZbEdYKvqghhAddXbq__3X9OgPUbgsd2wWsqrlx2QQncPWDlE8HUJtw>
 <xmx:ZbEdYHMQApeabh2GGAcwaU_Yd36wl7TmV8Nenokf1RoI-EX3CL7GeA>
 <xmx:Z7EdYF6IYVYhDl5WgoTl-s5904c5Qk6GhQYkzLujQF0kNQYiR4nldw>
Received: from thinkpad.fuzziesquirrel.com (unknown [173.167.31.197])
 by mail.messagingengine.com (Postfix) with ESMTPA id B3FAE24005B;
 Fri,  5 Feb 2021 15:58:13 -0500 (EST)
Date: Fri, 5 Feb 2021 15:58:11 -0500
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Ed Tanous <ed@tanous.net>
Subject: Re: Making the "new repo" requests go faster
Message-ID: <20210205205811.7xdjwjekmoaqnzvu@thinkpad.fuzziesquirrel.com>
References: <CACWQX80G75i+s8Vcro64uEyvcZn1Dc60y-coS6GqrvkJo59Kqg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CACWQX80G75i+s8Vcro64uEyvcZn1Dc60y-coS6GqrvkJo59Kqg@mail.gmail.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Feb 05, 2021 at 12:02:31PM -0800, Ed Tanous wrote:
>An issue I've seen in the past with adding new repositories, is there:
>1. Isn't a clear place to push code reviews for something "new".
>2. The project quality/CI/formatting rules aren't really enforced
>until after you request a repo, then push code to it.
>3. Setting up a new daemon with CI/build is non-trivial, and has sharp edges.
>4. "state of the art" build constantly changes (make -> autotools ->
>cmake -> meson, clang-format, clang-tidy, shellcheck, cppcheck,
>service file location, ect).
>
>In an effort to fix these issues and more, I'd like to propose
>creating a new repository for a "new daemon" template.  The hope would
>be that we can centralize a single set of "current state of the art"
>guidelines in such a way that they're usable more than just checking
>them into documentation.  Initially, template repo would contain:
>
>1. A meson file, that compiles a "hello world" dbus application that
>requests a name.
>2. All the relevant .clang-tidy, .clang-format, and cppcheck files
>required to ensure that CI is testing as much as we can.
>3. Unit tests
>4. Pre-integrated repo CI.
>
>The end goal of this would be that when new code is created, whomever
>was looking for a new repository could push a gerrit review to this
>"template repo" and the CI could ensure that it met the automated
>quality requirements long before any maintainer actually reviewed it.
>This would likely reduce the time it takes to propose "I want to add a
>new repo" and make a procedure for doing it a lot more concrete than
>sending an email to the mailing list.
>
>As part of this, I'd also want to deprecate and remove the .clang-tidy
>and .clang-format that are present in the docs repo, and supersede
>them with the files in the new repo, such that any changes to the CI
>infrastructure could be proposed on the template repo first.
>
>FWIW, I take no credit for the above idea, I 100% stole it from James
>Feist, who thought through the broad strokes of this a while back when
>we were talking about how to move new initiatives along faster without
>burdening maintainers.
>
>I'd love feedback.  Do others think this worth doing?

Yes!

These are all great ideas.  Thanks for tackling this.

Since I'm the only one with the right gerrit/github authority to create 
repos, I've obviously been the cause of the delay (there are others that 
can but this isn't really something they'd be comfortable doing).

For the record, making new repos from a logistics point of view is not 
hard and not any sort of burden on me.  I'm happy to do that.

I don't know if this is a good excuse or not, but I just want to say 
that in a some of the past cases making the repository took so long 
simply because there did not seem to be any clear consensus on whether 
the new repo was good or bad for OpenBMC.  When you combine that with 
the fact that I'm not really good at making unilateral decisions, many 
times the result was "analysis paralysis" on my part.  This is a big 
part of why I'm creating and excited about this: 

https://lore.kernel.org/openbmc/20210111220919.zwc727vbwc4itm7h@thinkpad.fuzziesquirrel.com/#t

-brad
