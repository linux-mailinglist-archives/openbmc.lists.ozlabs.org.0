Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 28EA1EBC41
	for <lists+openbmc@lfdr.de>; Fri,  1 Nov 2019 04:10:03 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4746cm302YzF4wP
	for <lists+openbmc@lfdr.de>; Fri,  1 Nov 2019 14:10:00 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.27;
 helo=out3-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="MynYPS+4"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="gKR+ZvJA"; dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4746bz0JmszF5Dr
 for <openbmc@lists.ozlabs.org>; Fri,  1 Nov 2019 14:09:18 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 9721F20E94;
 Thu, 31 Oct 2019 23:09:16 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Thu, 31 Oct 2019 23:09:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm1; bh=fDn9JLK251LwA9QlH1+nKiB0KWC0XBe
 ZDM4HPEHHtVs=; b=MynYPS+41vFs+nhFB34BMF6pe0CT+pupsuiMr7H9nR/WaGE
 L+VKY3pQvT/F/6OqmwFzt1gSrS9FduIT5YvJurhTcd9W4vOvRgSmIuCLDm0nnNlu
 XaEkpn+LIljLXX6LqAjk/VkAha6t84QE3mpCm3fgNu5MjVX4r7ze7aXlTlgZNwj0
 QoU4SCQbjzlkBI6dEKfIKBGSjerwUCqOM3B+2G8OK5xCxCTnr2qxyp+wCnlxpk9p
 FDJw9Yvze61Fc0q/XjkoMeQkoLEwkU5fAHU0cxUJt7teTzMhDeLWnwzza7dqIXBt
 KcD7nxSFWM846mpMNpZY95PmBHV6UDNFNV2kfKg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=fDn9JL
 K251LwA9QlH1+nKiB0KWC0XBeZDM4HPEHHtVs=; b=gKR+ZvJAdI90mK5B0u2jxS
 4W0/rhw2dF/gqmJRKvrwf2boVZrHe7+z9slzilc3tYAPacbqbmJmmKeyJfNKKKmj
 YghnrlrWi19cHzcow2gXXYC9Z22HeMUKup0hHS+rZKOy/A+p5lqZOVVDBJy/rVGu
 WuYHZMAwhypOjBPtETl1lAVUZCqc57nbI0eBwjjai48IFFjMXCkSbXW07vdRtqlB
 mtBJo85+3W0P34KFU0bsm5hfNq8CTVKJGttt8Yr6Kn9t+9/VqMBpY2r1ZJ1S7Av7
 LtkXp7T4oSxsR0XulRJwQk7Z0Dhbn+VlKdkHidV7Ir5cwHCDKyoLAAPuYnCSOFvw
 ==
X-ME-Sender: <xms:3KG7XdkhJIZ674ysAno4U_0hikA1i0_t5l0bcVHnTuvyMgR7O-vIVQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedruddtiedgheehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecurfgrrh
 grmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgv
 rhfuihiivgepud
X-ME-Proxy: <xmx:3KG7XeFytKx1-Bm9pA557AZSEWD2Nn5NT7LOFZTH9j49TNwu2-lRRg>
 <xmx:3KG7XWRfw9FnrxeOGleQlFPOp8V2QeiK2lx3Br33W2-CPSWOE9GQ8w>
 <xmx:3KG7XdSR2kEZfVliwd2Fmvfm7cFl5HrFnqLaIB-DGXcDcQrlKPQqVA>
 <xmx:3KG7XchPbnWfeM4_xMR_bri9UhHf7_rcBieb0FLbv__E3V8kiMbxJg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 64CDCE00A3; Thu, 31 Oct 2019 23:09:16 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-509-ge3ec61c-fmstable-20191030v1
Mime-Version: 1.0
Message-Id: <2380e006-30de-4bcb-940d-84ff6dabca39@www.fastmail.com>
In-Reply-To: <20191031053625.422-9-joel@jms.id.au>
References: <20191031053625.422-1-joel@jms.id.au>
 <20191031053625.422-9-joel@jms.id.au>
Date: Fri, 01 Nov 2019 13:40:22 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Joel Stanley" <joel@jms.id.au>, "Jeremy Kerr" <jk@ozlabs.org>
Subject: =?UTF-8?Q?Re:_[PATCH_linux_dev-5.3_v2_8/8]_fsi:_aspeed:_Use_defines_for_?=
 =?UTF-8?Q?port_reset?=
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



On Thu, 31 Oct 2019, at 16:06, Joel Stanley wrote:
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
