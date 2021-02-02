Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AB2630B453
	for <lists+openbmc@lfdr.de>; Tue,  2 Feb 2021 01:53:45 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DV5sf4lFyzDr3M
	for <lists+openbmc@lfdr.de>; Tue,  2 Feb 2021 11:53:42 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fuzziesquirrel.com (client-ip=64.147.123.25;
 helo=wout2-smtp.messagingengine.com; envelope-from=bradleyb@fuzziesquirrel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com
 header.a=rsa-sha256 header.s=fm1 header.b=mkSbd6k4; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=U2/VRwGx; 
 dkim-atps=neutral
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DV5rx49vczDr0B
 for <openbmc@lists.ozlabs.org>; Tue,  2 Feb 2021 11:53:05 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id C4F22EC1;
 Mon,  1 Feb 2021 19:53:01 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Mon, 01 Feb 2021 19:53:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 fuzziesquirrel.com; h=date:from:to:cc:subject:message-id
 :references:mime-version:content-type:in-reply-to; s=fm1; bh=BMj
 PWlpjTZvz3AbVrilrZGslD+mxa9xWcehiF6exGVQ=; b=mkSbd6k4kch5S9LtMiu
 8j5ALwnJKjHIYIjnBBb8Id8gp+ZsBOxQDqj2X71RfB5tAQvtb2DwfAcjrdx67GS+
 mcn3JNnE6WffEvV7XlQn/cctZFeSjbVAdVFjjyrziyeSWVo1aIar1DzSG0yz/8eU
 28zJQf+BoBJ47m7HatrZVRA7E2K28hK7AmCCB+dMRNfKW1Ezjv7fTnqrUHwaAyJc
 rFBJEjZ2wTW1ereuQm9yynhlP+UvdEKcmcP+5IiCAGzn/5Q2lbBA5irTja0E/I0d
 S/sPv9d5qgeLTjk9j5cCVGbqCV9ZHIVX1M2gGSOEi2v95F5BtrZyAO7cRDvOemZw
 tqg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=BMjPWl
 pjTZvz3AbVrilrZGslD+mxa9xWcehiF6exGVQ=; b=U2/VRwGxWMX77iUEWwJOvy
 mDCQUvpxG7PtR1NxA4pEhoS3DzAggsUHWUmygthxCPmSBrzhdfnP4fxhoLby2eiA
 YN3mJnEVCoZjp8r/HU+zeCwSfeiN0oDZys/Qfg058T8jcr8ltqCsC8kjQ4+Uf7W+
 S8z2wJTgIQl5mbV2J6iP6qzwzwd1W4LugovtNH3UzcxNGQZalu3+DJZyN0xqPHKF
 xsLfWyvjK7aR5eLO67+ayeBd8LZDo1kxU/38qHO0fgs6kYdkSwC8OIJl4UmtxKFy
 G94AwgHPI4IVcfRyQuMHN801FofnspM1tvTcCycD17C0ortx5JPP/LOrKd7VP64g
 ==
X-ME-Sender: <xms:bKIYYPWB4jZl_eDQHJbzt9FkbZFRktzhDlL1zfQGDOxBC9QRSpv1Lw>
 <xme:bKIYYAjNCyeeTSyZYoaOrE8oQegG2AuR7tUtNkpmMh8iTo7Jok5I7H-e5mZX0B3ic
 IclUiTTd5FP15fMpJE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeelgddvudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculdefhedmnecujfgurhepfffhvffukfhfgggtuggjsehttdertddttddv
 necuhfhrohhmpeeurhgrugcuuehishhhohhpuceosghrrggulhgvhigssehfuhiiiihivg
 hsqhhuihhrrhgvlhdrtghomheqnecuggftrfgrthhtvghrnhepkeekleeitdfhvddtgeeu
 hedvvdekiedvudejhffhvefhudejueegfeffledtjedtnecuffhomhgrihhnpehophgvnh
 gsmhgtqdhprhhojhgvtghtrdighiiinecukfhppedujeefrdduieejrdefuddrudeljeen
 ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsrhgrug
 hlvgihsgesfhhuiiiiihgvshhquhhirhhrvghlrdgtohhm
X-ME-Proxy: <xmx:bKIYYG_E1IPcldGucO7-gYkW0kKILBqJvMy7HdfgbilsRRabNUZ8aA>
 <xmx:bKIYYKae2JkcBORLFcHjuekwKKBwuVyEmionq6Jb4Q-KJaS3VR-NsQ>
 <xmx:bKIYYF0LkJ3z5oTTj3EHtWinxi8jaA6jaqR1mYbJVwoapZBODX41dw>
 <xmx:baIYYCBcMupiw0eDgIY5sIy93lm1icOoSoOP1LL_5J605aQC0qpv2g>
Received: from thinkpad.fuzziesquirrel.com (unknown [173.167.31.197])
 by mail.messagingengine.com (Postfix) with ESMTPA id EC9AC240082;
 Mon,  1 Feb 2021 19:52:49 -0500 (EST)
Date: Mon, 1 Feb 2021 19:52:48 -0500
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Patrick Williams <patrick@stwcx.xyz>
Subject: Re: Control / Operator panel support in systems
Message-ID: <20210202005248.ec7xsrz4aws3knci@thinkpad.fuzziesquirrel.com>
References: <8402e577-410a-cf27-9b3e-f2774f086d00@linux.vnet.ibm.com>
 <0745cd96-76d3-2075-4f04-afa4ae560689@linux.vnet.ibm.com>
 <76d7d22c-43a6-f144-9e1d-3b499d3a2309@linux.vnet.ibm.com>
 <YAl2b2xaXDV+GQwG@heinlein>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <YAl2b2xaXDV+GQwG@heinlein>
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
Cc: Jinu Thomas <jinujoy@linux.vnet.ibm.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Jan 21, 2021 at 06:41:19AM -0600, Patrick Williams wrote:
>On Mon, Jan 18, 2021 at 06:58:25PM +0530, Jinu Thomas wrote:
>
>Jinu, it seems like we still have a lot of discussion to work through on
>the design[1].  Can we get that resolved before we determine what are
>the appropriate repositories for this?
>
>https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/38904

Patrick

It seemed like your major concern was using the out-of-tree 
minion-mqueue driver or any other userspace i2c mechanism and I also 
share that concern.

If you replace those references with an input subsystem driver, did you 
have any other concerns? - thinking maybe we can work things out in
parallel a bit.

One last thought - do you have a use case for this?  I've heard about an 
OCP card providing similar function - wouldn't that use our existing 
IPMI over IPMB design with backend handlers - possibly OEM?  Trying to 
fit that into what Jinu is working on seems like a stretch to me.  
thoughts?

thx - brad
