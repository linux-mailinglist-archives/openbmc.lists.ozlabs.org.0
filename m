Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 463BE1F5F56
	for <lists+openbmc@lfdr.de>; Thu, 11 Jun 2020 02:58:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49j58F3VqtzDqg5
	for <lists+openbmc@lfdr.de>; Thu, 11 Jun 2020 10:58:37 +1000 (AEST)
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
 header.s=fm3 header.b=SANPpZFG; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=ey/8g6RY; 
 dkim-atps=neutral
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49j57P3by0zDqjn
 for <openbmc@lists.ozlabs.org>; Thu, 11 Jun 2020 10:57:52 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 51CF5621;
 Wed, 10 Jun 2020 20:57:48 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Wed, 10 Jun 2020 20:57:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm3; bh=LiIC570yyfKHpn4Z8PWR1D57qCjc5dg
 TduXeRv9pkX8=; b=SANPpZFG1DhVyOev8C0nzYEtFnqjCdKEr1KP5I66UKDQijC
 juC3KFgj77GoAY6eSANTmLctVqN3CV7drYtklAvrQSrFs7TQ55Pr3guQD3aK02yE
 P3bozwEOeQMFhezEQxQ777M6eQFvXL1+c5lDV3kqqamwI9mbIs8B4oK9OI503rx6
 h1860pPWi7ZnL6lXVvSi2c9+z/VBZGG1ZedMjH279CR7pOezSPFxYJDW7XkBR5Sv
 w4Xal1QwENrm4b+Rh7V7OzOn93tCCoYef9b9t42cKXDHalMjBCRHz2Gpn4KZKUXi
 lN0BeF/wIuZxESR9QwWMVPoWppzvkF8SfAAkBvA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=LiIC57
 0yyfKHpn4Z8PWR1D57qCjc5dgTduXeRv9pkX8=; b=ey/8g6RY8ZrXsRSY4b7B+x
 lC5en1VZ3N+poxqZxcyENoW7RijB9Mf5Rv/Kd9Lw9xBzP/BBPlERC+HezLqjdbYZ
 5P1/UMvL3YTxSVMRl8Ozx7Si4FTXpJnqdKIBafImjPTfE0ME8Th3s8u8vcvvUuYG
 Y8eo+b0JyGXnUE+pB8XlX0kdhiW4nozpexingQP/mYc/0Lfvi+q09VYcHs6g4hkb
 ObpgG5pk7wahJYa3EdQj3e67+JouzwxOJZo127r52xg2A4stmKqrh4Onbthzr+Qy
 hVUK5UHvlJvkkhiAvg5j5TR3c7AbtS1LbrlNG2fAPwSHuRq1IwxJvfT2w2Ai1O3w
 ==
X-ME-Sender: <xms:i4HhXvFapCd5EGijARJehSd6UYzg-T6meaP8rnWUrKsVS3qRA0vwcw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrudehjedggeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhepgeeftdfgueehveekjedtueehveetleekhfegfeelleevieevvdetgfek
 veekgfffnecuffhomhgrihhnpehttghpughumhhprdhorhhgnecuvehluhhsthgvrhfuih
 iivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgr
 uh
X-ME-Proxy: <xmx:i4HhXsVa0aboannQrFU5Z9WOKpZeLpFznPy0FJslf9yOwYBcAiw7fg>
 <xmx:i4HhXhL8rJkr6vNzm-0b5WDJIwJU7sZ41IZcdgkCYHEfKxVs0RXIYQ>
 <xmx:i4HhXtHrmhpKFTZCA7juElSBW7037uSX_eWEnwjYNV25ajBPPCTmPQ>
 <xmx:i4HhXkBBmnFL-vXXg6_X_eCtUn45_JwD5V8Yk_T1ewjET4xlsefVIQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 810ADE00A9; Wed, 10 Jun 2020 20:57:47 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-dev0-525-ge8fa799-fm-20200609.001-ge8fa7990
Mime-Version: 1.0
Message-Id: <9b9a7fe6-e7f5-4e78-a9a8-131890ea82ff@www.fastmail.com>
In-Reply-To: <19628.1591585637@localhost>
References: <CAFaEeaFTP9v1xZefxzoU9E6h7SpjfbxVrnnSRCmJfJ3QjWRqhA@mail.gmail.com>
 <20200514135723.GE1166713@heinlein>
 <3d6db63b-f670-4e01-94c3-425f93d89708@www.fastmail.com>
 <CAFaEeaGs0GSiPp9mGVrSMB1brG19ttroPcK-x-p+BN3SnHrU4g@mail.gmail.com>
 <2775.1590100786@dooku>
 <36873484-3078-4ec5-981e-88e59e619926@www.fastmail.com>
 <19628.1591585637@localhost>
Date: Thu, 11 Jun 2020 10:27:26 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Michael Richardson" <mcr@sandelman.ca>
Subject: Re: An IPMI Request Visualization Tool
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
Cc: Sui Chen <suichen6@gmail.com>, openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Mon, 8 Jun 2020, at 12:37, Michael Richardson wrote:
> 
> Andrew Jeffery <andrew@aj.id.au> wrote:
>     >> Interestingly, I was not that clearly aware of dbus-pcap :-) I ought
>     >> to know more, as the lead libpcap maintainer.  Is this visualization
>     >> tool part of openbmc, or is it a generic dbus visualization tool?
> 
>     > It's not really a visualisation tool so much as a script that will
>     > interpret the D-Bus-specifics of a D-Bus pcap. It's a commandline
>     > script that provides filtering based on D-Bus match specifications. You
>     > can capture all traffic on the system bus in any systemd-based system
>     > with `busctl capture > /tmp/my.pcap` and then run `dbus-pcap my.pcap`
>     > to dump the packet contents.
> 
> Is this something that you'd like to be able to invoke remotely in order to
> get diagnostics/debugging info?

I haven't needed to, but others might.

> 
>     >> We recently brought rpcapd into the mix; it can be invoked via ssh.  I
>     >> wonder if that might help you as a debug tool?
> 
>     > I'm not sure, I'm not familiar with rpcapd. I'll have a google.
> 
> https://www.ca.tcpdump.org/manpages/rpcapd.8.html

Yeah, I found it :) Thanks.

Andrew
