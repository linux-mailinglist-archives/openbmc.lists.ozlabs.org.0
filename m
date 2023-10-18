Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 368857CDD12
	for <lists+openbmc@lfdr.de>; Wed, 18 Oct 2023 15:19:44 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm1 header.b=jkNu/csY;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=MwS4bjMN;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S9WfQ0mMnz3cN6
	for <lists+openbmc@lfdr.de>; Thu, 19 Oct 2023 00:19:42 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm1 header.b=jkNu/csY;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=MwS4bjMN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=fuzziesquirrel.com (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com; envelope-from=bradleyb@fuzziesquirrel.com; receiver=lists.ozlabs.org)
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S9Wdk72WYz3bVS
	for <openbmc@lists.ozlabs.org>; Thu, 19 Oct 2023 00:19:05 +1100 (AEDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id A5B465C0329;
	Wed, 18 Oct 2023 09:19:01 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Wed, 18 Oct 2023 09:19:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	fuzziesquirrel.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm1; t=1697635141; x=1697721541; bh=/x
	CM8wBn4GVT3ZuNIm3knqAsQ/INpqZ+SDjf44rjrEA=; b=jkNu/csYJRtfgpyeL1
	Y2iOMGPylEX5CgbYOF6gtsC24Q7QMhDi8qMCj+fHk9mH05H93J7R1RE0xhynU0iP
	nOUU5c7MzMqkw+0oEIhQR8HBLUwPJq9ahGPrP+4UKdOqxAC4p2Dr2jR4I5+0cLWF
	RXNdlMoTVxTWB+bVmWj1m5xPszYZ8XjnxTOulmxOatJ5i7W4+T/ZyO08yCd/Pl5w
	+QKI8Wg+KBd7VwY2BKcwvBBvH9yiUSLDGq08Wenk+l6ND2tmYE2sMtVBGaFfqQYa
	YWbSVRO5vAged5vtLKVNU3lJXDEKb9R4B2dN3MpSOraHpVStg5Se4dpnI77a39fK
	y6fA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1697635141; x=1697721541; bh=/xCM8wBn4GVT3ZuNIm3knqAsQ/INpqZ+SDj
	f44rjrEA=; b=MwS4bjMNHlXdiiw/xnhHHEv0IHd72sKtc5vyKjG9+jOJ+ynq+sp
	4bt0GB8Ym/WOAj+MwSmf9JWTVIp7ghYeNeD5umlYxtGH56keWWYBywbZVzCceW5M
	zDnwhr+AnC0QopUPIcpnO+wywBTm4wy9yZBizYji0w6jB4GiUJWQCyHroQhTucr3
	zrrjcXIVg+QV+X7Y3RC2mv4u/mt/ZDc/6GfhDzubTRCa1+bTsYoigIpwPKt8lRQa
	WB/2kR+7DkZqqs4bHm9sxTwc9Ch7P/flkxViQ3Es3jrv61j+p0A8zs22W7iQjSYK
	uuh2dZQiVEoPNFw2alz12Tjq5iCEXzTBCdA==
X-ME-Sender: <xms:RdsvZU4GCPXrbSGMIaQL27EYJ6E8171cjWD_tzysif0hn2_6v9deQA>
    <xme:RdsvZV7f8kWC4yI66zmko7qleQUGZP_I_Bl7PgxrErnxRTj3RtibWRfd90BzSwECC
    TGWGRxzsu6uKIGhhEA>
X-ME-Received: <xmr:RdsvZTfnH2MmeBerX2YAg7wgfO8SugB2uLV6vD-nOvKNvKsUQOz0nA15JKGc2h5mFUf4ghl55oUqfti8qqCMEtvfVv1hFQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrjeeggdeiudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtugfgjgestheksfdttddtudenucfhrhhomhepuehrrggu
    uceuihhshhhophcuoegsrhgrughlvgihsgesfhhuiiiiihgvshhquhhirhhrvghlrdgtoh
    hmqeenucggtffrrghtthgvrhhnpeeikeeuteffveefgefhleeigfeutdetieevgeejgfej
    gfejffeuhedugfduffegteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
    grihhlfhhrohhmpegsrhgrughlvgihsgesfhhuiiiiihgvshhquhhirhhrvghlrdgtohhm
X-ME-Proxy: <xmx:RdsvZZJI6PvWyDNoaZYUoH-XoRv3Y5pQj2J7dA5BHEfWf1g3_PWbPQ>
    <xmx:RdsvZYLW9bFD0Tog6aareq1e5Sr3XSZEqr0Q-WeA1H9oE7_MbOETtg>
    <xmx:RdsvZay9I6G1r3xnaRQhMUM4FKPsX1jKxJpQmp_YjC7AqPK3n-7Luw>
    <xmx:RdsvZQ-b2w1mbkSQqoNom8s4mtEiG3v57cBYcqfSkBg0RB2zpAaz5Q>
Feedback-ID: i02c9470a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 18 Oct 2023 09:19:00 -0400 (EDT)
Date: Wed, 18 Oct 2023 09:18:58 -0400
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Sunitha Harish <sunithaharish04@gmail.com>
Subject: Re: D-bus model proposal for pay for access features -
 LicenseService at OpenBMC
Message-ID: <7xefpmuelqu2nv6iwkpaqqgeomdp7ru4uywejmqudeao7f5rbl@hqnhwttquefv>
References: <20210504233843.hvuvmebaznanqnlv@thinkpad.fuzziesquirrel.com>
 <YJLXlNyk/c8IVf9e@heinlein>
 <0af0324d-c8a1-4ce8-80c3-f8f846cc930f@gmail.com>
 <ZR_9p11_v5wQAOKB@heinlein.vulture-banana.ts.net>
 <ub2mniaycgyvj6ujfwytknyvhrscnjgoewxjtvpgq37znlxszf@yzvbxgnre4iy>
 <2736a0cbaf79f00617a8e55a962eea505ac7a7ab.camel@codeconstruct.com.au>
 <dr2sdq6xt52ieidkgdit56uew5bgo2tedlk5e4uee3tobcez3x@t3mhaemftllv>
 <0a4277122b61695d802c25d089533d1bdefe64a8.camel@codeconstruct.com.au>
 <nsa67efkmr5y7v66ox4zcmrqz6h6jewbw47qarad4t32ubnaoh@ayzfcex6kpre>
 <762c3491-93df-4ac4-9a44-a3fb1b448936@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <762c3491-93df-4ac4-9a44-a3fb1b448936@gmail.com>
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
Cc: raviteja28031990@gmail.com, Ratan Gupta <ratankgupta31@gmail.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, Ed Tanous <ed@tanous.net>, abhilash.kollam@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Oct 18, 2023 at 12:51:47PM +0530, Sunitha Harish wrote:
>
>On 13-10-2023 21:33, Brad Bishop wrote:
>>On Fri, Oct 13, 2023 at 05:04:23PM +1030, Andrew Jeffery wrote:
>>>However, there is an escape hatch for project social issues. For
>>>example interested parties might choose to collaborate on the license
>>>manager implementation outside of the OpenBMC org, and package it
>>>through Yocto or OpenEmbedded.
>>
>>I've been thinking along similar lines lately and I like this idea.  
>>For a license server and even in general I think less centralized 
>>control and less tightly coupled software would be a good direction 
>>to take.
>I am not very clear about this. The control and processing of the 
>license will not be in BMC scope. The host should manage it.

The suggestion here is to:

1 - write your license server application
2 - throw it up on Github somewhere other than openbmc
3 - submit a recipe to meta-oe

It's possible the meta-oe maintainers could reject your recipe for the 
same reasons as you've been rejected here (or any other variety of 
reasons).  In that case you could just make a meta layer with a single 
recipe and throw that up on github too.

The downside to this approach is you shouldn't use projects like 
phosphor-logging, sdbusplus, or phosphor-dbus-interfaces or any other 
recipes that are provided by OpenBMC or in meta-phosphor.  Certainly not 
if you want to get a recipe into meta-oe.

IMO this isn't necessarily a bad thing, though.  This is what I meant by 
tightly coupled software - if you take this approach and avoid OpenBMC 
specific frameworks...who knows - if you make a an really awesome, 
useful piece of software - you might even get collaborators from outside 
OpenBMC.
