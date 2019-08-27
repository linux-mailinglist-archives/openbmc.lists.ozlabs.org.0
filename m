Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A2A629DA9A
	for <lists+openbmc@lfdr.de>; Tue, 27 Aug 2019 02:26:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46HV6H0vVPzDqfZ
	for <lists+openbmc@lfdr.de>; Tue, 27 Aug 2019 10:26:15 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="gDBcpqYz"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="zKSqg7D0"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46HTzF4LjxzDql0
 for <openbmc@lists.ozlabs.org>; Tue, 27 Aug 2019 10:20:09 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 0A452223A9;
 Mon, 26 Aug 2019 20:20:07 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Mon, 26 Aug 2019 20:20:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm3; bh=sUyQSK5lDCueygqbBBoYhGJjUSdWLc9
 wUFy4JI+KcEQ=; b=gDBcpqYzxQ64AwnUO/IVFXGmA7oQ8HKJCTpqAKaBvw1/Ak0
 2ROymlvBV5rib7jXhR23metlepgD18fhTHPUrF9J4K3RjcbN/znlv/zbHfbzsYmi
 z9zrY0XDs0APwXf9Hq8Tlo/w3yRqZdu69DNGF6pk+vJdm+3SS8UYvc1vq9aiHj0s
 SAXNDO7Odwssv3kaaOBbUte5x9GTjVE7ISfeSq5cAFuvlHKE8p010pNK7pzbjlqy
 9C6GMdEecTQZlqIRYw6o6bQkofsT++VtLPU+abjH5xayN60IQX/YDj+sQ5MrNVUa
 zrTPZw4JaguKc0Ils9RZCXG5pEZ2kFqSVSJlFpQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=sUyQSK
 5lDCueygqbBBoYhGJjUSdWLc9wUFy4JI+KcEQ=; b=zKSqg7D0CEzlPPcCX/Ln8r
 RexazM/mIn+vjxBfxhxm0FTYXUjU5yC0X7WuHJwnGep6ymB2oxdTocEVCmj5uWuJ
 cGDznN0ZmsklATg3mIhpw+Z25VSzIJkNlq+MhmA5F3fcfRuLwY+I3qw+pEiCeHrC
 r8lU448oUdFseIGISIFVUyR0W0WKfE7/f6feF7v8JEq5oS6jUaeRuolqA6jn9WzV
 osWniy28gRV/YKuC47Ne8COK3tETr9EyfLN+pkcEbTt9Uh9j1/0RMjDjQUnqlZgp
 Ze8EZvtaGeim88QPsjutH/Z9V4aXDbClBt5hAnMrB41cTYKME3hPsl9XzFs6mMoA
 ==
X-ME-Sender: <xms:NndkXSWmxlxFXo1yZniggzbzaAS-1BCWwIWewf50MPvEYpn0LMXYCw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrudehhedgfeehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecurfgrrh
 grmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgv
 rhfuihiivgeptd
X-ME-Proxy: <xmx:NndkXXhV8j2zXfV8C8ztDElA6dfeoqXz_Qvrcbzfpp0jt9NbimPgpg>
 <xmx:NndkXR980UmsBzyhRoVmzAMP3SPi-ow7w5hHnSwMR40-OREP-n447A>
 <xmx:NndkXZb0uulPj5awdAxkC7V1digc_xj39wjP65wPkfEVY2PClfTmjQ>
 <xmx:N3dkXWyIP5F3Kyb1-ScvNh7BeeeNNpTuL47Bh2E2qMn41mhESeVHfg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 3E79AE00A5; Mon, 26 Aug 2019 20:20:06 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-139-g73fcb67-fmstable-20190826v1
Mime-Version: 1.0
Message-Id: <cad8d517-7371-4894-869b-ebe523f625c2@www.fastmail.com>
In-Reply-To: <CADy_Pt0PNASL=1eeL+KsasFhQZ69JRWkHzokmJwre+Y6++GtDQ@mail.gmail.com>
References: <MN2PR04MB5839D33826EF08A499E32167CDA80@MN2PR04MB5839.namprd04.prod.outlook.com>
 <CADy_Pt3tvAci8tXuZ3cTJY3tRxwnWPbD=yNL05VEYrjZKWcpEw@mail.gmail.com>
 <BYAPR21MB1191A89B2C012758241C5C72C8A80@BYAPR21MB1191.namprd21.prod.outlook.com>
 <CAEfeXvbYEA-5Hg=1Zs=Di=3HyNOpoSdM51GjSLwuiX01yHg2-w@mail.gmail.com>
 <865C376D1B77624AAA570EFEF73CE52F983F2A4E@fmsmsx118.amr.corp.intel.com>
 <BYAPR21MB11916802ED44B6397460086BC8A10@BYAPR21MB1191.namprd21.prod.outlook.com>
 <CADy_Pt0PNASL=1eeL+KsasFhQZ69JRWkHzokmJwre+Y6++GtDQ@mail.gmail.com>
Date: Tue, 27 Aug 2019 09:50:27 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "James Mihm" <james.mihm@gmail.com>,
 "Neeraj Ladkani" <neladk@microsoft.com>
Subject: Re: Socflash says the bmc is write protected.
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
Cc: Sharad Khetan <sharad.khetan@intel.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Christian Svensson <bluecmd@google.com>, Zheng Bao <fishbaoz@hotmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Tue, 27 Aug 2019, at 04:16, James Mihm wrote:
> The best that can be done with the AST2500 is to disable the bridges 
> very early in the reset handler and in a ROM'd bootloader. This has 
> been mitigated in the AST2600 with an option to permanently disable the 
> bridges.

For the 2500 you can also do it before the first instruction is executed on
the ARM core by taking advantage of the firmware strapping function. This
is about a small a window as you're going to get though.

OpenBMC's approach of doing it early in u-boot is the pragmatic approach
as you can read/modify/write the registers, which isn't possible via the
firmware strapping method.

Andrew
