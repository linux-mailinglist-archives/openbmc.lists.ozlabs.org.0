Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 427AD26D1EA
	for <lists+openbmc@lfdr.de>; Thu, 17 Sep 2020 05:50:46 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BsNKZ3Q8XzDqQC
	for <lists+openbmc@lfdr.de>; Thu, 17 Sep 2020 13:50:42 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.25;
 helo=out1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm3 header.b=gPth/bql; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=vC+AgOq4; 
 dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BsNJd3mQkzDqPC
 for <openbmc@lists.ozlabs.org>; Thu, 17 Sep 2020 13:49:52 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 18C1F5C0101;
 Wed, 16 Sep 2020 23:49:48 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Wed, 16 Sep 2020 23:49:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:date:from:to:cc:subject:content-type; s=
 fm3; bh=hMbLD1Onpcs73lKsvkivJ1EeTrF82CmjEJbefprerfo=; b=gPth/bql
 tpbSwhUI108XhFEpwkpLeCMLi8qMN9ejT85HiLHNAyvA1jvnO4IWQxpKyhUot+iO
 gyExf06F8jszuvWdY5PpPMtmVaO/G9FaMGk/HvvFhvSrRUN6CueheH4DeuMSjh1G
 XnpKycMlllthbiGCDpab+osGyO8QFkSDHzSelSdrSYxaiSm9vVUT4O5s5Y5N6/Z2
 AJC5sPtZ9Qi0WDNEUcBG7eRff9ooem+4hKthOCQrkrX1dhH9jha6W6lwJCcpfYuI
 ZB3C3YSFmcXQJmCG2PKRGF2zT6fJDz6MtNXGCqDkhph+rFuyoPwACA54Q+EHM66z
 fU33AQI/0ayKYg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:message-id
 :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm3; bh=hMbLD1Onpcs73lKsvkivJ1EeTrF82
 CmjEJbefprerfo=; b=vC+AgOq4ng3vdAL3DhGUlk0BMOGeBryjgNyoHSM4EQjHf
 NormLj0NVBbtPmASrlabKAJG0rgwY7GXG2DLpwwIzKo0ZEnTAQ2BBpNfbEXwv2a3
 4qLZ8LDDKd+rYheOODVQVID6wdAiv1OWNN+cmrwGkIO0ku6Hf5HovkfhLWRf5LMZ
 0S5OHdyalFqT9laGhiuvT28Bv763YRaYjXLCHltVFgCf8Z7K7KArHr8AaWjoFpnA
 FiVWOxbplmZoEOeAUGFl169XGdcHREDayErH0MZHrBzJWVkQE6hDvwxqtDpj0Peh
 QzlK4DHfdGGPmariEU9YvPRKdeQ0vATzpuOXqRl6A==
X-ME-Sender: <xms:29xiXw59Sh2mP94qlZoBycQbcIiJF_mBoBzTUSndYtb9dHy-D8bKGA>
 <xme:29xiXx7v7xnUH2t2eGiA0F1ZDQYXlzeokwAmiQguKbnVfTkCbFdbe-3W8GJWsD7Iy
 R-Rk0hkwGINU9QPcg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrtdefgdejgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculddvfedmnecujfgurhepofgfggfkfffhvffutgesthdtredtreertden
 ucfhrhhomhepfdetnhgurhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrih
 gurdgruheqnecuggftrfgrthhtvghrnheptefgieeuvedtveegueelveeujefgieffgfek
 keekleduhfegkeejvedtjeefjeffnecuffhomhgrihhnpehophgvnhgsmhgtqdhprhhojh
 gvtghtrdighiiinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhf
 rhhomheprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:29xiX_cbBgct_40VntjSFSvDclVA6z02nBJODtgRBrebncbWo8oZ8w>
 <xmx:29xiX1I-UbnNwzaDZWGVskdpeJm3CxFKq0HdVc43DODiZcPGvfU0kg>
 <xmx:29xiX0L5cLFuuLgk9RbBepvUI9rmdSX563uFztDAyBbX7ayk9-E4gw>
 <xmx:3NxiX7mni_6S3APrZiNl6vw5kb0YT4SYSo7Pge3wnjoU9Gwd7-0fEA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id AE7C3E00D1; Wed, 16 Sep 2020 23:49:46 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-324-g0f99587-fm-20200916.004-g0f995879
Mime-Version: 1.0
Message-Id: <f2731d26-8f3f-438c-b21e-5a2ed5f6471c@www.fastmail.com>
Date: Thu, 17 Sep 2020 13:19:26 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: openbmc@lists.ozlabs.org
Subject: Reorganisation of the openbmc-tools repo
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

Hello,

I've pushed a series into gerrit that puts all the tools in their own 
directories and then flattens the entire tree so that all tool directories are 
in the root of the repository:

https://gerrit.openbmc-project.xyz/q/topic:%22reorg%22+(status:open%20OR%20status:merged)

The current structure of directories of github usernames was a result of the 
original merge process I went through to bring several people's individual 
repos into one. I don't think its sensible to carry on with that structure.

Please take a look and let me know what you think.

Andrew
