Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 358F24847D5
	for <lists+openbmc@lfdr.de>; Tue,  4 Jan 2022 19:27:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JT1LK0jwvz2ywV
	for <lists+openbmc@lfdr.de>; Wed,  5 Jan 2022 05:27:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm1 header.b=Ir6IEVvF;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=KvybTbgn;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fuzziesquirrel.com (client-ip=66.111.4.230;
 helo=new4-smtp.messagingengine.com; envelope-from=bradleyb@fuzziesquirrel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com
 header.a=rsa-sha256 header.s=fm1 header.b=Ir6IEVvF; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=KvybTbgn; 
 dkim-atps=neutral
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JT1KF6lDJz2ywH
 for <openbmc@lists.ozlabs.org>; Wed,  5 Jan 2022 05:26:25 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id D12A6580443;
 Tue,  4 Jan 2022 13:26:22 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Tue, 04 Jan 2022 13:26:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 fuzziesquirrel.com; h=date:from:to:subject:message-id
 :mime-version:content-type; s=fm1; bh=Axpf/eY9xXw+6zjGO1PDnr95bK
 j12ePdP7epwpwwLyM=; b=Ir6IEVvFtWsv3wcx0nCHjdQ+7qY+cDlO+nm0rkvgHX
 kixhu8RMYKGeE99aVwvwI/LuiFK9sgDnlWYBSwVNkZPc+Xb9Ed0yYPvKNPeRMdxU
 u9FZyIXEgWXF1JDab2mGOcLoi6Gj4IK/OONEvZ0xK9NnanbRi3XMCABG8RFrmmOP
 S5Nq0rkRv7X+ND48jnuFuzaGCIvxkGb3cCZDoW57A9DeHorZTQ406tbAvfhlXTOB
 tzlYakGqWTqHqJ3YGXKHWjaSFeuKxClXihCTB2ce6wKYPR6PfLtQEvYEp13QOuep
 WLJunBEyciQGMlWhQ3994zbzMZtIhxzUx+IoslUtRbGw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:message-id
 :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; bh=Axpf/eY9xXw+6zjGO1PDnr95bKj12
 ePdP7epwpwwLyM=; b=KvybTbgn5E4gOtMRRvd9IrHgHmaRyfX9UoyIyk3woCt5r
 5DJ1i0p5mF9M5ZSEnu1Hon/LpO8BTHaYcMbBHr5borsqZOPYVtckHOSQjX7MmUDw
 ff5OhWlFnWW7V/bT9NRjITF9Bcurw+qIGS+X4zvUIJ1yOYt3gVo1r3ZbDlmWvlX3
 mDyE4ApNyos4haZ9+b697zgz8YJaTGH8CGOog1qianb+YBUnQzez4LWVI2kf4dVF
 JWXcQVctKuuiusxXiKHthUJlVD1naUXEoXml4F0/k6YvTfrvQnF1t0VMnOjrNkTc
 VxS/Nrt8evmcFyu11FT4rRZZGMsIs9H/z83ZiSlkg==
X-ME-Sender: <xms:TpHUYc5qQADhW7q9D5mL2sFQ-aeCJ4OTvZh7URs7uYCaF-R62JCN1w>
 <xme:TpHUYd6pQF39IICWKq7SPVnw4SRR5NxxTZkLdkmu1iAqyU7WB4RsmDMN_TFwkgjy0
 iALQlQfFtnKhpt6L1g>
X-ME-Received: <xmr:TpHUYbcfLuG5zqKYGSaC3DfRFml6rmYogZ4apx25GSlcx4wFxoLWPhQgm7u-ANKi6aZqwCF5Mtv_3EeGbQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrudeffedguddufecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhepfffhvffukfggtggusehttdertd
 dttddvnecuhfhrohhmpeeurhgrugcuuehishhhohhpuceosghrrggulhgvhigssehfuhii
 iihivghsqhhuihhrrhgvlhdrtghomheqnecuggftrfgrthhtvghrnhepudehieekkeejud
 euueekudeftdefleegvedutdejhfekgfffgeelgeegkeelfedvnecuffhomhgrihhnpehg
 ihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
 hlfhhrohhmpegsrhgrughlvgihsgesfhhuiiiiihgvshhquhhirhhrvghlrdgtohhm
X-ME-Proxy: <xmx:TpHUYRJXuYQACLRvUkvZzHicVQAv6Tra4sBdvbO5Y9MXOBtM1we6vQ>
 <xmx:TpHUYQIDACSaGhXM5Mbq6gakvoNNBUvCo18In3UT3ySeyFraM2TtYQ>
 <xmx:TpHUYSywc1nBo7-TyTSW67CcfqLaRbTwf1y7bRQ6fVGWPxwKs6e_Eg>
 <xmx:TpHUYVVg-naTyMU4NTSIs_C8fDydj_JujkU9AXAe0u6j_gh0uFfGTg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 4 Jan 2022 13:26:21 -0500 (EST)
Date: Tue, 4 Jan 2022 13:26:19 -0500
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: openbmc@lists.ozlabs.org, hpham@amperecomputing.com, amithash@fb.com,
 yuenn@google.com, gkeishin@gmail.com, James.Mihm@intel.com,
 chen.kenyy@inventec.com, tmaimon77@gmail.com,
 chyishian.jiang@gmail.com, p.k.lee@quantatw.com, a.amelkin@yadro.com
Subject: removal of company specific, general-developers teams
Message-ID: <20220104182619.ua6xl655s72d44wu@cheese.fuzziesquirrel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
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

Hi all

There are a number of github teams that as far as I know are unused so I 
would like to delete them:

https://github.com/orgs/openbmc/teams/general-developers
https://github.com/orgs/openbmc/teams/ampere
https://github.com/orgs/openbmc/teams/dell
https://github.com/orgs/openbmc/teams/facebook
https://github.com/orgs/openbmc/teams/google
https://github.com/orgs/openbmc/teams/ibm
https://github.com/orgs/openbmc/teams/ibm-development
https://github.com/orgs/openbmc/teams/ibm-test
https://github.com/orgs/openbmc/teams/intel
https://github.com/orgs/openbmc/teams/inventec
https://github.com/orgs/openbmc/teams/nuvoton
https://github.com/orgs/openbmc/teams/quanta
https://github.com/orgs/openbmc/teams/yadro

If you are aware of any use of these github teams please let me know.  
If I have not heard anything by February I will assume the groups are 
unused and delete them.

thanks!

-brad
