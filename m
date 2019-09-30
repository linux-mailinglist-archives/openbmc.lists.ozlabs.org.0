Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 41B56C2231
	for <lists+openbmc@lfdr.de>; Mon, 30 Sep 2019 15:38:13 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46hk4L55MtzDqM1
	for <lists+openbmc@lfdr.de>; Mon, 30 Sep 2019 23:38:10 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46hk3d3P4VzDqLR
 for <openbmc@lists.ozlabs.org>; Mon, 30 Sep 2019 23:37:31 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from [192.168.253.30] (unknown [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id 1B9A014881;
 Mon, 30 Sep 2019 09:37:27 -0400 (EDT)
Content-Type: text/plain;
	charset=us-ascii;
	delsp=yes;
	format=flowed
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: i2c-dev wrapper
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <000701d5772d$ed76d7c0$c8648740$@linux.intel.com>
Date: Mon, 30 Sep 2019 09:37:26 -0400
Content-Transfer-Encoding: 7bit
Message-Id: <FDFFF800-7927-4BF9-B9E0-DD7F44BC4730@fuzziesquirrel.com>
References: <E3DA1B69-7DA0-4E92-A6EB-BFBB7ADC50CC@fuzziesquirrel.com>
 <7bbd7b65-9cb7-8ca5-4d60-51d48e8735d1@fb.com>
 <000701d5772d$ed76d7c0$c8648740$@linux.intel.com>
To: Yong Li <yong.b.li@linux.intel.com>
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
Cc: Tao Ren <taoren@fb.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 shawnmm@linux.ibm.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

at 9:25 PM, Yong Li <yong.b.li@linux.intel.com> wrote:

> FYI, there is an i2c Write/Read API in libpmid for ipmi commands:
> https://github.com/openbmc/phosphor-host-ipmid/blob/master/libipmid/utils.cpp#L403
>
> Thanks,
> Yong
>
> -----Original Message-----
> From: openbmc  
> <openbmc-bounces+yong.b.li=linux.intel.com@lists.ozlabs.org> On Behalf Of  
> Tao Ren
> Sent: Monday, September 30, 2019 9:00 AM
> To: Brad Bishop <bradleyb@fuzziesquirrel.com>; OpenBMC Maillist  
> <openbmc@lists.ozlabs.org>
> Cc: shawnmm@linux.ibm.com
> Subject: Re: i2c-dev wrapper
>
> On 9/27/19 4:54 AM, Brad Bishop wrote:
>> Does anyone have a favorite i2c-dev API wrapper?  Preferably but not  
>> necessarily in C++?
>
> i2c-tools (below url) provides several easy-to-use APIs. Maybe you are  
> looking for more APIs?
>
> https://git.kernel.org/pub/scm/utils/i2c-tools/i2c-tools.git/tree/include/i2c/smbus.h
>
>
> Cheers,
>
> Tao

Thanks Tao and Yong for these pointers.  Will have a look!

-brad
