Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4832734B0FE
	for <lists+openbmc@lfdr.de>; Fri, 26 Mar 2021 22:01:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F6ZCD1w34z30hl
	for <lists+openbmc@lfdr.de>; Sat, 27 Mar 2021 08:01:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=KyBAwMKo;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=ho3F79Gd;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.27;
 helo=out3-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=KyBAwMKo; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=ho3F79Gd; 
 dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F6ZBy1Fy2z2xYj
 for <openbmc@lists.ozlabs.org>; Sat, 27 Mar 2021 08:01:13 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 603865C00A8
 for <openbmc@lists.ozlabs.org>; Fri, 26 Mar 2021 17:01:09 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Fri, 26 Mar 2021 17:01:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type; s=fm2; bh=sS6I1TxwQI1yBahIHKnqZ4E/lq0+SOF
 qOge9rfpDu/0=; b=KyBAwMKoyP2uylG3HattLZiC9qLRQRPLg4nE98l4lIyJyrC
 Hqi64oLtBfz4atM8Oxy7/l4RlgYFZHXOWTF2X704EeyqUFsvxvDhl/X6hs2Cl5Dq
 LCxEczjcMXBRHLg/wANm658zont+C+ZO0Jdvt5ssLqnLcSgV3YuwciW7WBaQJvDI
 ysg/8vBiJjGaO8kQxb5Zbqx0+jlmEblRrW27CVQPLYOuba2vXYPUInsLplfhNx8U
 p+Cblf6PpFYEdnJqC6H2Bzijp/GG4DhxbzC0Wx/WsNeLcN/LDNMPhVPPMyFQSq4x
 bnUQndgLbmRzonUOPUaU+i6PpUCEiz5Vi3dCO6Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=sS6I1T
 xwQI1yBahIHKnqZ4E/lq0+SOFqOge9rfpDu/0=; b=ho3F79GdmPF20vxZrDe/j3
 k9JEcFgF0dSbH/V4DsLiKTn6+PbeqKZJqVCT8SLNWbRWgJ/7Y2PyQ/yfOGuxGiFK
 bfBkIFP26KfxTpiiuKmeylqQK5F4poe4mtAPF4GUYnsoGlASPIvng8ygiqeVDdd0
 UgrVlwh3VVWZdT1dGCeTQv9LMYKfPHG/hexXCgMrw9kA54OVhAEaI0mi3bdEXFbA
 wVp+A4rLzyJGz7Y85bAO/D2yN1L6T6J2wKosClu1w7uAKgqSfSJuINuT1LyOV52+
 sz/qj+R9SDVGnCsyeVtvyEsP1b+pET1yCyMuCXzIW1U1YmTsh26ZjzeSvbJlewLA
 ==
X-ME-Sender: <xms:lEteYDwmkEvhURiElJ5GEnNprmpw00-xA_mZJXFUIa0pDORh5Fr2iw>
 <xme:lEteYLRLAD71PHju4EHgYoAv-58_rnRq_79WvXRfz9fDrTWZVBMb8VHkoH3WK8YI5
 E7fdNTAYm4i0oysbA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudehvddgudegkecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhepofgfggfkjghffffhvffutgesth
 dtredtreertdenucfhrhhomhepfdetnhgurhgvficulfgvfhhfvghrhidfuceorghnughr
 vgifsegrjhdrihgurdgruheqnecuggftrfgrthhtvghrnhepudfftddvveekfffgteffff
 euveegjeelgefhffejtdehtdfhlefgkeefhfefkeeinecuffhomhgrihhnpehkvghrnhgv
 lhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:lEteYNVLdIPBQJXUF7PalXqAUPxEgH_bC-JxPImjm2Dk3NWYhvLT8A>
 <xmx:lEteYNgT5Veo2FwJ66qA8soHs7-NLPO-I1eitBSRsGIK8vhsmfkn5A>
 <xmx:lEteYFBHwRNjZyBMtjRxAYDIhSpHn2fRmJMVZEMRfslg_cfxyzMWbQ>
 <xmx:lUteYIOcUJzmmMd_2ojs5QXoSnvs46n02HXI7mVAJS-zJCHGV79R9Q>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 90E65A00079; Fri, 26 Mar 2021 17:01:08 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-273-g8500d2492d-fm-20210323.002-g8500d249
Mime-Version: 1.0
Message-Id: <7cce5f73-e7f5-4d3a-8b79-c8dc65059813@beta.fastmail.com>
In-Reply-To: <36bafa0b-5dd3-6da5-b18d-847ee4a46459@linux.intel.com>
References: <gmu36wVnmbV9lyt9EpYcnZmnPwjF9wtDS0N8K0jOk9UR2uUO0QwQaackzJRPLjil_ZqLxTzX3qEMGl3IE6baoIpS-xh9aMnQL3VkAyXK6KU=@protonmail.com>
 <0a6dd101-fbea-7fdf-b9a6-3895b48a7f47@linux.ibm.com>
 <5197cbe7-1a8b-80ab-2712-9a8f07457432@linux.vnet.ibm.com>
 <nGEUmLQrNSqmytvShVUeFvOUKjW1cOTYv9Hrcmj7LyP1rfIdLOt8f7IkqzPKaXHZXHRGYtHBcjnt6Qo5c1fIw4doEmVwMmGI2e2rNhNXWZw=@protonmail.com>
 <5bcbc6b0-b9d3-a002-0f24-97bd91ba5bf8@linux.vnet.ibm.com>
 <36bafa0b-5dd3-6da5-b18d-847ee4a46459@linux.intel.com>
Date: Sat, 27 Mar 2021 07:30:47 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: openbmc@lists.ozlabs.org
Subject: Re: IPMI SEL Parsing
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



On Sat, 27 Mar 2021, at 02:38, Bills, Jason M wrote:
> 
> 
> On 3/26/2021 6:47 AM, Bruce Mitchell wrote:
> > On 3/26/2021 01:04, rgrs wrote:
> >> Hi Matt, Bruce,
> >>
> >> Yes, SELs for sensor events, threshold alarms.
> >> When a sensor value is beyond the range of thresholds, we need to log 
> >> the SEL.
> >>
> >> My understanding of OpenBMC implementation:
> >> dbus-sensors/phosphor-hwmon logs d-bus errors (logging/entry).
> >> Each entry object has a "callout", that is used by phosphor-ipmi-host 
> >> to convert dbus-error logs to IPMI SEL (16 bytes).
> Please note that there are two locations that SEL entries can be logged:
> 1. D-Bus
> 2. Journal/syslog
> 
> It looks like you are using D-Bus which I'm not familiar with.
> 
> >>
> >>
> >> The issue I am facing:
> >> 1. SEL creation: when I change sensor thresholds, I don't see a log 
> >> generated for that sensor.
> >> (phosphor-sel-logger has the capability to monitor threshold events 
> >> and log SEL. But phosphor-hwmon doesn't generate the signal that 
> >> phosphor-sel-logger is looking for.)
> There is another thread on the mailing list that is discussing this 
> issue: Question of phosphor-sel-logger. 

Note that we have the list archived on https://lore.kernel.org/ at https://lore.kernel.org/openbmc and this is a great way to identify other posts :)

> We can use that thread to 
> resolve this signaling issue.

Looks like it's

https://lore.kernel.org/openbmc/TY2PR04MB3712DCE11C578706F5F6401F88639@TY2PR04MB3712.apcprd04.prod.outlook.com/

Andrew
