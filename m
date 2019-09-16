Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4674FB32D4
	for <lists+openbmc@lfdr.de>; Mon, 16 Sep 2019 02:56:28 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Wnqs4TJtzF4s0
	for <lists+openbmc@lfdr.de>; Mon, 16 Sep 2019 10:56:25 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="lJhibjDY"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="KggnkOKp"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46WnqD5YnZzF1Gj
 for <openbmc@lists.ozlabs.org>; Mon, 16 Sep 2019 10:55:52 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 3D59921FC6;
 Sun, 15 Sep 2019 20:55:50 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Sun, 15 Sep 2019 20:55:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type; s=fm3; bh=iKFd/dnBsy+soIdMQuDJMq9kj/VsGAN
 Q9p5qDA+p4OA=; b=lJhibjDY4t+TNi2nzaqoizHiFNdtDIJcN/5VCSGhAg+axE2
 N7md7jnqxbeFRQsMnPTKaDzPRD050V/jbndxvCbYy3qyWTeYFeZDRv/csSi2gv2r
 bf12TEcA1bBVYeDUd1Ry2k7fdOSRJr+oi+Xvr/yh2z66m0Nqpl+TDXhRfoTuTFTk
 2A8JSCQr97T5TbpftYOOPzh+fK+fTkjFRrmZOjykvNGY314UhLRe38TiaMI8iZ3n
 DG9dP/Sx+edwU/oklFuURra7U8l4CXZyympJsxglEJ1irGV23hN5dx0yUSGFJ8j/
 Yptcdx+HsjjLlGnMArYPxBc5a7pcZE38oCyVmPw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=iKFd/d
 nBsy+soIdMQuDJMq9kj/VsGANQ9p5qDA+p4OA=; b=KggnkOKpABk553infsDlbQ
 H3Yn9wW1Qz7wlQ2mtIeqMAR+RCcK2E3bh1Ou1Kx3jsD9P8FShjHSOwPRiOcFCoIm
 f1o5KLubNH4X1qmkD6Wdf294ZEgbjcdxqtbIIFWp5cSwpj8gJadF1YpSjFY6IgWP
 6Yp4Xh58GAMsMUpq/mbkbMnoYYncJeuJn5Soui0pT3HgoNF+LEaX723Rzl5eR25I
 wr0N6Y0XYUUslxYTJWEHkM0EzJul6H5XFv8WL8GbZ2reYtDh8HOleIN4mQIHnetQ
 CMmB6qi/tTB8RN/Wx/IfBByXVQAncRM4zMOq4E8cmZQK+ylLg5hhBF/CiMEfUF5g
 ==
X-ME-Sender: <xms:ld1-XZ_itp9ElIQPKcjGG66tjfWEGf-KZrwx_eJOF8vdyVcVuj7SoQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedruddvgdegtdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfrrghrrg
 hmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghr
 ufhiiigvpedt
X-ME-Proxy: <xmx:ld1-XVliuDe7SRcvQgwgDnvRTcUDSsRUrjw6uVwsvJQt7rOLam9pYA>
 <xmx:ld1-XWY1ne32o1913_RFhqOSHKtoEWeTCyNOBGezh1kio5sFjeLA1Q>
 <xmx:ld1-XVPoQiwbGBTA-GTseZ8f6JbdGfHJteQQZmvGzZexQqY9Zp0EiQ>
 <xmx:lt1-XYlED54cVHdxrobHIXOWCRGd-qtgYwt0LJIEYT9Xc_HuG23_Bw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id C1754E00A9; Sun, 15 Sep 2019 20:55:49 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-237-gf35468d-fmstable-20190912v1
Mime-Version: 1.0
Message-Id: <3403737d-c75d-4893-9abc-1b03c3f3c947@www.fastmail.com>
In-Reply-To: <FB97DABE-E6EC-41CF-8628-C2AD45029CED@fb.com>
References: <mailman.578.1568408052.9379.openbmc@lists.ozlabs.org>
 <FB97DABE-E6EC-41CF-8628-C2AD45029CED@fb.com>
Date: Mon, 16 Sep 2019 10:25:46 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Wilfred Smith" <wilfredsmith@fb.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: Rant regarding code review issues
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

Hi Wilfred,

On Sat, 14 Sep 2019, at 08:46, Wilfred Smith wrote:
> Please, everyone, again my sincere apologies for upsetting anyone. I 
> was frustrated and sought commiseration.

An immediate problem I have with your approach is that you're ranting at
the people that you're seeking commiseration from. I don't understand
how you expect that to work unless you're trying to exploit cracks in the
community.

> 
> I will endeavor to push content that addresses my concerns; hopefully 
> that will serve the community better.

That would be appreciated. Please be aware that the outcome *may*
be along the lines of "thanks for your concern, however we can't
support your proposal for reasons X, Y and Z". There may be paths to
resolve X, Y and Z, and if so, please try to work constructively with the
people that raise them.

> 
> I do welcome these comments and will take them to heart. This is my 
> first venture into open source IP. I think your patience will 
> eventually be a worthwhile investment.

People come and go in open-source communities with many timings and
for many reasons. There's no stability in an open source community beyond
what individuals put in. In general we can't expect that anyone is going to
be present and working on ideas from one day to the next. The consequence
is that it's a personal choice for each community member as to how much
they invest in supporting other members of the community.

How you engage with the community will determine how quickly and
completely its existing members build trust in you - we can only make
judgement on that by how you interact on the mailing list, IRC and through
code review. You build my trust in you by rocking up consistently over time,
with interesting patches, are responsive to reviews and are willing to iterate
in response to reasonable requests. Your goal should be to achieve rough
consensus on a patch and get it merged, especially when you are new to the
community and even if some reviews seem unreasonable (though feel free to
ask for justification). Over time as trust builds in you, if you disagree with
particulars of how the community runs then you can start proposing that the
community change to meet your needs, but be aware that there might be
competing needs that drove the existence of the current conditions.

In summary, it's down to each individual in the community to choose
whether they have patience, whether and how much they want to invest, and
how quickly you're progressing along their worthwhile-investment trajectory.
Try to do things that will keep you on track for everyone in the community,
especially in the early days of your participation here.

Cheers,

Andrew
