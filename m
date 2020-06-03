Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CA3AB1ECF6B
	for <lists+openbmc@lfdr.de>; Wed,  3 Jun 2020 14:08:02 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49cSNH4yckzDqZw
	for <lists+openbmc@lfdr.de>; Wed,  3 Jun 2020 22:07:59 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.19;
 helo=wout3-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=W1IIRzLm; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=wVXD/g+8; 
 dkim-atps=neutral
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49cSMF3LbZzDqZ9
 for <openbmc@lists.ozlabs.org>; Wed,  3 Jun 2020 22:07:05 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id CE248307;
 Wed,  3 Jun 2020 08:07:02 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Wed, 03 Jun 2020 08:07:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm2; bh=GGRxWBEj0N4PRscHv+e9I1ezrOXqQuY
 k4OyGPdCMRco=; b=W1IIRzLmAlH2N+sF7tnMDoShgD7K1s3D5ALic+lGpzvrd9H
 cZKAn+TCZyrVzXCNTBoQLZOG3lSVSD1wm+Dnnvq6sRJysJYzp+jgGQyIIzvRrVp9
 pEo15uIQenu/NMJC61ZUog0vVdKL+XuNYODVFZ1V1lnltAxSekzBWMwcxHM2mvGJ
 SLderajDZAIDdWCXe6YLAW7xXpLPTASF2TRkItjN3ELY+vYwYUPEpECVxgYW37p4
 uNyT1ExXk3t4F+keCl/10gOTLItMt1gIQVPauWSDW1dLRrkKyogA4f1byVOZmNED
 Ets4oBt0qYqioCC7cj0Y0CO5EpTmhGPmie6Hb9g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=GGRxWB
 Ej0N4PRscHv+e9I1ezrOXqQuYk4OyGPdCMRco=; b=wVXD/g+8AIkWuyReVqQqWZ
 I4nlsQwWV0mtzHjlFZwIpzMVfH43MENNKKuwEdZVcppfhrDF/336+oYgxUekQRbl
 mromyhEGhEWoxS4xaFt0amF8AWPmzTsVSlbY0l3aSGfGxe1ULzdSeH6M1zm/B/HT
 zJNhbcQoyDL/YoZ5Ao4FcBaqMAjTqcqATW4qKFo4LnpTaTGM7e4CHGnciDiUz23D
 yqckKMN10BKtXzKFpI3Sfm8dy9YVkGolH7/ijlyQTDAIyiG5gXPLML7cVfcRkTEy
 QO/M3i9EAPy7b2fNSa68olUi+1sfLhuLAuaX7MjTaQ3lvlsMcUciaDaM8YDTal2A
 ==
X-ME-Sender: <xms:ZZLXXt5yXyrobQhA1ET9IAEH7SxrPtkTo0kP7-Apl9uEhaDa35M4sA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrudefledgfeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhephefhfeekgfekudevheffheeihedujeefjeevjeefudfgfeeutdeuvdeh
 hfevueffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:ZZLXXq54dXz34SFiEzCge77-347m7qc2rKKBgxceLYD_eX3atEXAzQ>
 <xmx:ZZLXXkcOOaTNN4HyDebxacPqHiNDF5fUlMF-Ql4GMQujzs9ajTDYog>
 <xmx:ZZLXXmJKdi_0rfT64P-U47_rH4ysYFsvF2dgDNvLncFf-U8C5nOBHw>
 <xmx:ZpLXXknTAvSHv7LnS_ZrI2UHGSUIhKM8sHVr2yXtTHmIcHKlITnyvA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id D43AFE00A9; Wed,  3 Jun 2020 08:07:01 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-dev0-519-g0f677ba-fm-20200601.001-g0f677ba6
Mime-Version: 1.0
Message-Id: <36873484-3078-4ec5-981e-88e59e619926@www.fastmail.com>
In-Reply-To: <2775.1590100786@dooku>
References: <CAFaEeaFTP9v1xZefxzoU9E6h7SpjfbxVrnnSRCmJfJ3QjWRqhA@mail.gmail.com>
 <20200514135723.GE1166713@heinlein>
 <3d6db63b-f670-4e01-94c3-425f93d89708@www.fastmail.com>
 <CAFaEeaGs0GSiPp9mGVrSMB1brG19ttroPcK-x-p+BN3SnHrU4g@mail.gmail.com>
 <2775.1590100786@dooku>
Date: Wed, 03 Jun 2020 21:36:40 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Michael Richardson" <mcr@sandelman.ca>, "Sui Chen" <suichen6@gmail.com>
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Fri, 22 May 2020, at 08:09, Michael Richardson wrote:
> 
> Sui Chen <suichen6@gmail.com> wrote:
>     > Thanks for your interest! I'm also using dbus-pcap to track certain
>     > issues on the BMC recently, and would like to add support for all DBus
>     > messages to the visualization tool, making it somewhat resemble a GUI
>     > version of dbus-pcap.  The goal would be to be able to use this tool to
>     > investigate both DBus and IPMI. The way I plan to use it would be more
>     > similar to how I use GPUView (full-system timeline rather than
>     > inspecting individual packets)
> 
> Interestingly, I was not that clearly aware of dbus-pcap :-)
> I ought to know more, as the lead libpcap maintainer.
> Is this visualization tool part of openbmc, or is it a generic dbus
> visualization tool?

It's not really a visualisation tool so much as a script that will interpret the D-Bus-specifics of a D-Bus pcap. It's a commandline script that provides filtering based on D-Bus match specifications. You can capture all traffic on the system bus in any systemd-based system with `busctl capture > /tmp/my.pcap` and then run `dbus-pcap my.pcap` to dump the packet contents.

> 
> We recently brought rpcapd into the mix; it can be invoked via ssh.
> I wonder if that might help you as a debug tool?

I'm not sure, I'm not familiar with rpcapd. I'll have a google.

> 
>     > If you ask how this user interface might differ from the already
>     > existing dbus visualizers such as bustle, my answer would be: it will
>     > present information in a way that's more relevant to the BMC, putting a
>     > bit more focus on BMC-specific DBus messages, such as HWMon and RedFish
>     > DBus messages, to present information in a high signal-noise ratio way.
> 
> Would this need to run on the BMC itself?

Hopefully not given `busctl capture` ?

Andrew
