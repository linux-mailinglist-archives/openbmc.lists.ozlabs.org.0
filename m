Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E8CF41AD3DF
	for <lists+openbmc@lfdr.de>; Fri, 17 Apr 2020 02:57:32 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 493HkK4GGTzDsQg
	for <lists+openbmc@lfdr.de>; Fri, 17 Apr 2020 10:57:29 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.26;
 helo=out2-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=c+NhrkJA; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=svLlxSBw; 
 dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 493Hjf0rJ8zDqWf
 for <openbmc@lists.ozlabs.org>; Fri, 17 Apr 2020 10:56:53 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 7DE115C0166;
 Thu, 16 Apr 2020 20:56:51 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Thu, 16 Apr 2020 20:56:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm2; bh=HCPZ4TbJ/i+6uFm6pOJOVUflJHPrZGs
 blbFeUXYbGgM=; b=c+NhrkJA/Bc0NCfW0ELUbTIOB615ws1UVyKipaeYIwiu1uz
 fMFsvrr6ItSdCheW0+y98sWEnrl7OXMPup26qyEK4r+VmABn7V3HLsRadSP/gOgT
 5AtrkFupU7oZf8V/+bNC7RqhaSLcxncvZAZH9+GO7WutGyMYSkCrBmaFlHRw5ONc
 7PdkPQIOFQH0B/cQCDIMu1aL7/zIN33nM+xYrP8NLtgeEXPN/LK0lvio76E5KX13
 RiXfUGKowsnzDDyQac00i3j7YlsfiS7wI/SaE1BiGDIXw3v8Li44AKi9mvr3Titi
 OggRfEUIg8OJMj8H9y7Z51gBUEMK+c7ygaLNkqQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=HCPZ4T
 bJ/i+6uFm6pOJOVUflJHPrZGsblbFeUXYbGgM=; b=svLlxSBwvffFrDwDzv+IUE
 U8qS7jBJ0CSIflBstCDCYk0nXNp46V6GvclxyUPNjuLoN3c70/KqM9k10LR0mV3r
 hDqng4P/wN5ZnVOsNBWwEP8zk9zHKx1bMJ26uFEiGzpOT/7pBEMcoR1Nqvyg6+9u
 OAvdPH7/RffjhwQRwPWrOyZEEKW6ZanvpewikVwboMRIQ4DiaREwHL4fLo7zuUtb
 ETSB//n08lunGBzlC3j8MFDmSjJn9qTVOkqSjzU9OoDMvtq1dU1fuPs2SM4U7TgH
 NDg2jbdWFxKfsbjlq0VzpDrPfDAuWTyUqfEn7PsC1ITBZyCshyRNk+k60BwbJKSA
 ==
X-ME-Sender: <xms:0v6YXmKPBn2ZWbStDloxDpJeREd3u8yA3nL_hzAn2urT4AZ1mz4JIw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrfeeigdegtdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucevlhhush
 htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghj
 rdhiugdrrghu
X-ME-Proxy: <xmx:0v6YXglFfrzCZgaO4_dHiH10Y73yMIUT7r05N5mghH7-Jmcy2QFuhw>
 <xmx:0v6YXkZcSjPp63FA04SO_7YDPsJxgju4cEPLzeHOXr9_0p3JhwdXGA>
 <xmx:0v6YXqge_-Bh1JaqFpgT2HNOIJa-DcgswpUTOvOtgJCGVB7hsa-CkQ>
 <xmx:0_6YXj7ZaeyfCg8kQhVqI-V8hQyCh4F1Vko9LPU7anC3WzEpErt82w>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id DF95FE00A6; Thu, 16 Apr 2020 20:56:49 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-1131-g3221b37-fmstable-20200415v1
