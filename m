Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D020F2FCA4C
	for <lists+openbmc@lfdr.de>; Wed, 20 Jan 2021 06:10:53 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DLDBL54mwzDqgw
	for <lists+openbmc@lfdr.de>; Wed, 20 Jan 2021 16:10:50 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.221;
 helo=new1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm1 header.b=Z+YsHN+l; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=UXcpzjfM; 
 dkim-atps=neutral
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DLD5454yhzDqlc;
 Wed, 20 Jan 2021 16:06:16 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id ABF8058067B;
 Tue, 19 Jan 2021 23:58:04 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Tue, 19 Jan 2021 23:58:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm1; bh=zqxskKjO+mY+Ddee8kVlG2biEnA/OUy
 hgfrM0eiY4eg=; b=Z+YsHN+livVf3VNh5k6sb+JxqvmscNFvJWesF9jDfDQcrXM
 LMxnBT1j0IJwXKiE/axt2B8oVV1qXmeR0v2hvCUCckyKi92Nla3PVPW+FXN5gYuy
 Owlg000UJ+LPETYXpFpPhTHl2u9hH3NcBUOhCAibB5lBYXrGGmgZTGCfDCKZfCr3
 HTAeR7C1wo5Z4QsxaIdIkg7JnXQhs5A5ttIHlSyggdHEm6ZmCORQO4+Jr2/w7/lS
 ooYdL5Z4I3RjitycN/eq9bJveBrql/PgdAgO8+JrKZdg0oBUazkgepSNGhRxsdri
 liSJpUKxIbRQ7Cpq6dyW9/mobW/0DWNn9sOiVSg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=zqxskK
 jO+mY+Ddee8kVlG2biEnA/OUyhgfrM0eiY4eg=; b=UXcpzjfM48bwrTh9ydDK/S
 glxCoExz4ly0RBb2F9xc60l5xjOPsVfzAwoqpOyMQ1Ff7WVUZpunswDclPaS7YPX
 Zgaf5zQDaqVDd+76UIEXAD5C4e8O/w4NVDb7OWlH5cmyRUx7H8DcTKM5e+Fg4d7D
 I3SNFfu4b8ZjU32sH0IA3qxg37G1Bj2aujSptozRA6PxlIIoRc7TVZMdcmeo4Je0
 UJaxzUFhOnrjuzP3uW6qDTL2oxwG2WtrHRtuC0K7zh42Fmw0uWlKbKGSv27qCikN
 adJriUPZTYU9fZq/FkyWpPpladeapo1L4o5LVNQ2OmmhUXX9A0kacCS2nyrD2NNA
 ==
X-ME-Sender: <xms:W7gHYIuN7LPIyMQKcsy8wl0gn005hzJ8AEfwyj6ZiEPTgL8f65lO0Q>
 <xme:W7gHYFdC_XD1iDWyH4dVx8fC2Nt2zztWa4a2ZWhubf61U49KBHoIXRcgIPTaCTY7e
 7z99rDBbxE_n1265w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledruddugdejkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtffrrg
 htthgvrhhnpeehhfefkefgkeduveehffehieehudejfeejveejfedugfefuedtuedvhefh
 veeuffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 grnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:W7gHYDzBAzdFe0I8qELw4p2bAbvNdxW6ses5zOt0tx2ub31uHYJGAw>
 <xmx:W7gHYLOaaDz-hR4CvP_hGAj2U-zLRmKTmdaRzYonZ4qyjYruBLDFuA>
 <xmx:W7gHYI90zsb-5IgQ5Bo411kfnLSF7lGpkTmEoKpFNswyzFVxCmtQDQ>
 <xmx:XLgHYDWl-fEhDPNG2JD9ooO66x_3HDsgj7F-0qjD1y4VPr5wjhsUqg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 74766A0005D; Tue, 19 Jan 2021 23:58:03 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-78-g36b56e88ef-fm-20210120.001-g36b56e88
Mime-Version: 1.0
Message-Id: <096ac290-3c85-4b08-8741-6efc77745bc4@www.fastmail.com>
In-Reply-To: <20210114131622.8951-2-chiawei_wang@aspeedtech.com>
References: <20210114131622.8951-1-chiawei_wang@aspeedtech.com>
 <20210114131622.8951-2-chiawei_wang@aspeedtech.com>
Date: Wed, 20 Jan 2021 15:27:43 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Chia-Wei, Wang" <chiawei_wang@aspeedtech.com>,
 "Rob Herring" <robh+dt@kernel.org>, "Lee Jones" <lee.jones@linaro.org>,
 "Joel Stanley" <joel@jms.id.au>, "Linus Walleij" <linus.walleij@linaro.org>,
 "Corey Minyard" <minyard@acm.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
Subject: Re: [PATCH v5 1/5] dt-bindings: aspeed-lpc: Remove LPC partitioning
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
> The LPC controller has no concept of the BMC and the Host partitions.
> This patch fixes the documentation by removing the description on LPC
> partitions. The register offsets illustrated in the DTS node examples
> are also fixed to adapt to the LPC DTS change.
> 
> Signed-off-by: Chia-Wei, Wang <chiawei_wang@aspeedtech.com>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
