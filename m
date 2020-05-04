Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 10ED11C3764
	for <lists+openbmc@lfdr.de>; Mon,  4 May 2020 12:59:03 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49G0GX0XzkzDqdc
	for <lists+openbmc@lfdr.de>; Mon,  4 May 2020 20:59:00 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.21;
 helo=wout5-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=tsIppicN; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=eeIwLfxR; 
 dkim-atps=neutral
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49G0Fj3X7tzDqBv
 for <openbmc@lists.ozlabs.org>; Mon,  4 May 2020 20:58:17 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 77BC244E;
 Mon,  4 May 2020 06:58:14 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Mon, 04 May 2020 06:58:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm2; bh=u/R9BI0RhV5sOy5h8tq4IMky50+BPuv
 hHU6alZgwRwg=; b=tsIppicN/kjw66wkqKbc6qPsJEQtgmcsONXkl/w7RdzpFsf
 8SS3VU/8/GzuxjSMMLrgX7X++ApZPflhCucM4BJhWAY0wVZxau7+ztv6ZqdhP9Qc
 cBF84bMqqEEMWet7//6+iXHVDHPDdf2Kgh8N5kWLff5iLtZKjLMDHrZFojTfOr27
 1wQ6ZVe1Ipq9fek9yHJd/tDQPy/IeQilCiwkbNc5+Mn6VLiUIe39k4wCngnvTJu8
 PDxf9qvD/Bima6t/s9DRPykQyPDtVispI7XWFNjxUZDvny4hr/bNhmOABBHFRdR3
 bkOhYI8Yp3YPGUI2tysO2rRIocb/iKXbRDDxvoA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=u/R9BI
 0RhV5sOy5h8tq4IMky50+BPuvhHU6alZgwRwg=; b=eeIwLfxR/XA1KDt8JyCpZ3
 vux/GFAfRJc+oBfaCr7t2KjiBjTMP96BZfS3/+Al4U41SgLil1pBOpUsNl6pWDCQ
 RQLjymGmo0vCkuSOGFCjYfLyKnkvZfK7REe1sztxh562k9ShTSxozz+qkmMmDzdz
 f3XVhmQ88fhcAsBv1YO7kbLs7Hdn6abYGY1SjHyLhCbNhZK9gt7VgqASo6YJvGmM
 CbaH6JaMrltK3MeFNYRlAfX3dUdC7mqD/PhHd2f11ZFbE+PWdpb2UyaTGUrrQRGT
 OIW1hdthEAVLCO5enf/3WJRv9fctY7A00nWVowXiksg/fqEFnQ6xui9I1cXuPmVA
 ==
X-ME-Sender: <xms:RfWvXmSJVMwv_YQw2giVUnWTkQzwu2U4yK5yNSWUwQm0EFlxkQDrvQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrjeeggdefudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtffrrg
 htthgvrhhnpeehhfefkefgkeduveehffehieehudejfeejveejfedugfefuedtuedvhefh
 veeuffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 grnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:RfWvXmLcFEjf7PyDb0_RQ3YiAgkEfmkbDobCixSqJT9vAQKcudAIsw>
 <xmx:RfWvXkkdu9p3ymOkDwCvstBobkLNRzIB7c2zEFyJ_I8HelINfBdsBg>
 <xmx:RfWvXvgg4XX4j9VDA-VVNZmd_VkUiLQj3Bdc2ba1-Whpe_WxOUngxg>
 <xmx:RvWvXjU1zB9C8QVarfYLZt87FtxdZwfbi4aiCEFkGZtcOnWY2-PyEQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id B59CDE00C7; Mon,  4 May 2020 06:58:13 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-dev0-351-g9981f4f-fmstable-20200421v1
Mime-Version: 1.0
Message-Id: <569b80cc-aa29-41dd-9edb-15c140d8c39a@www.fastmail.com>
In-Reply-To: <CAMXw96PaiyjPY2+Zk-BFRquWYPqtzJhCFtUQuoRudurOJK9iLA@mail.gmail.com>
References: <CAMXw96O6LpiR5CsmY4e_m2K-HNm_uHdRvRavf5iBSs1RqHYE6g@mail.gmail.com>
 <CAARXrtnLOFVT2TuBa=mPBzVv1tXtrPEbqjms1d2AiX3n4L9wag@mail.gmail.com>
 <CAMXw96PaiyjPY2+Zk-BFRquWYPqtzJhCFtUQuoRudurOJK9iLA@mail.gmail.com>
Date: Mon, 04 May 2020 20:27:53 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Zhenfei Tai" <ztai@google.com>, Mine <mine260309@gmail.com>
Subject: Re: Error with QEMU
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

Hi Zhenfei Tai,

On Wed, 29 Apr 2020, at 02:18, Zhenfei Tai wrote:
> Thanks for the info. 
> For me it just hangs there.

It's hard to help without knowing exactly how you're launching qemu. Can you
provide the command line that you're using and tell us what BMC image you
are trying to run?

Cheers,

Andrew
