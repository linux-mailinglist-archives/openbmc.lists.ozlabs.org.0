Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ABE0D8426
	for <lists+openbmc@lfdr.de>; Wed, 16 Oct 2019 01:02:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46t9tb09sgzDr6t
	for <lists+openbmc@lfdr.de>; Wed, 16 Oct 2019 10:02:31 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=64.147.123.24; helo=wout1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="gB+csWRg"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="UrlWS/c2"; dkim-atps=neutral
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46t9sd35FdzDr4L
 for <openbmc@lists.ozlabs.org>; Wed, 16 Oct 2019 10:01:40 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id AD237668
 for <openbmc@lists.ozlabs.org>; Tue, 15 Oct 2019 19:01:36 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Tue, 15 Oct 2019 19:01:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type; s=fm1; bh=XuzU7atM/sAvwlx/52gQvRk+fkv1a9u
 SHJyQWJjo8gg=; b=gB+csWRggTTzSvVbxvxr3213bGlJYMZcdrw6OyG4yPuYTq/
 RKFfC9CjcJy8vES7ehYF+KpT5axlzfTX3DIb00isHA3b07KXP226FIMRENttlJ5x
 kqraaz6a4v/HStgT9qysiPkv2j+H7wKjX6JYNzfRrfT0pneH5hxFW62NZTaOVDUb
 W/H3uPmbR1GvgpIxS/b5g4PU58Q8jbaJvEriSDHSdDfh+mcdxLglV1ZiFGcvIKyo
 jfpMJ0dJ1OoJ+iGh+QxM1P5jbJESjkZoI3yz7KoLsdsXnrmp8g2e0DXqHRxT6CIR
 emaJEtkAyvxvlZnrTwrxk4hHokFzWk1hDf/6CoA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=XuzU7a
 tM/sAvwlx/52gQvRk+fkv1a9uSHJyQWJjo8gg=; b=UrlWS/c2IIUgSkt2bihKkQ
 p+PVk1AqnQlx1qGVyR4YxQ4AItH1MzTMBuL1D7D6P8/rOpx+TsZHJ8zF3nFf3Z3L
 yRalisnhY2FB1H4nk51ptShpFsf9oZCHiEjBajlwWEwC2CgqObf9Mrdey5qpCx4N
 akJvFIGbtqQ9fkBif/QFqvVdoTHVe+4VZsUEOf1kkGwatBYDF3cXuKfsDIp8vflx
 KJwSsxDsoPa3+Y2fvBxgL2p6aHLQMOIRNwz/QbrZ+Hp8TemVDRnmlyo0iXcWoKyu
 RzhALTbePH6VKwQnr0IqPk5aE9at61JNL+T90txontzyxk1nnelzPllDcj/NIU9A
 ==
X-ME-Sender: <xms:0E-mXSo-scPJ3kEBwyL6gMQOIHTHIhuQqdIqsBh9iSPPZJbfSteRdg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrjeeggdduiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhepofgfggfkjghffffhvffutgesthdtre
 dtreerjeenucfhrhhomhepfdetnhgurhgvficulfgvfhhfvghrhidfuceorghnughrvgif
 segrjhdrihgurdgruheqnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrg
 hjrdhiugdrrghunecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:0E-mXU4pLuxe9O22Bo0faHQ1G07zSvFsYmPhOiL5hjTyFr3uQ3R-UA>
 <xmx:0E-mXSOXVoJYsXWXoNN7n2HZO8Rtx8pOPvubAcWMVJ5hbcgCye9cIA>
 <xmx:0E-mXWPV6gffnI2F8rxWhgG_mIXZgjDHkpG6JShn12QONZf5JLk92w>
 <xmx:0E-mXRBZEmO8ylnsTahf_xvjE3BqGwzmAiktQeGYp-btC1vTVSh2qg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id DED13E00A5; Tue, 15 Oct 2019 19:01:35 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-360-g7dda896-fmstable-20191004v2
Mime-Version: 1.0
Message-Id: <cf5ea5e2-3d0d-4546-9521-59fa05798b09@www.fastmail.com>
In-Reply-To: <8b5e67d9cd5d478b9ceb1201c56fc25a@SCL-EXCHMB-13.phoenix.com>
References: <8b5e67d9cd5d478b9ceb1201c56fc25a@SCL-EXCHMB-13.phoenix.com>
Date: Wed, 16 Oct 2019 09:32:33 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: openbmc@lists.ozlabs.org
Subject: =?UTF-8?Q?Re:_"No_Hardware_Required"_qemu-system-arm_no_services_running?=
 =?UTF-8?Q?_Ports_80,__443,_and_623,_why=3F?=
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

Hi Bruce!

On Wed, 16 Oct 2019, at 05:19, Bruce Mitchell wrote:
>  
> Hello,
> 
> 
> In the 11/3/2016 CAusten-OpenBMC.pdf presentation it is stated, on page 
> 12 of 18, "No Hardware Required".
> 
> I have obmc-phosphor-image-romulus.static.mtd and 
> obmc-phosphor-image-s2600wf-20191004165402.static.mtd
> 
> booting with qemu-system-arm and login in, however neither have any TCP 
> servers running on Ports 80, 443, and 623.
> 
> 
> So what am I missing in the process?

It's hard to say without more information. A couple of things would help:

1. Please paste the command line you're using to invoke qemu
2. Please provide the output from the journal
3. How did you obtain the obmc-phosphor-image-romulus.static.mtd and'
obmc-phosphor-image-s2600wf-20191004165402.static.mtd images?

Generally when asking questions like yours you should try to provide enough
information for someone to reproduce the issue you're seeing. That way
if we _can_ reproduce it we can poke at the system to debug without delays
or misunderstandings.

Cheers,

Andrew
