Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 618951A4220
	for <lists+openbmc@lfdr.de>; Fri, 10 Apr 2020 06:53:27 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48z5Hm46wRzDrMf
	for <lists+openbmc@lfdr.de>; Fri, 10 Apr 2020 14:53:24 +1000 (AEST)
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
 header.s=fm2 header.b=PX5S3eI8; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=p3v07b/4; 
 dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48z5Gb05jlzDrJY
 for <openbmc@lists.ozlabs.org>; Fri, 10 Apr 2020 14:52:22 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 47D975C0116;
 Fri, 10 Apr 2020 00:52:20 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Fri, 10 Apr 2020 00:52:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type; s=fm2; bh=nSXpqqdZo/3XrCr0Sp2Saa8OIxclqlM
 JFsXXINme1mQ=; b=PX5S3eI8Tah/yanuOo7NINscmhNIbCTL36FqgOO+SucJVht
 TSlRCKW1e9f7hFlTW1jDhhIsUVV7xbR8lSJKHfssnxmj9JLZyZQgQUnCJKJE+0dd
 nPfIdbczEryuAfiBDoPOjaKHydFlvw2FswdrDCDwkNgBwxd1n5ZImEr3djfgkj/f
 eJsCtqyCaSDSziaCcDtGG1T6E+ficnVaHMsL49W0kwPsxC3DELf9CoAkkeAzMYbS
 A9iicZqT8jwFyRTlB333s0zQSlC71gEXa3k7GavIC+geC+K1vCXsj4p+9U3gK+k/
 RdaBmQgH1g/5zTrKuz85jbL6wfkj7sDQI1suVDA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=nSXpqq
 dZo/3XrCr0Sp2Saa8OIxclqlMJFsXXINme1mQ=; b=p3v07b/4dA0CBlDwHveok+
 zafC89EDGkkIKe2CjC25fhylUZojMB3ZFVbawqE04/FxtrhqfAPYVu3om4rnYAF5
 5bHikT0j9RIeTCTpHK/BuXyuwGv+ysO/0rLp10GgvG2KpT5oFDNiAIGMbI+y0d8H
 p1G2rlaZkd3xyxx4lKMcg9z/ClnifBNVAK9oKYDXxSXqjrFY27r+DIsdfF1bFqgs
 wnSmz0873noFLdnIXkjR2ewiTxzfV1/dxnz2lSUCeVywfymIvgTwusqZvrZMzGM4
 EePngZrWcNKxw12kbAFBDUix7QJfQNeHyCvFoag2V7hUaY85meWz7fKkPYbs0LdQ
 ==
X-ME-Sender: <xms:hPuPXo5K7Q5mBHpAhcz8foufFFwXGuVSpd3Z6irWq4KBiiKVXqz0ag>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrvddugdekjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderreejnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucevlhhush
 htvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghj
 rdhiugdrrghu
X-ME-Proxy: <xmx:hPuPXs9TYZuzdQ2uMC010CKVZlISdiOGa-UDNBfaVFQC7BmxEyJw_A>
 <xmx:hPuPXiGBrrrSIsx7e1_ngPKKQj89UGb6xQe4fQzSf4Lw93LncpxCkA>
 <xmx:hPuPXpUYv8UGo_5DjV2lvdEqHUqNz5mbCCj03AqbWLlY7cRpV9HHlA>
 <xmx:hPuPXm-ojs8fXrcZqXNkj3LLsav-rrw94vdw18AW-KZh5-FhfEkPAg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 16DCAE00A5; Fri, 10 Apr 2020 00:52:20 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-1104-g203475c-fmstable-20200408v2
Mime-Version: 1.0
Message-Id: <87d6d53e-3295-49e0-920e-8ce92f3442ed@www.fastmail.com>
In-Reply-To: <20200406191938.31156-4-eajames@linux.ibm.com>
References: <20200406191938.31156-1-eajames@linux.ibm.com>
 <20200406191938.31156-4-eajames@linux.ibm.com>
Date: Fri, 10 Apr 2020 14:22:43 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Eddie James" <eajames@linux.ibm.com>, openbmc@lists.ozlabs.org
Subject: =?UTF-8?Q?Re:_[PATCH_linux_dev-5.4_3/3]_fsi:_core:_Disable_link_when_sla?=
 =?UTF-8?Q?ve_init_fails?=
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



On Tue, 7 Apr 2020, at 04:49, Eddie James wrote:
> In the case that links don't have slaves or fail to be accessed, the
> master should disable the link during the scan.

What are the side-effects of leaving it enabled?

Andrew
