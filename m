Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 84640C954C
	for <lists+openbmc@lfdr.de>; Thu,  3 Oct 2019 02:01:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46kCq23hF5zDqXB
	for <lists+openbmc@lfdr.de>; Thu,  3 Oct 2019 10:01:50 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=64.147.123.21; helo=wout5-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="j/H4blwW"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="nnaHcTj0"; dkim-atps=neutral
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46kCpH6g1kzDqBP
 for <openbmc@lists.ozlabs.org>; Thu,  3 Oct 2019 10:01:11 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 3025625B;
 Wed,  2 Oct 2019 20:01:07 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Wed, 02 Oct 2019 20:01:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm3; bh=wiSOtn4X8E2DyNrqKtmFg5nJ1kvUMUC
 YeQBKwXnIako=; b=j/H4blwWkWOf66QyXfRE/toT/txCXXNKh8J+Rx+SLER0AcN
 lkWRdVbfQ40njitPEx6ne2lVSB52u01mn9oIxrvgREFfapJiHd9D32lWaILeW1DI
 1T4hGde6v3zRiGyp0GThCgfgbk7308HWagIcAiVcJvWLW1rdmeikUcsTaEfVCpUW
 KnJHUeXu8TACPJpwHGCWlhq/5iHcD5Y4K8Ezf/koM4fySTluuMgo/YJUKDNQTY1i
 nFHBjPFZ8FtptG/pUUiuffTvuTYai3NwGOPOz3f4cIcEIds7F3hNIrE1GEmlXCjl
 ibM8kSqDkdElSgRYCrxC6/5Xdsq07gqaIR4F9rw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=wiSOtn
 4X8E2DyNrqKtmFg5nJ1kvUMUCYeQBKwXnIako=; b=nnaHcTj0AKhW/gqdtUwgKH
 wAi/Nta4hPVyh9eBRoeTaj1S/0+MWdlp8Jgt0udoLuKeSzAxAfjkmaoIskyine/U
 jJnClAFRJufAnqqAlyS8VnHLXQFS6Supy089EMEnWnoxwUdMkDIRzRIDPuCDWqhk
 mOmiJBeF3ADL0iLGq1xJhn1LqHpJHFc/wKl6GwQVEFX2j7gYhE+r/pwxxm9XhZc0
 aeKdpozY//UdzzpkbmzuXyEH7jgngZPVGH7wveY4oefkkJxSv9W8AmqkBE3mZwcc
 9+kqP+WH8WFw3Id6Q0zDbtpcbrWdy1dEDVZCc+L/vomh7gqpT1NVyKJH7gA7O7Jg
 ==
X-ME-Sender: <xms:QTqVXSizE-6QORF2_lxbj4hD9NKY9mROPLrLAbY8xPfQ0YvkRurAHw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrgeejgddvkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderreejnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfrrghrrg
 hmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghr
 ufhiiigvpedt
X-ME-Proxy: <xmx:QTqVXXQtXot_89PhK85q54pDtbooLxxOF_k-fU4k8Cgvgu2YIxwo6A>
 <xmx:QTqVXVF_ijSBIY6MvTc_P7QdU1Oh5iY4L4FvOIZLrU09wI6GfV_Fwg>
 <xmx:QTqVXfkEBnlbo6jjNTClJVMOJST4AzkgBhcX7auxiG_dQi99OipJCw>
 <xmx:QjqVXSzqSgguNK5g39OozeZoGUxr2Pgc3rWTz_ZUOeF3YpRhHMid2g>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 783A6E00A5; Wed,  2 Oct 2019 20:01:05 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-359-g64bf1af-fmstable-20191002v2
Mime-Version: 1.0
Message-Id: <0e45e7d3-98b1-4653-b2e2-57b87aaec30f@www.fastmail.com>
In-Reply-To: <20191002102328.5196-4-joel@jms.id.au>
References: <20191002102328.5196-1-joel@jms.id.au>
 <20191002102328.5196-4-joel@jms.id.au>
Date: Thu, 03 Oct 2019 09:31:54 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Joel Stanley" <joel@jms.id.au>, openbmc@lists.ozlabs.org
Subject: =?UTF-8?Q?Re:_[PATCH_linux_dev-5.3_3/4]_ARM:_dts:_tacoma:_Remove_incorre?=
 =?UTF-8?Q?ct_i2c_buses?=
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
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>,
 Eddie James <eajames@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Wed, 2 Oct 2019, at 19:53, Joel Stanley wrote:
> When adding the Tacoma system a number of I2C buses were enabled that
> according to the schematics are either tied to ground (i2c8, i2c6) or
> used as GPIOs (i2c14, i2c15).
> 
> Fixes: 4fde000c9b28 ("ARM: dts: aspeed: tacoma: Enable I2C busses")
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
