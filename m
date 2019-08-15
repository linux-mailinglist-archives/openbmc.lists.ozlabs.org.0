Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 649378F7C6
	for <lists+openbmc@lfdr.de>; Fri, 16 Aug 2019 01:59:12 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 468k254fZlzDrDZ
	for <lists+openbmc@lfdr.de>; Fri, 16 Aug 2019 09:59:09 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=64.147.123.21; helo=wout5-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="YfCk/bcP"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="x/tl+DyE"; dkim-atps=neutral
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 468k1S0J5DzDrC7
 for <openbmc@lists.ozlabs.org>; Fri, 16 Aug 2019 09:58:35 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 751835A8;
 Thu, 15 Aug 2019 19:58:31 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Thu, 15 Aug 2019 19:58:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type; s=fm3; bh=Zria5DLoGwTW6nuCHc+UOsD2NIBsYsn
 +eDt+Mb+Mm60=; b=YfCk/bcPqh123Njk3oXzI+Rn7K+fLWeYkDii+0QyGZOMgQE
 MQFGd9SegB2XvsArzIhoqiHUGB1hJeUdjUCMr5IosilhPe8GlrCkJl1IUzWyMeMf
 5YFn49QQikVhwD2CJA5KzSRPIH+H83/XZ6PEbyzFsvbYY3I1XRcmZRnZOOpe1x/H
 K3Us08H5VdpjJwqJx6IsTmaOT4wE+fG1GDFPd2lGWqjcYH8P+jcHSIhmDqj+lo17
 yHoMg/Auj77g3GVCOZ1KHe7JD7SQ4o3eLlZFIRnBWU7HUM8al3I6vOF3Wpq6aw+S
 Kwc+fVDCY4aA/b/GUDwVy+X930V1QDH5C/QKaow==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=Zria5D
 LoGwTW6nuCHc+UOsD2NIBsYsn+eDt+Mb+Mm60=; b=x/tl+DyEWORzyEffsjghE8
 Kd4rS+1PXr4ey/dQikpA4MtAfMOoMmah2k3NpqME2S5wzaG170d6HfDDkazwEd0M
 7aWYkA1aZIJ1NvLCnx3fiwPmYVvU2Xl/qMH3aiW4HbIVyF4E3T10fZhXynGyueAK
 1wN2xrmmVDcve0xmWEY437VXJuH4vuoKI2sp/KNOZ83f3AY6v3jOksM0CLQ6K0lv
 F6Tl7cLgdZQXhmT5bcPwuatNAxKO7GaO+rMjKQS9aSmOXxrVDlzlrqUrws4Xc/MX
 +HQzcWOedqe98pClch1HbbWCs1BHOc9IK4bgQxbNe8I0hmhSryx4LvnZc1uu6dng
 ==
X-ME-Sender: <xms:pvFVXVUKQhs8cYpxJtkVEY7tzo2n2miADHYvCrMwwMrbEn1vb1ieHg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrudefvddgfedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecurfgrrh
 grmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgv
 rhfuihiivgeptd
X-ME-Proxy: <xmx:pvFVXcc_JJdBALqpBfJXu2QlytdA5FN9pYHDl6MpjfZWDyabqxHaGg>
 <xmx:pvFVXeVywVNMdRdBGei07B-8t79PutlT4LXyG84wQXX1jQLisjZe1Q>
 <xmx:pvFVXVezhmWNWKUioLvseQ5Gty-Q_FW0sxwoKKaClCdfvlXpKBlcZA>
 <xmx:p_FVXdeyb6kFeHicYkPzrugCl_IwKeHYrQ6ar8jnMPAWGp3AVe3L5g>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 776B3E00A3; Thu, 15 Aug 2019 19:58:30 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-869-g2d94aad-fmstable-20190814v1
Mime-Version: 1.0
Message-Id: <9ad991fb-13fe-42fa-b5b6-48fd069342f9@www.fastmail.com>
In-Reply-To: <CALLMt=pv9GdHmv7ZJOBK+Z1wqAh4DmOzVR8ud=+KefddvEkreg@mail.gmail.com>
References: <CALLMt=pv9GdHmv7ZJOBK+Z1wqAh4DmOzVR8ud=+KefddvEkreg@mail.gmail.com>
Date: Fri, 16 Aug 2019 09:29:01 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Andrew Geissler" <geissonator@gmail.com>,
 "OpenBMC Maillist" <openbmc@lists.ozlabs.org>
Subject: Re: where to store application json
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



On Fri, 16 Aug 2019, at 07:01, Andrew Geissler wrote:
> As we start moving more and more of our applications to using runtime parsed
> json files, it seems like a good time to come up with a standard location to put
> the json files. I think a requirement is they be in a writeable filesystem
> (although that may bring security concerns) so that you can edit and restart
> services that use them on the fly for bringup and debug.
> 
> /etc seems like the right spot. But if so, where in /etc?
> 
> Adriana pointed me to the FSH guidelines[1] in a review which has the following:
> "It is recommended that files be stored in subdirectories of /etc rather than
> directly in /etc.".
> 
> /etc/opt ?
> /etc/opt/phosphor/ ?
> /etc/opt/phosphor/<repository name>/ ?

Where did the "/opt/" bit come from? Please lets drop that.

IMO we should be using /etc/<application name>. Be mindful that one repository
can produce multiple applications, but what application sits in which repository
is a code organisation problem and not something that we should tie into system
configuration.

Andrew
