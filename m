Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F02A1B9670
	for <lists+openbmc@lfdr.de>; Mon, 27 Apr 2020 07:15:00 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 499Xyn5GJkzDqYq
	for <lists+openbmc@lfdr.de>; Mon, 27 Apr 2020 15:14:57 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.19;
 helo=wout3-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=lygYPifz; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=4NWcs2sU; 
 dkim-atps=neutral
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 499Xxs4W6MzDqV8
 for <openbmc@lists.ozlabs.org>; Mon, 27 Apr 2020 15:14:09 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id DF6645D9;
 Mon, 27 Apr 2020 01:14:06 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Mon, 27 Apr 2020 01:14:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type; s=fm2; bh=LsaTD9qpQfKQpckpH7Q23hl5qMbTSqb
 IERl9XFHU47Y=; b=lygYPifz3xC+kFPTGKUFHLVXvb1UEyX1k7mUo5Z+VeiMoTh
 nUADlUhzWnx3scQEuMpLhlcMNorz02z4iSpjVwxguIhj0ON8QneaPA5YJO0ARmOH
 DRUgbuj773kDZSpvyOiBqATxCh8XRbOrcbtCwsZ4x0pZdMoxOdALosqfafEqYQYf
 jNJhfug+msLWsWne1ymt3LlpeWaeby3mBtc+as9QJIfOzOmNYqC/+xzVaL6IIT8J
 wBQsovDr1pzx9X2CfVh3DPyQhvV4VG1GTBcERvhQ5rCGpGLPDpBLvHM3UJOOxVWp
 oaO3vSLFN0adOrkUt7BVRWFDHGoKjElq50IRWWA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=LsaTD9
 qpQfKQpckpH7Q23hl5qMbTSqbIERl9XFHU47Y=; b=4NWcs2sUwz05D+DHJ0yhx9
 FQtb5nlLp47MXGqPwYjzthlmBXOKdYv/ChjWAf5ZDqiSC5JUgwIiV8ihw7rYrDAA
 DG70tNy3sNRxsIgekxHJsa7U6Ukyz2TMpi3cjYN0wni9Y0cpTdtuEtwK4cLp3gaq
 kqPknUkAfHGW/6UpMCGe46kKI4tGuMaPiRvuX4rDJMYdKpFGoLx9mRBNNczdzc16
 /hSuQt+X+YoR5Sb6IQy/28F372uRkv0SWBzWzQNp4+QQqwSj7vbIgUNxcPiMM+MS
 fuw+r7CsIEoKvFO1Kj/bHbEZFr4aHMXnjou+ZkD1Vw2u2bjr4lfUrDOqn9uqVC1Q
 ==
X-ME-Sender: <xms:HmqmXsC-Bi9z06BUyEh_Z9jIvKNpR6T0wj_40KEX4CohifNYuAY2-w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrheekgdelfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderreejnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucevlhhush
 htvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghj
 rdhiugdrrghu
X-ME-Proxy: <xmx:HmqmXq2k6i-l8EIP2X9UZc0CQbeKbH-L4AfAYVDwbLxGJBtYS6CL-g>
 <xmx:HmqmXiWVVhvmTc-33xb-G4y34nix3E97lOTgtIT-rsTxBoFVtDl9sg>
 <xmx:HmqmXklejNrDAwsZgrUepIWJO5uBfuSRRXjyPpuESaositZLG5QM4g>
 <xmx:HmqmXm0XfIsA2B_dipMh-LpbEszg2C-P6sN_tWchOxkcll1PyLkRIA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 5C51CE00C7; Mon, 27 Apr 2020 01:14:06 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-dev0-351-g9981f4f-fmstable-20200421v1
Mime-Version: 1.0
Message-Id: <031984f4-67a5-44e0-9348-ce271f5bb9df@www.fastmail.com>
In-Reply-To: <20200427050944.2177237-3-joel@jms.id.au>
References: <20200427050944.2177237-1-joel@jms.id.au>
 <20200427050944.2177237-3-joel@jms.id.au>
Date: Mon, 27 Apr 2020 14:43:46 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Joel Stanley" <joel@jms.id.au>, openbmc@lists.ozlabs.org
Subject: =?UTF-8?Q?Re:_[PATCH_u-boot_v2019.04-aspeed-openbmc_2/2]_ast2600:_tacoma?=
 =?UTF-8?Q?:_Run_DDR_at_1333?=
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



On Mon, 27 Apr 2020, at 14:39, Joel Stanley wrote:
> Restrict M-PLL to 333MHz so DDR runs at 1333MHz. Failures were seen when
> running M-PLL at 400MHz.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Heartily-endorsed-by: Andrew Jeffery <andrew@aj.id.au>
