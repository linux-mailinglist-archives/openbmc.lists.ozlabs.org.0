Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B01B1BC07E
	for <lists+openbmc@lfdr.de>; Tue, 24 Sep 2019 04:56:28 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46cm6f09fHzDqMN
	for <lists+openbmc@lfdr.de>; Tue, 24 Sep 2019 12:56:26 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fuzziesquirrel.com
 (client-ip=173.167.31.197; helo=bajor.fuzziesquirrel.com;
 envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=fuzziesquirrel.com
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46cln16znWzDqPW
 for <openbmc@lists.ozlabs.org>; Tue, 24 Sep 2019 12:41:08 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from [192.168.253.30] (unknown [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id 399586DECB;
 Mon, 23 Sep 2019 22:41:04 -0400 (EDT)
Content-Type: text/plain;
	charset=us-ascii;
	delsp=yes;
	format=flowed
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: OpenBMC CVE issues in openssl
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <959CAFA1E282D14FB901BE9A7BF4E7724E52C8BD@shsmsx102.ccr.corp.intel.com>
Date: Mon, 23 Sep 2019 22:41:03 -0400
Content-Transfer-Encoding: 7bit
Message-Id: <FAD2D9A0-A730-4A28-9798-0B8B3228E14F@fuzziesquirrel.com>
References: <959CAFA1E282D14FB901BE9A7BF4E7724E52C8BD@shsmsx102.ccr.corp.intel.com>
To: "Wang, Kuiying" <kuiying.wang@intel.com>
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
Cc: "Jia, Chunhui" <chunhui.jia@intel.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "Mihm,
 James" <james.mihm@intel.com>, "Shi, Yilei" <yilei.shi@intel.com>, "Xu,
 Qiang" <qiang.xu@intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

at 10:25 PM, Wang, Kuiying <kuiying.wang@intel.com> wrote:

> Hi Brad,
> Openssl is already upgrade to 1.1.1d, so please help sync to the latest  
> version.
> https://github.com/openembedded/openembedded-core/tree/master/meta/recipes-connectivity/openssl
>
> Please let me know, if you need me to submit patch for this upgrading.
>
> Thanks,
> Kwin.

Hi Kwin

I pushed a change last week that picks it up:  
https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/25306

Something broke though, so that will need to get debugged before we can  
pick it up.  If you are able to help you could cherry-pick this change and  
do some builds and/or testing.

thanks!

-brad
