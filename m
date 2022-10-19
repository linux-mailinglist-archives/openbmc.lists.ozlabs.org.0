Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D9DF604E40
	for <lists+openbmc@lfdr.de>; Wed, 19 Oct 2022 19:11:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Msy1n2g5Rz3c4S
	for <lists+openbmc@lfdr.de>; Thu, 20 Oct 2022 04:11:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm1 header.b=nrx+5JLY;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=uF3KTwf2;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=fuzziesquirrel.com (client-ip=66.111.4.27; helo=out3-smtp.messagingengine.com; envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm1 header.b=nrx+5JLY;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=uF3KTwf2;
	dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Msy1731PVz3bl0
	for <openbmc@lists.ozlabs.org>; Thu, 20 Oct 2022 04:10:50 +1100 (AEDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 8C0825C0199;
	Wed, 19 Oct 2022 13:10:46 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Wed, 19 Oct 2022 13:10:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	fuzziesquirrel.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm1; t=1666199446; x=
	1666285846; bh=PZR3dMhx4O2qkCBEaQOEfasheEtZmfL8lUJ9RvzwSFY=; b=n
	rx+5JLYALAmlkENhGByKMeuoYeBfa+by+aaOTbRrndxnxcN2Tdv5V45UJITLUBgj
	ZZ2z7aZLnHmbfdwW+Px3PFhgOn5+hW/IN2xYrvE/rfhLufStUcPGsi6GuVu0qllE
	M/1WejGJN/9vPTEd6e6zdwlZ2Tkq+3/IeI9Ip+ysaFUiDwCa3iV0tu/MCk8syewH
	XxGgC1iAXTteZH66xMNZhsQ88GcJSfqlxm/s6QJhDCIKcYMUcJ7inNuvUPRxftSC
	/cX/SPIsdJMHAIbTqrIRxGQIqx4NnDZPTIv+FBnkzQ+MD4BdiZaWfC89ATL8q+BM
	qmhOsPjusvl8NTvIp3JhA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1666199446; x=1666285846; bh=PZR3dMhx4O2qkCBEaQOEfasheEtZ
	mfL8lUJ9RvzwSFY=; b=uF3KTwf2S2ZlPfAQX9AyZtVU/tiqXe6zRPiG9Ax15faD
	gU08iCwbO1NIz1hX4Lw9HUgOnjt/aPQLtLxsJhpp8decFY34WrmUuwHjwxyUf//g
	eq+q/95aVQHsmTuAc7j9BI7PUmcPwq196kR8ZkbNuYZoaCeU51PsSUSmW4T2ZaIv
	WD7IQ2+7yE4HO/sHoZ29sZkP+LRBswDrwCWDRxabiy/nGqfzAasotSY/2ZGd1IBY
	s/nVj7si8kC2ubmJjQ8bI5Lk/KxXMzLThu+jssQ33FHrde1NyeUrJ/Ta0mPpa2PZ
	amtU/fpeVY4zA7v0BRQ3yfFlqbVNN/qCtoqiHOclkA==
X-ME-Sender: <xms:li9QY8s9FeKMojH7YTfZnZuhYm2byeVlgo0E1gv_FuRXhsP2vBRw3A>
    <xme:li9QY5fNqaFL5ew1gSZT2Klw1ZjyuhS4IhJ-jYG1fn78HgZEx7CALWEHPMjCXiHs6
    lK6N2bjw32yl4pVyf0>
X-ME-Received: <xmr:li9QY3yLltTFd_R9ogGHn3gx6Grq_IHodvNhTm7nn-qArG2-30TaDK-O>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeelgedguddtkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeeurhgr
    ugcuuehishhhohhpuceosghrrggulhgvhigssehfuhiiiihivghsqhhuihhrrhgvlhdrtg
    homheqnecuggftrfgrthhtvghrnhepfeeiueejvdelffduieeliedutddugfefjeevieei
    ueeuvdeludeghfdvledtkeeunecuffhomhgrihhnpeigkhgtugdrtghomhenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsrhgrughlvgihsges
    fhhuiiiiihgvshhquhhirhhrvghlrdgtohhm
X-ME-Proxy: <xmx:li9QY_M3nih3OXreOmURlZpMNhoFFNS4yWKVIkqjjRR0uaAUVAuEsg>
    <xmx:li9QY8_o6fsCTaD_7-mAK0Pednob8s1z8QBIPk4Do8F3DlE-OsuhbA>
    <xmx:li9QY3W2fAtdykhxErPhcU59bx6NjzxhJbzfvPCUHmPyU0VTgw0ugQ>
    <xmx:li9QYxEcQz34Rl1QVEdXHUe-yYBhx2VcKLdZ67Usig6VzYpGl7ooSg>
Feedback-ID: i02c9470a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 19 Oct 2022 13:10:45 -0400 (EDT)
Date: Wed, 19 Oct 2022 13:10:44 -0400
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: "Bills, Jason M" <jason.m.bills@linux.intel.com>
Subject: Re: Adding support for custom SEL records
Message-ID: <20221019171044.s4kfuqehuwwxpiit@cheese>
References: <CAGm54UFshn7RpFMhpoJrMVHh9ONibDQ0DKoUokaG0q7V4Qi5VQ@mail.gmail.com>
 <e91a28c961288e3ead27cff19dfc9f03907f4405.camel@fuzziesquirrel.com>
 <CAGm54UE55N3JW0CUYb9piRopBcz35+Q2H66row-fDBf1VEGo+w@mail.gmail.com>
 <b96c24c0a1e5779c66a8882b6eec9883f9bd5e00.camel@fuzziesquirrel.com>
 <5994636c-b32a-0b8a-5873-a73390318fe3@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <5994636c-b32a-0b8a-5873-a73390318fe3@linux.intel.com>
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

Thanks Jason

On Wed, Oct 19, 2022 at 09:50:47AM -0600, Bills, Jason M wrote:

>Intel had a requirement to support storing at least 4000 log entries. 

Ok.  So is it fair to assume anyone using the DBus backend does not have 
this requirement?

>At the time, we were able to get about 400 entries on D-Bus before 
>D-Bus performance became unusable.

To anyone using the DBus backend - have you observed similar performance 
issues?

Jason is there a testcase or scenario I can execute to highlighht the 
issues you refer to concretely?  Maybe something like "create 4000 sels, 
run ipmitool and see how long it takes?"

>I'd also be curious about the reverse question.  Is there any benefit 
>to storing logs on D-Bus that makes it a better solution?

Yes, this is exactly the question I've been trying to ask.  The answer 
seems only to be that the code is in meta-intel/intel-ipmi-oem - but 
that is easily fixed by moving the code to 
meta-phosphor/phosphor-host-ipmid.

>At the risk of complicating things more (https://xkcd.com/927/), D-Bus 
>was the primary solution when Intel joined.  We created the rsyslog 
>approach because of the limitation imposed by D-Bus.  But I know there 
>are still those who don't like the rsyslog approach.  Is there a way 
>we can now get together and define a new logging solution that is 
>fully upstream and avoids the drawbacks of both existing solutions?

I hope so, because doing that would make things a lot easier for our 
users adopting OpenBMC.

Thanks,
brad
