Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C19434DDAB4
	for <lists+openbmc@lfdr.de>; Fri, 18 Mar 2022 14:40:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KKlWK4H0rz3bSm
	for <lists+openbmc@lfdr.de>; Sat, 19 Mar 2022 00:40:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm2 header.b=egSu1RtA;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=hq106sFA;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fuzziesquirrel.com (client-ip=66.111.4.25;
 helo=out1-smtp.messagingengine.com; envelope-from=bradleyb@fuzziesquirrel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com
 header.a=rsa-sha256 header.s=fm2 header.b=egSu1RtA; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=hq106sFA; 
 dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KKlVw2GLZz3096
 for <openbmc@lists.ozlabs.org>; Sat, 19 Mar 2022 00:39:51 +1100 (AEDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 356735C01A9;
 Fri, 18 Mar 2022 09:39:47 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Fri, 18 Mar 2022 09:39:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 fuzziesquirrel.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; bh=HGWWWxsClLmdt8
 LGTDyH9i0rQEJ4AQu49LXJZrx3yU4=; b=egSu1RtAjOW8LvBN0d7s84paG5e2G2
 ur958jcwbCIr7YDBwa20otQCiWuXiuYjoRtU5jzBzR2WnV7+Nr49CPPGzsC0P6kP
 rP4qbFnd/0WHF1Z1JtD38QpI6eckmgbY94LlwH1LdUIyoi/8g5RN8ETqWjgUYKTm
 eI3MdgCijOsR89N3VeRYKswb5S9pkBjgdu6LHV2eNd+1gq9QJmaDeHPYpPGeKA0w
 64H5RJTsQLdBDzG2RQ4yQBsqpzkpn/2bzlcRtU52ZeDn14eioXJpWo+oDf3USbKV
 oMobJP0aYXNRvVuylbocg5Z6bl1M2BqLl+hbvFav9Q2pGIOV2nsUy/yA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=HGWWWxsClLmdt8LGT
 DyH9i0rQEJ4AQu49LXJZrx3yU4=; b=hq106sFALG7Ept6Lu0WgDvq6LCY1gs3Cd
 U0WCFquUoftD1C1RfAn3hNuLr7S453AgP3hKKkOSVfsgE5olYtc8dr1bquKdrDWP
 YzWHjXyJZOiZpvFphVI7bGOHV5NGzmoEZdcGtE0gm4tCRmcCvd48bZrGxiV+FtWp
 BeDM2TG6+EkdJtXuBbnh4ugZfzSyg+M3KCHENLd70wS1f2Exj1qlqkjc+UVK1G0U
 tn9LrJ22WsA14gGxBkYQdJ7fARGmMMYNNO9u7XYb3O9A0/6b4HnaWW3dOWjiWh31
 OCRUvtL7uluGfoLcfUINSzuYousiCifA5h0naIkFm663jitb20etg==
X-ME-Sender: <xms:oos0Yjzv25Qa4kUru5OQfVGcxu4XejQJANhw7CKfluiJUpqBuEhd-Q>
 <xme:oos0YrTg2tUIAWGJqzI5QkMywtraNmJ9txvEZyEzJRHPnetWa6vwIq2BC2Q-PzzTs
 reD5UuW9Y0UCwMXSQs>
X-ME-Received: <xmr:oos0YtW8Y-n4OSW8RNQ6TA8y_sCho1OxBZx6sR3AYyd9tNdTmbi4EHA6>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudefiedgheegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeeurhgrugcu
 uehishhhohhpuceosghrrggulhgvhigssehfuhiiiihivghsqhhuihhrrhgvlhdrtghomh
 eqnecuggftrfgrthhtvghrnhepfeffhfefheeguddtvddtueeihfduieefkeefieefkeef
 udefueevudelgfekffefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
 hilhhfrhhomhepsghrrggulhgvhigssehfuhiiiihivghsqhhuihhrrhgvlhdrtghomh
X-ME-Proxy: <xmx:oos0YtgwXgrn33hEophJ-AGFPrJ8IIqCH8eDYSpV5BmTNsGq3j9sBA>
 <xmx:oos0YlCgYJ13vL9oiRG3PEuu8-zzImdm10RVJLio8g8_hyGTwS2czQ>
 <xmx:oos0YmK-0nx4sh1C8t6Bfsh4di2TmmgyLGlRUESXwGFvUw9qkphQ-A>
 <xmx:o4s0Yi5_CSmugjzffAcMLA9QCAH4VGXeU0BEvqc1F13Yj9x50JgpCA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 18 Mar 2022 09:39:46 -0400 (EDT)
Date: Fri, 18 Mar 2022 09:39:44 -0400
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Patrick Williams <patrick@stwcx.xyz>
Subject: Re: Software Bill of Materials
Message-ID: <20220318133944.sczzlgki25bynokw@cheese>
References: <CAD2FfiEKfS-=ER9qJ9mftjCsiAiseytrDCcbiCn+EcyKOLd9Mg@mail.gmail.com>
 <YjO0QqLKbNned7dk@heinlein>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <YjO0QqLKbNned7dk@heinlein>
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
Cc: openBMC Maillist <openbmc@lists.ozlabs.org>,
 Richard Hughes <hughsient@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Mar 17, 2022 at 05:20:50PM -0500, Patrick Williams wrote:
>On Thu, Mar 17, 2022 at 04:26:08PM +0000, Richard Hughes wrote:

>> I've been thinking this about the SBoM problem from a firmware point
>> of view, but in a "BMC image" it's often lumped together as one thing,
>> but in reality a single BMC image might contain a BSP/FSP, microcode
>> blob, an EC, a root filesystem and a lot more. Even something as
>> seemingly-monolithic as a USB controller might contain a HAL from the
>> silicon vendor, an ISV-supplied bootloader and an ODM-provided runtime
>> firmware all built together.
>
>I believe most of our BMC images actually are much simpler than you've laid out
>here.  Typically it really is just the BMC code and images for any other devices
>are updated independently.

I think many general purpose offerings do this in the way Richard 
describes.  Can we include that world-view in the disucssion too?

brad
