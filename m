Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 47C24B8B10
	for <lists+openbmc@lfdr.de>; Fri, 20 Sep 2019 08:31:55 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46ZP5464t9zDrJ1
	for <lists+openbmc@lfdr.de>; Fri, 20 Sep 2019 16:31:52 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.29; helo=out5-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="c3kaBZ7h"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="NuPpM1vz"; dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46ZP4K04v6zDqMn
 for <openbmc@lists.ozlabs.org>; Fri, 20 Sep 2019 16:31:12 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 0FE2D21F18;
 Fri, 20 Sep 2019 02:31:10 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Fri, 20 Sep 2019 02:31:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm3; bh=V8N+fIObOKPRG1ocfc8CKZ2evcsjHoY
 UDj/YkpnCdpQ=; b=c3kaBZ7hZf+iLBR1YQUxfpgGd79DhHSyFwRNMsABqtGzvpG
 gTykGcMxnzZqOjH7zjXog1O7NlzCxj7IWtglA3gNWsfDQ5e8M9Q5j266arW1MFow
 tGnv/6IpSS5v9oMUgwnF15V8CsoW08BEdhCUzUTsViPB/Gt7noUBTC7yQlvaztp4
 IcmphacpW03RhT1XS2XmLagYllJaniKyqzxD41TntMStePQBW0Sc8biU0TQUfymg
 E/O9sqgBLbBrP5wWCZSuqVBq1PO2CJSTB7R785kDCqypZ6hYjHuXY0s5YEaWkbyo
 IaeWwPua4rvclEWN6nzhntu97eQJ4uNuPOKlj2w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=V8N+fI
 ObOKPRG1ocfc8CKZ2evcsjHoYUDj/YkpnCdpQ=; b=NuPpM1vzqutbuavmC8lhVY
 4tGO4bCFOl7wPGsMpPeJKWRQLYloPn3ThYeqdrEI1b9aTdq+nwqYPa1+0kVPj/BT
 BHpBSZVIbU4OqqpYSX8p15/j0/kuqiejEIhdbcOFYlD6pZYvrhhiWNfELvMiySJu
 Z6dwk2k1vpx5Ve3rsIVv14cCOaSF5QRIh63hQ8IBBkWvACKNsc+QHm3EgkuRZcHv
 2fR4IJsJwra58lh/JONjqSuFSzcALLWL8XouPsuzoEy8ZkQ0CZKsKqlV1NciTTO2
 D+ZiZi6rT4nWY064XIHocIHNhbN5oFVrfGX5Q9Tj2BamvyiyrvOEfQWlS2WI9KPg
 ==
X-ME-Sender: <xms:LHKEXebP0Dw07nrImalrC50Zm2ckFDM9eSiJGrwTX2xy8rYTCN1l2g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvddugddutdekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecurfgrrh
 grmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgv
 rhfuihiivgepud
X-ME-Proxy: <xmx:LHKEXX0rIasac_AlnAt2Z8OcuiX1ElrqaDgrHP6DRbi8nS3sqLiLCg>
 <xmx:LHKEXRwJnfXCDXPpcUnsOHSYlwTPnWamSAOqeLha9R_9fznAglaOLQ>
 <xmx:LHKEXf78i8i1dfgz-MV1A2Zemi8vHhy-b3BtzmPbAEoT-_622NMsfw>
 <xmx:LnKEXZFQJEDm0808zG5GzusaAjwTTtEvRSSkm23nRv9YP6yZjmrdIA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id A5C6CE00A9; Fri, 20 Sep 2019 02:31:08 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-238-g170a812-fmstable-20190913v1
Mime-Version: 1.0
Message-Id: <f2cae818-a373-4a2e-825b-e90165410758@www.fastmail.com>
In-Reply-To: <20190919152340.23133-3-bradleyb@fuzziesquirrel.com>
References: <20190919152340.23133-1-bradleyb@fuzziesquirrel.com>
 <20190919152340.23133-3-bradleyb@fuzziesquirrel.com>
Date: Fri, 20 Sep 2019 16:01:43 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Brad Bishop" <bradleyb@fuzziesquirrel.com>,
 "Joel Stanley" <joel@jms.id.au>
Subject: =?UTF-8?Q?Re:_[PATCH_v2_linux_dev-5.3_2/4]_ARM:_aspeed-g6:_lpc:_add_comp?=
 =?UTF-8?Q?atible_strings?=
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



On Fri, 20 Sep 2019, at 00:53, Brad Bishop wrote:
> Assume the AST2600 SoC contains the same LPC devices as the AST2500.
> 
> Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
> ---
> v2:
>   - removed DT binding documentation changes
> ---
>  drivers/char/ipmi/bt-bmc.c            | 1 +
>  drivers/char/ipmi/kcs_bmc_aspeed.c    | 1 +
>  drivers/reset/reset-simple.c          | 1 +
>  drivers/soc/aspeed/aspeed-lpc-ctrl.c  | 1 +
>  drivers/soc/aspeed/aspeed-lpc-snoop.c | 2 ++
>  5 files changed, 6 insertions(+)

Also should be split for upstreaming, but as with the bindings the changes
are fine in principle.

Andrew
