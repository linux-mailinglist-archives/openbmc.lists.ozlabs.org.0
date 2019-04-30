Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B4FB3FEE5
	for <lists+openbmc@lfdr.de>; Tue, 30 Apr 2019 19:33:53 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44tpXv0yjMzDqPn
	for <lists+openbmc@lfdr.de>; Wed,  1 May 2019 03:33:51 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.20; helo=mga02.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44tpWw2CCWzDqKs
 for <openbmc@lists.ozlabs.org>; Wed,  1 May 2019 03:32:58 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 30 Apr 2019 10:32:55 -0700
X-ExtLoop1: 1
Received: from yoojae-mobl1.amr.corp.intel.com (HELO [10.7.153.148])
 ([10.7.153.148])
 by orsmga002.jf.intel.com with ESMTP; 30 Apr 2019 10:32:55 -0700
Subject: Re: ikvm refresh failed on host screen 1680x1050 resolution
To: xiuzhi <1450335857@qq.com>, openbmc <openbmc@lists.ozlabs.org>,
 ed <ed@tanous.net>, Eddie James <eajames@linux.vnet.ibm.com>
References: <tencent_5FB0BF811DCC8BEA504F5A8F@qq.com>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <fd4d422e-402d-d7fe-f743-f2d967b2cac8@linux.intel.com>
Date: Tue, 30 Apr 2019 10:32:55 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.0
MIME-Version: 1.0
In-Reply-To: <tencent_5FB0BF811DCC8BEA504F5A8F@qq.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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

On 4/29/2019 6:30 PM, xiuzhi wrote:
> Hi Jae,
>      Did you reproduce the resolution issue? CentOS7 or RedHat7 has this 
> resolution.

I saw this issue too. Looks like it happens when height of resolution is
not a multiple of 8 which makes frame updating very slow. Not sure why
it happens. Need more debugging.

-Jae

>    Bets,
> Xiuzhi
> Hi Jae,
>     My host OS is RedHat7.
> Both "Refresh" button on ikvm web Page and "View--Reload This Page" or 
> reload button on chrome browser menu works.
> Xiuzhi
> 
> ------------------ Original ------------------
> *From: * "jae.hyun.yoo";<jae.hyun.yoo@linux.intel.com>;
> *Date: * Apr 5, 2019
> *To: * "xiuzhi"<1450335857@qq.com>; "openbmc"<openbmc@lists.ozlabs.org>; 
> "ed"<ed@tanous.net>; "Eddie James"<eajames@linux.vnet.ibm.com>;
> *Subject: * Re: ikvm refresh failed on host screen 1680x1050 resolution
> 
> On 4/3/2019 10:21 PM, xiuzhi wrote:
>  > Hi Jae, Ed,
>  >      The ikvm screen cann't refresh on ikvm webui screen when setting
>  > the host screen resolution to 1680*1050 . I must click the "Refresh"
>  > button to get the new host screen.  Other resolutions works very well.
>  >    Please check it.
> 
> Hi Xiuzhi,
> 
> I can't see the resolution option in Ubuntu 18.03. What host OS did you
> use for the test? Let me clarify one more. Do you mean the "Refresh"
> button in KVM web page, or reload button of the web browser?
> 
> Thanks,
> Jae
> 
>  > Best,
>  > xiuzhi
