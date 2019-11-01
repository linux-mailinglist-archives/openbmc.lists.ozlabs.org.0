Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A85CFEBC1C
	for <lists+openbmc@lfdr.de>; Fri,  1 Nov 2019 03:58:23 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4746MJ6TsZzF6G9
	for <lists+openbmc@lfdr.de>; Fri,  1 Nov 2019 13:58:20 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.27;
 helo=out3-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="PUM2QCWF"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="vxR3QxsG"; dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4746LQ1N7GzF5lb
 for <openbmc@lists.ozlabs.org>; Fri,  1 Nov 2019 13:57:33 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id DF26520F51;
 Thu, 31 Oct 2019 22:57:30 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Thu, 31 Oct 2019 22:57:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm1; bh=cTpY/Yjm8oO4brJWeMUCOskfX1fQV70
 PbQckN+1UOgY=; b=PUM2QCWFpc2P079Id9cUPAgXFvYL6QlR3b/76JcfPXr1lnW
 9RYJEYerYAa8A/yGyIcXBP02Ih3WnJIZIq5LeuP77l68MY5a5ZpilYSv5gHIzVFf
 olphcknJEpvwHqufYMqsiohT+MYZ95f7+nOPl/8+tuOjLxsOhuculp91v+xizZ+u
 sTS6LIIBcVkgDmCW8AIMWbZvsCCXWAF9Iudz+1bYQIw98fJXW4/fmko/hVnfJtmO
 o+OG/ZM1k8WpudAchnOEo5RKRpIEQIAtHU0250jS067oBZv60DZ3AQoRAJLpbSG2
 8Y5AipgMYxNPwOm4/fbQ1ihG+dss+0uZP9Kya+Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=cTpY/Y
 jm8oO4brJWeMUCOskfX1fQV70PbQckN+1UOgY=; b=vxR3QxsG6W8qIA3UW+ZLyl
 3FdICyYiD3X3BQXbexe4RGsdvVif3cHbq1GU8WlWb1WNnVYgc1fVd+OryS1BZO5S
 GgWbj7FIyVnwawoSLG8WOU46r1gGGyWxhq9WsJfZZwGAEzHCTW/tqoP3ud3//4he
 F2ZxVmnH9ymUlfe+jlZ+7P4wXeYcM7gBL1+L4oavp13SEMrix1+8QmBWechR95bk
 Ux3jpgBh+4Dpk3R/YcEE5H07vucwVVjPzHnkY5Ae3/EL4AaoBQdm+blMn5j/PQEc
 dnaRjCfzdMUsbqeyB6ZwOD54xrf/Zno17RTgObMHSx4kkqmGfVOZ7bB7NJ7ghgYA
 ==
X-ME-Sender: <xms:GZ-7XVG5MsV-eJyYWb3N45vrZn_z_VccpyXhHgwz_ud4n0pgaGAfng>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedruddtiedghedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecurfgrrh
 grmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgv
 rhfuihiivgeptd
X-ME-Proxy: <xmx:GZ-7XcBIIDH1LfeiXXjpdM1b_SItROWy3TzTwxffkWqOzMyNgfB8-w>
 <xmx:GZ-7XakqGno_5EVJExTL8zvTWYQG04QUsn0XKfkxF9noHLxqEyTEHA>
 <xmx:GZ-7Xa71srpcERTfLHYKriBQKF3kG_7M-dPXcJXF58VohlseV9j5QA>
 <xmx:Gp-7XZwiXdQLo34f8r8rQtsNdlSlp6T59HraIg--PueKIjQq_9uHhg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id DBC7AE00A3; Thu, 31 Oct 2019 22:57:29 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-509-ge3ec61c-fmstable-20191030v1
Mime-Version: 1.0
Message-Id: <5aaa8944-2c72-4d07-9686-8ab754a70067@www.fastmail.com>
In-Reply-To: <20191031053625.422-3-joel@jms.id.au>
References: <20191031053625.422-1-joel@jms.id.au>
 <20191031053625.422-3-joel@jms.id.au>
Date: Fri, 01 Nov 2019 13:28:36 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Joel Stanley" <joel@jms.id.au>, "Jeremy Kerr" <jk@ozlabs.org>
Subject: =?UTF-8?Q?Re:_[PATCH_linux_dev-5.3_v2_2/8]_fsi:_aspeed:_Implement_byte_a?=
 =?UTF-8?Q?nd_half_word_reads?=
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



On Thu, 31 Oct 2019, at 16:06, Joel Stanley wrote:
> A similar rationale to the writes, where we create helpers for each size
> to ensure the callee gets type checking and allows the lookup of the size
> to be done once, in aspeed_master_read.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
