Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8201FE4152
	for <lists+openbmc@lfdr.de>; Fri, 25 Oct 2019 03:59:39 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46znNm2bS9zDqgF
	for <lists+openbmc@lfdr.de>; Fri, 25 Oct 2019 12:59:36 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.24;
 helo=wout1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="Xi5v5+ZD"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="jsVrdcWD"; dkim-atps=neutral
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46znMD5mFVzDqXY
 for <openbmc@lists.ozlabs.org>; Fri, 25 Oct 2019 12:58:16 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id BCBE6497;
 Thu, 24 Oct 2019 21:58:13 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Thu, 24 Oct 2019 21:58:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm1; bh=loLSE212rkDAru8S6L8mzX2a1RSIXiS
 KyAP/mycwfco=; b=Xi5v5+ZDlUSPWmv/2KNgUWhfevjjRxbUTYTptSZ5Sb7qcAD
 XoeGqhp/V0Mk+Niay8gQDi6TBU9dOGG5KzDEXe8NHKvnMqcnrxsjNXKy6p0D3LZ0
 aIOSXgNhcVnlUedZjFosw9+IBlkU91/Ns3qRlKe9tqbEQzknyaigZIFzxZMp2Jre
 v3XtA38FzCecWyJExs0K6KlV9r9JqBpdEllFWlE+1ytRUv0mS8Jcx3hfyumGP5Da
 xTAqctzD7Av7GhxH5NjBAnYpyZ8XOk9hJ+WQBqGSewKQ5yh7Eune3OeVip1mC4lq
 M8h9VbPSd/FstNcUuplLGAfzLoJG38GHi4AqM0Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=loLSE2
 12rkDAru8S6L8mzX2a1RSIXiSKyAP/mycwfco=; b=jsVrdcWDeS/sDUAcJCRdzl
 LJIOUubrdNhkq+5e0thDfXbw5znioVrGxr2E5eGBjUEvmxFkmOl2ZdWyx5nCMlZ2
 Nfls7F4RaD0HqnTNHBXVxKAzVtNIKN8wSOShaSn5+0bnYr/sVXJ0b7K0ZaOxkOzG
 G3sMPc3Q4CwgG2yg6UqXjvc+L3IdPKa0PtvHSwzum5gwNHmkK6QKPSSWYzjaQZpu
 4t/4qlUH0WhCmUhBFNl3DsyfyILb/yTiDf9j796/DG2ihRpK0UYLG+hgut25HoOq
 rsBMW3KkCx8c4sc98WNZ3EwMtgu3QF7CK1q4VpyyTc25TzjjbYDbO6PTDfdUVDVg
 ==
X-ME-Sender: <xms:tVayXTZv8vWfDx40nDkcxiSjvqaJCaGJiBguPVQ78WWL0aFElU74cg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrledvgdehudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfrrghrrg
 hmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghr
 ufhiiigvpedu
X-ME-Proxy: <xmx:tVayXUf6zwOPLXTBHCS8f3HrOM3r8NYVnI2c85kecT5aLXhioe22Zg>
 <xmx:tVayXWcPf5Adu3NlgjObtfF2oqiMQF7JErbRc2vGLrzU0iXRZPVBGw>
 <xmx:tVayXebLEq0Uc_GY5ghW62IQjMShkNkt1SKKsH8dy7oEwX2Cv9nK_g>
 <xmx:tVayXdC37iuutZiA3NIpLvXRePrNpjEz1lr0SenkG0oRHk6MfD_8Tw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 31E3BE00A3; Thu, 24 Oct 2019 21:58:13 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-470-gedfae93-fmstable-20191021v4
Mime-Version: 1.0
Message-Id: <58568046-a0f5-4522-89fc-4137bbb282d6@www.fastmail.com>
In-Reply-To: <20191025010351.30298-5-joel@jms.id.au>
References: <20191025010351.30298-1-joel@jms.id.au>
 <20191025010351.30298-5-joel@jms.id.au>
Date: Fri, 25 Oct 2019 12:59:14 +1100
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Joel Stanley" <joel@jms.id.au>, "Jeremy Kerr" <jk@ozlabs.org>
Subject: Re: [PATCH linux dev-5.3 4/7] fsi: aspeed: Only select OPB0 once
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Fri, 25 Oct 2019, at 12:03, Joel Stanley wrote:
> The driver can leve

s/leve/leave/

> OPB0 selected to save a AHB write per OPB operation.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
