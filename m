Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F894EB7C8
	for <lists+openbmc@lfdr.de>; Wed, 30 Mar 2022 03:26:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KSpgh15KKz2yZw
	for <lists+openbmc@lfdr.de>; Wed, 30 Mar 2022 12:26:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm3 header.b=PxqmyVSI;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=Mm0sFu5m;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.27;
 helo=out3-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm3 header.b=PxqmyVSI; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=Mm0sFu5m; 
 dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KSpgH44yTz2xBF
 for <openbmc@lists.ozlabs.org>; Wed, 30 Mar 2022 12:26:35 +1100 (AEDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 882755C00A2;
 Tue, 29 Mar 2022 21:26:33 -0400 (EDT)
Received: from imap49 ([10.202.2.99])
 by compute5.internal (MEProxy); Tue, 29 Mar 2022 21:26:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; bh=mVay7p+bt/5OjPkz6qh+GPSPJGzgAVZVawurzF
 mYCbc=; b=PxqmyVSIimpKVvke/QKvo4/XGS9eU6WjQ1nGz5Yh+rWf7TnnI1O06B
 C0C2w/wPXr4dG6h/fV0iBWZNF/YLT1LdksY0r7Qn301U4QMdzqKIxWhrybr8avHE
 OCryU/ATmI68TR5EqAqSfwP6MlBnGbiQh6JiEGy+ixeg1/6moRPg/zmmT8/fdhoF
 TtBvgFn35v9bfJWcwOUkPKmB5aIq6mf4t9XZAWqYxsKtroHSXm3ulhHrK7dZqpyx
 xZGf4quWm5tvZxy6vCvrOR2h3a8qqAFrT2aPfH9PsEeOPBM8gPaSkkv8mXYBbgNj
 zai5J40MUvC5jtHzpg6Kk42s08XYMrBg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=mVay7p+bt/5OjPkz6
 qh+GPSPJGzgAVZVawurzFmYCbc=; b=Mm0sFu5mfvZ3GMGDFPTK0TJq0VttVZ2Tl
 g4FUSnENJNBzNTD2nX1iz7r/7k2s1Qw6aaxbArazNA+hnY4Ib8qGVi+N8V6KfcBU
 OJpG0g8nacJLAKB3wa/3r0e6D5mEr1uCnzQdTIRCZHoPh+ykC9t0AOW3Of6kTqFK
 BI4iGmYdrVV+qSAvy0TGAhxJEyhn4djmCToQeeUIqQrXR1iKMH0K+l5DqppW0wYH
 o/KO4ryzamJcqm9i9Di2XwrgRmdTrXKIXf/NCNFYwFiuqRzzHzXmfog9yOCiulLZ
 7rzDTsuds188DlMDZ577HCfW9IfEjj+NHFHdKh5mekaXlMlnx856A==
X-ME-Sender: <xms:ybFDYqHdZ_ItUn-6rgT0v7A_F7yRe9H7dFN8CMAOltU1lIZ_o2QoYw>
 <xme:ybFDYrUfur1pOytJennOBfvwTjX5vF2Phoj-HHCxVL1uabhJxI9qS-_tTQuuCnMhW
 I7juAZKuDJFvW-Zjg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudeiuddggeehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhephefhfeekgfekudevheffheeihedujeefjeevjeefudfgfeeutdeuvdeh
 hfevueffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:ybFDYkJ2-CgX8WPFAS-JxjxHtHoMLa2COEIkDQ3W5I5xFVjgf8jRig>
 <xmx:ybFDYkESxTGGUfuzokDf2YACyiS6pd9kY8ciIkIFLPkuygzOa44C6w>
 <xmx:ybFDYgXwfq1lyNUNiuhbNPctaIO-4LL-wJtFnRk5ZgW3IYRP_R1M-Q>
 <xmx:ybFDYuyxFt6BnNmn5CKItwcQy5-eTS_zuR2ZwFCcoMpwmrpvr5PFnQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 42787F6043F; Tue, 29 Mar 2022 21:26:33 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-4911-g925b585eab-fm-20220323.003-g925b585e
Mime-Version: 1.0
Message-Id: <d61fb380-aab2-436f-810f-2cd4d1cc2847@www.fastmail.com>
In-Reply-To: <YkM6yAHSWubX7Nh1@heinlein>
References: <4bc2b30d-b335-4457-9601-9c7226d6c656@www.fastmail.com>
 <YkKYdecCGm4vGMUa@heinlein>
 <5ff7a5e4-1c8d-4707-906f-efb3b40b8d48@www.fastmail.com>
 <YkM6yAHSWubX7Nh1@heinlein>
Date: Wed, 30 Mar 2022 11:56:12 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Patrick Williams" <patrick@stwcx.xyz>
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



On Wed, 30 Mar 2022, at 03:28, Patrick Williams wrote:
> On Tue, Mar 29, 2022 at 09:22:01PM +1030, Andrew Jeffery wrote:
>> On Tue, 29 Mar 2022, at 15:56, Patrick Williams wrote:
>> > There has been talk previously about making something like
>> > `.openbmc/config.json` as a further configuration file where we could
>> > enable / disable all these check.  I think it would be worthwhile as a
>> > way to eliminate many of the "search for special file X" checks we have
>> > where we simply touch an empty file, but I suspect we really shouldn't
>> > be using the "touch a magic empty file" mechanism anyhow.
>> 
>> This is related but is starting to feel a little tangential. I think we 
>> can get away without trying to switch things to a json config for now?
>
> I wasn't sure the scope of what you wanted to tackle right now so I was
> giving you the full-spectrum of my thoughts. 

Yep, that's fine, I was just trying to indicate which bits of the 
conversation I hoping to avoid focus on. However:

> We could certainly make a
> tactical solution that resolves the issue in EM, but I think we still
> have a mess on our hands w.r.t. specifying what linters and formatters
> are ran in CI.  Random dot files, deviations in formatting rules between
> languages, and undocumented combinations of testing are all artifacts of
> the mess

Can you be more concrete in your concerns here? Can we enumerate them so
we can make the call on whether to tackle them or not? Reading this my
thoughts were:

* Random dot files: Are we labeling e.g. .clang-format as "random"? Or
  specifically other things, not that? What specific files are we concerned
  about?

* Deviations from formatting rules between languages: Is this aimed at C
  vs C++? You can't really apply C++ formatting to e.g. Python, so I'm
  not sure what distinctions your making here

* Undocumented combinations of testing: Is this a comparative statement
  between support for the different build systems? Or something else?

Andrew
