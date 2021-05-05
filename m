Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01F843732F0
	for <lists+openbmc@lfdr.de>; Wed,  5 May 2021 02:00:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FZcLC6pXHz301v
	for <lists+openbmc@lfdr.de>; Wed,  5 May 2021 10:00:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm2 header.b=CNkEORau;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=blcMXIhG;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fuzziesquirrel.com (client-ip=64.147.123.19;
 helo=wout3-smtp.messagingengine.com; envelope-from=bradleyb@fuzziesquirrel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com
 header.a=rsa-sha256 header.s=fm2 header.b=CNkEORau; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=blcMXIhG; 
 dkim-atps=neutral
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FZcKx6ZcGz2xgJ
 for <openbmc@lists.ozlabs.org>; Wed,  5 May 2021 10:00:37 +1000 (AEST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 207A513D1;
 Tue,  4 May 2021 20:00:34 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Tue, 04 May 2021 20:00:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 fuzziesquirrel.com; h=date:from:to:cc:subject:message-id
 :references:mime-version:content-type:in-reply-to; s=fm2; bh=HvG
 hG2J7dH/14J2CYZ6utpn1GyYW65A7B0V9u8b7UW8=; b=CNkEORauMLshgkJX7lZ
 GWS67sMyVS/UkgHsnM66NXlAEIoWPVla5l8+fOy/ueXJvXXxvveEmqEMwQ4bA5oP
 0DAmFv3JB1Gtr+tsrqwlBTFb+lIuRXhbz3CHNiHsSnrPkFbS4JCJIZtzfgBbvVrl
 q3iXjQyO1CWp5rxx0YPgnP0608YZVCZ3QMa+FJz0n8sDyvtN7C4oq3HGRZZNMac6
 WkAJBJCQvF2eL5yJ2MKFJs9+PIr7J+3GDcM9Ir0rAL/n2RCVGTs1JNTfriSkK5AR
 yfJpT5oAzcePNXT3L5PS4UJdcvpX0ziay/+RkkjU8iwtmfu3kCRJ+UocXGCmMR4O
 5Mg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=HvGhG2
 J7dH/14J2CYZ6utpn1GyYW65A7B0V9u8b7UW8=; b=blcMXIhGOMDgEMjUlrO97n
 BE+tyXpM3EKcOoB2ndvqrVk7heZjxT2dk6Xqz9vQ8IbRi4fIFSMQz+QJTUM1ikOK
 qBHHb6FV+dFiJmjelWx8gSLoE0gtN36MEQpnv/go9GOSFLkFhoHSQdTS+kQWO3CJ
 dcqBQFd2EsVYSJuTgp/pFvPKo7vB0NrWh1EtJTk0DQrfEiORF9lHXBjm4VZ992Hh
 qW2vSoSWIT6PugPOj044eZ/i/5mAksWv27rp1F1SaUZMGHgHONQdk9MLs+c2jyd9
 tuoX+aotVljqblOejizPi5eccZ0py+98mehNSAzvZD2ykuLuws+z2KNPSUPZrb7w
 ==
X-ME-Sender: <xms:IeCRYMy8zj2_EDccy4oCr8vqD-k5VH99UjllDaYGxKqZTJGGKg68fg>
 <xme:IeCRYATHq0r7ReLQlM7RRweQ8Bn13ZSKWFSVvYnPH15iG2-KlMkBIb_3jwxK0y3jn
 E2I-aWMgFQ1ZtjDKhc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdefjedgvdegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeeurhgrugcu
 uehishhhohhpuceosghrrggulhgvhigssehfuhiiiihivghsqhhuihhrrhgvlhdrtghomh
 eqnecuggftrfgrthhtvghrnhepfeffhfefheeguddtvddtueeihfduieefkeefieefkeef
 udefueevudelgfekffefnecukfhppedujeefrdduieejrdefuddrudeljeenucevlhhush
 htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsrhgrughlvgihsges
 fhhuiiiiihgvshhquhhirhhrvghlrdgtohhm
X-ME-Proxy: <xmx:IeCRYOWsAQdp-RgWm8UECxP0t_-gnW2qXZsrvbdbNgalj_m1MJeeYA>
 <xmx:IeCRYKjHC7urSSJRZecFSKEz_o-q-WxpWIXw2FIEo87C-bSdQ183VA>
 <xmx:IeCRYOC2iDSBNnTQNs_bSsIqZXodRM70NlYJ5urDYmxqTFMWF50-Rg>
 <xmx:IeCRYP4fJbzMDnNqV8En60FOa4ll308b6hadttgiHyrP6lfPYv2CNw>
Received: from thinkpad.fuzziesquirrel.com (unknown [173.167.31.197])
 by mail.messagingengine.com (Postfix) with ESMTPA;
 Tue,  4 May 2021 20:00:32 -0400 (EDT)
Date: Tue, 4 May 2021 20:00:31 -0400
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Mike Jones <proclivis@gmail.com>
Subject: Re: D-bus model proposal for pay for access features
Message-ID: <20210505000031.kl4w7eglkl3iz7jd@thinkpad.fuzziesquirrel.com>
References: <CAMhqiMoFAHcUk0nO_xoOubcZqF_dPDFweqsttTULRJK38o1Ung@mail.gmail.com>
 <CACWQX83=CG_H8YUvEYj4BpDWFPoYkVLdpxo6n9V5LneTeeM7Bw@mail.gmail.com>
 <F3123217-EAD7-4613-9CBD-39EACB7791E9@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <F3123217-EAD7-4613-9CBD-39EACB7791E9@gmail.com>
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
Cc: Ratan Gupta <ratankgupta31@gmail.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Ed Tanous <ed@tanous.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, May 04, 2021 at 03:18:43PM -0600, Mike Jones wrote:
>
>> initial thoughts are:
>> 1. I don't want to support it or help the code in any way, but IBM can
>> check this into their own specific interfaces.
>
>Given that Redfish is a big tree of interfaces, is there a provision for custom interfaces?
Yes.

>
>For example, suppose I wanted some special ADI interface for some ADI functionality (like tell me the duty cycle of the PWM of regulator foo), assume it is public info/code for this discussion, is there a way to hook into the hierarchy and add interfacing without updating the Redfish specification?
Yes - Most(all?) redfish properties have an "OEM" property.

>
>Like is there a way to query and ask what special stuff is there and access it? Or knowing a prior where to look to access it?
>
>Are there OBMC principles on these kinds of extensions? Like it is allowed or not? Like one can bend the Redfish conventions or not?
Ed or Gunnar can correct me if I'm wrong but I'm pretty sure the current 
rule is you have to make an attempt to get your "extensions" proposed to 
the DMTF at a minimum, before it will be considered for inclusion as an 
OEM property.  IBM and Intel do have a bunch of OEM properties that was 
added before that rule went into effect.

>
>I have to assume that somebody has the need to do non-standard interfacing.

I would go a step further and say "most" or even "everyone" has this 
need.

FWIW I have a love/hate relationship with this rule. I think its great 
because it really forces you to get your content into the spec, and 
thats good for OpenBMC and the industry.  I'm proud to say that IBM has 
gotten piles of content into the spec in the last 12 months or so as a 
direct result of this rule.

However, there is often still lots of other content that is absolutely 
required in products and adding that content to the spec may just not be 
a priority at the moment.  Also not everyone can invest in the resources 
to participate in the DMTF.  I think it would be great if we could do 
more to help these kinds of users (e.g. some kind of plug-in system).

-brad
