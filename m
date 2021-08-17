Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 395683EE3F4
	for <lists+openbmc@lfdr.de>; Tue, 17 Aug 2021 03:50:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GpYrK0GQSz30BM
	for <lists+openbmc@lfdr.de>; Tue, 17 Aug 2021 11:50:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm3 header.b=B+ixzD9n;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=bpkZyhUx;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.25;
 helo=out1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm3 header.b=B+ixzD9n; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=bpkZyhUx; 
 dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GpYqn6VqBz2ymP;
 Tue, 17 Aug 2021 11:49:41 +1000 (AEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id 63C8D5C015E;
 Mon, 16 Aug 2021 21:49:39 -0400 (EDT)
Received: from imap43 ([10.202.2.93])
 by compute2.internal (MEProxy); Mon, 16 Aug 2021 21:49:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type; s=fm3; bh=AYfOx7gxqwMc/xkwet6LywqFwcut1+p
 zBE2v44auoJs=; b=B+ixzD9nW2uFK3iCqrXvzjWoo3LF5a9z/fiIO6WuibXN9Uy
 fKSwAoe0qZ32e9ucYiDTQOKiJh8ZGjK4l4EPQjcfzN7U1fq2taBzSlGuw/4zx0O1
 kpUdQcbIR88PfmQtEIzMZ4yv4muJ6hsaWOulDwKFjjL1GtnKfZwtZL131mFAtB1z
 3FMCJ8JRbdEy2osDr4qftrDFezF/f1gzSSSjpq1EgkLefyePGca2KU3qq+MsxPi4
 SWutbDBnfxEIM0eSlXQK3cXvFRXbYMa3B7Hx8mftxcUeh/wjcPWlNCMvnzUpcKxW
 CsqlkhbmgtyavNNAuqlu1lHbji/goUDSYGZ6X6w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=AYfOx7
 gxqwMc/xkwet6LywqFwcut1+pzBE2v44auoJs=; b=bpkZyhUxuR2LTPK0uoY+0u
 Ft7sexeLQsq9u5MX+nWTFSxybslVR2HQUskttIuq2zJ51RV4pXgw2E6Gz/+x9zOd
 d30DKuT38AwH2B/ZZwMjsKS67mx+4U0imMPa9Mbez3Qmlt7sKSbcmwJ50szF3+ib
 YTC5GcWj/8xH6CCafQcSjXtFRaDB33SlkE8VAwGrezNp3MZOX7C505ZyT0yIvJgw
 bWgGMzdtWtnSmdp0OLPEYD5Rp5elAvRFpqsKNh7GR2tVNFvQRDibjMOMgY7kmxXw
 JNVXC0Mpq81VktzVno+kdiVhS0JAMvwK2gz5n3UqEDNKlV+xiWQm5Dl53yFQ5K2w
 ==
X-ME-Sender: <xms:sRUbYc_vCdhVhXigNC_gBs4cmvDu0wZi4qIvEHZ53sPzdBvUSy5HDw>
 <xme:sRUbYUsxecbQhgk3JCKPw7zMqcJ7yoqanqSKQ3Pd78mill4HV7n-cQFz-PAJMDr2g
 _vWMGA_0aYHcUAY1Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrledvgdehtdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderreejnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtffrrg
 htthgvrhhnpeetveegudfggeefhfdutdfgffeggedvteelfeejffevleegffegteevveev
 tdfhudenucffohhmrghinhepghhithhhuhgsrdgtohhmpdguvghvihgtvgdqthhrvggvqd
 hgphhiohdqnhgrmhhinhhgrdhmugenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgr
 mhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:sRUbYSC3Z9bkjMQxQMrM0UcJTprPNNjfpsJOhd4Elt8H_3D0b2xk4w>
 <xmx:sRUbYcckE0_Oy_nVYBemmgz11fHZfMofOBB5uNrZxyfoeIk3QmJ4fQ>
 <xmx:sRUbYRM36ZNcZ2jKP3PFZrf1Mv7GVMg2FE3nwNNKBndUJCtnw0wTjQ>
 <xmx:sxUbYf1haRocjvCls-Ewq3SmMlUXTpx9Uq09EoarajlyNmAhtCMIqA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 90296AC0E77; Mon, 16 Aug 2021 21:49:37 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-1118-g75eff666e5-fm-20210816.002-g75eff666
Mime-Version: 1.0
Message-Id: <f7e626b5-bd7c-4e8a-85fb-84e9de6a017a@www.fastmail.com>
In-Reply-To: <20210816160002.18645-1-jlwright@us.ibm.com>
References: <20210816160002.18645-1-jlwright@us.ibm.com>
Date: Tue, 17 Aug 2021 11:19:16 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Jim Wright" <jlwright@us.ibm.com>, "Joel Stanley" <joel@jms.id.au>,
 openbmc@lists.ozlabs.org, linux-aspeed@lists.ozlabs.org
Subject: =?UTF-8?Q?Re:_[PATCH_linux_dev-5.10]_ARM:_dts:_aspeed:_p10bmc:_Add_power?=
 =?UTF-8?Q?_control_pins?=
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



On Tue, 17 Aug 2021, at 01:30, Jim Wright wrote:
> Add to p10bmc systems the GPIO line names used in chassis power on / off
> control and chassis power good monitoring. Names used are as documented at [1].
> 
> [1] 
> https://github.com/openbmc/docs/blob/master/designs/device-tree-gpio-naming.md
> 
> Signed-off-by: Jim Wright <jlwright@us.ibm.com>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
