Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CFFBE1C321B
	for <lists+openbmc@lfdr.de>; Mon,  4 May 2020 07:14:39 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Frd92cwZzDqk8
	for <lists+openbmc@lfdr.de>; Mon,  4 May 2020 15:14:37 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.28;
 helo=out4-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=ewjePhUC; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=V0nRJVew; 
 dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49FrcP70jCzDqWN
 for <openbmc@lists.ozlabs.org>; Mon,  4 May 2020 15:13:57 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 7B1095C00F0;
 Mon,  4 May 2020 01:13:55 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Mon, 04 May 2020 01:13:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type; s=fm2; bh=4G1MzXOp2EsJge2U3TitxDiS99+FsRi
 PCEGAhpR8dZA=; b=ewjePhUCciyby5MbH5EMQLeqyK59JrXNvGYi9YgGekHQ9E+
 LKDEs/l2ULCcsuWwW3NA0HUBBCnBfHJehKX94VxaNBZxNfZpHqhi09ISn4MPJICD
 uYH5TorxcQHXr+wdK4Xp0LkrCfsmpwro53B7SBi/TpklLmrZGactbNZpTvJFpk5l
 hmBA4juRLOy9Zmb7YGOlnInbCMF2WkYfH+5Oig7bQAyXhwa01LF5FeNIlRycG1AO
 XScYaVgDKF2R6UejTh55qcBav236xNbeNAIMnox0zZsSMvqgba8Xcs8EmZWSbop+
 DTgijydpXdSoUI0eCesZsYJf0H+yGuRpzW2krcg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=4G1MzX
 Op2EsJge2U3TitxDiS99+FsRiPCEGAhpR8dZA=; b=V0nRJVew6i/glQ+9ojPFCs
 69KV3nfZiuhEXuVz3AEwMeJpM9J+ok8sG9CnrJRN1AMLYAl1pBs/dkJHypz37De4
 tcRXbw83NQhmgNULmh+pTuGRJqXV2HD2szXAjg+YCNcofRuKcyillp8nUciACwgq
 mHFYrQHZO4a4jXDEYwXXlkbRe3mc7Rv/LyH9n4KdpxCToeiuAxFC9NHOeA16Sc3S
 s/L0+PE0ywuQXO4ADV2ZWPeSdJLK/lQ1YFZR1/oh1u1c5t0VujtePOjHzcDFGe43
 TW0TCVLBXOPjNpcbZy2wbxn4c62WSQdUxKYAKAayfZxqpMVBS6ePMRzdFkuXVoiQ
 ==
X-ME-Sender: <xms:kqSvXg_sHVWpldaelWxARtBlNd3SDJZa5BDm5cdB6VoomI4h-Aur7A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrjeefgdeltdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtffrrg
 htthgvrhhnpeelkefgffekteejhfdtfffgveejvedvvdevgeduudffuddukefhhfekvefg
 iedtffenucffohhmrghinhepghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivg
 eptdenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:kqSvXgV_cWFeVM5MWFCmk6etlE0Tk7qhxvkXixLX_HtMmAjQl3-dUw>
 <xmx:kqSvXhPfqSAELZMvsS5NDd5DWGmE099CviElkGDR6lDv_GgXGGbV6A>
 <xmx:kqSvXqxyY0rTp17CvdXJThU7OPjalPh91Iufbh_EVkQkpwv51gI1tw>
 <xmx:k6SvXsPxtLquI-BNkAZSr49eVGFcJFCEb01zY2lqN9U-X2KH86tC3w>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 6022BE00A9; Mon,  4 May 2020 01:13:54 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-dev0-351-g9981f4f-fmstable-20200421v1
Mime-Version: 1.0
Message-Id: <6458b8d3-d460-40c0-9573-fa970cc8fd47@www.fastmail.com>
In-Reply-To: <f44ba049-2678-c34e-4906-5ce0b9d416d3@linux.vnet.ibm.com>
References: <CAG5Oiwj+-OnkPMc+dfeo0P=MfREPz_7E+zBaMaYy6AHMLO+BxA@mail.gmail.com>
 <f44ba049-2678-c34e-4906-5ce0b9d416d3@linux.vnet.ibm.com>
Date: Mon, 04 May 2020 14:43:34 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Gunnar Mills" <gmills@linux.vnet.ibm.com>,
 "Kurt Taylor" <kurt.r.taylor@gmail.com>,
 "OpenBMC Maillist" <openbmc@lists.ozlabs.org>,
 "Bills, Jason M" <jason.m.bills@linux.intel.com>,
 "James Feist" <james.feist@linux.intel.com>, "Joel Stanley" <joel@jms.id.au>, 
 "Deepak Kodihalli" <dkodihal@linux.vnet.ibm.com>
Subject: Re: OpenBMC 2.8 Release
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



On Thu, 30 Apr 2020, at 02:30, Gunnar Mills wrote:
> On 4/29/2020 10:48 AM, Kurt Taylor wrote:
> > just add it directly here:
> > https://github.com/openbmc/openbmc/wiki/Current-Release-Content 
> Added:
>  * Yocto refresh to "Dunfell" version 3.1
>  * Redfish support for: full certificate management, complete LDAP 
> management, full sensor support, event service schema, task schema
>  * Move to Redfish Specification 1.9.0
>  * Redfish support for 2019.4 Schemas
>  * GUI enhancements: LDAP, certificate management
> 
> And removed "`Redfish configuration backup and restore function`".
> James, Jason are you okay with the Redfish list above? Should we add 
> something about Storage & Drives? Anything else?
> 
> Should we add something about the Kernel? "Move to 5.4"?
> 
> Anything for PLDM / MCTP? For the 2.7 release it says "Partial PLDM 
> Support" and "Partial MCTP Support".

Certainly MCTP support is still "Partial". Slowly progressing with help from
Intel.

Andrew
