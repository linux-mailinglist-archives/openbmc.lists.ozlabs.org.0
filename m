Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B1342135119
	for <lists+openbmc@lfdr.de>; Thu,  9 Jan 2020 02:56:03 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47tTjX5zRJzDqX2
	for <lists+openbmc@lfdr.de>; Thu,  9 Jan 2020 12:56:00 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.24;
 helo=wout1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm1 header.b=l3ncNRW1; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=ZUNNkxTB; 
 dkim-atps=neutral
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47tThl5fNXzDqSg
 for <openbmc@lists.ozlabs.org>; Thu,  9 Jan 2020 12:55:19 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 4BD799C0;
 Wed,  8 Jan 2020 20:55:17 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Wed, 08 Jan 2020 20:55:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm1; bh=UbxKhRjH/ZsHmNhLFagNe92veaaIgfo
 7LeCetUHYfnI=; b=l3ncNRW14Os+P4LIpVl3MJZq/af43W5THELS7DXc1A7E4kX
 bEg6zBspet86PeVNRqj4Az55r4AFBU2rnthosbHjX1qa2qGnp3Lnedpfpy1utWo3
 YRy4+0yMC1OqBFLg246sL4mUZU9T8aW9aSHrnJfiuzTb5cdQim5ae4b7PWxdRUuU
 gjCZLRDHEVF0d2Gdh94HukucWE891Ehlpr8R9e5frpiDMIeeY98/nSuNxYSFlZk5
 My5aqE7RwOYstNXHpFth5kIB5jIGbadmNViaIsy1Y5PQOpMTH4Z95LRGNPcnL60w
 DR2Bague3jV2ZGOs88WnDMKRm6xgLeUhwaFNUJQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=UbxKhR
 jH/ZsHmNhLFagNe92veaaIgfo7LeCetUHYfnI=; b=ZUNNkxTBqUFmZM2Y04JwNC
 aR1toP5AJxLC6lo7+CqSG8rZfpt8oFhWdRVTACvSur1hk5gc1H/PghxZ1B7PrOtb
 JTgsd5CrRbk1LPc2k3rH3zNdjpyw/BJF0pIib9IaPUgVfCeru3Vy1ME5/V4YBRUJ
 VzN8f9CjQ9iVpZZdRbmnSFphwht9QeN5InoOqWDp4c2m36J6alXjJi0XdaVi03+T
 1haLxcxIltdNHCFQfnsGWubAmTYX3YpBW+uHpUv7xGsI+qnYxVtYWTgzKvbef0vN
 Q/JARybxEU8iYtbYE6TpKOyGpjE2gfbLN7rMAzXKLqIqX+UZtFqhEVVn3F/dH2HA
 ==
X-ME-Sender: <xms:A4gWXpr35J3Kp4St8ttQs5NGgyf0Oe1MrLEg9veO0EZqf3eL33py7A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvdehledgfeelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecurfgrrh
 grmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgv
 rhfuihiivgeptd
X-ME-Proxy: <xmx:A4gWXv69DmD0aTt3ijEHPPp4ZoI8jrIM8Os4kZm7bJL5ubJaafdBdw>
 <xmx:A4gWXhMGzFCWa3Ks_tcZQZIbH2RPMJkHTqUgn5gvl42tTLnAd3AMjQ>
 <xmx:A4gWXpOx1tZhKsqiuF_M6te5Odo0qwfv4KGAkU-YoNerHapyVgu0qg>
 <xmx:BIgWXq44wabhgiSfeyYKYhB_EG3m-2YV5m4nCyr6zwmj5s0Bif1j9g>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 7C367E00A2; Wed,  8 Jan 2020 20:55:15 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-731-g1812a7f-fmstable-20200106v2
Mime-Version: 1.0
Message-Id: <8a1fc80f-9d25-4c38-bdcd-df05c4194fe7@www.fastmail.com>
In-Reply-To: <865C376D1B77624AAA570EFEF73CE52F9E0E4E3E@fmsmsx118.amr.corp.intel.com>
References: <gqnvvFdbRiXJzS3sVr0pSSo8kD6KjPbFMgg8CV1tsi0cKt0zT5mrnSTfBB1cpiOt-MVrXNzlg95DqgWZ3AxD8zOyEbFYRykqjP-DxEW4Mww=@protonmail.com>
 <037D4669-D49C-4DF8-B49B-4F3BD97451AE@fb.com>
 <865C376D1B77624AAA570EFEF73CE52F9E08757B@fmsmsx118.amr.corp.intel.com>
 <3502e928-40c5-41d9-9ff1-5aa199e0e31b@www.fastmail.com>
 <865C376D1B77624AAA570EFEF73CE52F9E0E4E3E@fmsmsx118.amr.corp.intel.com>
Date: Thu, 09 Jan 2020 12:27:05 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Sharad Khetan" <sharad.khetan@intel.com>,
 "Vijay Khemka" <vijaykhemka@fb.com>, rgrs <rgrs@protonmail.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: MCTP over PCI on AST2500
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



On Sat, 21 Dec 2019, at 10:45, Khetan, Sharad wrote:
> Hi Andrew,
> Sorry for late response.
> The plan is to have MCTP in user space. 
> 

How are you handling this then? mmap()'ing the BAR from sysfs?

I plan to get back to implementing in-kernel socket-based MCTP shortly.
Unfortunately it slipped back a little in my priority list late last year. I'd be
interested in your feedback on the proposal when I get something written
down.

Andrew
