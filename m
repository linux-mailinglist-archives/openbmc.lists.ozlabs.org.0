Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E08A2D6C77
	for <lists+openbmc@lfdr.de>; Tue, 15 Oct 2019 02:32:12 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46sbwV11Q5zDqT7
	for <lists+openbmc@lfdr.de>; Tue, 15 Oct 2019 11:32:10 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=64.147.123.19; helo=wout3-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="T8KuPq7d"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="jc4ltFE5"; dkim-atps=neutral
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46sbrw5VDxzDqCs
 for <openbmc@lists.ozlabs.org>; Tue, 15 Oct 2019 11:29:04 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 28006576;
 Mon, 14 Oct 2019 20:29:02 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Mon, 14 Oct 2019 20:29:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm1; bh=TaFB39spxFKqMYLPZueC8vSQjL1fFvP
 Yql1jfskwpiA=; b=T8KuPq7d09a+R5aJfq8xWrQY+HAUnIZZuUwjhUGsIR251Mn
 BdN6KHugAw1XRV9dCxMAe0VPBKJpAsCoZ6UipHxOm4nr42+CfnKpir/EPKPYCSts
 mOdmwzxvCBhRmf8LqYKljbER6DBQnwYXbRcWvZ+RPFcYgXXXXBnPt2/dlQ0OAgxM
 QpegugvOIWldm4pDWKxgkyaFKjcAZw7AQKa39N/86G08nDxQYuihdgqByZqteFCb
 +k4+nzxZV4bEMR/JmeY91u5SAC0LTCqr69k9SgXYPR72KGVhqbCgNqlAYVW5/ezh
 RzyJuncuCecHCOrmVCwaTleSxoLrltzDjMePjjw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=TaFB39
 spxFKqMYLPZueC8vSQjL1fFvPYql1jfskwpiA=; b=jc4ltFE5H+zFGDKc5wGshG
 B+P3zm0xyH9lIcdwqO0N/mtpmN38lVscfRnJMj/R7+dEh7HFXaiWUw1uR2N4g3Zm
 MZU6Zr6zC8JzbGRTJ/xKYfO3Bp1CYvVC79qVDQYVZWAg9PmIuo+7Xjxtnacs/a39
 kLXAvbvpxkhPoIzq2rBCTZoCMDPcqAkSekWCpzJtH5kR94i2rOc+ckSAZ/b8O/4P
 SQHEC5hv7mnpVisQ8L9nJxaBh5VoqhqqYPRIVw10eDgZj12hyjG3iUb0BU1bWKrn
 SHOIxmu9RIesToC4gvGbDMzSnxcUTDPXHpxA6UsNzrTYDBS8/WhPJxsUObT0pz8w
 ==
X-ME-Sender: <xms:zBKlXWsL5cVc1MtvP7ei7uYg7YjqkDX1oaZwQ5gQ5Kn_wA1ArwhkiQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrjedvgdeffecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderreejnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfrrghrrg
 hmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghr
 ufhiiigvpedt
X-ME-Proxy: <xmx:zBKlXVijNQIOjauTUCufBYCMAxDEGqL8rGK4BofD6DG5HNSiXIsFiw>
 <xmx:zBKlXUr1NFcd7nIVxbjU3aN650xFWNxiJcU_HWxE_yLTTOo4DXsHbQ>
 <xmx:zBKlXZLXictS3QJhWABVzqipxrRSXDI9exvZPBivGq5SJJu-VzETSw>
 <xmx:zRKlXcGwQ9V9-m1JpeiwObDKOfhPm5d35FuSXRFYwP27Ru2UyMd5jg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 07B4BE00BB; Mon, 14 Oct 2019 20:29:00 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-360-g7dda896-fmstable-20191004v2
Mime-Version: 1.0
Message-Id: <8f6bc1c4-b10b-4e1b-9cc8-36dc913551dc@www.fastmail.com>
In-Reply-To: <20191014074618.15506-3-joel@jms.id.au>
References: <20191014074618.15506-1-joel@jms.id.au>
 <20191014074618.15506-3-joel@jms.id.au>
Date: Tue, 15 Oct 2019 10:59:36 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Joel Stanley" <joel@jms.id.au>, openbmc@lists.ozlabs.org
Subject: =?UTF-8?Q?Re:_[PATCH_linux_dev-5.3_2/2]_ARM:_dts:_aspeed:_tacoma:_Add_FS?=
 =?UTF-8?Q?I_mux_and_enable_GPIOs?=
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
Cc: Eddie James <eajames@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Mon, 14 Oct 2019, at 18:16, Joel Stanley wrote:
> On Tacoma the enable and mux GPIOs allow the BMC to enable FSI and
> control if the clock and data should come from the BMC, or from the
> debug connector.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
