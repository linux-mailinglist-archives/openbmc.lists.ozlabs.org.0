Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 124E0DA25D
	for <lists+openbmc@lfdr.de>; Thu, 17 Oct 2019 01:36:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46tpbl1k6WzDr1F
	for <lists+openbmc@lfdr.de>; Thu, 17 Oct 2019 10:36:51 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.19;
 helo=wout3-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="YBb/ZzP8"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="BLnCuC0N"; dkim-atps=neutral
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46tpZb3FXwzDqSR
 for <openbmc@lists.ozlabs.org>; Thu, 17 Oct 2019 10:35:51 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 14E10148C;
 Wed, 16 Oct 2019 19:35:49 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Wed, 16 Oct 2019 19:35:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm1; bh=8gQ2NRYUDxz0ekMMnDhmum+Kzn3A3u5
 MphGS0xSmUDA=; b=YBb/ZzP8I2lShk6SpW/qdxUE+lYKiGKWLqJfCHsgy/z8Boa
 +yoEAWaFDVE5ZP2QSp/eG1sbKcC2soh4YGxBxbGL6rz/T552nKvepXWL9IbSFR6k
 8PhoPVOVCaoiK6GEvvj63ORYZK3n3hJvVP2FZKxtwFCd6e3Yq3zWy841lUU+ozdH
 T/f/waJ93vJ1uxrMsJ4EabWKGrsR+rROl79ofTUeC/anFU73LADtkqHmaWi4m8vn
 tMjTg80tXxQSTU3R/YcRP+r2bRhHF0sxO1wngWpMWcZuagoap70DqBjRawTpLrhI
 9XtT01omN3bQZAjpL3qWyWQ+ST+NDRFr3mpKvwg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=8gQ2NR
 YUDxz0ekMMnDhmum+Kzn3A3u5MphGS0xSmUDA=; b=BLnCuC0NFTgR02oxrz8wEZ
 XibEZLeVdc1cs9Sk0st57CLP05SRQ2Iwq9EHXwTCcek6BTyP9B/dGHov/o/kppwJ
 Ol+zwf+7M6KemGi4FlmRVR79hpWokCu/DcNE1xElglJHLAeutPGzjek9CEq+c+/f
 ZmRJtkz9GzmQztQKf6WIEWbkGVm7ObDm0KmkNmr8jf76ANcnQJQqwZeohf+A4cX9
 YhP8rbeV7pfxRIF/xAwrZOqLGvYrcpkqK9mLc6sq+Wyf+iyhVQyGor+jYV5dg1l5
 mLPryyMQzXIQN0fXF/Ebin0N65YhFXZF5ChLulMmUF7GKSBoDOV/P+TM3InOy6oA
 ==
X-ME-Sender: <xms:VKmnXSCysLNmEXWFM36HEQSHjw0jzkE44cjN4teLeQ3j8p46hGNvtw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrjeeigddvvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderreejnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfrrghrrg
 hmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghr
 ufhiiigvpedt
X-ME-Proxy: <xmx:VKmnXULoHzJEj6sLktvvlzLkCdR2-ZJaMvjqHZl4veyNxPwAfaq5kA>
 <xmx:VKmnXc8-dKv2RB1cAFJrwSO4uuy1qgcrFEwUkfeJvpgmTwWJ_aE4Zg>
 <xmx:VKmnXbSl52nsF1Q5T_5st__ausOcDRT2bvgmKezlO9mhLMUZ1MF_dw>
 <xmx:VKmnXZAzWNu8RWp02y8qwIWklYp9-qO4gZJ_klh-T7FZ6eCzwrtrVw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 685C3E00A5; Wed, 16 Oct 2019 19:35:48 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-360-g7dda896-fmstable-20191004v2
Mime-Version: 1.0
Message-Id: <aea15ef8-c43b-47d9-a56d-9ff9008204e0@www.fastmail.com>
In-Reply-To: <OF89958F58.DD5DED38-ON00258495.00807651-00258495.0080789F@notes.na.collabserv.com>
References: <20191016230610.29462-1-andrew@aj.id.au>
 <OF89958F58.DD5DED38-ON00258495.00807651-00258495.0080789F@notes.na.collabserv.com>
Date: Thu, 17 Oct 2019 10:06:45 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Milton Miller II" <miltonm@us.ibm.com>
Subject: =?UTF-8?Q?Re:__[PATCH_linux_dev-5.3]_soc:_aspeed:_Fail_probe_of_lpc-ctrl?=
 =?UTF-8?Q?_if_reserved_memory_is_not_aligned?=
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Thu, 17 Oct 2019, at 09:53, Milton Miller II wrote:
> On 10/16/2019 about 06:06PM in some timezone, Andrew Jeffery wrote:
> 
> >Alignment is a hardware constraint of the LPC2AHB bridge, and>misaligned
> >reserved memory will present as corrupted data.
> >
> >Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> >---
> > drivers/soc/aspeed/aspeed-lpc-ctrl.c | 12 ++++++++++++
> > 1 file changed, 12 insertions(+)
> >
> >diff --git a/drivers/soc/aspeed/aspeed-lpc-ctrl.c
> >b/drivers/soc/aspeed/aspeed-lpc-ctrl.c
> >index 12e4421dee37..5bad6a33ca43 100644
> >--- a/drivers/soc/aspeed/aspeed-lpc-ctrl.c
> >+++ b/drivers/soc/aspeed/aspeed-lpc-ctrl.c
> >@@ -241,6 +241,18 @@ static int aspeed_lpc_ctrl_probe(struct
> >platform_device *pdev)
> > 
> > 		lpc_ctrl->mem_size = resource_size(&resm);
> > 		lpc_ctrl->mem_base = resm.start;
> >+
> >+		if (hweight32(lpc_ctrl->mem_size) != 1) {
> 
> is_power_of_2 from include/linux/log2.h

Ack.

> 
> >+			dev_err(dev, "Reserved memory size must be a power of 2, got>%zu\n",
> >+			       lpc_ctrl->mem_size);
> >+			return -EINVAL;
> >+		}
> >+
> >+		if (lpc_ctrl->mem_base & (lpc_ctrl->mem_size - 1)) {
> 
> This could be IS_ALIGNED() from kernel.h

Ack.

Thanks,

Andrew
