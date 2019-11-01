Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EF3FEBC3E
	for <lists+openbmc@lfdr.de>; Fri,  1 Nov 2019 04:08:56 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4746bT6BSwzF6V5
	for <lists+openbmc@lfdr.de>; Fri,  1 Nov 2019 14:08:53 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.27;
 helo=out3-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="KJD3cAZ2"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="gntuqqe6"; dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4746Zj3lY2zF5Xj
 for <openbmc@lists.ozlabs.org>; Fri,  1 Nov 2019 14:08:13 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 1A73020F2E;
 Thu, 31 Oct 2019 23:08:11 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Thu, 31 Oct 2019 23:08:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm1; bh=fDn9JLK251LwA9QlH1+nKiB0KWC0XBe
 ZDM4HPEHHtVs=; b=KJD3cAZ2LEROUH/+/PG800BkqIKnNB/ee5wWAc8NONXAimD
 LHR58O1/OnstkauoXEN3KelG/EeFDXSD6QVomOg3EF6W6fsHO3N4BOEczyVrOd/C
 gX4suV5O3sN6vvVlZrgyW7106wc5yca/OeVlJP/AGkHVHJaTLF6y+aO1UYw/l5g3
 hRWzaGlxuoWHZ6/PoUDPbARxp4ObRZ9+ciBccNet2iD6xUR4MXj/7Fj1ZoL7PzY/
 xpxgdW5jBOocH0IGUT1Iac2Tx+v3+c7boMGkd+5F3f0AKVSJREOPHIfaIEx8jpg0
 sMK99kpHZykzVURMpfgcKebkkhWg0yv6AnMcuCw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=fDn9JL
 K251LwA9QlH1+nKiB0KWC0XBeZDM4HPEHHtVs=; b=gntuqqe6fxfxCHeW48/5yq
 23wiZc+UaMXR/c45q7jKN10LLWCEEM5eOdlIbZ6YSkClFlb0iCmnTKSQN9LNVvXi
 +BAU0/w3Q4JLh+bkAAOLgFJKZrQlRDsC84dcur0ao+HXPTbO9+sJVhxGaVDHLvVH
 KpN2UaVdireiehD4iYiBX/Xtm3EmdqMdQLmeWT9tcYINRzQp9IuJLqIlqyH/ImKc
 fDEHisvTF800VMSgqTV2y2OsjnkYfrmDU9s82B6YTu58/lC/P1AqPZagJ6IafSQ3
 R/hpThWfGyYkl1/qlWbwN6Jp1kuESuYk8iocT51catmmV1JT30XBBFGFBwMHQvCw
 ==
X-ME-Sender: <xms:mqG7Xa8hI4mEzqFWl1kxR1wVBk0IdzZn4i06-Idwn8jGE8s9kdQPfg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedruddtiedgheehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecurfgrrh
 grmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgv
 rhfuihiivgeptd
X-ME-Proxy: <xmx:m6G7Xd2TsJZ6P3CqCNjhyAysduYQoh7mupqNzXPpUXirakfItJYOwg>
 <xmx:m6G7XdcUBOgRhrjCyuBqIFuFn2HftMWfH0bS-lZh_rvFytmpAKDyew>
 <xmx:m6G7XXCIzCsdqyVWLGoYuk3L-_ympQlSLQKVAykZS4NCGV8RsYIwVw>
 <xmx:m6G7XfnVRZWisYPkLqS3gFiFYj1vBkdSS4T2pUDvRF2npFDXST6TyA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id E567AE00A3; Thu, 31 Oct 2019 23:08:10 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-509-ge3ec61c-fmstable-20191030v1
Mime-Version: 1.0
Message-Id: <272e9593-901a-4053-878a-63131b11fa66@www.fastmail.com>
In-Reply-To: <20191031053625.422-8-joel@jms.id.au>
References: <20191031053625.422-1-joel@jms.id.au>
 <20191031053625.422-8-joel@jms.id.au>
Date: Fri, 01 Nov 2019 13:39:16 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Joel Stanley" <joel@jms.id.au>, "Jeremy Kerr" <jk@ozlabs.org>
Subject: =?UTF-8?Q?Re:_[PATCH_linux_dev-5.3_v2_7/8]_fsi:_aspeed:_Fix_whitespace_i?=
 =?UTF-8?Q?n_check=5Ferrors?=
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
