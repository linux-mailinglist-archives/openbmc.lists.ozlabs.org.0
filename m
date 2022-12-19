Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9625D650D85
	for <lists+openbmc@lfdr.de>; Mon, 19 Dec 2022 15:40:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NbMnl3rdJz3cGd
	for <lists+openbmc@lfdr.de>; Tue, 20 Dec 2022 01:40:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm3 header.b=bSf+TPDe;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=vSYrMgEt;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=fuzziesquirrel.com (client-ip=66.111.4.29; helo=out5-smtp.messagingengine.com; envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm3 header.b=bSf+TPDe;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=vSYrMgEt;
	dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NbMn645vYz2xWg
	for <openbmc@lists.ozlabs.org>; Tue, 20 Dec 2022 01:40:09 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id B14AA5C017E;
	Mon, 19 Dec 2022 09:40:05 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Mon, 19 Dec 2022 09:40:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	fuzziesquirrel.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1671460805; x=1671547205; bh=6IWwvH/APN
	FJb73YiN1HFR4iojqX53oWrlC0YwHH798=; b=bSf+TPDefpJmBY49RwtrG7IaFz
	9YQS6TD3P/c+ghDm3dDwvGOj0AV//e02kBz05/KqI18nuQxcQYAqpUoWIlBL1nRy
	VBbwxABCUEM1eiykd0fMWBxvuJc4E8JXO+raIa2ISEGwIlmV1xLdhyVsd04ImK6V
	/Win9SSFjNB14MsARulALMMbo0sEO/UFhBoGgPloNP7kNWGYy6uWZKBb/Nn1Kfe4
	guXoBytGj4OUcl/fKyi0kPTYfcBH/1910YdDVpkX/O/+0Txiht/7d8V+32PV9JiR
	NWwOq3Rz1K+Wde/ihhac6d570AeYYiQZjZlBFw/YzOFtLimVYxQcW01FvZWg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1671460805; x=
	1671547205; bh=6IWwvH/APNFJb73YiN1HFR4iojqX53oWrlC0YwHH798=; b=v
	SYrMgEt3TeOlqmBQS/5VHyRvbixb1nORa1Wjsvx1dM8efOFg/1pyRhIFEOiw6A6J
	yjSM9QM6J7rlSjGhl2GjJoXlXtRcxk91pDzlPi9XJkJbGqMHGplS1vQITE+4MR4M
	LeeJknT8O4cB1NPAeCovh7Y8SvuFnOPI8Ibm+WWSUTVOEm0z0va45VfRL/6EagH/
	QfHWCrZWSWkQvy5X+8ZKQZESBbov7jOv2Wq2EO3TzJyObfgI+J1pvBGI2qTISng5
	oKqoyLxeLsw3RSSrAbSB/uxXEx2MyY2xBCNKLH7895LTXqLFM4J0t5wD0eZ+ULyx
	cdkC1J9Nhu20LDLi4E75A==
X-ME-Sender: <xms:xXegYx183yHA58VOHzaDn_FHg4sZf8WovwLljxuGbPmEy0m89SpdMw>
    <xme:xXegY4ECXA6WdGAEqSfE9WSfFp2DdLMhiEt3GXfqpJKWRlLbctR32iffBP3aT0_Bb
    TacWeGBennd5ZKUK8A>
X-ME-Received: <xmr:xXegYx5Pues_B4gjZCt2R9GDehOM8JIYhx0WPLOzEZtE-S7w1XAYxrfi_klfgYBwlCAItxxFGAEPZH9brMNo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrgeefgdegtdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefkuffhvfevffgjfhgtgfgfggesthhqredttderjeenucfhrhhomhepuehrrggu
    uceuihhshhhophcuoegsrhgrughlvgihsgesfhhuiiiiihgvshhquhhirhhrvghlrdgtoh
    hmqeenucggtffrrghtthgvrhhnpeegteekudefteejheevfeehkedtieefvdfhieelhfei
    hedvhedvtddugfeugfeiteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
    grihhlfhhrohhmpegsrhgrughlvgihsgesfhhuiiiiihgvshhquhhirhhrvghlrdgtohhm
X-ME-Proxy: <xmx:xXegY-0PhxOKSQJtFtej1JwXidzr0lcF5KuzGs97QgWFAjrpQmDo1g>
    <xmx:xXegY0F6kBlcGxX91827Xo-Y641xF5mWk4voZOwVFBtxlOEE96jxpg>
    <xmx:xXegY_8PLUPESwG7A1HLrZjccqcfhf-vUoLsn-ehOJzvL7cKob8kfw>
    <xmx:xXegY4DWQTx-2wAqMQXzzcall7cVHiXyzarcxiQrZCU2Jr4QGBvW3Q>
Feedback-ID: i02c9470a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 19 Dec 2022 09:40:04 -0500 (EST)
Message-ID: <2a197f638e9ef7372fc2cea686c0bec5b7f6f8d8.camel@fuzziesquirrel.com>
Subject: Re: Ufispace OpenBMC CCLA Signed 20221206
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Jordan Chang <jordan.chang@ufispace.com>
Date: Mon, 19 Dec 2022 09:40:04 -0500
In-Reply-To: <CAJ3czeRU2-WAuv4UvL2_6ipiLdrmse8KN_t3cio7A6DZ2mDJ6A@mail.gmail.com>
References: 	<CAJ3czeSoe8rDaXP59BY3MKdNwzZiEQsZxqmrvC8uvDKPL9dfpg@mail.gmail.com>
	 <e6a0017bb89c7e77a32ff2666273f36bafa3319b.camel@fuzziesquirrel.com>
	 <CAJ3czeRU2-WAuv4UvL2_6ipiLdrmse8KN_t3cio7A6DZ2mDJ6A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1 
MIME-Version: 1.0
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
Cc: Jay Lin <jay.tc.lin@ufispace.com>, manager@lfprojects.org, openbmc@lists.ozlabs.org, Eason Huang <eason.ys.huang@ufispace.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, 2022-12-09 at 11:09 +0800, Jordan Chang wrote:
> Hi Brad,
>=20
> Thanks for your suggestion. I have edited the Schedule A section in
> CCLA
> document. Please help to review it. Thanks.

Hi Jordan, CCLA accepted, thanks!

Brad