Mime-Version: 1.0
Message-Id: <a9bdcc17-ab5f-403c-90d3-cd96dd4347e2@www.fastmail.com>
In-Reply-To: <CH2PR21MB151024EECAFA2663BA89E575C8D80@CH2PR21MB1510.namprd21.prod.outlook.com>
References: <0F332F74-FF51-4239-8B52-2EBA770AE6CC@fb.com>
 <8022481D-7C72-4A7B-AF9C-D144177B4C88@fb.com>
 <CH2PR21MB1510E11F9772C45D12EEA0F1C8DB0@CH2PR21MB1510.namprd21.prod.outlook.com>
 <82E67AAA-1BD8-41D8-BE27-966F840236E2@fb.com>
 <CH2PR21MB1510AEF844D82AC9D897B902C8DB0@CH2PR21MB1510.namprd21.prod.outlook.com>
 <4770a42d-d012-4e95-9347-d5c287c2e288@www.fastmail.com>
 <CH2PR21MB151024EECAFA2663BA89E575C8D80@CH2PR21MB1510.namprd21.prod.outlook.com>
Date: Fri, 17 Apr 2020 10:27:15 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Neeraj Ladkani" <neladk@microsoft.com>,
 "Vijay Khemka" <vijaykhemka@fb.com>,
 "James Feist" <james.feist@linux.intel.com>
Subject: Re: [EXTERNAL] Re: nvme sensors
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "Thomaiyar,
 Richard Marian" <richard.marian.thomaiyar@linux.intel.com>,
 "sumanth.bhat@linux.intel.com" <sumanth.bhat@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 16 Apr 2020, at 17:22, Neeraj Ladkani wrote:
> Some of use cases:
> 
> - Standard MCTP message handling

This can be split into a few parts:

1. MCTP binding implementations
2. MCTP message packetisation
3. APIs to expose the control commands defined in the DSP0236

Regarding 1, we have a couple of bindings in upstream libmctp:

a. The standard serial binding (DSP0253)
b. A vendor-defined (IBM) LPC binding (i.e. this is not the standard KCS binding).

As mentioned elsewhere in this thread Intel have a lot of out-of-tree code that
enables the SMBus binding. Some of the difficulties with upstreaming this code
are addressed by moving MCTP into the kernel and exposing a socket interface.

Regarding 2, this is already reasonably well handled by libmctp.

Regarding 3, I'm working through some of the details with Richard and Sumanth
from Intel at the moment about how we best support the base control commands
and the effects they can have on binding instances in libmctp. One of the issues
to highlight here is the split between in-band data and out-of-band notifications.
Currently libmctp's mctp-demux-daemon does not have a good story around
out-of-band notifications.

Regarding the planned kernel implementation, 1 and 2 will happen in-kernel,
while 3 will remain in userspace. The plan is to implement a netlink interface
to control configuration of the MCTP network, which will allow userspace to
communicate out-of-band data from the standard commands to the kernel.

> - MCTP bridging 

There is some support in libmctp for bridging but it would currently require
an application to explicitly exploit it. For instance it's not exploited by the
mctp-demux-daemon (in utils/).

Supporting MCTP bridging is definitely on my radar for the kernel implementation.

> - Support SMBUS ( PCIe in future) 

The motivation behind the kernel implementation is to hide the specifics of
applying a binding specification to a piece of hardware from userspace, which
removes the currently problem of needing to create bespoke userspace
interfaces to expose the hardware capabilities out to userspace. Once I have
the in-kernel interfaces going for MCTP then adding support for SMBus and
PCIe bindings should be the same amount of effort as implementing a device
driver.

> - MCTP tool( from console) that can be used to send any MCTP messages 
> to a device and read responses, discovery etc.

Yep, I intend to write one as part of supporting the kernel implementation.
This would be usable with the socket interface provided by the
mctp-demux-daemon.

> 
> Can you explain what are problems with libmctp(SMBUS binding ) with 
> current implementation?

That might best be left to the Intel people who have already done some work
in this area.

Thanks for the response. Hope my replies help.

Andrew
