Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 82EEC173139
	for <lists+openbmc@lfdr.de>; Fri, 28 Feb 2020 07:42:41 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48TKjB47xMzDrDZ
	for <lists+openbmc@lfdr.de>; Fri, 28 Feb 2020 17:42:38 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.27;
 helo=out3-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=Kz85I+jG; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=oqefcCx1; 
 dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48TJ2g3l4BzDr7F
 for <openbmc@lists.ozlabs.org>; Fri, 28 Feb 2020 16:27:38 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 65789221F8;
 Fri, 28 Feb 2020 00:27:35 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Fri, 28 Feb 2020 00:27:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm2; bh=gzFAvI4I4AMAeefPirYSXabhLUfXbqy
 7nzXTHdcMEMo=; b=Kz85I+jGDWl0lc7ZlDFyutqwQs1ExgA+2SmFIdW0XZKL+JV
 IcR1saiOXBUG0ebYNfSuWc0E5AE7QKC7aZn1OaKE4XbASVX2A8//ps/e8I/Z/iKT
 BljNvbWYws4+TwJaXrGuZLsFGvkQPK84zOEuraP5kVfywEsgQLcBiqSi7R6SsM/3
 ipZXm5P8+n/kJpkB+GDioD+LubVvgnorRi9QKYTdARM6loNlayEkUS/oFtIHbO1O
 ffUrNMnLHyPQ8zFkdytIOkHNvSvbc4DbFk8bHf+o25b5mFAgFhTAyvUyO1ZgylXg
 N2xLXGydMwAykeVUwjctgamwp+0z/Ne6rlrTwng==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=gzFAvI
 4I4AMAeefPirYSXabhLUfXbqy7nzXTHdcMEMo=; b=oqefcCx1+JVt/2DKqbr6qw
 Z/xEqhxnFkvvzxLVC2E6MZRNDV/htn+OAYMDirXdQgaezuTAx0Xs1hz7fe69Zdax
 sMiTmpLsen9zkGIyFBQnSO1hB2XeTzx1qbOMPyDmCB71YUpmjEYq9b1tNzPs2ixR
 mY9eHB/0NedhctvEPmWdINKYwZeVyAlOCZjiQL5TB5zgjU5WMxloMEb97FkqVZB9
 gmgX80dq57V82DZSmnf0eD5XkyW7kyciQtECCCJH0lVNUdg0zydw/6M/iNQGDVIj
 mGYVEBCYixA/PuZrPINQbqiepxEAEhX1RYDExHVRjR2uDmnkPt7qgEGkA9soNp0g
 ==
X-ME-Sender: <xms:xqRYXlWQmTSj6TsCUh0pWpFebS7ifjKq6sRDBELJ8UUuTzTDBm2spA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrleejgdekhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucffohhmrg
 hinhepohiilhgrsghsrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghm
 pehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:xqRYXkztNfEwotEFEjUasmGhpbD4C3inLl6_DbVnQWKoSCaCwptNpA>
 <xmx:xqRYXkG8aY4IS6ncXRAMvyA3G3yF5D5qHhrEnTa7Uggllzk9mqFqug>
 <xmx:xqRYXhvHZFSPG-1JckYzCbQUmV9nuNRQdPappTNVdBuDcZ5MbUh-Kw>
 <xmx:x6RYXqtGkLWAKxNkknU1Av8IFTkfKe4diWnn81inSMCfr0YdPEUBoA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id C1CEBE00BD; Fri, 28 Feb 2020 00:27:34 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-967-g014f925-fmstable-20200226v1
Mime-Version: 1.0
Message-Id: <64e1858f-7713-4ca4-880f-db639ab78d30@www.fastmail.com>
In-Reply-To: <37851ADF-67EC-4761-A4C5-33F28373A609@fb.com>
References: <37851ADF-67EC-4761-A4C5-33F28373A609@fb.com>
Date: Fri, 28 Feb 2020 15:57:31 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Vijay Khemka" <vijaykhemka@fb.com>
Subject: Re: obmc console for multiple host
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Vijay,

On Fri, 28 Feb 2020, at 15:48, Vijay Khemka wrote:
>  
> Hi Andrew,
> 
> I saw new multi host support in obmc console. Thanks for extending 
> obmc-console for multi host connection.

No problems!

> 
> 
> Can you please send me new changes required in configuration file as we 
> are defining local-tty and baud for host in out configuration file for 
> single host. What would be a sample config file for multiple host 
> support and also what are command line option would be for client to 
> connect to particular tty.

Did you see my response here? I think it covers the answers to your
questions:

https://lists.ozlabs.org/pipermail/openbmc/2020-February/020736.html

If it doesn't can you please respond in that thread about what is unclear?

I did leave out exact details on how you might integrate concurrent server
support into your bitbake recipes. I can provide suggestions on how to do
so if it helps.

Cheers,

Andrew
