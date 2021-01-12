Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C3C22F3C79
	for <lists+openbmc@lfdr.de>; Tue, 12 Jan 2021 23:50:26 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DFm4Z1hy9zDqv5
	for <lists+openbmc@lfdr.de>; Wed, 13 Jan 2021 09:50:22 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.20;
 helo=wout4-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm1 header.b=qte6aZLv; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=Ko5KE5rY; 
 dkim-atps=neutral
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DFm1S10mmzDqRs
 for <openbmc@lists.ozlabs.org>; Wed, 13 Jan 2021 09:47:39 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 1022F1980;
 Tue, 12 Jan 2021 17:47:35 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Tue, 12 Jan 2021 17:47:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type; s=fm1; bh=MnX7tZ2SzyJR3vDll6fovQHwheStGwO
 /wApp5YiZWXI=; b=qte6aZLvLhHjZ7W4vYud+blGxo8qOZdE0TRi6vLM5+1PWNr
 mIpfD6Dj84hHCcoczztdyeCjEeTjZdnefe0b5tvvT901eB5CyVakh1eNFsIPkv9t
 O8L3NAgy809fYUy/DlSDJkJ62HoJ+hTrHVd/L3XEW/zwTnmqAT0A7kEEgJrVwR1h
 z305RV4RwyxpOdIMnDJKAuhDpycsPHwpv3kzy4rP/ff1if/YLhm6NtJwQrcKtIIS
 mCfiF29lxRLKFQm9g6xsqV5HUu5Mw4DsAB6y6wChobqA56G8spiFRCtfHvjM/Hf+
 1ahtf4RvwPNrYYxdzL93jr/bDc8lXE8Bp/vFOsw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=MnX7tZ
 2SzyJR3vDll6fovQHwheStGwO/wApp5YiZWXI=; b=Ko5KE5rYuztHgdWf8DPX8B
 pz/8Q6dJLdDVPEsBE4vErOj3pet5Rniy+xnNnfaIoyS9TduE8ykbuPq+MPGji8Im
 zGZFWjoOMXUzXpAoKXGmJSf69azME0ZK8dtH2zjtnwo1c+L3TL0dF+oNQ1X24ppP
 f7HIRELRNaKfBiMVgcoRARD7z4YKArUpDT+q667ZwLFPPJumriy2ur5oigUrljUp
 21YRIO3jqLwIIRRN3qoLsYHwLv4lpOe9HKRl9C56YNnvnhqi0f1ySKMxLTvY6WbO
 3Bc+vzIH6EQBCLxRL5gQPFLJIW7srJtLXg84+oQp8WeyQzrYQ8WPFgOnt4yngCrw
 ==
X-ME-Sender: <xms:Bif-X7W_PMNDmwnJJTOI-QCAF8OcLv-I6C1mYtoV0fOpLvr8w4xe7Q>
 <xme:Bif-Xzla7K0OZhrpm-N5v5al6PQ35urkpL3hF5yoHBgYO6JjOj_aWAtjMgMNayZQR
 CTN_JLdTjCJTcFmfA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedukedrtddugddtfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhepofgfggfkjghffffhvffutgesthdtre
 dtreertdenucfhrhhomhepfdetnhgurhgvficulfgvfhhfvghrhidfuceorghnughrvgif
 segrjhdrihgurdgruheqnecuggftrfgrthhtvghrnhepleekgfffkeetjefhtdffgfevje
 evvddvveegudduffduudekhffhkeevgfeitdffnecuffhomhgrihhnpehgihhthhhusgdr
 tghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 grnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:Bif-X3b4nfjz1pSouy-wc5bYPdgsJ8TkMSqYQ66tV4M7Ym9mpoJtyw>
 <xmx:Bif-X2U6KG6rcBjS_E6twMzogQxikGNEw8K8XlDtvMbLFfiyhfBQVQ>
 <xmx:Bif-X1lf97IK_D472KQozkUte7CzBlM4RdhFeqof2qBKPEM8mpR4yg>
 <xmx:Byf-XzQ7ghgvpZb97uLalk-SGSO7611ygTvSMdvPn0IEFUydzFFT_A>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id B6416E00C7; Tue, 12 Jan 2021 17:47:34 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-45-g4839256-fm-20210104.001-g48392560
Mime-Version: 1.0
Message-Id: <e511b34f-c659-46cc-a219-105df9f3df8d@www.fastmail.com>
In-Reply-To: <20210111220919.zwc727vbwc4itm7h@thinkpad.fuzziesquirrel.com>
References: <20210111220919.zwc727vbwc4itm7h@thinkpad.fuzziesquirrel.com>
Date: Wed, 13 Jan 2021 09:17:14 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Brad Bishop" <bradleyb@fuzziesquirrel.com>, openbmc@lists.ozlabs.org
Subject: Re: Call for volunteers
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



On Tue, 12 Jan 2021, at 08:39, Brad Bishop wrote:
> Hello OpenBMC-ers!
> 
> Your TSC has been aware of the problem of fragmentation in our project for some
> time.  Fragmentation is a loose term - for the purposes of this note consider
> it to be any time contributor efforts in the community are duplicated without
> thought given to maintenance and/or compatibility.
> 
> To begin to address this issue the TSC is looking for volunteers to serve on a
> "repository review forum" to which the TSC will initially delegate its
> authority in the areas of:
> - new repository creation
> - placement of contributed new function into existing repositories
> 
> The TSC fully expects the scope of this forum to quickly grow into the role of
> a traditional TSC providing frequent, technical oversight to project
> contributors.  The current TSC will continue to serve the project in terms of
> governance, advocacy and industry exposure - and likely get a rename (OpenBMC
> Board? or OpenBMC Steering Committee?) in the process.
> 
> The new forum would meet periodically or at the demand of other forum members
> to:
> - raise the forums combined awareness of new function under development
>    (information exchange)
> - build a consensus within the forum on where the function should exist
> - inform the function contributor and the rest of the community of the decision
> 
> A successful forum would be a forum that can simultaneously encourage the
> contribution of new and innovative solutions to existing problems without
> introducing complexity to the project as a whole.
> 
> A successful forum member will have previously demonstrated a breadth of
> understanding of the upstream OpenBMC codebase through:
> - frequent participation in peer review, the mailing list, IRC, and Discord.
> - submission of high quality designs and code to upstream OpenBMC
>    (github.com/openbmc)
> - a history of working with and guiding less experienced OpenBMC developers
>    in a timely manner, enabling them to come up to speed quickly.
> 
> If you are interested in serving the project in this manner, please reply to
> submit yourself as a candidate.
> 

I'm interested.

Andrew
