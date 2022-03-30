Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D11A14EB7B9
	for <lists+openbmc@lfdr.de>; Wed, 30 Mar 2022 03:18:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KSpV85yZgz2ymf
	for <lists+openbmc@lfdr.de>; Wed, 30 Mar 2022 12:18:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm3 header.b=HilC+wng;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=n6TxJyMm;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.27;
 helo=out3-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm3 header.b=HilC+wng; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=n6TxJyMm; 
 dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KSpTg2JHlz2xsM
 for <openbmc@lists.ozlabs.org>; Wed, 30 Mar 2022 12:18:14 +1100 (AEDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 94A465C01C8;
 Tue, 29 Mar 2022 21:18:10 -0400 (EDT)
Received: from imap49 ([10.202.2.99])
 by compute5.internal (MEProxy); Tue, 29 Mar 2022 21:18:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; bh=0Cqv0OKZmwG0g/ypwmmVpmHJX0VamUjt8vwLKf
 Ii7Dg=; b=HilC+wngicQL2e2hZzsU1Y/I1b5J/EucgT871EFGIFhLq9TTQwmXwO
 GwhzoMEy0JJC/4nH++UWdE+gaqfwNDiegheAbuWjw+TaR1nBF2e9WQ1uTon9rioN
 W8WveSmY0ktCeJ7XErsrozhA0+1Vms+kAL26daHVnvzsNCcFpLkkpJ/U48CH34e9
 ZQzSU6nJhhf8PgReegbcEL1+Z+DoWRRTcT07ihx92KbBLPDsbq/iXLgvAdsM1VoC
 Llaogd6UcPPxUAQA9+6qzObsLiUVDQo16+9h/uPjxAgDcj3EZ7vybsA6qMe8vqBV
 aA09Hk2shBkIDnR56Dcd1CXuBwl4h34Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=0Cqv0OKZmwG0g/ypw
 mmVpmHJX0VamUjt8vwLKfIi7Dg=; b=n6TxJyMmAnBdlSVVVw1iqvurJPFKDsmE7
 HMFbm6Wz0IXfApyWxgjs/w2oEOWY8TfS9s5DZxkprNESdGOnStkTzdTnUxP4q3l6
 ak4kZkEWr7qCa4H8ZLZTF2F1FSqEPCvDXmUmC48Ca08INBqPAu6cn0eCFFowHqVA
 Lh5o+T5TFaVV4Z3KbXQJ/cZ7O3uqp3y+/UZmSV5NfJ6RSaMp5HPmjlG4Zxg+ay7Z
 A1wgBst+zeFhENL3HEmgv2A0mgGeExPO99F8GbTig1lE1U0PqK9yUl/MX3izqMmZ
 4KC/FVNp6ei3gSuHx3HVosp5hTwPqLUuAjl7IoPvJkmyRQON+mbAQ==
X-ME-Sender: <xms:0q9DYjjNBEWAKH2zzF4EfPpe6BIp1dhl6jlL5SCQcbhafqr81cHViw>
 <xme:0q9DYgDNAbuA8SLp9CbjKM5Dw7aqaYWBxYmlqBLokJG1AjDsgIEX_Wf25HmlJUyY0
 8T1Ox8D5QHqfA0H0w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudeiuddggeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhepieffkeehgffgffffteefheetfeeifeehkefflefhveffffelfedttdeg
 ffehgfefnecuffhomhgrihhnpehgihhthhhusgdrtghomhdptghonhhtrhhisghuthhinh
 hgrdhmugenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhm
 pegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:0q9DYjGhUjFb12aD8KOygJHMMjoQzKGG3CGVmHoCnaDl6KEDcJFN1w>
 <xmx:0q9DYgQUEJlDJ-dseYDiZQjQWkWbejJBBrMXjqOdPWFp5CP0O618rQ>
 <xmx:0q9DYgzix8WBEsO9TmH0gm_LK1LqFYL9x9GvKFW4fd2b1FabF4Uy8w>
 <xmx:0q9DYvqFzpb4BSYJJA23YPntccTZ210nT6Pd-EAQ_cpnxdmJGWxIVA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 07F4EF6043F; Tue, 29 Mar 2022 21:18:09 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-4911-g925b585eab-fm-20220323.003-g925b585e
Mime-Version: 1.0
Message-Id: <c591ee43-7387-467b-8233-ec7cf092423e@www.fastmail.com>
In-Reply-To: <CACWQX82FJw=wfpjfT9_T+bnvW85SJTca=yr7gOrSaY7Z7ShyAA@mail.gmail.com>
References: <4bc2b30d-b335-4457-9601-9c7226d6c656@www.fastmail.com>
 <CACWQX82FJw=wfpjfT9_T+bnvW85SJTca=yr7gOrSaY7Z7ShyAA@mail.gmail.com>
Date: Wed, 30 Mar 2022 11:47:39 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Ed Tanous" <ed@tanous.net>, yulei.sh@bytedance.com
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
Cc: openbmc@lists.ozlabs.org, Matt Spinler <mspinler@linux.ibm.com>,
 jiaqing.zhao@intel.com, Ed Tanous <edtanous@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Wed, 30 Mar 2022, at 01:59, Ed Tanous wrote:
> On Mon, Mar 28, 2022 at 7:08 PM Andrew Jeffery <andrew@aj.id.au> wrote:
>>
>> There are 4 possible behaviours that openbmc-build-scripts could take against
>> an application repository:
>>
>> 1. All code formatting is disabled: No further action
>
> Long term, is there a use case for this?  I realize it's required
> temporarily while we make all the repos consistent, but it seems like
> it should ideally be a temporary situation for portions of the
> codebase, and something that eventually we can just enforce globally
> in the project.

IIRC Lei added the behaviour so if you ran the docker container locally 
for testing you could disable code formatting.

>
>>
>> 2. No custom code formatting: Just do whatever the default actions are as
>>    implemented in openbmc-build-scripts
>>
>> 3. Some custom code formatting: Actions to run in addition to the default
>>    actions implemented in openbmc-build-scripts
>>
>> 4. Only custom code formatting: Actions to run in-place of the default actions
>>    implemented in openbmc-build-scripts (which must not be run)
>>
>> Currently openbmc-build-scripts only implements 1, 2 and 4, while
>> entity-manager had assumed 3 was supported.
>>
>> ## Background (AKA why don't we have support for 3?)
>>
>> Code formatting support in openbmc-build-scripts began with an implementation
>> of 1. However, along the way we introduced the phosphor-mboxd repository which
>> due to some unfortunate history has a mixed C and C++ codebase. The C code is
>> written in kernel style, while it was desired that the C++ be written in
>> OpenBMC style.
>>
>> At the time the problem arose, clang-format had two issues:
>>
>> a. It treats C and C++ as the same language, and so maintaining a code
>>    formatting split across those language boundaries requires two separate
>>    clang-format configuration files
>
> Is the core of the issue here that we have different formatting rules
> for C than C++? 

No, because we have other formatters too.

Anyway, this is just the background section that justifies how we got 
to where we are. Changing the recommendation for C code formatting 
wasn't something I was looking to debate here.

> clang-format is entirely whitespace changes, so could
> we solve this simply by just reformatting all the C code to the common
> project style, and we wouldn't need this anymore?  It seems like
> regardless of C vs C++ we should be consistent.

We could, but that's not what's currently documented:

https://github.com/openbmc/docs/blob/master/CONTRIBUTING.md#c

Andrew
