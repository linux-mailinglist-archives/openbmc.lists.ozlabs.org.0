Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 746EF21AC72
	for <lists+openbmc@lfdr.de>; Fri, 10 Jul 2020 03:16:01 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B2w8t4tVCzDrFF
	for <lists+openbmc@lfdr.de>; Fri, 10 Jul 2020 11:15:58 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.25;
 helo=wout2-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm3 header.b=fjKuucBF; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=MhfNBEd9; 
 dkim-atps=neutral
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B2w7z2kNkzDr9T
 for <openbmc@lists.ozlabs.org>; Fri, 10 Jul 2020 11:15:11 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 2964E9BC;
 Thu,  9 Jul 2020 21:15:08 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Thu, 09 Jul 2020 21:15:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm3; bh=LfxwM2a3zS+Wtdqj/pIZ6WZnqcPHD11
 9FCYTUkIgPjA=; b=fjKuucBFtwbsp28uKdjw1VQl/SnERwvj0oG1Hx/F6c/Tglu
 XaaG+YPem7YTk0rl/2CyZwTqunETIPunGdKIGbROmDiD48mjSKTkOsYveqIM3fML
 ssDellm1+XmCIN0y1XVARMeqQplIT7ZVrCAKiB8Si7hUE6Ms5pvDT48ZMR8pY5hy
 ALGMffdjK5MUNKaA1kECDt+jgEbcR9Qz5xGv3EWfkIXGIkMCngwXJ3mdoeUBmUEx
 4FlPshUXh60KTbU/63EndhAQPfvWas99a7oOMkVdiONHjr97GKEkPzMOU580Xz9e
 /e5NkcQWpp5wpf1NPbPFQQ061zkDKGKvf9jdZaQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=LfxwM2
 a3zS+Wtdqj/pIZ6WZnqcPHD119FCYTUkIgPjA=; b=MhfNBEd9aXlJPwSlLNxGT7
 4IRtG3L+spY8ympNpWpvZ8ConyM6IF9S6AuPEEnmgOk5AV88p20MGdsM2YkDa1co
 eP0PXBNWeXyg/FdIEWX9InycFYrQxRNTf7H2TDPAgwJSY5gNUBy4vY0fwtH8Os2O
 jTJm1K8F5EXwwZ0isAePn4ZidFANrgHq2SADLA3t1Z9y/tZr6VPrq7F79afwEsIR
 dRWqRjWa5GFj59x4a2DB52pRV9gpqbQ6MACJ7oucePbfnXJWCQ8AfSzvnhgDrS09
 NHYUC9poY4OETfUqGdpPP+7exS0HL6VDEjDrX9otkhC/d996cvT1zryh3oNNTXdA
 ==
X-ME-Sender: <xms:G8EHXxlXaySS4qejK1VKvSX3esgVXTs4OL_kX6XMSt_Neb7bR6aJeg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrvddtgdeggecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderreejnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtffrrg
 htthgvrhhnpedutddtkeeugeegvddttdeukeeiuddtgfeuuddtfeeiueetfeeileettedv
 tdfhieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 grnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:G8EHX82n9jKSHrsN05IpY54fCQipWLAM2ABQ1WJ1vV06flWn8ayCCA>
 <xmx:G8EHX3r4I7yFbzqTQGir0sM-4OFWGNGpKtP7C976_1nH75XBEjEPUQ>
 <xmx:G8EHXxnU6Y1-2gIKgLJl7hz0skLYz9tobMwlXcQCNvbf9acmy7Byaw>
 <xmx:G8EHX0gnacd4O_WF7_4_qoVx3Xte3gHJPwb1H4MI8aVSFXo7UPbFWA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 96489E00AA; Thu,  9 Jul 2020 21:15:07 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-dev0-613-g8a73ad6-fm-20200709.001-g8a73ad6e
Mime-Version: 1.0
Message-Id: <ff8adc4d-078e-4685-aa95-a355846774e1@www.fastmail.com>
In-Reply-To: <20200709194113.12119-3-eajames@linux.ibm.com>
References: <20200709194113.12119-1-eajames@linux.ibm.com>
 <20200709194113.12119-3-eajames@linux.ibm.com>
Date: Fri, 10 Jul 2020 10:44:46 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Eddie James" <eajames@linux.ibm.com>, openbmc@lists.ozlabs.org
Subject: =?UTF-8?Q?Re:_[PATCH_linux_dev-5.7_v2_2/2]_mmc:_sdhci-of-aspeed:_Fix_clo?=
 =?UTF-8?Q?ck_divider_calculation?=
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



On Fri, 10 Jul 2020, at 05:11, Eddie James wrote:
> When calculating the clock divider, start dividing at 2 instead of 1.
> The divider is divided by two at the end of the calculation, so starting
> at 1 may result in a divider of 0, which shouldn't happen.
> 
> Signed-off-by: Eddie James <eajames@linux.ibm.com>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
