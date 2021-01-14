Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BAF2A2F6A98
	for <lists+openbmc@lfdr.de>; Thu, 14 Jan 2021 20:12:14 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DGv7h3t4jzDsM4
	for <lists+openbmc@lfdr.de>; Fri, 15 Jan 2021 06:12:00 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fuzziesquirrel.com (client-ip=66.111.4.26;
 helo=out2-smtp.messagingengine.com; envelope-from=bradleyb@fuzziesquirrel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=fuzziesquirrel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com
 header.a=rsa-sha256 header.s=fm1 header.b=N21GHTeB; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=dxfdf/iU; 
 dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DGv6g07kQzDrhd
 for <openbmc@lists.ozlabs.org>; Fri, 15 Jan 2021 06:11:05 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 441235C010B;
 Thu, 14 Jan 2021 13:53:19 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 14 Jan 2021 13:53:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 fuzziesquirrel.com; h=date:from:to:cc:subject:message-id
 :references:mime-version:content-type:in-reply-to; s=fm1; bh=OOl
 jZUKEoyd4FA24oLdToaPb36ahG0F5WBrfb+1wep8=; b=N21GHTeBC5RwEFTixVY
 rswkUWv5JNCVQ6TJ5lxUm2aBcI4ZkkyxliuYrsnYLNf7A/t54HsIv5Qq3zL+gpZD
 m91vbvsV1yJcyjBgp3KZbEnr72LNSZcoju4016N4eQoTYqVInEGHqGGD6qhAZFRc
 sJyCvAdfiqsZSf4+1XScd0U5IPCdF7Vn7I3bqYr8C5N/R9NzgEZ6bKlQ27k5OAeI
 NciXCa1zZoBDxgIeuIYLxkXVPwJHsXxWtKvDEaCk6xh5IVnG3NCMAE7bpyFsn+O9
 3nUFJyvFceLMEdXmj/tkIPAP9e27p2RBrymNQ4XYpplABW2zC3NxkNl/HxoB3G6f
 c0Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=OOljZU
 KEoyd4FA24oLdToaPb36ahG0F5WBrfb+1wep8=; b=dxfdf/iUJ/VQclBrhqQui6
 GmUGC/myeWHEWW9STVXHQDJJ69C/tc62SwORA5zUTqhaaL7G9rOiZ4tNhqJY2Vhh
 1TEUTpjalYU9rNhtB4FpXaLdz+bBW/S+YsfSDTMBTTVpQKrQ16Dk7GZvDEKzsVMR
 5BfophK4R+kmI8YSuGhJoaC5sQuZWaNN//wYRA0vX+lQi/YQKB3Huh+mHaYpOQZ5
 CrvBns3phddytluB5OhkxFnJdlxwcDa9a+iKlBnzmX48engYty37AGnltSXdCnVr
 fY0yahxmcD9w2ySu2icdXwlrOAL/EkPMTW3GrcIgtOkxkerRUBB1Sjl0+wXClmWQ
 ==
X-ME-Sender: <xms:HpMAYDbowQz3Kg5qBoKtmvhYNFPHyu6pk-q3Tt-uUBSkGy04vowJtw>
 <xme:HpMAYCZ_7tJ0LZ3pkMtSq8u1mBa_9G2OotdxEkBuB95Gx3vV-IihZSWPTtbtBlDaN
 i4HbQHPcF8zFPQp61g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrtddtgdelfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehrrgguuceu
 ihhshhhophcuoegsrhgrughlvgihsgesfhhuiiiiihgvshhquhhirhhrvghlrdgtohhmqe
 enucggtffrrghtthgvrhhnpeeffffhfeehgedutddvtdeuiefhudeifeekfeeifeekfedu
 feeuvedulefgkefffeenucfkphepudejfedrudeijedrfedurdduleejnecuvehluhhsth
 gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghrrggulhgvhigssehf
 uhiiiihivghsqhhuihhrrhgvlhdrtghomh
X-ME-Proxy: <xmx:HpMAYF-fMDjrLL727rS8H2Zn_3YdPEOVWOhfLne1-uWVPTb7FYlDtw>
 <xmx:HpMAYJqhWi7i4_2VEX3KO4GjHeKJMJ20Zbk-rAoZO_EFaZXXL8RngQ>
 <xmx:HpMAYOruAuy4m2DZGYCbPT5tVMbW21zIgpTKDfif9mmmXOdcoqFDyw>
 <xmx:H5MAYHkglr8CAWnrGPU_Z9QS-6K95db9AyzjKd_ET9tMaQA36q3XtA>
Received: from thinkpad.fuzziesquirrel.com (unknown [173.167.31.197])
 by mail.messagingengine.com (Postfix) with ESMTPA id 426441080057;
 Thu, 14 Jan 2021 13:53:18 -0500 (EST)
Date: Thu, 14 Jan 2021 13:53:16 -0500
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Ed Tanous <edtanous@google.com>
Subject: Re: Intel-ipmi-oem repo
Message-ID: <20210114185316.vmlaa7nn7vlxq2wh@thinkpad.fuzziesquirrel.com>
References: <CAHwn2XkNiz7rZzn9RbpZCaUM8HD0HO+mJTD9D2ENc_p+SsmXHg@mail.gmail.com>
 <20210114143909.jf3vbk7zhxp3iguv@thinkpad.fuzziesquirrel.com>
 <CAH2-KxBgmEmfeQxsbTa1RPVO_nm5=G+ayZ9aDM+1hf7oRtoDGA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAH2-KxBgmEmfeQxsbTa1RPVO_nm5=G+ayZ9aDM+1hf7oRtoDGA@mail.gmail.com>
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
Cc: Willy Tu <wltu@google.com>, vernon.mauery@linux.intel.com,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, chunhui.jia@linux.intel.com,
 apparao.puli@linux.intel.com, Vijay Khemka <vijaykhemka@fb.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Jan 14, 2021 at 08:38:41AM -0800, Ed Tanous wrote:

>I only suggested a new repo originally because today it's a separate repo,
>and the long ago patch to add it directly to ipmid got the feedback that
>was too different than the existing to go there.  

Hrm...this is not at all how I remember it.  I thought the feedback IBM 
tried to give back then was "please don't break the code that is already 
there."  I apologize if what came through was "your code is too 
different, no thanks" ...that was definitely never the intent.

-brad
