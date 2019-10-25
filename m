Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 34E28E4150
	for <lists+openbmc@lfdr.de>; Fri, 25 Oct 2019 03:57:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46znLL4v7wzDqXP
	for <lists+openbmc@lfdr.de>; Fri, 25 Oct 2019 12:57:30 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.24;
 helo=wout1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="lOJFrYZ1"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="E/+prtiN"; dkim-atps=neutral
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46znKT6GzSzDqhR
 for <openbmc@lists.ozlabs.org>; Fri, 25 Oct 2019 12:56:45 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 596594DD;
 Thu, 24 Oct 2019 21:56:43 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Thu, 24 Oct 2019 21:56:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm1; bh=b6FGYC5jd4jLs71PmN4JCPoSVwwFPmm
 dGg4bVTkRnq8=; b=lOJFrYZ1Ntw+c6yuEtByWhQIDaIR9CwNUqAG2tr/8N6KW/l
 Beulb9wqsn6SONln3diIR5R4RoJmgbli7djPOGhWJ95uf4GLUEutUMGzMuaCm3FH
 0Qh+/30DK9Dtguk1xE5v33yUWAgPyw+G/CDWlLeOK+DIqpvPUpxOGZgAHUsXeqN8
 blesdbtS4p42+LzfgOysQqzmMQmI+zd1vd/+kSlqTTzALhtJaBHKCkjDbS4OW+J8
 Utw0AwIKyKymeTP3ofqwAtnpxi8EnSGNG3haG8j+xqFYcycY6qBUx500mbxxLzVw
 Lu885fbBaLdOY9HMqB/YChPU32BuAtnvi4cl49Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=b6FGYC
 5jd4jLs71PmN4JCPoSVwwFPmmdGg4bVTkRnq8=; b=E/+prtiN72N3ReTaa7sUxd
 XGIQB3FOKRBPkHDEZBZ6ksdPzym0anXI788ld5ZFhs8gDAyeKpP3KedMOgCKEpl3
 COJcqjHWaJ+dtSVCipu5DFTDjaJDxTJqk/ZzIwh31FrgODwiEn8rf08Y9j9NC3z4
 CDrx/kG7ejxqPAu79VUjSuQu714otuWtgab5pG35PrkwcFyfh5hiwzl3Uh8xvlHY
 K1/vhRou/FZQir6g35seqLXPgYWZlrIeuDvxVKAvkl9gNzxZY6bfgLxkVbNRkVRm
 YHi2ciVqMCI881l5EomBXMcWk5s7Qa9r5QnsFWb5lzxqVMoozi+dsNmaxJTaMxBA
 ==
X-ME-Sender: <xms:WlayXcGuaLaCvUsO-xMA3lU2ky-olj2vYgc2o49UVKta7KBf69oWQQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrledvgdehudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfrrghrrg
 hmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghr
 ufhiiigvpedt
X-ME-Proxy: <xmx:WlayXUVNhwU0cGaVFnH9Tmeuqay9Gv5hJHktTqpZ1GfdGNXmxgWY-A>
 <xmx:WlayXWTE_6QvL9RCnHFB0ChjRIora-buMnB845ZLED6yoRgFRL9gnA>
 <xmx:WlayXQdeFz7JbJMuQ15ER1MkF3RC3vS1npBcgEnpa2R25QtUl6fasA>
 <xmx:W1ayXcsZGZ7PTWlErR1BrPpRJsSXoj80ItRbkFOKFy_2H3T5ar9r6Q>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id D0C22E00A3; Thu, 24 Oct 2019 21:56:42 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-470-gedfae93-fmstable-20191021v4
Mime-Version: 1.0
Message-Id: <6a131a69-12c3-433d-a65c-003b8bec686e@www.fastmail.com>
In-Reply-To: <20191025010351.30298-4-joel@jms.id.au>
References: <20191025010351.30298-1-joel@jms.id.au>
 <20191025010351.30298-4-joel@jms.id.au>
Date: Fri, 25 Oct 2019 12:57:44 +1100
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Joel Stanley" <joel@jms.id.au>, "Jeremy Kerr" <jk@ozlabs.org>
Subject: Re: [PATCH linux dev-5.3 3/7] fsi: aspeed: Enable relative addressing
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
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
