Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C8842440278
	for <lists+openbmc@lfdr.de>; Fri, 29 Oct 2021 20:49:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hgs0x5QYBz2xX6
	for <lists+openbmc@lfdr.de>; Sat, 30 Oct 2021 05:49:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm3 header.b=M6SL5WMT;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=SRsdFG/l;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fuzziesquirrel.com (client-ip=66.111.4.29;
 helo=out5-smtp.messagingengine.com; envelope-from=bradleyb@fuzziesquirrel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com
 header.a=rsa-sha256 header.s=fm3 header.b=M6SL5WMT; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=SRsdFG/l; 
 dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hgs0W6BMFz2xDq
 for <openbmc@lists.ozlabs.org>; Sat, 30 Oct 2021 05:49:15 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id CE2AF5C01BD;
 Fri, 29 Oct 2021 14:49:13 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Fri, 29 Oct 2021 14:49:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 fuzziesquirrel.com; h=date:from:to:cc:subject:message-id
 :references:mime-version:content-type:in-reply-to; s=fm3; bh=3UW
 q805p3AvrDi3QuA+J3me36fFeaKJmL3whNinWAEc=; b=M6SL5WMTTQD3aHniOlL
 yFRaTo41mR/4Us8Vrw1mhR7q9CMgNcz7WXI59vipWou9NKdkXkumXGL096vDjQtn
 7rPWI9fFumw7NStDgzcx/C4GEk+4194qxvbpB8WQA5CMnOjsSWT/n2TJi+QrXQPb
 A/QcQEM1A/WGXWNKM6pIfer+EXgDkDjToqSU74mmLJkttReuUMg9L0GqURThGu1j
 BRfGXqvBcdExcsjzluTISZg2SyWcQsE7y2JQoUjcqX5/bembhJf2HUUKRA1cRuhE
 H5FCs8Q51aQ89dwA5Fu8BvW39lA3ZUB03+r+nFQ8DJm8wvC0IdnE0tJfqWMX4ac3
 JbQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=3UWq80
 5p3AvrDi3QuA+J3me36fFeaKJmL3whNinWAEc=; b=SRsdFG/lEl4iNE3+DmJyg8
 HCRPWAmc8M+u0hilH3aDfMS2pZWySJf95sVYdaoValBh9aerUa8JgLltCPYCg/FO
 WeToidcnoz8PKJPIuhhOOAn3L5dT0P3jzy1g1Ba+7l53+tFPhJGhzN62ZgG4EJIE
 okkKUAW7gRMDHzNxnXgc18CtoX3iF1RBYOINFvC18NBzW8fEcHgfbXQ9J3OwDR94
 mtFhtYdMQlJXqKkcHMrzTxdWqkvdfiogjU3AoP+hZM1P6xlbIiH6Hz2bryujRw4B
 T/MpavkZJNLiScBg7LkvFs2fbGQVbNpzOu+Bl274HyDs9084nqt/UCU7bP/1GbAg
 ==
X-ME-Sender: <xms:KUJ8YYH4LM0UGgpqUr1mywfWTRV3r6YLSQHQh-aIqmvVkkG7UtTH2w>
 <xme:KUJ8YRXRSwCftyn_3vTvOvGutFM8N3g-U3CSwFm66ep3G2hST86VyuCrvqNwjyXZm
 pB2XZKXsn69T0Sxaos>
X-ME-Received: <xmr:KUJ8YSI83SotExsMfgKheIFgR_uGHN1sx6toSNrqI1r43XsinI1gO3qu>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvdeghedguddvhecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehrrggu
 uceuihhshhhophcuoegsrhgrughlvgihsgesfhhuiiiiihgvshhquhhirhhrvghlrdgtoh
 hmqeenucggtffrrghtthgvrhhnpeeffffhfeehgedutddvtdeuiefhudeifeekfeeifeek
 fedufeeuvedulefgkefffeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
 grihhlfhhrohhmpegsrhgrughlvgihsgesfhhuiiiiihgvshhquhhirhhrvghlrdgtohhm
X-ME-Proxy: <xmx:KUJ8YaGSdDQpoHxAVH00alUpQEGsE6d8r6etdhARcEk0YrejGp6JiQ>
 <xmx:KUJ8YeXYDhh3BI3Efm-CX-Ffj1-JdC5--XfeAdJw-kBna4mJGoU9YQ>
 <xmx:KUJ8YdOzMp8em4MQlItrmLu8juw5Gx8yzTYlp0OzwH6HeVLMUNhZFw>
 <xmx:KUJ8YXf7FOagLqdpmo5FCb3TZu7AKcJgiuYSxdXcnkp4vE2HClyQKg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 29 Oct 2021 14:49:13 -0400 (EDT)
Date: Fri, 29 Oct 2021 14:49:11 -0400
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Patrick Williams <patrick@stwcx.xyz>
Subject: Re: OTP-5: "OpenBMC TOF Proposal" Process
Message-ID: <20211029184911.ioqweku6gjvgipje@cheese>
References: <YXDtrwHhUcxwtlij@heinlein>
 <20211029162954.nkwfhzineypitwu5@cheese>
 <YXxACfWFxZ9MFbSv@heinlein>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <YXxACfWFxZ9MFbSv@heinlein>
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
Cc: OpenBMC List <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Oct 29, 2021 at 01:40:09PM -0500, Patrick Williams wrote:
>On Fri, Oct 29, 2021 at 12:29:54PM -0400, Brad Bishop wrote:
>> On Wed, Oct 20, 2021 at 11:33:51PM -0500, Patrick Williams wrote:
>> >Any member of the OpenBMC community may give feedback by:
>> >
>> >1. Expressing a vote to the top post of the Github issue.
>> >2. Providing grammatical suggestions to the Gerrit commit.
>> >3. Responding on the mailing list with opinions on non-grammatical OTP content.
>>
>> I think I would just like to see the entire conversation happen on the
>> list.  What would be the difficult parts with that?
>
>I listed voting in Github to avoid emails like "+1", but to allow the TOF to get
>a general sentiment.

Agreed, I like this.  I was/am sort of thinking of the list/gerrit split.

>I put "grammatical suggestions" elsewhere because:
>    1. Again, reducing clutter.
>    2. The post here is mostly a 'draft' anyhow, which needs a follow-up in
>       Gerrit later on for documentation purposes.
>    3. I've previously heard sentiment along the lines that "Gerrit is good for
>       code review but not for discussions".  Grammar is 'code review'.
>
>The purpose of having proposals on the mailing list, I think, was to give
>broader awareness and because it is easier to follow discussions in email.
>Having minor comments on the mailing list means others have to sift through
>those uninteresting emails which may reduce the visibility into the primary
>discussion(s).
>
>If we want to combine 2+3 together to have all community comments on the mailing
>list, I don't think it drastically changes the proposal and seems just as fine
>an approach.

Ok.  Let's let others weigh in.

>> >4. (Least desirable) Providing off-line feedback to a TOF member(s).
>>
>> If it is undesirable why do we have it?  Maybe we could list that
>> rationale to make sure this option is only used for those special cases?
>
>Even if we don't spell it out it is still going to happen.  You can't stop two
>people from talking to each other.  Some people are not going to be comfortable
>expressing their opinion in public but they might have an individual on the TOF
>they are comfortable confiding in.  The "least desirable" is to spell out that
>the preference is for opinions to be expressed in public.
>
>I can certainly drop this or reword it if the consensus is as such.

Sounds good - was mostly wondering if you had any specific situations in 
mind.
