Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FCE21AD3AD
	for <lists+openbmc@lfdr.de>; Fri, 17 Apr 2020 02:37:26 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 493HH43slkzDsx9
	for <lists+openbmc@lfdr.de>; Fri, 17 Apr 2020 10:37:20 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.26;
 helo=out2-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=E9tXE/hp; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=H9Yo/3Cq; 
 dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 493HFL4phSzDsq3
 for <openbmc@lists.ozlabs.org>; Fri, 17 Apr 2020 10:35:50 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id F358D5C0248;
 Thu, 16 Apr 2020 20:35:46 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Thu, 16 Apr 2020 20:35:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm2; bh=M73uMMN6NSFYJvVBFvvHytJ7R6kitRF
 LXggRW+ra8ys=; b=E9tXE/hpIeW6kxnJRgrQrreHWYWgkOQXm+HZILGyq+W0D47
 Rlb8v2E1UscrHfjyQodwnAHfdZSbf/fdtHfjkxY9IqFIKSWPTIgwWINXN5VwksNX
 Jnce685kz63OEcFjPBsi4wwqM0aUJG/AXkq2PbegdDlu8vJqAgvxSpGuUA0TdJjt
 uMsaehaCFm1PDP1FqJ6pZ+SDhx+CZ1ovwiswBulgcVoY8qN4lEiCULXjJlNKQDGJ
 fK0hvU2ZhavLMtVMycKa2sZhU13rc+xsNE2GjGzAgkWbhsX7t3zRFF29KZQhbDm5
 y4oULDBHSsqhyXjlVYo/pC1hgn/nLFqyUMtWQtg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=M73uMM
 N6NSFYJvVBFvvHytJ7R6kitRFLXggRW+ra8ys=; b=H9Yo/3CqxQkGL2DSR6lnnP
 UXVzaXWUtivaHGB9TUlP5C6pmjbtePfqKlg7sKSkYYZqpONEKLjhAnS44FWmXXjc
 9E9Lu/dMz7DcXFUr/BNoY0qzto3kiOlkkKnqBXLJ1xilitc5riZcG41YBKVYtjuO
 mgCDqnpot7s4OwuR8Fnr6otqAADl86zbq5676nC8JW2Euynj9sYJCYfgg6MqaJbQ
 xYaL1MP8DxuoyQ5i7lCKQsb1/oQHLo9QnaCSlmaBhRxbDUYakffy9hWMuUKQ++5v
 FrF7jpMbXR7ec/irTB/j3523qjNtF3nibE641lav8IBwqZW+ZDF44VOExAUuUYpw
 ==
X-ME-Sender: <xms:4vmYXhrVwYPpK5DcVhp2KtrD8CX-0Ppzh1Gxx4sQWiedF80aHil6lA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrfeeigdefiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucffohhmrg
 hinhepohiilhgrsghsrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghm
 pehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:4vmYXhcmFRhukgx8OnzQ-3VQcgoVthCnv9hf7j7Xoz7tW1mWBvjHLg>
 <xmx:4vmYXooXr_0Z0tIDetuPfYolzwIYIVWAsCnpc_uWvj1xthbnGul-nQ>
 <xmx:4vmYXqFPgQBaIbPpIxDBVr-Ez1FUAJ64nRgDJciDorj71j8l_DUyGQ>
 <xmx:4vmYXuyK_s83F4ybkxjXh-SzF9dIQGXnC79PXKrlgh7gnngiYII3eQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 22422E00A6; Thu, 16 Apr 2020 20:35:46 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-1131-g3221b37-fmstable-20200415v1
Mime-Version: 1.0
Message-Id: <22e54b85-83e8-4325-aac3-41d51518bc4d@www.fastmail.com>
In-Reply-To: <38C6FED3-EACB-4BE9-B3AE-4FE34D2982AF@carlson.net>
References: <4770a42d-d012-4e95-9347-d5c287c2e288@www.fastmail.com>
 <38C6FED3-EACB-4BE9-B3AE-4FE34D2982AF@carlson.net>
Date: Fri, 17 Apr 2020 10:06:12 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Mark Carlson" <mark@carlson.net>
Subject: Re: nvme sensors
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Neeraj Ladkani <neladk@microsoft.com>, Vijay Khemka <vijaykhemka@fb.com>,
 James Feist <james.feist@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Mark,

On Thu, 16 Apr 2020, at 12:38, Mark Carlson wrote:
> NVMe-MI. Over MCTP. This gets you into a broad range of SSDs for 
> management.

As mentioned in other replies in this thread you may want to check out
Intel's dbus-sensors or the phosphor-nvme repos.

https://lists.ozlabs.org/pipermail/openbmc/2020-April/021288.html

> Also would like to look to I3C Basic for MCTP in the future, and I know 
> DMTF is looking at this. They have a Redfish Device Enablement method 
> for getting an NVMe drive to respond with Redfish.
> 

Cheers,

Andrew
