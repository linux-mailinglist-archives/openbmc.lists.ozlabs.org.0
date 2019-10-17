Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 709DCDA2C2
	for <lists+openbmc@lfdr.de>; Thu, 17 Oct 2019 02:39:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46tr080GPvzDr4t
	for <lists+openbmc@lfdr.de>; Thu, 17 Oct 2019 11:39:36 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.25;
 helo=out1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="WVOhYKJD"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="J7zfdYIo"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46tqyq2dydzDr6w
 for <openbmc@lists.ozlabs.org>; Thu, 17 Oct 2019 11:38:27 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id DAF7822063;
 Wed, 16 Oct 2019 20:38:24 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Wed, 16 Oct 2019 20:38:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm1; bh=55v4uMUppMnzOREpKEJO2tc2C8l7yah
 TgKMzXiGmQTw=; b=WVOhYKJDyxEBsXFjTObKddxlibXHpiratioiJBJi8DUD9YS
 PdYtanddRUk7XMJCeVdgS5/YRC7C7OF/YXrGCxWfVz3AqVI9qkJtLmrxCwYd8HLh
 VvYwwuYTGJ9xF7AnoforyUJciyHiiqAGfwdHRBxI6lRdjQancGqkvMsLdRGTpDPC
 5P7YHFF6as5AKXJt8b0SEnBmnQ/DUOSX4N6tjT1JYoR+4cAAmshLPAMlUO65vuwG
 mLBthAftDrpjlkRm5mUu70DwagsVYFki0lDkwun8lFWNq1pQWxi+jNZmkAJliCQF
 IC1ddlhZ0dkCL7zFoFOV8FCWQrzp82ZFjoACE5Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=55v4uM
 UppMnzOREpKEJO2tc2C8l7yahTgKMzXiGmQTw=; b=J7zfdYIo2B9P2fCSElDdKS
 mtZiiDBRCTTYSdGKRHdTd6hWpP/2X0D2TCvn4MFsyzEFc9gd20RE64YDPIErRmEV
 LHpcixze1IobaKe0fJnQN/8vhUTpZzYvOnpX20XteChRTMmAkHsTql3rv3jdBrv9
 IVv0GIFZLNwfFBcbzvZquH+Pax0fxRK+6mOPDZa8ThV6VhjOvctWNofibEDGqEtH
 1umINeMGiEj+2o1MBcgfV6Fqrdppxhzr/UeF7cEw2tmV78mk82wU/O6Rc0vPC6Qm
 IIstQcRHNJbnTKft0SdVWhI6b5TVmq4TXAZEBHeDA3VtwV+Rc7s/M2e9y7rPI09Q
 ==
X-ME-Sender: <xms:ALinXf091H54iZmPFjLGjmEquP3HODnysacfaFNAk92Tlpk9l2hnww>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrjeeigdefgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfrrghrrg
 hmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghr
 ufhiiigvpedt
X-ME-Proxy: <xmx:ALinXfnOEv3CUeq1SEXAgnVUOPwY_6fmRvWFItzfN31EASjUX1IeTA>
 <xmx:ALinXYhkmhes8h4w4ea-Wrbhe8M5hy8Y-NwvYtqvqqKuMJCkkj4hAw>
 <xmx:ALinXW0QyKVKmODaSHGVjvkWC7OLkr1Y_aYJ1cYlxrts4jZCirhNow>
 <xmx:ALinXcdMaFWu-hUrYv5lxO2Td67dKcgFYyuHPT_UUS1fTrHSVOk5tg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id ABA19E00A5; Wed, 16 Oct 2019 20:38:24 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-360-g7dda896-fmstable-20191004v2
Mime-Version: 1.0
Message-Id: <eb0f7a47-c53c-484d-909d-ee8a8031d685@www.fastmail.com>
In-Reply-To: <20191017002955.2925-4-joel@jms.id.au>
References: <20191017002955.2925-1-joel@jms.id.au>
 <20191017002955.2925-4-joel@jms.id.au>
Date: Thu, 17 Oct 2019 11:09:21 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Joel Stanley" <joel@jms.id.au>, openbmc@lists.ozlabs.org
Subject: Re: [PATCH linux dev-5.3 v2 3/3] fsi: aspeed: Disable IPOLL
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



On Thu, 17 Oct 2019, at 10:59, Joel Stanley wrote:
> Having IPOLL enabled when turning on the host causes FSI to stop
> working.
> 
> In the future we will need to add a mechansim for the BMC to enable
> IPOLL once it is ready.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Acked-by: Andrew Jeffery <andrew@aj.id.au>
