Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C3E94EB7BC
	for <lists+openbmc@lfdr.de>; Wed, 30 Mar 2022 03:19:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KSpWK1ZMgz2yg3
	for <lists+openbmc@lfdr.de>; Wed, 30 Mar 2022 12:19:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm3 header.b=i4x+tZ6z;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=MW4O7pPz;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.27;
 helo=out3-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm3 header.b=i4x+tZ6z; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=MW4O7pPz; 
 dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KSpVx08Tpz2xBF
 for <openbmc@lists.ozlabs.org>; Wed, 30 Mar 2022 12:19:21 +1100 (AEDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id DF31E5C01A8;
 Tue, 29 Mar 2022 21:19:18 -0400 (EDT)
Received: from imap49 ([10.202.2.99])
 by compute5.internal (MEProxy); Tue, 29 Mar 2022 21:19:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; bh=FZP2k7tuGXEDDGFGEUrmtEKo4dd7GLDNDXoUWB
 f7cJM=; b=i4x+tZ6z541Aj1gB4yJdhhEVIcsHFWs3oJrPmJY6fvi2habCkmowX7
 GqdZGx6/gIr5LYeHTimNFAIQD0ha3yxWf02WRGY5vc3OUDBqdIzcD85P5utbxZ6+
 YgC9kvvfhRYRGjcT94buxzNjPoFc+hcXlg7sZW61upTlPzAagJiXK/7br8OMO4zW
 h9AGgiPW64tNyn0/PkoS4CUdwAfTgyNcP2w30q6dt4u2kmrmMv065rfI2zSVjXV3
 nDxiPnCg0qORVvQuE+Waoum7T/EKtDD44kjc3txAEQKtaldjH/dBwhcxJLIUgGRP
 rIRsl+XvYzI+6Hnogd0TizLmEHjG/wkg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=FZP2k7tuGXEDDGFGE
 UrmtEKo4dd7GLDNDXoUWBf7cJM=; b=MW4O7pPzlFUuhBwk/UqqQPpBSRL06xgpK
 Zc0uhiUJpB1XPxva5ZuWrJCxxcxkIQ3h5jmhbzxQyAiB7sTubf1n8i/F2Xzw7h6j
 3kNaH17sKwkbQuwo/ObXGIA/C6X95PiTUNHsP2nNt5No/NvbRKDFryHLYWlLawAL
 +7jaGlNYZbhwVj3Tp5YNTnP+Uc9+apmwxyF0fI4tj9lV1F0BcEk++sOyl+ykMENw
 IcW0govv/Mkou8okDCXTCphL4wpCbhzAYmc90OrKW5PDJSZezgW31DRp5ZFbqOXC
 5OmFJX9NYriISnOAdXUiPkJjAG2ua89bLOsGx7NtM2sDgMHSJOzbQ==
X-ME-Sender: <xms:FrBDYm10EVfIeuGKPDsqCaVAvYXLzmsGLcbvfa3C_MXmnsAwWhpeRQ>
 <xme:FrBDYpGceuMbbNHxN55Zvu_Qid9r0xQeOVJMY3yirYRGhxYrcBli9rLgWhx8nkVsK
 4xytgqJJvLfuysthg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudeiuddggeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdlvdefmdenucfjughrpefofgggkfgjfhffhffvufgtsehttdertder
 redtnecuhfhrohhmpedftehnughrvgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrg
 hjrdhiugdrrghuqeenucggtffrrghtthgvrhhnpeekudegfefhieegueehhffhfeduveek
 jeeuheegjeegvedufedutdehvdeuuedvjeenucffohhmrghinhepohhpvghnsghmtgdqph
 hrohhjvggtthdrgiihiidpghhithhhuhgsrdgtohhmpdgtohhnthhrihgsuhhtihhnghdr
 mhgunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
 hnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:FrBDYu5H6w6QCSZcrLcLZxNiNMR2vrxDNfhgpJAa2rIURPUWdCg4zA>
 <xmx:FrBDYn3gGLUTQGxuaqq1kcgNASn70xqihr9r_EhTGD2s_HMHYJ0tGg>
 <xmx:FrBDYpGnxwqe_uizGXfTemAnd1jZyFE0Yco2oK4oV0arMAItaXr-kA>
 <xmx:FrBDYoxwxZkrvZbU0S4pUQHDvsctNGWTsRahOTh0luI2GpjF68BnCw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 6035DF6043F; Tue, 29 Mar 2022 21:19:18 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-4911-g925b585eab-fm-20220323.003-g925b585e
Mime-Version: 1.0
Message-Id: <6672ac45-4f02-45b3-a0e5-b30b527070f5@www.fastmail.com>
In-Reply-To: <fd5ff423-6392-b0a5-8e3a-27926508cc01@linux.intel.com>
References: <4bc2b30d-b335-4457-9601-9c7226d6c656@www.fastmail.com>
 <CACWQX82FJw=wfpjfT9_T+bnvW85SJTca=yr7gOrSaY7Z7ShyAA@mail.gmail.com>
 <fd5ff423-6392-b0a5-8e3a-27926508cc01@linux.intel.com>
Date: Wed, 30 Mar 2022 11:48:58 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Bills, Jason M" <jason.m.bills@linux.intel.com>, openbmc@lists.ozlabs.org
Subject: Re: Defining the behaviour of code formatting in openbmc-build-scripts
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Wed, 30 Mar 2022, at 02:48, Bills, Jason M wrote:
> On 3/29/2022 9:29 AM, Ed Tanous wrote:
>> On Mon, Mar 28, 2022 at 7:08 PM Andrew Jeffery <andrew@aj.id.au> wrote:
>>>
>>> Hello,
>>>
>>> Review of https://gerrit.openbmc-project.xyz/c/openbmc/entity-manager/+/52406
>>> sparked some discussion about what we actually want from the code-formatting
>>> support in openbmc-build-scripts going forward.
>>>
>>> ## General statements
>>>
>>> Enforcing code formatting in CI is effective in that it ensures style from
>>> multiple contributors is consistent with minimal maintainer intervention.
>>> Sometimes the automated formatting might be questionable, but the judgement is
>>> that on the whole the consistency is a better trade-off than occasional
>>> enforced untidiness. There are also escape hatches to disable formatting in
>>> extreme circumstances. Automated code formatting is desirable.
>>>
>>> clang-format is at the heart of OpenBMC's code formatting support as the bulk
>>> of the OpenBMC codebase is written in C++.
>>>
>>> ## The problem
>>>
>>> "Like all Vogon ships, it looked as if it had been not so much designed, as
>>> congealed." - Douglas Adams, The Salmon of Doubt
>> 
>> Don't panic.
>> 
>>>
>>>
>>> Code formatting support in openbmc-build-scripts has evolved over time and
>>> no-one has ever written down what we actually want. The lack of concrete
>>> requirements has lead to an counter-intuitive and convoluted implementation
>>> that has ended in some repositories (e.g. entity-manager) not having their code
>>> formatted as expected.
>>>
>>> There are 4 possible behaviours that openbmc-build-scripts could take against
>>> an application repository:
>>>
>>> 1. All code formatting is disabled: No further action
>> 
>> Long term, is there a use case for this?  I realize it's required
>> temporarily while we make all the repos consistent, but it seems like
>> it should ideally be a temporary situation for portions of the
>> codebase, and something that eventually we can just enforce globally
>> in the project.
>> 
>>>
>>> 2. No custom code formatting: Just do whatever the default actions are as
>>>     implemented in openbmc-build-scripts
>>>
>>> 3. Some custom code formatting: Actions to run in addition to the default
>>>     actions implemented in openbmc-build-scripts
>>>
>>> 4. Only custom code formatting: Actions to run in-place of the default actions
>>>     implemented in openbmc-build-scripts (which must not be run)
>>>
>>> Currently openbmc-build-scripts only implements 1, 2 and 4, while
>>> entity-manager had assumed 3 was supported.
>>>
>>> ## Background (AKA why don't we have support for 3?)
>>>
>>> Code formatting support in openbmc-build-scripts began with an implementation
>>> of 1. However, along the way we introduced the phosphor-mboxd repository which
>>> due to some unfortunate history has a mixed C and C++ codebase. The C code is
>>> written in kernel style, while it was desired that the C++ be written in
>>> OpenBMC style.
>>>
>>> At the time the problem arose, clang-format had two issues:
>>>
>>> a. It treats C and C++ as the same language, and so maintaining a code
>>>     formatting split across those language boundaries requires two separate
>>>     clang-format configuration files
>> 
>> Is the core of the issue here that we have different formatting rules
>> for C than C++?  clang-format is entirely whitespace changes, so could
>> we solve this simply by just reformatting all the C code to the common
>> project style, and we wouldn't need this anymore?  It seems like
>> regardless of C vs C++ we should be consistent.
> I agree with this. I have some C code that I just let format according 
> to our project style, and it makes formatting much simpler.

There is this:

https://github.com/openbmc/docs/blob/master/CONTRIBUTING.md#c

Though it does give you the flexibility to do what you're doing.

Andrew
