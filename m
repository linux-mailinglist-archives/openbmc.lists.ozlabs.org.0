Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D9BDA2B49
	for <lists+openbmc@lfdr.de>; Fri, 30 Aug 2019 02:09:06 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46KKb33MgfzDrdL
	for <lists+openbmc@lfdr.de>; Fri, 30 Aug 2019 10:09:03 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.29; helo=out5-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="nK7vlst6"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="0ZaTgvDX"; dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46KKZL0vsCzDsx9
 for <openbmc@lists.ozlabs.org>; Fri, 30 Aug 2019 10:08:25 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 3FEFB21AD2;
 Thu, 29 Aug 2019 20:08:21 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Thu, 29 Aug 2019 20:08:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm3; bh=FDR5IqhOSMAVpbr6xuLKzTjkyMOP5Eh
 MJwrHTLUT+3E=; b=nK7vlst6MkvDJLd159bWjmLKgoO44UWwxBbgeiR6bE29FG/
 ND/nG+Dxm19/+NpFW4J7Fqn5/xIx87LMtLhZnhec/PclafOe4jtOefeb8a8eRIdu
 XnMFVkwtKVqmp2Z8NTIBoS2FvqMynXskWSTZPZHmfyx0ZfFpUkQDImFPdn3MBD0Z
 2oF6QUFPlqVNqyy5GxqTm+yZT5QJ0TBq410dZBC8ryAiF2xuzAqWkz3x1vaDDozB
 weqm9lJNqDGigpYQ300bBPSZs9uCBP7NK8H5xK+X5ALu3UTZjonT/Oqiy2RWYlqr
 d8P52ayPUUrEXfpR/niCoX91+y+bihwNx3ialVA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=FDR5Iq
 hOSMAVpbr6xuLKzTjkyMOP5EhMJwrHTLUT+3E=; b=0ZaTgvDX54liwMsqI7mHNB
 UFrQPrMBs0JPavWFC69Uv+IbGUQR4pmyyR9KAKw8DQ0YhFcwoBwhTxG3XvJ57Adf
 a/PAw7vIoIUiZm7DU+NJSXM9xRs0FiGyv/x7/cuWQ6v6NXVNKb+/e25HPPW3hWK9
 l/rxnVIQVcXMBfLbbwuN4w3B+fvK8bxRiWNZiCfkg7h30+7/xPNJWWZs3uQ6FdXQ
 tri5xaWx/KTR9k7i1GWGJJAhG/15FQ+iHSZV3Oz0xuVcISjO3Sow3RHI3eCnjyYG
 CQTO/4eWxPql0lr9KiOJyPbrXVy5AytEeSGzEgDTXNCeNoHbBdtrsxOKbKLSw6Eg
 ==
X-ME-Sender: <xms:9GhoXbCjp_xte04ugSO1bO3plW5tMvOsxQDjhB_XGV4LBRY-NkEUvQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrudeifedgvdekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecurfgrrh
 grmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgv
 rhfuihiivgeptd
X-ME-Proxy: <xmx:9GhoXY-11OniJ2nOg4VAm1H0pNH0AAjD_SVUvZllOJ0GaiL4qErTjA>
 <xmx:9GhoXfjTSl7Hx24x7kmMgw1HMYQ5tyxNGjUHj6RtHI7bSr2lOTNE5Q>
 <xmx:9GhoXYuL4EVbuYBU11nFiurZC8gdMkIm33HyVsuXLBEnAus7bg4klQ>
 <xmx:9WhoXZoI4bs_ZfODYNyKEPQQRhIhWuAdYu8tAFHW7jT9O8lkHzvhcw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 913DFE00AD; Thu, 29 Aug 2019 20:08:19 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-154-gfa7592a-fmstable-20190829v1
Mime-Version: 1.0
Message-Id: <4739073b-3ac8-4e0f-b3e0-7a268ccd3db4@www.fastmail.com>
In-Reply-To: <393e2e29-979b-3787-9776-0d5f5f8fbc6f@intel.com>
References: <85985690-0f45-9c8e-cde7-caa7d932ff12@intel.com>
 <eba2e99e-f3bc-4906-aafb-1e09794c6c43@www.fastmail.com>
 <393e2e29-979b-3787-9776-0d5f5f8fbc6f@intel.com>
Date: Fri, 30 Aug 2019 09:38:42 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Johnathan Mantey" <johnathanx.mantey@intel.com>
Subject: Re: QEMU native compile issue
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
Cc: openbmc@lists.ozlabs.org, Brad Bishop <bradleyb@fuzziesquirrel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Wed, 28 Aug 2019, at 00:09, Johnathan Mantey wrote:
> Not really. I'm not sure where the code went.
> 
>  I cloned the OpenBMC QEMU, made my change, and then pushed the change 
> to "upstream". I have SHA "650af0e183 Fix compile error when using 
> kernel 5.2" as the text.

As you noted in your follow-up email you found the fix upstream. Further, the fix
is contained in the QEMU v4.1 tag.

Upstream open-embedded has already bumped QEMU to v4.1 - I guess we
should backport that change to openbmc/openbmc and this will be resolved.
I've Cc'ed Brad so he's across it.

As an aside, while we have the openbmc/qemu repo on GitHub, it's not
integrated into openbmc/openbmc, openbmc/qemu is a bit less volatile than
Cedric's legoater/qemu aspeed-4.x branches (as it's used for OpenBMC CI
purposes), but has more models implemented than what upstream typically
has (I intend to update openbmc/qemu to 4.1 with some of the patches from
legoater/qemu aspeed-4.2 on top in the near future). The QEMU that's built as
part of the OpenBMC build process is the upstream release.

Hope that helps.

Andrew
