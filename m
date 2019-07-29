Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CC87782CF
	for <lists+openbmc@lfdr.de>; Mon, 29 Jul 2019 02:27:15 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45xgVm6jDFzDqQX
	for <lists+openbmc@lfdr.de>; Mon, 29 Jul 2019 10:27:12 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="MqdvJmXn"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="0aG64izv"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45xgVC4BWwzDqQX
 for <openbmc@lists.ozlabs.org>; Mon, 29 Jul 2019 10:26:43 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 8E1E421FE6;
 Sun, 28 Jul 2019 20:26:40 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Sun, 28 Jul 2019 20:26:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm3; bh=HvykgjD5sYz55Z+ZtU/jrOlybfKWHVH
 5h34U/BPb6aY=; b=MqdvJmXnY2IcWVzCUlCP85Vd86unL0hiBO0YGS0K7Em1EHU
 HROrwIksjl6gNpY1783HdmOzd2OhA6GLtGyFd/8hMNKub8cXmCERq+LboiT+9StO
 JzMTmrL9Xqg64g2A+9birKT58Whyahl0IofovI/KpFXWqNZ9qlNANAqRJ00U0QwO
 HSwVN0sBZz0HOpcnLFLoFP02ICsouHMUZqtd0BCYHdVV9eob6vpDMeWX7Yd+IggB
 MUX5vy83ZXA5TN6viyJ65+uAtphzqCl0ne6z5A9WhRdqsfrMTaUVT2gfeXxzLpXK
 aQLOKb/MpCQRysv5rB0Z7j0WSyyO0XOXouRjBrg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=Hvykgj
 D5sYz55Z+ZtU/jrOlybfKWHVH5h34U/BPb6aY=; b=0aG64izvvmNHCzrylDnwX4
 L9xIzNuwL36pfc1JIsYEwSbS6OrLIeYlfFG3/ucg0uc1km0sTtPRX/fMk3rwhMcg
 hhKSVvCMyDX+QdeGK0zLXDitDIYvTPMe4Vn4aEhGUxEwq/q34QSe9q0D5nrA99f7
 yHp0VkhPzXWBO8aDx78Qn5JDJWY2rss2lRVFMVZ9gV8g/H9673VQEFaD7RjMfVBH
 VnrwcsnrJW7hjMN/rcDot0oIDIBXQcFupU3X9htEKb0qd79jPCZeKCtEruwPVWzJ
 AFETVGBjx/A1eb5vg+X2oOr/St7kW8XArcJdjRrw0B4Ww8FlRDl6oihhEFxsK8aA
 ==
X-ME-Sender: <xms:Pz0-XYUSw4akJRW4vxO1iQUyKT5pr6l_UKIgPME9C3m4tlZkGwYk6g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrledtgdefgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfrrghrrg
 hmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghr
 ufhiiigvpedt
X-ME-Proxy: <xmx:Pz0-XeCyPb7ge-yuZa3l3E3XJQsiQYGiN6uBqd2s3tAQgLTWdijfWA>
 <xmx:Pz0-XXyhMLqQPWb8PJWCzLVj5pBGQ23_YwYAUeNwQY4Im2xptyFb8g>
 <xmx:Pz0-XUYeeXjz1kqS00jNEAvvqUTZLoaxbWUcCsf3-DFccpYa4BRhew>
 <xmx:QD0-XaS8HTlFjM4jM4ahR7htUSn_BYwXpIPwD4z52OkOatOGDgsvYg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id D8311E00A2; Sun, 28 Jul 2019 20:26:39 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-736-gdfb8e44-fmstable-20190718v2
Mime-Version: 1.0
Message-Id: <d799bdd4-8889-41d9-bf40-e5ccc7170ff4@www.fastmail.com>
In-Reply-To: <CAHkHK0-_rKUd5EbyUtcgYttpZoy1-md8AG7f-8Er075pgObqBQ@mail.gmail.com>
References: <CAHkHK0-dT2R6WUowZhaLgVurFPukL3tmJGneXCEijKew=1uRyA@mail.gmail.com>
 <46f3ba00-9382-2040-80a7-519457ecd65c@linux.vnet.ibm.com>
 <2f7ad2ea-7717-4f9b-bdd5-b6efc131cf4e@www.fastmail.com>
 <CAHkHK0-_rKUd5EbyUtcgYttpZoy1-md8AG7f-8Er075pgObqBQ@mail.gmail.com>
Date: Mon, 29 Jul 2019 09:56:58 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "John Wang" <wangzhiqiang8906@gmail.com>
Subject: Re: How to ideally fix the log function
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Matt Spinler <mspinler@linux.ibm.com>, Patrick Venture <venture@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Fri, 26 Jul 2019, at 12:33, John Wang wrote:
> On Fri, Jul 26, 2019 at 10:08 AM Andrew Jeffery <andrew@aj.id.au> wrote:
> >
> > Having said all that I'm not really a C++ person, but it appears the API has
> > trapped itself in a C++ corner. Maybe people more experienced and creative
> > than I can come up with something, but I think the best thing we can do
> > is three-fold:
> >
> > 1. Build libsystemd with `CFLAGS=-DSD_JOURNAL_SUPPRESS_LOCATION`
> > 2. Add a new log macro that allows us to capture the info properly
> Maybe something like below:
> ```
> struct traceLog
> {
>     traceLog(const source_location location = source_location::current()) :
>         location(location)
>     {
>     }
>     template <level L, typename Msg, typename... Entry>
>     void log(Msg msg, Entry... e)
>     {
>         phosphor::logging::log<L>(msg, entry("CODE_LINE=%d", location.line()),
>                                   entry("CODE_FILE=%s", location.file_name()),
>                                   e...);
>     }
> 
>   private:
>     source_location location;
> };
> 
> int main()
> {
>     traceLog{}.log<level::INFO>("xxxxx", entry("entry=%s", "xxxx"));
> }
> ```

My immediate thought is "pretty ugly" :D
