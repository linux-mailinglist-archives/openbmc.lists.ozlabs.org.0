Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C443018A0D5
	for <lists+openbmc@lfdr.de>; Wed, 18 Mar 2020 17:47:16 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48jGD20YRqzDr0C
	for <lists+openbmc@lfdr.de>; Thu, 19 Mar 2020 03:47:14 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=preossec.com (client-ip=66.111.4.26;
 helo=out2-smtp.messagingengine.com; envelope-from=lee@preossec.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=preossec.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=preossec.com header.i=@preossec.com header.a=rsa-sha256
 header.s=mesmtp header.b=dswFkJ0V; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=Yop5wayN; 
 dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48jGC81tfhzDqxj
 for <openbmc@lists.ozlabs.org>; Thu, 19 Mar 2020 03:46:27 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 970D55C02CD
 for <openbmc@lists.ozlabs.org>; Wed, 18 Mar 2020 12:46:23 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 18 Mar 2020 12:46:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=preossec.com; h=
 subject:to:references:from:message-id:date:mime-version
 :in-reply-to:content-type:content-transfer-encoding; s=mesmtp;
 bh=sDU6qUDQIIPWIYtXD1baU5owlMoHnVAJL5yLgs+MZEQ=; b=dswFkJ0VZlJi
 lShlezpPKYvnODUR7+ml0ju0DxLHANBtauT3hYUZzhzIEpw9chliw1AJTfyVy/8k
 bwj5jl85+toXfnqwVcHaPRPSWJQDhd7ULvSSjRkPMI3V3yAVYY28AhCaz+mHA8WP
 jJLJMce6VEqWSApYFkcJ8z0vowIh2xw=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=sDU6qUDQIIPWIYtXD1baU5owlMoHnVAJL5yLgs+MZ
 EQ=; b=Yop5wayNy7tLoMWG0Foh2yE534ygtgGqCnyA1dbhyR3AV8ga6cOwbTBtj
 Xc9ckN/spAQrR2SBdlg17RD2eHXhxekNLbfIZzxNfi2BOAC4+vJmVQ9YL5QN7j//
 tWm2TLCxkObMQPdz8p3KKhNkNgqtgKOrwojAR+P8KQzj0bzpIdMcLjy5PV9O48+t
 HKCOCzS3pMw1v57HIa6KSj/xtwQTWeEKMe8E0SDg+eLPkQa5rq8nfi+YMnwqyomk
 w00fEcl9k7X20jLZGexnd0YRnG3uwtGr8HXT0NL9q7nRhn7AD9FatudL8yR42DIG
 3o2aMUT/IH2zPJKkMDD6eiBbHcw8Q==
X-ME-Sender: <xms:X1ByXtpUZRIKtHGuuXDNUoDN-kalELoKJYNdBvH8uan9NWa6ruEYcQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrudefjedgledtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefuvfhfhffkffgfgggjtgfgsehtke
 ertddtfeejnecuhfhrohhmpefnvggvucfhihhshhgvrhcuoehlvggvsehprhgvohhsshgv
 tgdrtghomheqnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucfkphephedtrdduvd
 ehrddvvdekrdeikeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhl
 fhhrohhmpehlvggvsehprhgvohhsshgvtgdrtghomh
X-ME-Proxy: <xmx:X1ByXvYnKLnlOQjXAQrcfL6BHE1fDEwAH_2fNdQRHsaWJ9Kgjle0bw>
 <xmx:X1ByXsurD3Fqs9nv9-T6YgSHAwzBvRvRydj8Wenj2rwKsFBuCh6nbQ>
 <xmx:X1ByXoOJznfBLuOjdRC6JvNvXS7JLYRnzveIAwrq_GpgsFF01mPXYA>
 <xmx:X1ByXhWJxE4qRSSrMEBMmwV9ShD0j70DNEpoOXTGhSAZZOgSTbMb2g>
Received: from [192.168.1.100] (unknown [50.125.228.68])
 by mail.messagingengine.com (Postfix) with ESMTPA id 1BDB53280059
 for <openbmc@lists.ozlabs.org>; Wed, 18 Mar 2020 12:46:23 -0400 (EDT)
Subject: Re: openbmc-specific dynamic security scanner
To: openbmc@lists.ozlabs.org
References: <d2bdd336-88ee-19f7-9215-2c0ede78e3bb@linux.ibm.com>
 <9bb74bdc-bb09-0206-1431-04979e664235@preossec.com>
 <0a426b00-2afa-754e-d3be-bc7b4d44c3d6@linux.ibm.com>
 <b2515c7f-94c9-6ec4-6e2b-694fa1b97199@linux.intel.com>
From: Lee Fisher <lee@preossec.com>
Message-ID: <87e28547-de1e-4a87-2141-c226220bb016@preossec.com>
Date: Wed, 18 Mar 2020 09:46:18 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <b2515c7f-94c9-6ec4-6e2b-694fa1b97199@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
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

> [...] But the BMC itself is ARM [...]

Intel CHIPSEC team has expressed interest in accepting patches from
non-Intel systems.

I think there might be an issue for the first non-Intel ISA to try to
port CHIPSEC to their chip: CHIPSEC supports the public interfaces of
Intel systems, but may require an NDA to access equivalent info on some
systems. That might be why there's no AMD port.

ARM (Linaro) has been porting the Yocto-based LUV (Linux UEFI
Validation) distro, a test distros for UEFI vendors, which includes
CHIPSEC They've not ported CHIPSEC yet, but they have expressed an
interest. Perhaps ARM-based OpenBMC and Linaro UEFI teams could share
resources and port CHIPSEC to ARM. A former Intel CHIPSEC team, now at
Eclypsium, did a quick port of parts of CHIPSEC to ARM, but never
upstreamed the patch, I think that may've caused Linaro to block on
attempting a CHIPSEC port.

Regardless of the complications, industry NEEDS to have tool like
CHIPSEC on ALL processors -- CPUs or BMCs --  other non-Intel chip
vendors should have something similar. Maybe it makes sense to share
same codebase as CHIPSEC, maybe simpler for a new codebase and duplicate
some of the security tests.

FWIW, there's only 1 or 2 Intel business class laptops that pass all the
CHIPSEC security tests. All the others fail miserably, and the non-Intel
systems can't be tested. Having tests doesn't mean the vendors will do
anything about fixing their security issues. :-( Hopefully you can
incentivise your OpenBMC vendors to pass security tests.

> [...] A simple script may be okay initially[...]

There is a script that calls CHIPSEC to gather multiple things:

https://github.com/ANSSI-FR/chipsec-check


