Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 11EA9176E29
	for <lists+openbmc@lfdr.de>; Tue,  3 Mar 2020 05:48:53 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Wl021tGgzDqdl
	for <lists+openbmc@lfdr.de>; Tue,  3 Mar 2020 15:48:50 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.25;
 helo=wout2-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=ZNZVw89E; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=Iu1UTnFd; 
 dkim-atps=neutral
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48WkzP2VpxzDqXM
 for <openbmc@lists.ozlabs.org>; Tue,  3 Mar 2020 15:48:17 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id B233B679;
 Mon,  2 Mar 2020 23:48:14 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Mon, 02 Mar 2020 23:48:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type; s=fm2; bh=FCMkBrFR+scHBSKWTNzIyu/xjAIEHVT
 zz3St2QW+O3k=; b=ZNZVw89Ei4FCHx1V06DuD6zgEhjlxTpwVT2REuh4EBfwD3y
 xu1iXPKZeXE8ZgJiCZ/MW8dvKAPiC3oLEKyUIanZQgby/bfgAunj9riB7bqeqMSF
 cK5OTS37TFmiDPTgUlOeBXmZmWLfSAvcTfxTI4ChM9jJi6wkVdrfJ1wXTb2yONVl
 WLAp4d9hqOx7RE35O/CB30zJhzIDlVX9EPjePVWdMi/6Bxtgu5WmRIt/2u6chbqH
 4o+3Bp5xJt/Ngn6IpmhBjfU/ZEscslHvp3T/StM8+8UV1D2TRSZKWYPIkQxXh46v
 sDSIkowfCV6b3D95LI7uVS6g/huIl/7OtpZOfDg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=FCMkBr
 FR+scHBSKWTNzIyu/xjAIEHVTzz3St2QW+O3k=; b=Iu1UTnFdqx9kbvNIlZV3Cy
 yYh2uotEIOYWf34P4Pf8283h67FehbGEvtnrgu39W1MfpFcdUYqsuxYvsVDrrsft
 RwN2FqHBdvo0/Fu6Pz0x0nI6stGgNw+yumIuHre4OdCDT3x1ldexBCJlu9VJVLQJ
 xOKoO9b3CvKiHBkob5q0jmA++krlQmTc2Ojyd6+2Gys2VvSFmEMJe+3jXBXWLgus
 zkwSFUf9Uy7UCrPk8qOGrLx5gHWYVVdu9LN/KxHy1OacddyQC82OF33QKjVTjh+R
 GcAfiZkYyrKzesNq0dKQbDvyMGAHotJ7mc5mPIVsqn+XA/YmhyjXqap1o6wrWwBw
 ==
X-ME-Sender: <xms:jeFdXl7nQsStI6NmMRI1t-VFxOrKOZot-zFLA6eik_YKrehAZxGIZA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedruddthedgjeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuffhomh
 grihhnpehgihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgr
 mhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:jeFdXtxeaKeRLJbXBhtL7JJmiNN7Vhr9JBIiq7PGpm4OsOgaw-0YYg>
 <xmx:jeFdXtbrgbUlHkK7OZwjPSCdqhwOm8SGUdck7hxUAY6556475pWHhQ>
 <xmx:jeFdXlIMUvpr6TevCS3FMBqsKwSz1d4YSUhUrUhgWtKJFr4xk4TdPg>
 <xmx:juFdXkBhPoqrw7U57mF1GeaIi58C_bQ8vdG5Id1Qgpj75GvcqgIoiA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 6C52AE00C2; Mon,  2 Mar 2020 23:48:13 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-967-g014f925-fmstable-20200226v1
Mime-Version: 1.0
Message-Id: <c2ebd229-edfc-4e9c-877e-313bce3a8c3e@www.fastmail.com>
In-Reply-To: <OFBAC0E531.E7E68FE5-ON0025851C.0053A4C8-0025851C.0055AA1E@notes.na.collabserv.com>
References: <OFBAC0E531.E7E68FE5-ON0025851C.0053A4C8-0025851C.0055AA1E@notes.na.collabserv.com>
Date: Tue, 03 Mar 2020 15:18:12 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Lakshminarayana R Kammath" <lkammath@in.ibm.com>, openbmc@lists.ozlabs.org
Subject: Re: [OpenBMC]: Unit test coverage analysis on openbmc repositories
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



On Sat, 29 Feb 2020, at 02:05, Lakshminarayana R Kammath wrote:

> https://github.com/openbmc/obmc-console.git YES, UNIT TEST

I need to add coverage support to obmc-console.

> https://github.com/openbmc/openbmc-tools.git NO

Not sure we can expect anything for openbmc-tools - it's a collection
of random scripts people have written to make their life developing
openbmc easier. It's not something that should have strict QA
processes.

> https://github.com/openbmc/openpower-host-ipmi-flash.git NO

I should add some tests here where I can.

> https://github.com/openbmc/hiomapd.git YES, UNIT TEST
> https://github.com/openbmc/libmctp.git YES, UNIT TEST
> https://github.com/openbmc/phosphor-led-sysfs.git YES, UNIT TEST

These three do in-fact have GCOV/LCOV support, you need to do the usual autotools invocations to get it:

```
./configure --enable-code-coverage && make check-code-coverage
```

> https://github.com/openbmc/phosphor-mboxd.git ERROR

This is archived.

...

> https://github.com/openbmc/u-boot NO

This uses Kbuild as a build system. I notice openbmc/linux and openbmc/qemu aren't included in the list.

> https://github.com/openbmc/webui-vue.git NO
> https://github.com/openbmc/witherspoon-pfault-analysis.git YES, COVERAGE
> https://github.com/openbmc/x86-power-control.git NO
> *************************UNIT TEST COVERAGE 
> REPORT*************************
> SUMMARY:
> TOTAL REPOSITORIES : 110
> TESTED REPOSITORIES : 43
> ERROR : 11
> COVERAGE REPORT : 12
> UNIT TEST REPORT : 31
> NO REPORT : 56
> ***************************************************************************
> Following actions, we can draw from above
> 
>  1. *There are 12 repo's that have GCOV/LCOV plugged in* - We need to 
> maintain which has good coverage and try to improve those which has 
> less coverage
>  2. *There are 31 repo's that have unit test cases added but no 
> coverage analysis because they aren't plugged in yet to GCOV/LCOV* - Is 
> there a plan for plugging in GCOV

As above at least three of these are false-negatives for test coverage.

Andrew
