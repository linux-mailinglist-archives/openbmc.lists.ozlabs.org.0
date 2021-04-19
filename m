Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E4B136460F
	for <lists+openbmc@lfdr.de>; Mon, 19 Apr 2021 16:26:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FP8Jv6rBkz2xZy
	for <lists+openbmc@lfdr.de>; Tue, 20 Apr 2021 00:26:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm2 header.b=QNjqINn/;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=iuGZz15l;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fuzziesquirrel.com (client-ip=64.147.123.20;
 helo=wout4-smtp.messagingengine.com; envelope-from=bradleyb@fuzziesquirrel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com
 header.a=rsa-sha256 header.s=fm2 header.b=QNjqINn/; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=iuGZz15l; 
 dkim-atps=neutral
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FP8Jc2cs3z2xZQ
 for <openbmc@lists.ozlabs.org>; Tue, 20 Apr 2021 00:26:39 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 1A881B7B;
 Mon, 19 Apr 2021 10:26:35 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 19 Apr 2021 10:26:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 fuzziesquirrel.com; h=date:from:to:cc:subject:message-id
 :references:mime-version:content-type:in-reply-to; s=fm2; bh=1Dj
 JjuxI6tHWzs9dE4+twvTHy9guDGMVdDg5J5uzFdI=; b=QNjqINn/csF3rJ2nmo6
 KlwpzlxWOAye8k4DHJ3hAT5ftMlV1UUdtFy1WlJ+19on3Fffh6hHxg4RVJKCkeqr
 SXy+JGWDexgAklPUa2V+1IJBmF2fkaEIffiemQYcCQ4HPEWLJipBqWiXMAM76Eme
 UlEQw2gno//GXvsZjEnc8aGHPHfSlPHSac29Z3IG3f6U7OZLh3gq7l24+up+bda8
 lTKGIpGCSCJI/LoRWBEZ63MZRcs3Mc+UHRjsfwJMgVhNABH9K5FO5/TfqJ8kQBNK
 TSLtG24lFTVl9yvxJUeHFLZ9VvmJFUvY6qz3SMQZETIqi+yfjFLYaMi9u2CntfN0
 vCw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=1DjJju
 xI6tHWzs9dE4+twvTHy9guDGMVdDg5J5uzFdI=; b=iuGZz15lrneZtQZYVoq0DU
 a5Pn6HDrzyXnwNPOVyQMNdA6qlBNta8zbsDy6lB1w/YXDdjeqllkpVtztPL8TWtS
 dFV3r1RTprFni3LSx/LspuhatmzBw2Au5IKdNuBRHpQQR+2ou+2Abykxqm4/gsWO
 kPRx5qe9V26P0nX84VWwgbxPiSNJqHW6RcN0s1TscJsHCfhOzXNhwneyp1Uexyrg
 MjleQxHEzAUC19q4c3IIdSmc8W8gray4KPqlzlAXlhnzpb+r3tqEuVcPZucwqmmM
 UA0OXIcPvZeLETSvy2kbRHaEScaDnMb6h2QmmkMcMvomSsHpOfitDvN9RU/cZiAg
 ==
X-ME-Sender: <xms:GZN9YDO4nHKsTbWFUV-Wy_zjprH_vvlfRKu-9OIAqgyYfGjqQ5P7tg>
 <xme:GZN9YN9bMusHzpg40GGLXjpQ8jHVNkJQSzBUaGW6-dJ8amobkW_yOQGSHh2BLJj_T
 PDVwvLtaMl9NAju82I>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvddtgedgjeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeeurhgrugcu
 uehishhhohhpuceosghrrggulhgvhigssehfuhiiiihivghsqhhuihhrrhgvlhdrtghomh
 eqnecuggftrfgrthhtvghrnhepfeffhfefheeguddtvddtueeihfduieefkeefieefkeef
 udefueevudelgfekffefnecukfhppedujeefrdduieejrdefuddrudeljeenucevlhhush
 htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsrhgrughlvgihsges
 fhhuiiiiihgvshhquhhirhhrvghlrdgtohhm
X-ME-Proxy: <xmx:GZN9YCTQ7237KcEvT-kvJL0kdeR9rgwQyYG9oJ2lHk1mGjbU5yJ28w>
 <xmx:GZN9YHtjL6JAdIvXPTuizEhwzPuQYxwGG7cIElY2I8BbfUOi-p30MA>
 <xmx:GZN9YLehNT3fiZPAyjgkHz70ElR_cVS0c7fUztwQnA0Fk3PPXzj4mA>
 <xmx:GpN9YMqOmPhJKKFaaDUiOuKz2lJ6ems05aTK-cxHcE8bjw3EGYNL2Q>
Received: from thinkpad.fuzziesquirrel.com (unknown [173.167.31.197])
 by mail.messagingengine.com (Postfix) with ESMTPA id 8DF271080066;
 Mon, 19 Apr 2021 10:26:33 -0400 (EDT)
Date: Mon, 19 Apr 2021 10:26:31 -0400
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: "yugang.chen" <yugang.chen@linux.intel.com>
Subject: Re: apply for a new repo "openbmc/node-data-sync"
Message-ID: <20210419142631.eutfkickwfke7aq3@thinkpad.fuzziesquirrel.com>
References: <cab2988f-76b8-6a30-5fa9-0ee8030af7f0@linux.intel.com>
 <AF9887DB-F6CB-4CE0-90B1-17FEA2497013@fuzziesquirrel.com>
 <bd64513a-76f6-7617-9942-ced892b2c500@linux.intel.com>
 <CAH2-KxAe7v2ptH5SEJkd5YeQ-nCo_JQvwCoS5nU=ZLFac+tAuw@mail.gmail.com>
 <2e6ff1b9-733b-56ca-5cd6-fab6f0b20530@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <2e6ff1b9-733b-56ca-5cd6-fab6f0b20530@linux.intel.com>
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
Cc: "Bills, Jason M" <jason.m.bills@linux.intel.com>,
 Ed Tanous <edtanous@google.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 chunhui.jia@linux.intel.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Daniel

Typically email attachments are not opened.  To ensure your mail gets 
read, avoid attachments.  Resending without the attachment...

On Mon, Apr 19, 2021 at 12:41:00PM +0800, yugang.chen wrote:
>attach the design document, please take a look.
>
>Best Regards
>Daniel(Yugang)
>

># Modular System Support - PCH IO Expander
>
>Author: Chen, Yugang
>
>## Problem Description
>When multi modular 2 socket reference platforms (RP) are connected together,
>the BMCs on each RP shall support the ability to manage the system as either
>single 4S/8S system or standalone as 2S systems.
>
>## Background and References
>In 4S/8S mode, only one PCH works at DMI (Direct Media Interface) mode,
>this PCH is called legacy PCH (PCH.L), the other PCHs are called PCH IO Expander
>(PCH.IO). The BMC attached to the PCH.L works as a primary and the other BMCs
>work as secondaries.
>
>## Requirements
>Check a modular system as either 4S/8S or standalone mode by GPIOs on BMC each
>time system AC on.
>Each BMC works independently in standalone mode.
>In 4S/8S mode, only primary BMC is responsible for management of system level
>resources, secondary BMCs need to collect its local management resources and report
>them to primary BMC.
>
>## Proposed Design
>Each BMC will have a property to reveal its work mode. Users can know if BMC is in standalone mode or 4S/8S mode.
>Each BMC has another property to show if the BMC mode is PCH Legacy BMC or
>Non-Legacy BMC. PCH Legacy BMC is working as primary and Non-Legacy BMC working
>as secondary.
>
>Each time a BMC reboot, The BMC needs to check 3 GPIO Pins: FM_STANDALONE_MONDE_N / FM_4S_8S_N_MODE / FM_NODE_ID to get working mode as standalone mode or primary /secondary(4S/8S) role according to the GPIO values.
>After confirming the mode and BMCs' role, BMCs should set properties according
>to the correct configuration.
>In 4S/8S mode only node id 0 will be primary BMC because only this node will be the PCH.L. Node id 1,2,3 will be the secondary nodes.
>
>Once a BMC gets mode is in 4S/8S, node roles are configured by node
>ID (GPIO Pins) and keep consistent once AC on. Once node role check is done,
>
>In 4S/8S mode, Primary BMC needs to broadcast its role to make sure there is only
>one primary BMC in the system.
>
>Need a new feature to make sure secondary BMCs send local redfish events to primary
>BMC. And primary BMC needs to add a tag to those events coming from secondary BMC so
>that user can know the event logs happened on which node.
>
>Even in 4S/8S mode, each BMC will collect its local management resources,
>including sensors, fans and do FSC according to the values of local sensors.
>PSU and Fans on each node will not be connected together. Configuration
>settings of each secondary node will remain the same, and won't be synced across
>the nodes.
>
>In 4S/8S mode, PECI will only be connected to primary node. Primary BMC needs to
>monitor all CPU and DIMM sensors and deliver the sensor values of the CPUs/DIMMs
>on secondary nodes to secondary BMCs. So that secondary BMCs can use the sensor values to control their own FSCs. Primary BMC also needs to have a way to find how many
>CPUs are in the whole system include Primary and Secondary nodes.
>
>## Alternatives Considered
>Primary node monitors all the IPMI sensors in secondary nodes and creates redfish log
>by itself.
>
>Instead of BMC reboot, only AC cycle will make BMCs check GPIO pins and set
>Legacy BMC or Non-Legacy BMC mode.
>
>Only primary BMC broadcast its role and secondary only waiting for the broadcast
>from primary.
>
>## Impacts
>Only on the motherboard where legacy PCH is located, POST code/Front Panel/KCS
>port/UART will work, while these interfaces on board with non-legacy PCH will
>not work due to BIOS and HW design. And this will cause non-functioning of
>SOL/KVM/Virtual media on secondary BMCs.
