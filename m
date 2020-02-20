Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EE84165360
	for <lists+openbmc@lfdr.de>; Thu, 20 Feb 2020 01:10:31 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48NFNN65ZLzDqP6
	for <lists+openbmc@lfdr.de>; Thu, 20 Feb 2020 11:10:28 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.28;
 helo=out4-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=QXgKhxc7; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=XwEaCuYx; 
 dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48NFL651rfzDqSC
 for <openbmc@lists.ozlabs.org>; Thu, 20 Feb 2020 11:08:30 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 0B24822017;
 Wed, 19 Feb 2020 19:08:26 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Wed, 19 Feb 2020 19:08:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm2; bh=9F2m5GLTYjPlxVoBdMxmyb4f0fiQ03Y
 XliYXpG7cvQA=; b=QXgKhxc70WO17amO+ci2kWB8gUtokVBnmA68zDedj9zy6D3
 2JOTxagAYj7JtwXKEIwu2ZyTct4ixkQwmSGJDO0Nd4xW7tRUK7HP9sB0YNAQBGEC
 VJkoatGfC9rLHSYdA615GDffpLYfWvnB9q+HTPMOTC/CwNiwm336h52IEmiUSZxO
 vX1Vqpq0t3lZZLcaEx9hl6y6izSlwZXPezkjUjjAZJ1cMJIwnrWF6+waNMor1L5i
 KVFm6m53v7Vq7jbBxxpbY/QAJc2/Faj1DOaScQUwBGXHpNMpjVOlCHf0/IaapksS
 etTnc+s2f5JExF+hBR6yOOvK+DIvEdLfIyXurfA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=9F2m5G
 LTYjPlxVoBdMxmyb4f0fiQ03YXliYXpG7cvQA=; b=XwEaCuYxcd3d8NInf/sKXI
 Z+wOtKYyC83ESQzuf8rjHgYmnD0QLCE2O2I4tM1TAE8TJG/P3FeTDSve0ArTmhF9
 mV6o2EPWfmuL3XO0epfL3SL4SYX0x/faDF6r25BIIvgnQMyUZPvp/xUwZk7bSYyl
 /MYcsSFs7lAYOzuo7uumkRwuwOuRaoZ8YtFh5aaC1wEV/Nab7/Q+r0V2R2uJrasV
 CfR4iJrRgwzm1QiXIUZ6QJqRYMu80Qs85ZSv9PgJXTzQTYGYUoRzIubWdgvMl+tS
 LKsZV1LB+9uShan8Y2ALgM3mTlGLe8JOns8pj5Wc4F33CAzjO8iuLrock8IsBYHw
 ==
X-ME-Sender: <xms:-M1NXkmxrzkvGrS9RkZdU-1Brh3urPk1ITwwpLNUxJ51AEcwC9ydng>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrkedugddulecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculddvfedmnecujfgurhepofgfggfkjghffffhvffutgesthdtredtreer
 tdenucfhrhhomhepfdetnhgurhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjh
 drihgurdgruheqnecuffhomhgrihhnpehophgvnhgsmhgtqdhprhhojhgvtghtrdighiii
 necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghnug
 hrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:-M1NXo2vh2wk9D0wcjGHXDNm-WjHxPTDwGfmcIafGA4UE55TiDGGvw>
 <xmx:-M1NXjg051Rw2-7bfORDgIVab3_9fC4sI_KbT1Eg3z-Fuzsyvl8PCg>
 <xmx:-M1NXmXPuWf29g7tDwUaRw6JFJ_Bj4Efi4CErSiutPJpd3mWObJ6SQ>
 <xmx:-s1NXgt8YFNChQK6QOWjb_2o2N2aXV5ulYPxg1W6uYaVzFhs0jhuxA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 1B418E00B2; Wed, 19 Feb 2020 19:08:24 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-802-g7a41c81-fmstable-20200203v1
Mime-Version: 1.0
Message-Id: <f136d4ad-65e6-4e74-8f53-2ca3edaf9288@www.fastmail.com>
In-Reply-To: <SG2PR04MB3029CF9F520DF543B57B93C2FD100@SG2PR04MB3029.apcprd04.prod.outlook.com>
References: <SG2PR04MB3029CF9F520DF543B57B93C2FD100@SG2PR04MB3029.apcprd04.prod.outlook.com>
Date: Thu, 20 Feb 2020 10:38:16 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Kumar Thangavel" <thangavel.k@hcl.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: obmc-console design for multi host support
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
Cc: "Velumani T-ERS,HCLTech" <velumanit@hcl.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Kumar,

On Wed, 19 Feb 2020, at 18:24, Kumar Thangavel wrote:
>  
> Hi All,
> 
> 
>  Obmc-console application current design may not support multi host or 
> multiple console. So, we proposed the design to handle multi 
> host/multiple console in obmc-console client and server applications. 

Thanks for writing a proposal.

> 
>  Please find the attached design document. 
> 
> 
>  Could you please review and provide your comments on this. 

Interesting timing, because I've actually just solved this problem. Please
review this series in Gerrit:

https://gerrit.openbmc-project.xyz/q/topic:%22concurrent-servers%22+(status:open%20OR%20status:merged)

Regarding the proposal, I have a few thoughts:

1. Please try to keep it to plain-text
2. If you have code it's best to post it straight away (rather than lead with
a proposal and no code)

On point 1, this is an open-source community and sending documents in
formats like docx might mean that some people can't access them. Plain-
text always works, especially as emails are generally composed that way,
which means you can put your proposal directly in an email and people
can respond to it with ease.

On point 2, it seems that you've included screenshots of code changes
that you have made locally - a few sub-points there:

a. Code is text - you can include snippets of it in your document directly,
which removes the need for rich media formats, which removes the need
for something like docx.

b. If you've got code, push it to github or gerrit and we can look at it
directly!

On point b, given that this proposal largely deals with implementation
details, it's much more effective if you lead with code and then drive a
discussion on the list if necessary. At least this way we have something
concrete to point at and argue about, or in the happy case we can just
merge it and you've avoided the effort of driving redundant discussion.

Finally, these thoughts are about helping you help us help you to get
your code merged with the least amount of effort/friction. Hopefully
they are useful to you :)

Cheers,

Andrew
