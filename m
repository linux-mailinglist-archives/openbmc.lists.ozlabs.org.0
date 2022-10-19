Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D42B605133
	for <lists+openbmc@lfdr.de>; Wed, 19 Oct 2022 22:21:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mt2Dz32Kxz3dqc
	for <lists+openbmc@lfdr.de>; Thu, 20 Oct 2022 07:21:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm1 header.b=ROvodkbR;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=H3vYXVUN;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=fuzziesquirrel.com (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com; envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm1 header.b=ROvodkbR;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=H3vYXVUN;
	dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mt2DK3ZH7z3bkx
	for <openbmc@lists.ozlabs.org>; Thu, 20 Oct 2022 07:20:48 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id D0B405C010F;
	Wed, 19 Oct 2022 16:20:44 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Wed, 19 Oct 2022 16:20:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	fuzziesquirrel.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm1; t=1666210844; x=
	1666297244; bh=1OPRAUZ1nudtJ/ECOXgTddKhsStWXi0fXvzqw9vkKMM=; b=R
	OvodkbRzNzNg29dcSuJAKIm9UA/B0rbhWT0RK6E9HR9XdVR1S8LIlkoK8DK9mi5G
	hFGtY7pJE1QC9hU6BOZFr9z/EbTZhgKYKkizJxijN5MhLVZJ1G+H+7mwqW7ZGegL
	XU3XzGTkW9ZyFSlrq/3QEc6ABHw02dQ2tPV06q4yIhRXm6TVFe8gXiZnB9H4DjQg
	s0l+NVEhuF3p6Zrb7cjRxUwBS7HrZ2uR/kfVvi28xtLYctnst4Ul3zpxwnbNbPpG
	dlgbOykc81oJF9SzKKmke7D4IcIBW+aDZXgzWYoQEb2c0Xvjf2yU09Pb5gQQbfUR
	jhbvk2oQtSE3fkdLMzmiw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1666210844; x=1666297244; bh=1OPRAUZ1nudtJ/ECOXgTddKhsStW
	Xi0fXvzqw9vkKMM=; b=H3vYXVUN+I1P6lz05B778D7eBuye49A2mba4WaYTFB6a
	Bz84VvLj/OGeYYQ4984fNTl8N1295iaIDm5gyet8H4dthHedqMwWXe7pXFjJTONH
	WUEwTvRDCWBYRHqMNuScmUsHRdNoRx2+axCPxQ2U7cFnvaCl5snkYn0DNkT/uyii
	NyFIGxf3LPX9Uulk/DlIoDZD/e0FfpWQN8boi9odM1meW1gvVtNPSInT1FI9xaWO
	nO46fhH5OB3yjHLYwFU0WRHNFTXbLo+Zo+K9Xy9qUHekFO/EIcfxLgOG/UjxNGZj
	lhAEuJMF4Qm7KIXJ6e6DrOJ6MXNa28KN+z05vhqxgQ==
X-ME-Sender: <xms:HFxQY0FucgPNvmvVqRveFLPrVDll2tI0RLWXi5e-89Ks-LbayD94Xw>
    <xme:HFxQY9VzqZA-lXkqYwvGxJ7IgpANS7XWJPh1eJLtdo3of1kBbU2ja1Ug-6kr84eth
    40pwS1aeghNiUhYjNY>
X-ME-Received: <xmr:HFxQY-IH9Evyb4zW3QrCnwuHxXwx16CiAZwewCPiQX3pxZo3Rg57agPK>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeelgedgudegkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeeurhgr
    ugcuuehishhhohhpuceosghrrggulhgvhigssehfuhiiiihivghsqhhuihhrrhgvlhdrtg
    homheqnecuggftrfgrthhtvghrnhepgeetueffgeetgfeugfettddugfduvddukefhffet
    ffefvdegledvieelteffudelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomhepsghrrggulhgvhigssehfuhiiiihivghsqhhuihhrrhgvlhdrtgho
    mh
X-ME-Proxy: <xmx:HFxQY2HTNxuS260yElIRmO2RSl9XT7dng77SYPVB77v9WpWGBAqqKA>
    <xmx:HFxQY6XqXfbOs0ZDakXSnCNIeVuCoa6bxjxnwRoCka9slf4NXtJQwg>
    <xmx:HFxQY5PCzy2VCLJJfmbWdVRd5GZ5zaBO1beuxamgh-8jonMh9xXyew>
    <xmx:HFxQYzd_UQWUpZebHKZtrGi6ZnhUZPmnUymGSba2NO3-CKW3DuAzAg>
Feedback-ID: i02c9470a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 19 Oct 2022 16:20:44 -0400 (EDT)
Date: Wed, 19 Oct 2022 16:20:42 -0400
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: "Bills, Jason M" <jason.m.bills@linux.intel.com>
Subject: Re: Adding support for custom SEL records
Message-ID: <20221019202042.xyae3hcritwmxfqi@cheese>
References: <CAGm54UFshn7RpFMhpoJrMVHh9ONibDQ0DKoUokaG0q7V4Qi5VQ@mail.gmail.com>
 <e91a28c961288e3ead27cff19dfc9f03907f4405.camel@fuzziesquirrel.com>
 <CAGm54UE55N3JW0CUYb9piRopBcz35+Q2H66row-fDBf1VEGo+w@mail.gmail.com>
 <b96c24c0a1e5779c66a8882b6eec9883f9bd5e00.camel@fuzziesquirrel.com>
 <5994636c-b32a-0b8a-5873-a73390318fe3@linux.intel.com>
 <20221019171044.s4kfuqehuwwxpiit@cheese>
 <6a0d18b1-cc43-41ad-9f9a-85c0a927e5b2@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <6a0d18b1-cc43-41ad-9f9a-85c0a927e5b2@linux.intel.com>
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Oct 19, 2022 at 12:05:03PM -0600, Bills, Jason M wrote:

>If I remember correctly, Ed Tanous is who did the initial evaluation, 
>so he may have more detail.  But I think it was similar to what you 
>suggest: Create 4000 logs on D-Bus and check the performance.  

Ok.  It would probably help if performance could be qualified more.  
What was checked to determine that performace had been impacted?  
http/ipmitool response latency?

>My main requirements are to store many logs (at least 4000 was the 
>original number, but I can try to get an updated number if needed) and 
>have them persist across BMC reboots.

These requirements are obviously quite reasonable, but they are already 
satisfied by both implementations.  So the requirements that are not
satisfied by the DBus implementation would be helpful to the discussion 
I think.  I'm assuming those would be certain reponse time targets for 
different types of queries, and possibly some other general performance 
metrics around resource utilization?

>How is best to approach starting a new design discussion?  Should we

For those using the rsyslog backend, I think sharing (performance) 
requirements would be a good start, as that seems to be the major 
differentiation feature.  For those using the DBus backend, it would be 
helpful to know if there are any technical reasons why they have not 
moved to the more performant solution (assuming it actually is).

>continue discussing in this thread?  Start a design doc review? 
>Something else?

I'm happy to keep the discussion going here...

Thanks,
brad
