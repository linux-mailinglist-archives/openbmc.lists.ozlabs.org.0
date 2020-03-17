Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 38676188D26
	for <lists+openbmc@lfdr.de>; Tue, 17 Mar 2020 19:29:00 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48hhWp4x1dzDqlR
	for <lists+openbmc@lfdr.de>; Wed, 18 Mar 2020 05:28:54 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=preossec.com (client-ip=66.111.4.28;
 helo=out4-smtp.messagingengine.com; envelope-from=lee@preossec.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=preossec.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=preossec.com header.i=@preossec.com header.a=rsa-sha256
 header.s=mesmtp header.b=xvgVH1uV; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=khrh6kMl; 
 dkim-atps=neutral
X-Greylist: delayed 442 seconds by postgrey-1.36 at bilbo;
 Wed, 18 Mar 2020 05:27:54 AEDT
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48hhVf4zFxzDqlB
 for <openbmc@lists.ozlabs.org>; Wed, 18 Mar 2020 05:27:54 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 006825C024F
 for <openbmc@lists.ozlabs.org>; Tue, 17 Mar 2020 14:20:16 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 17 Mar 2020 14:20:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=preossec.com; h=
 subject:to:references:from:message-id:date:mime-version
 :in-reply-to:content-type:content-transfer-encoding; s=mesmtp;
 bh=elPz5r+dLX3olBOf9lsMjOBb8NVw4aLB7VzfkvSGOWw=; b=xvgVH1uVrGqm
 WfZtqe7uWqchKkEa/rmPwleTDILhu0rWnpP86LaV6Ck/kKzEjWUFhyoez+/5AfIo
 GufPbGYkXXa9DrnFdmXrWm+cHsTMijxNlL+yQRsfi0zb86C44JDuUkAcBKqoWb+B
 gkyjE8YuLzG9vpsu4eu69pIgpSgIPME=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=elPz5r+dLX3olBOf9lsMjOBb8NVw4aLB7VzfkvSGO
 Ww=; b=khrh6kMl+gy7saDqSolLAJXjwjxJApAsf6Pr60gNIHVJsFuSiVBEC+/wm
 i8VfF8MiV3iRw8YVWc70EIXSTE8wZ5EGfF1hwjusqYBZ3VXVvL9/58Cbo71ZhXru
 lT6GlslbO7romiC2ngPlDpjtnYfn1fRB4ZtN2AZAHHCUrqlHIr/1Ke5mai1U00Hi
 qbGXcZb/cHwl7gorPvmDbyWRI6eyqXpgWmAhPBiKejRJVx1lG2iP4z7E93u0+VDg
 qD1y+CM1b7P2CHBWvCY/lHr8Gt+vAGYRCq6TPEZLcR2C6y+mcV7ixqtm9OyF9TSz
 C1zlCNBKJFiTfDei6dKn6kMI50jXg==
X-ME-Sender: <xms:3xRxXuMbmGFMNYCl7AIukfTuP6bx5NKNm3QWxJDzIWNSflYoErgqhg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrudefhedguddtiecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhepuffvfhfhkffffgggjggtgfesth
 ejredttdefjeenucfhrhhomhepnfgvvgcuhfhishhhvghruceolhgvvgesphhrvghoshhs
 vggtrdgtohhmqeenucffohhmrghinheplhgruhhntghhphgrugdrnhgvthdpghhithhhuh
 gsrdgtohhmpdhfihhrmhifrghrvghsvggtuhhrihhthidrtghomhenucfkphephedtrdef
 hedrledrvddvudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
 hrohhmpehlvggvsehprhgvohhsshgvtgdrtghomh
X-ME-Proxy: <xmx:3xRxXv0zobSI2GLU2u2ecTfmwcTC42kJgZfFKAF41_Yavb7k7ZDLxA>
 <xmx:3xRxXmEQCPIIPlPYmJiCsF9ngeyHMELkOLPa3YomjTjiBeSQI2SAVA>
 <xmx:3xRxXgj1TrUOL5QErNCT0h0N7TA774NVJB2K6XATbLHLh_hxSBEIPg>
 <xmx:3xRxXt4ToJpbn4PP1J9wlSw0hzCnub35KYoRHcBRTm8TduqLpUDycw>
Received: from [192.168.1.100] (unknown [50.35.9.221])
 by mail.messagingengine.com (Postfix) with ESMTPA id 593FA3280064
 for <openbmc@lists.ozlabs.org>; Tue, 17 Mar 2020 14:20:15 -0400 (EDT)
Subject: Re: openbmc-specific dynamic security scanner
To: openbmc <openbmc@lists.ozlabs.org>
References: <d2bdd336-88ee-19f7-9215-2c0ede78e3bb@linux.ibm.com>
From: Lee Fisher <lee@preossec.com>
Message-ID: <9bb74bdc-bb09-0206-1431-04979e664235@preossec.com>
Date: Tue, 17 Mar 2020 11:20:11 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <d2bdd336-88ee-19f7-9215-2c0ede78e3bb@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
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


On 3/17/20 8:01 AM, Joseph Reynolds wrote:
> [...] And I am looking for your feedback.

Perhaps, instead of creating a new OpenBMC-centric security tool, add
OpenBMC-centric tests to an existing firmware security testing tool.
IMO, there are basically two existing firmware security tools, FWTS and
CHIPSEC.

FirmWare Test Suite (FWTS) is from Canonical to run diagnostics (not
necessarily security-centric) to see if a system (HW/FW) is capable of
running an OS. Runs on multiple ISAs. Has security tests, but not
security-centric. Probably has the best set of ACPI tests available,
recommended by UEFI Forum for PC vendors doing ACPI testing. GPL C codebase.

https://launchpad.net/fwts

CHIPSEC is a firmware security-centric tool from Intel. It has existing
security checks that OpenBMC could use. Main downside -- IMO -- is that
it only works on Intel hardware, no support for
AMD/ARM/RISC-V/POWER/etc. GPL Python codebase with a bit of asm.

https://github.com/chipsec/chipsec

HTH,
Lee
blog: https://firmwaresecurity.com/

