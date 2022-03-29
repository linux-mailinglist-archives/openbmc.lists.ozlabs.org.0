Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F30844EA969
	for <lists+openbmc@lfdr.de>; Tue, 29 Mar 2022 10:34:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KSNC06WzWz3c60
	for <lists+openbmc@lfdr.de>; Tue, 29 Mar 2022 19:34:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm3 header.b=UCo5xVnv;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=JQKycoTg;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.224;
 helo=new2-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm3 header.b=UCo5xVnv; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=JQKycoTg; 
 dkim-atps=neutral
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KSN996f2qz2yb5;
 Tue, 29 Mar 2022 19:32:29 +1100 (AEDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id C8AFC580117;
 Tue, 29 Mar 2022 04:32:25 -0400 (EDT)
Received: from imap49 ([10.202.2.99])
 by compute5.internal (MEProxy); Tue, 29 Mar 2022 04:32:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; bh=g+MRVCTHkd5UITx1/MCA0rtdiS/Q7gdlkLwbx1
 Cvlxo=; b=UCo5xVnvSc2K5kqHRzTJYLeCTDsbjgl6xT1NBykQQVKMp4Ur92CcFO
 AVM/JayZKVAC/L65NLtrgIbuEHLVwP1Co3xz7FvhPeYlG1Aa5OHK5Qzj2LLMcBlE
 WDtU+9q9xR4065u7bzMG2cnDmDNge9YR3DUCJyjxKPy6ijNuBxr2WhIiWtmAFGLx
 CaVwyLl64hj1MiG3Uig1TLYu4vrIGHosrlS82ja6VAHEBoC5JYmZ2CKUWQMpqg+p
 LhX0oBQIe2SVGDKB1tl9YuLNvxELH4cOL2WMDEfBEJeyYF2z/QfC0sM0WfFEA9jv
 yiENlM4gRwAggRNn+gcXyaRjlMVLYwRQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=g+MRVCTHkd5UITx1/
 MCA0rtdiS/Q7gdlkLwbx1Cvlxo=; b=JQKycoTgRna0MzP3EC2Bm6lralytF7Tvt
 lO0V5VJRByINopZ+fWpwTMDpmc9b/kA60ODT10jjyv7RLyd3OIx56kYmaRKvKXC+
 9qywkBjHLtg84fuHVkJ82sdvyWSVvO7j8dRzTPrBA5cWRk2mWM6v+O/RybVFk6XN
 1317aXIiz7LSlCY9H/UvNDXEnOEWcl2X8I5I9ZMOO6mUX7BmtuqNX/TOlTncnjxM
 vnb/YbOBUfwse4qT7wmShdeh7Zr9gvKg4veBUWBzDumgWjl4uoEolDtlj0LQms3L
 KmnJxQzF1LHoY56R0OmEIx4KCtCggE0RHmifBELWQFRqbXe/dRoUQ==
X-ME-Sender: <xms:GMRCYi9lAlRf_jy7QNeRahO_YXR-VhpiMkQ_YloAqeAlNIQCJYksiQ>
 <xme:GMRCYitrNz2rRmWvgRBDL9li4UdVscERnbnixCB8cuM7YHtD6CAt27u0YdYH6glcG
 xVRD9PHWS3Uu0dLBA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudehledgtddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhephefhfeekgfekudevheffheeihedujeefjeevjeefudfgfeeutdeuvdeh
 hfevueffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:GMRCYoCb5efEYVXCkjDv6RMqt50vpeN1UgDVvgcJYHA7Q7yrh-bcyw>
 <xmx:GMRCYqehW6WYsT5oizMPuHR-1iStUAS0tj_iRWm6Rvh2pxQnybYqzA>
 <xmx:GMRCYnOid8_hb9g4tQfGh5YCQefCRBpCLNIYlNoVWZYfWgt5M14Cig>
 <xmx:GcRCYhUHyBdj-xhT55yXBJuRVssviSpjCt6GNkSVx49WFreCEk1xiw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 599DFF6043F; Tue, 29 Mar 2022 04:32:24 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-4911-g925b585eab-fm-20220323.003-g925b585e
Mime-Version: 1.0
Message-Id: <a2542d9f-581a-49be-8e70-722fd98ab6f1@www.fastmail.com>
In-Reply-To: <YkK691VG6ON/6Ysn@atomide.com>
References: <20220328000915.15041-1-ansuelsmth@gmail.com>
 <CAFr9PXkgrRe-=E=GhNnZ4w1x_FMb97-_RmX6ND1vEd74_TbZSw@mail.gmail.com>
 <YkK691VG6ON/6Ysn@atomide.com>
Date: Tue, 29 Mar 2022 19:02:04 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Tony Lindgren" <tony@atomide.com>, "Daniel Palmer" <daniel@0x0f.com>
Subject: Re: [RFC PATCH 0/1] Categorize ARM dts directory
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
Cc: linux-aspeed@lists.ozlabs.org, linux-realtek-soc@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, chrome-platform@lists.linux.dev,
 linux-samsung-soc@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-arm-kernel@axis.com, linux-rockchip@lists.infradead.org,
 linux-sunxi@lists.linux.dev, DTML <devicetree@vger.kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-actions@lists.infradead.org,
 linux-unisoc@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-omap@vger.kernel.org,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Ansuel Smith <ansuelsmth@gmail.com>, linux-renesas-soc@vger.kernel.org,
 kernel@dh-electronics.com, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-oxnas@groups.io
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Tue, 29 Mar 2022, at 18:23, Tony Lindgren wrote:
> Hi,
>
> * Daniel Palmer <daniel@0x0f.com> [220328 08:53]:
>> Hi Ansuel
>> 
>> On Mon, 28 Mar 2022 at 09:09, Ansuel Smith <ansuelsmth@gmail.com> wrote:
>> >
>> > Hi,
>> > as the title say, the intention of this ""series"" is to finally categorize
>> > the ARM dts directory in subdirectory for each oem.
>> 
>> While I agree with this change and think it's for the good (browsing
>> the ARM dts directory at the moment is frustrating..) I think
>> buildroot and others need to be told about this as it'll potentially
>> break their kernel build scripting for ARM and probably messes up the
>> configs they have for existing boards.
>
> Yeah.. And ideally this would be done in smaller steps as these will
> conflict with all the other pending patches.
>
> For example, I have a pile of pending omap clock clean-up dts patches
> posted and tested waiting for v5.19-rc1 to apply. I'd rather not start
> redoing or fixing up the patches with sed :)
>
> What I'd like to have see is that at some point when suitable we move
> one machine at a time with a script if possible.. Maybe the dtb files
> generated would need to remain in the current directory until all of
> the machine dts files are moved? That should help with the build
> scripting too probably :)

There's probably some reason not to, but could we symlink the new paths 
in the subdirectories to the existing files to handle the transition? 
Then do the move to remove the symlinks at some future point.

Andrew
