Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A0FC478358
	for <lists+openbmc@lfdr.de>; Fri, 17 Dec 2021 03:46:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JFYK06tW9z3cJm
	for <lists+openbmc@lfdr.de>; Fri, 17 Dec 2021 13:46:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm1 header.b=FFfYbeSh;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=S86wORQu;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.28;
 helo=out4-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm1 header.b=FFfYbeSh; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=S86wORQu; 
 dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JFY9W5kKYz3c7r
 for <openbmc@lists.ozlabs.org>; Fri, 17 Dec 2021 13:39:59 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id CD2985C0160;
 Thu, 16 Dec 2021 21:39:55 -0500 (EST)
Received: from imap43 ([10.202.2.93])
 by compute4.internal (MEProxy); Thu, 16 Dec 2021 21:39:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm1; bh=RvVmLgJ+CfIM8KgsuhBrVfZ8NqzSNxS
 HCy/QyHOevIc=; b=FFfYbeShZATKMkapn+oaHM1QvzBVcyCYmBYPGlc7nEj3GLS
 Qlied/aNtCxa2eCTcacDMDVP1Vo/FRe+eIEFpnHTPI1K/UeQ5KeAXftoG/Vhwq1o
 mSpuNHj/18rj/Cg9y48+wp9tFYkwwu5Ha6/KM9PgPwjTGBbkQcn4u1rBnI6QBv41
 20I8b9AFQEN1TSApE8mO7EvYR1xhe0OxL8FnALvWFe3J05CZdSnllB3YekHY7plA
 bCwNx4dQHeX49qLJniujPmcywxay6+iU6owIZCc8TpLG9GTIdogPN/YEX40uFaxz
 zipa+pY95I+9xo4yIDu09hKJ6PcOdRJ5lQpQwjg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=RvVmLg
 J+CfIM8KgsuhBrVfZ8NqzSNxSHCy/QyHOevIc=; b=S86wORQu9zZQaO8yAzPQ3z
 wSfJXiblJMcnTdSi5au2F4OoVFnZoQM+LDwY0ztJ2Zc1mYLN3LjSTkbd6ZTrGsWz
 t2nFk2dhoQDRv1bLmah8ShJGgwpf8v1fBfEh2rZBSy9lmRmPJTt7yghluc1WutFs
 NEXA/B0kglJc6CQGBIP9jF1JHAie9VIKoGJGykxE57LMXSUQeAHjrfhtjW6Hf0jL
 kI/NQfIJmj02Tag9akSNP27zEitr+GewXpIWcxmeLyTDeEarIooLH77iC1k/WffP
 F87qsPNFjfsw9Hcp9q+hOHsDX6iViWXI8MSZyePGoFFC9AdZUDWaBlpPfGesp08A
 ==
X-ME-Sender: <xms:e_i7YSAoPQH0HXaziD2ho2TtAAqDl5hL3B5DZnOIQjK_7cVyJsa__Q>
 <xme:e_i7YcjxjH5dAMGkATCC12Uc7aIsUAih8ISuLF_P5xaCCdF2MXQkxOC7EwV_-w_fY
 2ODYdYWJIPVwOHkog>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrleehgdegkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtffrrg
 htthgvrhhnpeehhfefkefgkeduveehffehieehudejfeejveejfedugfefuedtuedvhefh
 veeuffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 grnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:e_i7YVn6_M5IyYXpDJMgsnOFW8jL2UNIwtqcaUZsBIIo7wXI5H-Mkg>
 <xmx:e_i7YQz6kadUxEkYPWWz2bDHCxW13DHM_vwoubgFQagw6GoD2mCE2w>
 <xmx:e_i7YXQDIqd7LJ5P8G2_-5R5lXfrLTyfgqLB33vcXT1pVayrPUgsng>
 <xmx:e_i7YY6pQ2wujbiRR-i5BYvfZpZg9Kk09_NLdFGJfOVPclG3savaBQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 79CD7AC03DB; Thu, 16 Dec 2021 21:39:55 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-4524-g5e5d2efdba-fm-20211214.001-g5e5d2efd
Mime-Version: 1.0
Message-Id: <40eb458a-678c-4dfa-b07e-f73ac9cdb3fa@www.fastmail.com>
In-Reply-To: <CAO9PYRKPrVzew5KUcxL7HKo4VXNR+mEef7AiPas-5FxdcB5FeA@mail.gmail.com>
References: <CAO9PYRKmup17BSTLNLdBMO=-HjQ2Lxw+Gcw7+0VY8DKVMed9GA@mail.gmail.com>
 <YbduMfjuc7TXT6Rw@heinlein>
 <CAO9PYRJD0MJsuY8M_80yJci-nT8idKL7VhSXJzvX_JS1wreJzA@mail.gmail.com>
 <YbtzcvbSwTjGzfcH@heinlein>
 <CAO9PYRKPrVzew5KUcxL7HKo4VXNR+mEef7AiPas-5FxdcB5FeA@mail.gmail.com>
Date: Fri, 17 Dec 2021 13:09:35 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Deng Tyler" <tyler.sabdon@gmail.com>,
 "Patrick Williams" <patrick@stwcx.xyz>
Subject: Re: Run unit-test during development
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, 17 Dec 2021, at 13:06, Deng Tyler wrote:
> Hi Patrick:
>     I try to build and run unit test repository which support meson such as
> phosphor-logging and phosphor-network. There is dependency issue while
> building them and I wonder it is a bug or my environment issue.
> /openbmc/phosphor-logging$ meson builddir && ninja -C builddir test

...

>
> subprojects/sdbusplus/meson.build:14:0: ERROR: Dependency "libsystemd" not
> found, tried pkgconfig and cmake

You need to run:

sudo apt install libsystemd-dev

Andrew
