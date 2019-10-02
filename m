Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5843FC9527
	for <lists+openbmc@lfdr.de>; Thu,  3 Oct 2019 01:45:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46kCS40yRkzDqRX
	for <lists+openbmc@lfdr.de>; Thu,  3 Oct 2019 09:45:24 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.27; helo=out3-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="pBrsXfT0"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="oSxzDeo7"; dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46kCPW63CYzDqDc
 for <openbmc@lists.ozlabs.org>; Thu,  3 Oct 2019 09:43:11 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 867E622006;
 Wed,  2 Oct 2019 19:43:06 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Wed, 02 Oct 2019 19:43:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type; s=fm3; bh=7JSQQhbzJoNjz9T93LNgy/CEj5GmFYn
 8Pk5PBNkkmCM=; b=pBrsXfT0Y81+8Ye5dYUtl2gkdegVVH8QvzSCzkensBsGVZu
 FixCRR4WKOC2w9csDDL/VIoIh6lTu0jFVIKpxcKWrJ39YkXRVjzAO+YJJO9S+dvt
 TRtlSz4UwyTHrSH/T36oSP+DitqFwGH514RnWj3S/jj5o08ZYvr9msmgb3PceWH6
 8JBWKSXtPYKgDJvE+jFxzCTOHvPhBvgET+yZNPQ/sp0rcGsHYA3Gx2W7zFcqyiAl
 vltraQCnhBHpZutBaliUngOcQNqitRp+vOvBbWOwvBVPM/B/DQ/N7EwNqODfTLtM
 2CEgXDz/kozGQqLg0MXOl3IxIJD77KsdfGd2Mmg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=7JSQQh
 bzJoNjz9T93LNgy/CEj5GmFYn8Pk5PBNkkmCM=; b=oSxzDeo7B13iceB60KU4Fr
 qxVJ6maOu5OXEUXHwjK8kI5gW0NvzVRPCNymiR92HQXhHhTtf9JH+ctYcAn4LKjN
 77EdOV0DRNXDxzMLeBPeJQgd9me/CFo8Km0JviAmU6xHDz2XK4TKzDXpegPFtJh7
 H3kO3KCT9fadv9JQjCMbclGrDxOJFwjWy2I1TV9Jricp46R7H1PLw+i8AD7l2alL
 MqlIVt6l5qCyVe/lygwT3ZJR1ay079KzdQP507V0dJSmTHstTPGBejyflhhLIudo
 OgXR9YEXRm6wuYPUmq/C5r9C2c5iu/IK5EYP1cLN4QZV6nftuty77lbtaXFrfLRw
 ==
X-ME-Sender: <xms:CTaVXc9DWWJ16HrMDkChak4duPXcH9uJXPqFsYrEVl3GCbPf-WkeIQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrgeejgddvfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfrrghrrg
 hmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghr
 ufhiiigvpedt
X-ME-Proxy: <xmx:CTaVXY_O5rgtx76VuNQrp3kdwPWEy6fpXudGIIIf3RZFLiB3ufFFSQ>
 <xmx:CTaVXdBZWUcjAWCPYoQVOg4qMIOqdbBCrBS3COw_Zt-xRRWsu1-GjQ>
 <xmx:CTaVXQwne-J1t_VGASmwpwWgg6tpj87VM3ZgE1r-KzuKhmTMq_2h7A>
 <xmx:CjaVXYJsL14H-MoZRi1cDrKtH06-rJMUoyBQd3U5W4rivXWZ1e4Ncg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 9D4A2E00A6; Wed,  2 Oct 2019 19:43:05 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-359-g64bf1af-fmstable-20191002v2
Mime-Version: 1.0
Message-Id: <704b589d-1758-4c3a-b029-9bbb0e266352@www.fastmail.com>
In-Reply-To: <20191002121343.12424-1-joel@jms.id.au>
References: <20191002121343.12424-1-joel@jms.id.au>
Date: Thu, 03 Oct 2019 09:13:54 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Joel Stanley" <joel@jms.id.au>, openbmc@lists.ozlabs.org
Subject: Re: [PATCH linux dev-5.3] clk: ast2600: Fix enabling of clocks
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Wed, 2 Oct 2019, at 21:43, Joel Stanley wrote:
> The struct clk_ops enable callback for the aspeed gates mixes up the set
> to clear and write to set registers.
> 
> Fixes: d3d04f6c330a ("clk: Add support for AST2600 SoC")
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
