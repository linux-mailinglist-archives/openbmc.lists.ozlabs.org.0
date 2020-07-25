Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F66F22D40C
	for <lists+openbmc@lfdr.de>; Sat, 25 Jul 2020 05:02:59 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BD9qM6y2MzF1Tw
	for <lists+openbmc@lfdr.de>; Sat, 25 Jul 2020 13:02:55 +1000 (AEST)
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
 header.s=fm3 header.b=ZWjc7EKk; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=r2miyYaZ; 
 dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BD9pR3TPbzF1S9
 for <openbmc@lists.ozlabs.org>; Sat, 25 Jul 2020 13:02:05 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 8AF8B5C0154;
 Fri, 24 Jul 2020 23:02:02 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Fri, 24 Jul 2020 23:02:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm3; bh=zgXDSwlJs8pCP20YT4YD1jNprrUDzLc
 v+hQ1OL7kqMM=; b=ZWjc7EKkNlWgv1znw3ooP1r5YaBB16qXzzNdBuuNlddfWdi
 dRB4acs4vcJSiXzaQK2nXWXEo29S6mnadyTetra6+72FTTYhPUnrcFnYQGrf8W/f
 MLAH/rvMvOk/p1vclPrmZoHZRbtVET6uCEOeYxzZL2b7wAmTEuvHlEB/X4jCKnr0
 St0Pmb9uTQuRQQtL/asZxMR+2wMdfTH5bPccyinWNODFtlIuC/0zcoGSt2kWeKOd
 x9UlwUmQWftYkGYwyJ4plMcSFaZjRGIbfaWPT150FSCoZugxuSE8ymsdMHIPk+Sd
 HnktSK9AKyiez8ddgUJl8hhxzvnbJCNQnf+PcfA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=zgXDSw
 lJs8pCP20YT4YD1jNprrUDzLcv+hQ1OL7kqMM=; b=r2miyYaZZ9pkMKI0pByF5B
 oP7xW/N/3OTT5Ziu3QFijkkzHaimUDdWO994+3kWCY3nDDkxAWQ1Qn1YiYKVs2Dn
 9sTWg7k4yTnM7gNr8vD2P0a6j2chzA4VSQjCUdn/rRaxkzKt7REl6YctTIuVRg/N
 INoeaDWYdXyME84c+xcvOulm8IG+GUkeyZ70sF9SFhcTu7/vgmsRP+BeQ02RuSnc
 OcjhRgkoke4XK1UfzciV+TXlOStKKUORUvqVzte1fubYXwYQ9IOL6NTbtEc0H4Zk
 iKe9JrmaC0h1xPmkKPcoZ/7RiOUIsv39MJCvkq+oNjGRIsdm8Jj5RHiG0GWOtKVQ
 ==
X-ME-Sender: <xms:qqAbX0341RpWu8dPuvR0r4zzMv5Ld__Q8uGx3ol9_zmRH9hZY0umbg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrheeggdeihecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculddvfedmnecujfgurhepofgfggfkjghffffhvffutgesthdtredtreer
 tdenucfhrhhomhepfdetnhgurhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjh
 drihgurdgruheqnecuggftrfgrthhtvghrnhepgeehheeigffggfektefhgeeffeeugedt
 geefleekveekleevvdejhedttdejgeeunecuffhomhgrihhnpehgihhthhhusgdrtghomh
 dpohhpvghnsghmtgdqphhrohhjvggtthdrgiihiienucevlhhushhtvghrufhiiigvpedt
 necurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:qqAbX_ECIp9Kvnzr-3UA8xNCj7DD1KP9r54fXFebT-MmP9N59JM0YA>
 <xmx:qqAbX84erPtUx7fGcYq7y0dnKEu5-7VNc9GzP_OnYMD5nGqNm6liKw>
 <xmx:qqAbX92dwRr3z72A1E1TxQt26cZECSlBrBKc4MhsGGsLZdFl2M4hQA>
 <xmx:qqAbX6MHZeYzXuIsnr3CapD9z0Vk9ES7ps9rZNM4_XzSuKHo1D04lA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id E0CAFE00A6; Fri, 24 Jul 2020 23:02:01 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-92-g11c785d-fm-20200721.004-g11c785d5
Mime-Version: 1.0
Message-Id: <1872ef34-0a74-4084-8098-424130f71848@beta.fastmail.com>
In-Reply-To: <CAFaEeaE+xp89Q4dc0uS_-mdwy=ngb6-1XqnfdtTZ_1CW-GCE_A@mail.gmail.com>
References: <CAFaEeaE+xp89Q4dc0uS_-mdwy=ngb6-1XqnfdtTZ_1CW-GCE_A@mail.gmail.com>
Date: Sat, 25 Jul 2020 12:31:31 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: openbmc@lists.ozlabs.org, "Sui Chen" <suichen6@gmail.com>
Subject: Re: [openbmc-tools] dbus-vis: DBus capture visualization tool
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
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Sui,

On Sat, 25 Jul 2020, at 08:29, Sui Chen wrote:
> Hello,
> 
> dbus-vis is a GUI tool that does the following:
> - It visualizes busctl pcap files, the same format that dbus-pcap reads 
> and parses.
> - It somewhat half-automates the process of doing a capture on the BMC 
> and transferring back to the host for analysis (console access to the 
> BMC is required for this purpose.)
> 
> dbus-vis started from an IPMI timeline visualization tool that only 
> processes IPMI requests exposed on DBus. After I learned about 
> dbus-pcap 
> <https://github.com/openbmc/openbmc-tools/tree/master/amboar/obmc-scripts/dbus-pcap>, it turns out DBus visualization is a natural extension to this visualization tool. Because this tool currently accepts the same packet capture format that dbus-pcap uses (by using a slightly modified version of dbus-pcap), it kind of functions like a GUI version of dbus-pcap, and is therefore named "dbus-vis" to indicate what it does.
> 
> The main difference between this tool and other existing dbus 
> visualizers (such as GNU bustle) is that dbus-vis shows data in a 
> compact timeline format, making it possible to show >10K events 
> simultaneously on the screen at an acceptable frame rate, as well as 
> making it easier to focus on DBus performance rather than the 
> dependency of different DBus units (that other existing tools seem to 
> be focusing on.)
> 
> The changes for the first commit of dbus-vis is listed below; any 
> comment is greatly appreciated.
> https://gerrit.openbmc-project.xyz/c/openbmc/openbmc-tools/+/34263
> 

This sounds really interesting, thanks for sharing your work! I've added myself as a reviewer (as the author of dbus-pcap).

I've taken a brief look at your patch and think there's a bit we could do to improve dbus-pcap for your needs (e.g. adding timestamps to the json output). I'd also like to work out how we can better integrate dbus-pcap with dbus-vis so we're not maintaining a fork of the code. Maybe if we package things properly they could both be more easily installed onto a system. That way we could describe the relationship in terms of package dependencies rather than forking or using wget for the job.

I'm also thinking it might be time to start (an) independent repo(s) where we can develop the two, what we have is starting to grow a bit beyond the intended scope of openbmc-tools. Looping Brad and Andrew Geissler in here to get their thoughts.

Cheers,

Andrew
