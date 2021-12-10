Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F3DAF46FA26
	for <lists+openbmc@lfdr.de>; Fri, 10 Dec 2021 06:24:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J9K8Z5bv5z3c7w
	for <lists+openbmc@lfdr.de>; Fri, 10 Dec 2021 16:24:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm1 header.b=KSm44uA4;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=glzMj+xl;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.20;
 helo=wout4-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm1 header.b=KSm44uA4; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=glzMj+xl; 
 dkim-atps=neutral
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J9K8C1phSz2x9N
 for <openbmc@lists.ozlabs.org>; Fri, 10 Dec 2021 16:24:11 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 32C0B3201D69;
 Fri, 10 Dec 2021 00:24:09 -0500 (EST)
Received: from imap43 ([10.202.2.93])
 by compute4.internal (MEProxy); Fri, 10 Dec 2021 00:24:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm1; bh=nK5MerAgPLTfkQqd1Hl6qDnXmVakLZf
 MBoMUOiiKdYI=; b=KSm44uA4Wzo/N2sytRN7zXq5VNU7LjoWRaBOGU3XiGw1J2z
 3RAegOIAbkalMxhvOg5a3JV0ki8X9q6FUtqVFqN8rRhy/X1FS03uLPcRsobfHfuv
 5g4MRlZH//Olw4KErlz53tM1zTssJdIj6YS8cqakZCfUgp+q8IRlmNfWb3Awflo7
 dflhdIThAydUJW7F0FU1u8AzdjkEEbj9nhq2HjHevf9CRHgG7rJbHPaLL5pAluJC
 I5FiuINJCFRMjWNJoUy4qNeo3Tjre0gRxZeko0/aWrQH076hC5I1b796hjUnheLB
 pdh+iPLNtyV9C4dvH9/m3K7EdQq3c5ZJKp9tkyg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=nK5Mer
 AgPLTfkQqd1Hl6qDnXmVakLZfMBoMUOiiKdYI=; b=glzMj+xlXJJ+lg8PEN51Tt
 Ggrvn1uyrTddb34LET2SneEl//3EmUOPwxUbtuKGwB8Ru5ytMeSRn5L1RrZUUfdT
 zQcZX37jxN57DxlyqYZrvIvKG3W1EQY5IkJO+ANm+62EQaH8Bsta3W2ra2AhUfgK
 Z6Xh09Ay1KCBMU5gvNmaq64qOy8iTolP/yrQ7UTG5pb4ELrYuUs8uOzzxsg2DkW+
 cjbmRIa+Atjf16DtUJiT4LVULyra2wEUkOSecnGmN/y8NAVo+pmKa1LKqPC/7EqG
 hNfB3tw8OOF2bqSbC8uiutOqJN2GIKzNtFk8eNFcPz8hVb+/ig0Rhltm9hv7ZFBw
 ==
X-ME-Sender: <xms:eOSyYZN8jDsm0pY0bf0YFmIq82OT-T2__fXZO8PLbIUfmAAaZXx8UQ>
 <xme:eOSyYb84Nyw61PoqAgT0veO0K8Dp0y7jofQa0l6xtMghL5Jrg8IHEojBmOBBFqkSz
 gql_375pfR0m2PN0Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrkedugdekvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtffrrg
 htthgvrhhnpeelkefgffekteejhfdtfffgveejvedvvdevgeduudffuddukefhhfekvefg
 iedtffenucffohhmrghinhepghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivg
 eptdenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:eOSyYYQb81kT5UUNFpmdE5NwLtOQL7OXvNOs8iTpAs__TbovXtTuVQ>
 <xmx:eOSyYVu7ztEjim12Xv2w35R7wusNos15Jdkv1jsA4Yf1mvZfaPkAig>
 <xmx:eOSyYRdMge82UWoYRTLrrihBRKbBzT5SOTTU5wCl2Q3fcjgOZ7nWug>
 <xmx:eOSyYRmlzrQCy6ZOo5rvBn-G_1np5yTM8lYjiTE1jcJWc45X9AMDvA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 79857AC03DB; Fri, 10 Dec 2021 00:24:08 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-4514-g2bdc19e04f-fm-20211209.002-g2bdc19e0
Mime-Version: 1.0
Message-Id: <7575bf21-c087-4be3-8dd5-ca5f58f8f17a@www.fastmail.com>
In-Reply-To: <1639112518-8080-1-git-send-email-dphadke@linux.microsoft.com>
References: <df30fbcd-870a-4d9e-9377-80c0b1a9c3ca@www.fastmail.com>
 <1639112518-8080-1-git-send-email-dphadke@linux.microsoft.com>
Date: Fri, 10 Dec 2021 15:53:48 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Dhananjay Phadke" <dphadke@linux.microsoft.com>
Subject: Re: Security Working Group meeting - Wednesday December 8 - results
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
Cc: openbmc@lists.ozlabs.org, Joseph Reynolds <jrey@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Fri, 10 Dec 2021, at 15:31, Dhananjay Phadke wrote:
> On Fri, 10 Dec 2021, Andrew Jeffery wrote:
>> I'm not sure what patches you're referring to here, can you clarify?
>
> https://github.com/AspeedTech-BMC/u-boot/commits/aspeed-master-v2019.04
>
> cmd/otp.c has more changes compared to openbmc/u-boot.

Okay, I expect we'll sync up at some point.

Andrew
