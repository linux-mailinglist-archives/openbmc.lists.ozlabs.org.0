Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F366B44021F
	for <lists+openbmc@lfdr.de>; Fri, 29 Oct 2021 20:35:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HgrhJ5zQhz3bXv
	for <lists+openbmc@lfdr.de>; Sat, 30 Oct 2021 05:35:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm3 header.b=OUj0vHhB;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=URMwiKle;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fuzziesquirrel.com (client-ip=66.111.4.29;
 helo=out5-smtp.messagingengine.com; envelope-from=bradleyb@fuzziesquirrel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com
 header.a=rsa-sha256 header.s=fm3 header.b=OUj0vHhB; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=URMwiKle; 
 dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hgrgt1QWWz2y7M
 for <openbmc@lists.ozlabs.org>; Sat, 30 Oct 2021 05:34:49 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id A695C5C0103
 for <openbmc@lists.ozlabs.org>; Fri, 29 Oct 2021 14:34:46 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Fri, 29 Oct 2021 14:34:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 fuzziesquirrel.com; h=message-id:subject:from:to:date
 :content-type:mime-version:content-transfer-encoding; s=fm3; bh=
 qiIgxhAUsxWwHUxAgiIqYC/9Gk7a7OYE+iDOJMSD2vY=; b=OUj0vHhB3fZUer0/
 XdxeafbxhZEbMpXTPJeKLHAQ6EaSRm3lmxJ4D1M/p/lE33DUGcnm6wOcrdgunD4L
 Sou4gnLvDpUO1PwFPWd6+o8qbMn6V8PgpbsbUgbSMYbb+bFFmzAi/srp3QDFOFXZ
 dgZoQm1oWlLc1CcoWPW6eEoBBA8Oq4YuNoIKxS1+oahjoh90A4HREtiMByr3gcQM
 X83YUSfoT1f0jzFRdZWSwgGdzcf/zKiamo20p2WEMiNUVaXHlwMjmu5PP+jfEhVz
 FJqaX9598M2CV4uLtNKZ8f50olnoV9haT33sruQ1dPd03Z0VQ53P8ZQDqR/ZtiuK
 oNQkWg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=qiIgxh
 AUsxWwHUxAgiIqYC/9Gk7a7OYE+iDOJMSD2vY=; b=URMwiKletfNpkJc+dCioCu
 KpuDtpDXMP2/fzJOJyWLUPL4W7N1CikoVBc6w5AoSKGGeVtOeI0bHs9rnVk29M7S
 y1B/7uix0+ikx7DV4GW6GLjugYhbItCZCxzYR3CxIhxKs9pUD05D7go5Tl/qwaF0
 7eZBu4H4ep6Mo0Hzog4IyILvSmvqlUcx317JYdBbi4xOoZ/xlpYDKTnBkzg+1sIf
 Hj2SSfTxbslVBFpG/iH8IgbI58TiZsoCXDRXcYc9gspI46f+PZxWdrXBUEsqi9Uq
 YERwuVCmoiieuBHpkQ0fgJlM3fDQX0i3k29lY29Zmmhdu0qhYgFGooYMgGgL7S8Q
 ==
X-ME-Sender: <xms:xj58YcGGqlqtYqdyf8ccTjSM0CFNjUcaMkhBmiKk_ntzWnj53W4Dfw>
 <xme:xj58YVXijq_CxvIUfpMFqc5TikrQUDIEdIyKtd2nsAqvGKbRLPfe-UXSHX6Ym4W-K
 jYKh2ey_XXcqUMUYTY>
X-ME-Received: <xmr:xj58YWIU63Jyi9gltxnU8V0p-AHjJs6fAb132S_OD9r3Ec0f9G3w47KtHpu8GFSPI4Ulz5A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvdeghedguddvvdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecufghrlhcuvffnffculdefhedmnecujfgurhepkf
 fuhffvffgtfggggfesthekredttderjeenucfhrhhomhepuehrrgguuceuihhshhhophcu
 oegsrhgrughlvgihsgesfhhuiiiiihgvshhquhhirhhrvghlrdgtohhmqeenucggtffrrg
 htthgvrhhnpeelieejvedvvddvudfhffduueffjeeflefhleelfeejjeegfedtheehledt
 ieefhfenucffohhmrghinhepohhpvghnsghmtgdqphhrohhjvggtthdrgiihiidpghhith
 hhuhgsrdgtohhmpdhosghjvggtthdqmhgrphhpvghrrdhmugenucevlhhushhtvghrufhi
 iigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsrhgrughlvgihsgesfhhuiiiiih
 gvshhquhhirhhrvghlrdgtohhm
X-ME-Proxy: <xmx:xj58YeEloy0mNPTr5CJuTrheTGtWDc0jBvx7QInCVE18vzeJjIpujQ>
 <xmx:xj58YSULL0hG3-YGnPw6Hulhigy5HdP0Ryat01T6bwxOBss2f1sGpA>
 <xmx:xj58YROZDd08yxzjVijNMQfAuo4fDLe_Cs0hoGaOaFz2m8hbNTolAg>
 <xmx:xj58YdAqC1GxIa24VfNn1nurrPu7Sws7XTVpDtEiHSETXf_daZgq7g>
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openbmc@lists.ozlabs.org>; Fri, 29 Oct 2021 14:34:46 -0400 (EDT)
Message-ID: <e41ba66012487dbec35d73ed82fcc95a8a2927d0.camel@fuzziesquirrel.com>
Subject: documenting object associations
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: openbmc@lists.ozlabs.org
Date: Fri, 29 Oct 2021 14:34:45 -0400
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

I recently submitted a patch[1] that tries to establish a mechanism for
documenting our DBus object associations[2].

The patch has been merged - I am sending this simply to highlight the
change and to encourage everyone to document your past, present and
future associations using this mechanism.  In case you missed the review
feel free to reply here with suggestions for improvements.

thx - brad

[1] https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-dbus-interfaces/+/47463
[2] https://github.com/openbmc/docs/blob/master/architecture/object-mapper.md#associations


