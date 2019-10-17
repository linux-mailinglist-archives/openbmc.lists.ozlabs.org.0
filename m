Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 50E4ADAFAB
	for <lists+openbmc@lfdr.de>; Thu, 17 Oct 2019 16:17:47 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46vB872x62zDqZQ
	for <lists+openbmc@lfdr.de>; Fri, 18 Oct 2019 01:17:43 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fuzziesquirrel.com (client-ip=173.167.31.197;
 helo=bajor.fuzziesquirrel.com; envelope-from=bradleyb@fuzziesquirrel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=fuzziesquirrel.com
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46vB3K4ZBbzDqYq
 for <openbmc@lists.ozlabs.org>; Fri, 18 Oct 2019 01:13:33 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from [192.168.253.30] (unknown [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id 145855C08B;
 Thu, 17 Oct 2019 10:13:30 -0400 (EDT)
Content-Type: text/plain;
	charset=us-ascii;
	delsp=yes;
	format=flowed
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: Lenvo IPMI OEM in openbmc Community
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <34e9db59f8064625a90b4021de1e54dd@lenovo.com>
Date: Thu, 17 Oct 2019 10:13:29 -0400
Content-Transfer-Encoding: 7bit
Message-Id: <4FBBF668-7781-40EF-A469-ED3FD756ED36@fuzziesquirrel.com>
References: <34e9db59f8064625a90b4021de1e54dd@lenovo.com>
To: Yonghui YH21 Liu <liuyh21@lenovo.com>
X-Mailer: Apple Mail (2.3445.104.11)
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

at 3:16 AM, Yonghui YH21 Liu <liuyh21@lenovo.com> wrote:

> HI Brad,
>          Now we are implementing some lenovo OEM commands based on below projects, could you help create lenovo-ipmi-oem repository for us?
>          https://github.com/openbmc/openbmc/tree/master/meta-lenovo
>
> Thanks

Is Lenovo OK with Apache-2.0?  I only ask because Lenovo deviated with the  
license for its bitbake metadata.  The OpenBMC charter says that code must  
be Apache-2.0, with room for granting exceptions but I think it would be  
simpler for everyone if Lenovo simply use Apache-2.0.  For the fine print,  
please have a look at the charter:

https://www.openbmc.org/wp-content/uploads/sites/62/2018/03/charter_openbmc_02142018.pdf

specifically section 7.

thanks!

-brad
