Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D03414D1D5
	for <lists+openbmc@lfdr.de>; Wed, 29 Jan 2020 21:21:02 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 487FHH29MKzDqV4
	for <lists+openbmc@lfdr.de>; Thu, 30 Jan 2020 07:20:59 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.27;
 helo=wnew2-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm1 header.b=RBI/lsz/; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=N1fhBkji; 
 dkim-atps=neutral
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 487FCT4JRNzDqTq
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jan 2020 07:17:41 +1100 (AEDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.west.internal (Postfix) with ESMTP id A30EE70D;
 Wed, 29 Jan 2020 15:17:39 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Wed, 29 Jan 2020 15:17:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=QhCZ9KeAE7DplWPb+6P/M1/zzws
 cL4O0ngCSguLjCY8=; b=RBI/lsz/M7XuIblo8569M998NvrzHO5I4w1oymsj1Po
 Hjmpf/A9I72AKRP+OmApToBFUjD9nHPMZZTDOeFTYxwbl5mhSs/mnLTv7WF7A1Yr
 zWyrp1sjjPhI0+BDnax6RQcceFsagFfmAVURh2fOHG4Q3bUSzngP03DRY1qcMKUK
 A6SK1id/h212/lrQALNPDdhfHXWll8XnLT2OO9AMJb/LCEOxTSRGWQg6SkY2qKkc
 JahFVD1jS5kx50aJNNdQJymLgSvZHR/GsVMHOV+eBvs+xwCWSrDbhR3QAPY7u/PE
 3t2OIdmHaf0VyfgPdx8pBvz3Ny5CAtUQMLKQeCVocBQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=QhCZ9K
 eAE7DplWPb+6P/M1/zzwscL4O0ngCSguLjCY8=; b=N1fhBkji2xkdXJUyy7kVeS
 xEBYCbnOqxpowoBXSr7Xuz/jY7E849bRCWu1xm2R2cfiPQOQN+UvoZPmWGcM2Gu0
 MXnftYhhdrIiXvNIY/Uz3TrF4jaKjiZVoxvxdppnPSKD0I77rfWppMPPMzgDpZjm
 3YpNcEQP/37E2QBQARHJoxpXQZfVlMeud+RQnNJg8CQ76tWSFR2DQdvPyLuW49DY
 tZkk1g/qPIKlBP5Vma8C5X4u7vyYS+Z50K4lVVl1/Gbc8ctwvQvBpLZf5ccOcF9P
 WmipYztV2xZG1Tx6s9UOLArU4p+Ou9JiN/dAWPGxCo5fUsReR2WBQCpXIwzWnKqg
 ==
X-ME-Sender: <xms:Y-gxXm7DOQVdYHZIzYEu48ey2KDGrXV7wxZo80t1EXGp4MjHOTJtdQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrfeeigddufeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdlfeehmdenucfjughrpeffhffvuffkfhggtggujgesthdtredttddt
 vdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecuffhomhgrihhnpehophgvnhgsmhgtqdhprhhojhgvtghtrdig
 hiiinecukfhppeduleelrddvtddurdeigedrudefvdenucevlhhushhtvghrufhiiigvpe
 dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:Y-gxXugcpxfaFrVa8Rhv4VpiEOHh4ZIaza09FVQf77T-eNTxKn7hbA>
 <xmx:Y-gxXpvLmUyIRHD8i8X7C6WBftOjmWNKrMBkZFPVYc3ae_o5zaLwNA>
 <xmx:Y-gxXihUzVRy8qR4eTVbOw2JsYstBlsJapGZ1RjrN5zvWwy2gA1-tg>
 <xmx:Y-gxXnVhDUniy96WYYACJcCtEqMNLY68LcAdaQBL8Q0LWPAjKIUD6Y-I0RROJ6xS>
Received: from localhost (unknown [199.201.64.132])
 by mail.messagingengine.com (Postfix) with ESMTPA id D508A3060B27;
 Wed, 29 Jan 2020 15:17:38 -0500 (EST)
Date: Tue, 28 Jan 2020 19:07:42 -0800
From: Patrick Williams <patrick@stwcx.xyz>
To: Matt Spinler <mspinler@linux.ibm.com>
Subject: Re: Using a struct[enum] as an sdbusplus D-Bus method arg?
Message-ID: <20200129030741.GB96533@patrickw3-mbp.dhcp.thefacebook.com>
References: <ad2ea491-9eb0-375b-1832-c2a50e63b3c7@linux.ibm.com>
 <20200109162238.GD1233@patrickw3-mbp.dhcp.thefacebook.com>
 <0de28bd0-95a7-11f6-f2bd-9806508ec5cd@linux.ibm.com>
 <20200109190343.GF1233@patrickw3-mbp.dhcp.thefacebook.com>
 <b018b37e-10e8-55bf-b48e-fd2c71c47160@linux.ibm.com>
 <20200114174117.GA3512@patrickw3-mbp.dhcp.thefacebook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200114174117.GA3512@patrickw3-mbp.dhcp.thefacebook.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Jan 14, 2020 at 11:41:17AM -0600, Patrick Williams wrote:
> On Mon, Jan 13, 2020 at 12:59:26PM -0600, Matt Spinler wrote:
> This needs a pretty simple refactoring to rename the
> convert<enum>FromString function to a template function.
>
> -- 
> Patrick Williams

This probably wasn't as simple as I lead on with this previous email,
but patches are up for sdbusplus ending with this change:
    Ib142482de90572e1bda2f3658f6aeec201c043de

https://gerrit.openbmc-project.xyz/c/openbmc/sdbusplus/+/28859

With this commit sequence you should be able to read / write any
container with sdbusplus-enums in it with the message::read / append
functions, which as a side-effect means the generated classes no
longer need all the conversion hoops they use to jump through.

-- 
Patrick Williams
