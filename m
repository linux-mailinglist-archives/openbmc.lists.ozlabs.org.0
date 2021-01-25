Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 03BDC302108
	for <lists+openbmc@lfdr.de>; Mon, 25 Jan 2021 05:17:25 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DPGmK50RGzDqr5
	for <lists+openbmc@lfdr.de>; Mon, 25 Jan 2021 15:17:21 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.224;
 helo=new2-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm1 header.b=m9bcb0GH; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=EXa6EsDC; 
 dkim-atps=neutral
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DPGkk4jGSzDqr6;
 Mon, 25 Jan 2021 15:15:58 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 5A0595807D1;
 Sun, 24 Jan 2021 23:15:55 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Sun, 24 Jan 2021 23:15:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm1; bh=Y5snhxS8mW1RuSQI45POs81UwwdOf3y
 NQAfUu8eLaUE=; b=m9bcb0GHHgsSbwl7lL55N45p01DOOg9ndlB3FmCPgJ3xXUo
 JLiDPtSnYg5YZ5MwIdOglzub2eGncYZBS/d3G+tbfYrGFWjOt/12//mCtcO5Kcns
 DFdXqa4LT2m7CO6akoTRiFA3YBhszjPrHH6SUFCIgwvM0RBtM7rRLCGQuIWPDLJ4
 3nKMN1+BiAvatNN8U5eD2yqTLubH80YwjNCSlMOr8LhxIs/FEapWGeYx0fiA2iNI
 Ve2CI4i0cnCF4FidlTY0Wc0hzJqnEYMEnx5RwZ5H7tQplhPqETHf1+AGWgriPGe4
 p3phnhNNkkSil/B3Za738uQT8a51AdB8zYuycWw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=Y5snhx
 S8mW1RuSQI45POs81UwwdOf3yNQAfUu8eLaUE=; b=EXa6EsDCXBYEJ0Z7UzZlgg
 a54aVP6unAa5wgcDozLCQiFSCI7aFY+L8W1vjYo1O86NPdOcn6ZT7bVlPgke8BIS
 vsOEMljfl7W19pxuRvkYjJAlZzV6oXVtZMzkUpVoT7uylHhAmSl87O08m21hGGdL
 1qiZMEFX2CfmF1rVSENbHP35Aa1Ks547nyqSQrbd3pcRXMVJA91jgFnaYuvihfFH
 z5rYUUV7hXCxS6VAMhGpAqd4S0bzM6uXJ9g+dIz8TGOqXq5lAMQ9Xv5tecUDL1+Q
 lyRO1IGP2YxVe3brNcC8vD8eGxT2zPdWsWUl21z/s0yGTab2RR9cR2xJHAg8LwBA
 ==
X-ME-Sender: <xms:-0UOYFKSCZ0WiMgNHtVp_sAUfwHv0MnGYIdK3v1xk87wxMdniTV3rA>
 <xme:-0UOYBIVF75za-d1gdUkeo7N3zKc157PPnFGmsGGbb0eSgwSYxOFV7-Vx_DUR7uaY
 -z4xkL2AOhlsredvA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvddvgdeilecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtffrrg
 htthgvrhhnpeehhfefkefgkeduveehffehieehudejfeejveejfedugfefuedtuedvhefh
 veeuffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 grnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:-0UOYNt8uqyEwDh4-2BVQJCQU_DccsE0IiTAYrSMjpRIDb1BY6tbTQ>
 <xmx:-0UOYGZXW2ADtpBwVI5e44eTcwxzRmSx1WrlJfU08CazK-sN6jfWsQ>
 <xmx:-0UOYMaetVmDD4wcDismNO9ltQdFAgdPuQ0h2tg4jucHX4o64AhzqQ>
 <xmx:-0UOYITdZoaB0Spq5mACc-0xNzWxWW8eibFea0K9l8_QB80G-Z6CmQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 330BAA0005D; Sun, 24 Jan 2021 23:15:55 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-78-g36b56e88ef-fm-20210120.001-g36b56e88
Mime-Version: 1.0
Message-Id: <a40f7391-e468-4155-b19c-240fb65ce22c@www.fastmail.com>
In-Reply-To: <20210114131622.8951-6-chiawei_wang@aspeedtech.com>
References: <20210114131622.8951-1-chiawei_wang@aspeedtech.com>
 <20210114131622.8951-6-chiawei_wang@aspeedtech.com>
Date: Mon, 25 Jan 2021 14:45:34 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Chia-Wei, Wang" <chiawei_wang@aspeedtech.com>,
 "Rob Herring" <robh+dt@kernel.org>, "Lee Jones" <lee.jones@linaro.org>,
 "Joel Stanley" <joel@jms.id.au>, "Linus Walleij" <linus.walleij@linaro.org>,
 "Corey Minyard" <minyard@acm.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
Subject: Re: [PATCH v5 5/5] soc: aspeed: Adapt to new LPC device tree layout
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
Cc: BMC-SW@aspeedtech.com, Cyril Bur <cyrilbur@gmail.com>,
 Haiyue Wang <haiyue.wang@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Thu, 14 Jan 2021, at 23:46, Chia-Wei, Wang wrote:
> Add check against LPC device v2 compatible string to
> ensure that the fixed device tree layout is adopted.
> The LPC register offsets are also fixed accordingly.
> 
> Signed-off-by: Chia-Wei, Wang <chiawei_wang@aspeedtech.com>
> ---
>  drivers/soc/aspeed/aspeed-lpc-ctrl.c  | 20 ++++++++++++++------
>  drivers/soc/aspeed/aspeed-lpc-snoop.c | 23 +++++++++++++++--------

Using a Witherspoon (AST2500) I've tested the aspeed-lpc-ctrl driver:

Tested-by: Andrew Jeffery <andrew@aj.id.au>
