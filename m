Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F04672F6CF1
	for <lists+openbmc@lfdr.de>; Thu, 14 Jan 2021 22:15:01 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DGxsb36HszDqSK
	for <lists+openbmc@lfdr.de>; Fri, 15 Jan 2021 08:14:59 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fuzziesquirrel.com (client-ip=66.111.4.26;
 helo=out2-smtp.messagingengine.com; envelope-from=bradleyb@fuzziesquirrel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=fuzziesquirrel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com
 header.a=rsa-sha256 header.s=fm1 header.b=PxZXd8CI; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=jK+tKC1U; 
 dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DGvmb64trzDsfP
 for <openbmc@lists.ozlabs.org>; Fri, 15 Jan 2021 06:40:31 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 1D43A5C0172;
 Thu, 14 Jan 2021 14:40:29 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 14 Jan 2021 14:40:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 fuzziesquirrel.com; h=date:from:to:cc:subject:message-id
 :references:mime-version:content-type:in-reply-to; s=fm1; bh=pdO
 qYkaDWyvP5WnTP35XeR+NP9gUuy3OMHVsZpTThuY=; b=PxZXd8CI5WsgGrzRKcr
 bbogA61djJx9XGmIim4Pz8KMAcWZH4h9wjJ/9RuIHlcTOR2gEEii1lUf9vuOYaag
 ggUm0PjgfTOJA/BcwEj1vS+KQp1FI3XjyUCCnwY0PDLwxyRTVGbmSn1AVVRKd9Dq
 QCP2Unyz1R4+X4Vz6cVAA6XilPtzvO3O0qOIYdqfJ1ks42qDHjm7WKipxyQ7VyNO
 jrbcFujXTkc9Ck+7WTJ7siqcVXlz947N0w80BlMoDsYbzORisKlj9rsFXh0/kJfA
 nE1B1ku20e71NkWgQf3ed2BkwSKr36+hGXyDs9JV+DCiXxdnrOLQ0xe8OAK0U0Lt
 rGw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=pdOqYk
 aDWyvP5WnTP35XeR+NP9gUuy3OMHVsZpTThuY=; b=jK+tKC1U07uwUSsvyd9CQ5
 s/TrUw4STS8Q0ZO8nde6NstwWGsrKn3I0nR5rphzYbGTRqZ0FYnC+YqWkL/0c9R/
 rA/U5xPEl5+s+hAi+E/P0htGl6nFJA5OmvMxuZaTQMzKEUlwIaOnyweQzzxWHvuv
 bIWeC5HcbH7R/SbV4vIApij9nadtcF1NGT0qFfUWci/YPkkRxCcQ2kdhye90R+a3
 jnXbFLQvejrXZIcB6c/e1nzeUx28PrB7qVRHwxmI+aLoqvt2p/3Lidcg/Sy2d1UK
 yB6c6aXF1DIENNzjyBZjVBjjg/Ub478p6zPPluAce5+Dj9t31LETRURCcOO8rQbQ
 ==
X-ME-Sender: <xms:LJ4AYMfE2SdETZ8PsEyql8V7bUv5o6wU2kQAGId27p5fd_DmUAswAQ>
 <xme:LJ4AYOOu7d87AFJgFo0mWKDSyIIeN8elt-_0mxSPtkMMI4Sk6TDh__6xVBPYcMA0S
 6BToKmbPTQ1Oxqt8Yk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrtddtgddutddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeeurhgrugcu
 uehishhhohhpuceosghrrggulhgvhigssehfuhiiiihivghsqhhuihhrrhgvlhdrtghomh
 eqnecuggftrfgrthhtvghrnhepfeffhfefheeguddtvddtueeihfduieefkeefieefkeef
 udefueevudelgfekffefnecukfhppedujeefrdduieejrdefuddrudeljeenucevlhhush
 htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsrhgrughlvgihsges
 fhhuiiiiihgvshhquhhirhhrvghlrdgtohhm
X-ME-Proxy: <xmx:LJ4AYNjA9-1QDj7XjtQg5T4OqGwod_9PrvW78q7wNBByadc8TaHJFQ>
 <xmx:LJ4AYB-YwkWKubi65xolJ1goWgkILmlNJqPpMk8DF7HiGG8NHd4YFQ>
 <xmx:LJ4AYItjXuOnIsWffEF8e6zxDjUWTwq2hZiC3H-yonDDZdrsjcXSEA>
 <xmx:LZ4AYKLYXSDNVO3DJ77k_LP3MrIHMBunSYc8QB5x892b5uzP1jw2Xw>
Received: from thinkpad.fuzziesquirrel.com (unknown [173.167.31.197])
 by mail.messagingengine.com (Postfix) with ESMTPA id 24479240057;
 Thu, 14 Jan 2021 14:40:28 -0500 (EST)
Date: Thu, 14 Jan 2021 14:40:26 -0500
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Vernon Mauery <vernon.mauery@linux.intel.com>
Subject: Re: Intel-ipmi-oem repo
Message-ID: <20210114194026.ejf2fa3zhuqfdom4@thinkpad.fuzziesquirrel.com>
References: <CAHwn2XkNiz7rZzn9RbpZCaUM8HD0HO+mJTD9D2ENc_p+SsmXHg@mail.gmail.com>
 <20210114143909.jf3vbk7zhxp3iguv@thinkpad.fuzziesquirrel.com>
 <CAH2-KxBgmEmfeQxsbTa1RPVO_nm5=G+ayZ9aDM+1hf7oRtoDGA@mail.gmail.com>
 <20210114173805.GB45289@mauery.jf.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20210114173805.GB45289@mauery.jf.intel.com>
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
Cc: Willy Tu <wltu@google.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 chunhui.jia@linux.intel.com, Ed Tanous <edtanous@google.com>,
 apparao.puli@linux.intel.com, Vijay Khemka <vijaykhemka@fb.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Jan 14, 2021 at 09:38:05AM -0800, Vernon Mauery wrote:
>On 14-Jan-2021 08:38 AM, Ed Tanous wrote:

>>Would people prefer it to be a package config on IPMID to select between
>>the two implementations?
>
>I don't have a problem with a package config to select sensor 
>implementations.

This seems fine to me too.  I looked and there are non-POWER users of 
the fixed sensor id implementation too so openpower-ipmi-oem probably 
doesn't make good sense.

>I would say that if IBM is the only company using the sensor 
>implementation that is currently in ipmid, it would be best to move it 
>to the IBM OEM layer. But it is difficult in a project this size who 
>is using what.

'grep yaml-config' of the openbmc tree gives a pretty decent indicator 
of who is using the fixed sensor ID implementation.

-brad
