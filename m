Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7234B1B5344
	for <lists+openbmc@lfdr.de>; Thu, 23 Apr 2020 05:59:01 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4973Sy53glzDr3F
	for <lists+openbmc@lfdr.de>; Thu, 23 Apr 2020 13:58:58 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.25;
 helo=wout2-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=g4Z+M24g; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=zCXbpNvA; 
 dkim-atps=neutral
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4973SG3H0TzDqwt
 for <openbmc@lists.ozlabs.org>; Thu, 23 Apr 2020 13:58:21 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 4219E6DC;
 Wed, 22 Apr 2020 23:58:18 -0400 (EDT)
Received: from imap25 ([10.202.2.75])
 by compute3.internal (MEProxy); Wed, 22 Apr 2020 23:58:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type; s=fm2; bh=p+m/+UPttgZQXTr5AmYDtMbbP0ENlQm
 aduo5RsQ+1T0=; b=g4Z+M24g8gW+6N24pzNS1+stAlDIVCc0S3hUQ0E6BROrq2p
 ccMWAcs91OHonAK/lxFeR9A8vitKOigyhhFg7Ba390Y9c/+XliI6FtnweCdJ2GUo
 QW7gwChKWzAWqMyy4TZQbmW1ALvOc0ArOsgSI9ayaj8p62E6Fy1xaCjtUcAlPiPF
 kzrrWVpmaJcSoLVqQi+e2q8s1jfLHLgtPYLgnRHa2G86DqiQWjDVwAOa6tKqgnPg
 9c0F6I4Dc7UScExgQI/XUDNA6b3YkaUcTb48DHjUz1TxkHFf5dpyW0EB480s42OK
 oHfkIqN1gLiX7hRU/pqn+B4+vj8YT5UkdImzJ2w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=p+m/+U
 PttgZQXTr5AmYDtMbbP0ENlQmaduo5RsQ+1T0=; b=zCXbpNvAaEryX/CzaNPV+x
 j87/vi9GnZgcC5VDL1JT+DHBShP/CLY2MyWreKt/D5M8TWLtnXr7qXHAsrNe/8TF
 22r+GYH9clp3lhlmOZnSJzHPjAg/DjA5YXlUANf0DIarQhus+5N1AX4jsW53evXl
 P8KdvwKk+ePQEUn3TXry7b2hz6cnl1iWeyZk/ZEMtXzZl9jKHZ0/Gd6zgMk/SdBk
 7RwYv4en2jYsQ2FL2uLJo/Xgr6R86k3rbiE9j3yYHQaRTXU+PLftpvfjmXk4ATeD
 JWBR7YqdtrfKE02cncNXaIvxlLXsPVHF/KUG3WzZ95QHbHVqAlDn1btc0X4cHaSw
 ==
X-ME-Sender: <xms:WRKhXnU4sDlItSahWcg13VgOwSLnXl0yZo41uT97ISzRLmiTTOPDAg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrgeekgdejfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucffohhmrg
 hinhepghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghm
 pehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:WRKhXnAfbxa1aVe9j83sU7l-GAYK8tMy5iYbMVkSNPgqm7TEZ_gG6g>
 <xmx:WRKhXgwLTbOyB-wNcW7rCBIcruSOHmI-iZAcjs2wv8DYVTfktI4yJg>
 <xmx:WRKhXsD_lA9W-uM0ver-8xRitExGdPrLOHVFgy5t3X_wF9F8DjtOvw>
 <xmx:WRKhXrdNw9JNYGgyj_5rlWZOAKPUminBB0jH9qv2hWThzFzsj7K-tQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 37A68BC00C3; Wed, 22 Apr 2020 23:58:17 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-dev0-351-g9981f4f-fmstable-20200421v1
Mime-Version: 1.0
Message-Id: <e827d946-828c-4028-ba09-bfeadd854a0d@www.fastmail.com>
In-Reply-To: <5e9dd66f.1c69fb81.45fc6.0118@mx.google.com>
References: <5e9dd66f.1c69fb81.45fc6.0118@mx.google.com>
Date: Thu, 23 Apr 2020 13:28:51 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Sui Chen" <suichen6@gmail.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: Call for Gardening Tasks
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Tue, 21 Apr 2020, at 02:35, Sui Chen wrote:
> > On Apr 11, 2020, at 8:15 AM, Andrew Geissler <geissonator at gmail.com> wrote:
> 

> 
> 
> I think packet analysis tools such as Wireshark and graphics frame 
> analysis tools such as RenderDoc, or system event-based Windows 
> Performance tool like GPUView provide great examples of what people 
> might expect to achieve with a visualization tool: capture, inspect and 
> (sometimes) playback, across multiple layers in the software/hardware 
> stack. Many similar existing tools process sequences of events, and in 
> this case of BMCs, the events could be dbus messages. I found a 
> prototype visualizer made at work greatly helpful in explaining to new 
> team members some basic concepts and the IPMI stack on the BMC.
> 

Not really a visualisation tool, but I'm going to plug my dbus pcap parser
here - it's helped me analyse a number of silly problems of dbus
interactions between a number of applications:

https://github.com/openbmc/openbmc-tools/blob/master/amboar/obmc-scripts/dbus-pcap/dbus-pcap

It desperately needs a README, but you can slice and dice `busctl capture`
output with DBus filter specifications, and if you like dump the output as
json for further processing.

Andrew
