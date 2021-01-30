Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AD8AB30968D
	for <lists+openbmc@lfdr.de>; Sat, 30 Jan 2021 17:16:31 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DSfTm65PfzDsVK
	for <lists+openbmc@lfdr.de>; Sun, 31 Jan 2021 03:16:28 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fuzziesquirrel.com (client-ip=64.147.123.24;
 helo=wout1-smtp.messagingengine.com; envelope-from=bradleyb@fuzziesquirrel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com
 header.a=rsa-sha256 header.s=fm1 header.b=mdoLkeoX; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=k5zoO9ao; 
 dkim-atps=neutral
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DSfSx0g96zDr0w
 for <openbmc@lists.ozlabs.org>; Sun, 31 Jan 2021 03:15:44 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id A4192E9C;
 Sat, 30 Jan 2021 11:15:40 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Sat, 30 Jan 2021 11:15:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 fuzziesquirrel.com; h=date:from:to:cc:subject:message-id
 :references:mime-version:content-type:in-reply-to; s=fm1; bh=Aow
 9ii8H0qxrN1GxA8zEkiZ5LvF0v2IgPnC35m++t2Y=; b=mdoLkeoXrR5fNs341hD
 JoZrvwgOt7GfmV+3q7+hfjkecBCfwCJEe854F+MMhFx26kezNAcGpGjQyZCdOvGv
 kG3aLOALxWLGE4wFC/oZpcTrGiWwQGZQujFNnGdzMFBDP+LGHuhnihSkvcMryUIb
 7/MX0K1hthLcnTg0m+YaxU8Q1TvOBzjt/bVdEWBhJFVpUAzl5LSoc7qNzEKlO2CT
 MeEU/KSJZdUNbQSOv5WaZcB0taRopXyt7NLMIUGPyUA1QuP6coo42mYbMyWrabu2
 oAQEuPKpGSaGML3ea4cOAp4vozWU7JoscYzC11icKPpIX2aTOJqNUEswnmKJwUSW
 15w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=Aow9ii
 8H0qxrN1GxA8zEkiZ5LvF0v2IgPnC35m++t2Y=; b=k5zoO9aoYnqHs+Ti2/kGyd
 uiA7TSTRTUZxH2xRLmC6kHqEAQ96ecmx0sXeENVNIuooniI7dez/9bVjJrxP0tzB
 mUhzOGDJQW1HZJr5OeLav+KcVbxBlfStY1o45IOL3TyOHdnPzahBduMhB155lXRw
 5OqRplHTK0+2FexOqYd3KO1urabgpUyh18Q4UovUWPZochM9ZYkCUKxNgPBLb5PE
 BAx6yLwTZIkJdkA900l2Y+bVjrfar/vvZSBP40+07gp89FP4MnYhVG4NlgZPwhBF
 tTXPh9XXVuPydonPclnOwee9s1DzDY18BUl0cL1H0qq32r+7ToM4G2lZ0wXROySw
 ==
X-ME-Sender: <xms:K4YVYNaqVopUrn-BCeJCSpe2cRRWSJ-LEZsmbmEF2C7-NJFkxEN7Uw>
 <xme:K4YVYEYdoR2hCUQB9IVCpo_sCFPYyJppfrw7g4VQ2ipmGWRyPcfM6lmprlL5NEr_Q
 -puivyl0Os_gQUu2TE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeeggdekjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehrrgguuceu
 ihhshhhophcuoegsrhgrughlvgihsgesfhhuiiiiihgvshhquhhirhhrvghlrdgtohhmqe
 enucggtffrrghtthgvrhhnpeeffffhfeehgedutddvtdeuiefhudeifeekfeeifeekfedu
 feeuvedulefgkefffeenucfkphepudejfedrudeijedrfedurdduleejnecuvehluhhsth
 gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghrrggulhgvhigssehf
 uhiiiihivghsqhhuihhrrhgvlhdrtghomh
X-ME-Proxy: <xmx:K4YVYP-yzgU9OWJkB-du2d6FgPOHqKDW3EdFR_cA2-L8HwrJxVLX9w>
 <xmx:K4YVYLq8ypeczQh3IDyOMus1vUiDzae1_xec62jEVK-vyu2Kf_85DQ>
 <xmx:K4YVYIo7nUoWauTrMwe2L0r4ZgCvMhJct-OccRIdtePAF6LM69Yefg>
 <xmx:LIYVYPSQ-YhvGYG0GgaydWNJmShUsBdOvOgKFh4Oi8qure6kygzIzQ>
Received: from thinkpad.fuzziesquirrel.com (unknown [173.167.31.197])
 by mail.messagingengine.com (Postfix) with ESMTPA id 37FC624005C;
 Sat, 30 Jan 2021 11:15:39 -0500 (EST)
Date: Sat, 30 Jan 2021 11:15:37 -0500
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: "Thang Q. Nguyen" <thang@os.amperecomputing.com>
Subject: Re: create meta-ampere folder in openbmc repo
Message-ID: <20210130161537.gj6jhwvsnwgdkofa@thinkpad.fuzziesquirrel.com>
References: <d5302c4f-c0c4-0bde-2a60-e943a2f41788@os.amperecomputing.com>
 <0e2507bc-f8c5-85c4-cd39-4c603a729f4c@os.amperecomputing.com>
 <da62c090-c6a0-1844-cc2b-44846b83c89d@os.amperecomputing.com>
 <3eff5596ee50878be8623c021816977f42111ea4.camel@fuzziesquirrel.com>
 <96568613-294f-8a3b-9aa9-7918b5df2d9b@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <96568613-294f-8a3b-9aa9-7918b5df2d9b@os.amperecomputing.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Lancelot.Kao@fii-usa.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Sat, Jan 30, 2021 at 10:37:52AM +0700, Thang Q. Nguyen wrote:
>On 1/5/21 20:54, Brad Bishop wrote:
>>On Tue, 2021-01-05 at 08:48 +0700, Thang Q. Nguyen wrote:
>>>Hi Brad,
>>>
>>>Just a reminder. Have you got any chance to check our meta-ampere?
>>Hello Thang
>>
>>Apologies for the lack of responsiveness.  This is definitely on my todo
>>list, along with the request from Fii.
>>
>>thx - brad
>>
>
>Hi Brad,
>
>With the change recently in owner plugin, what should I do with my 
>meta-ampere?
>
>- Wait for meta-ampere integrated to openbmc/openbmc before pushing 
>new codes?

Hi Thang, I pushed the commits in meta-ampere to openbmc/openbmc just 
now.  Going forward please submit meta-ampere patches to openbmc instead 
of meta-ampere.  You'll want to submit an OWNERS file in meta-ampere so 
that you can approve metadata in meta-ampere.

This is long overdue, thanks for being patient.  Like I said in the 
meta-fii note, thanks to the work of Ed, and others, to deploy the 
owners plugin this shouldn't be a problem for others in the future.

thx -brad
