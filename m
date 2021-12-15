Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B9DB47611C
	for <lists+openbmc@lfdr.de>; Wed, 15 Dec 2021 19:53:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JDks61Knfz3bsp
	for <lists+openbmc@lfdr.de>; Thu, 16 Dec 2021 05:52:58 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.31; helo=mga06.intel.com;
 envelope-from=jason.m.bills@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JDkrs3JDWz2ybH
 for <openbmc@lists.ozlabs.org>; Thu, 16 Dec 2021 05:52:43 +1100 (AEDT)
X-IronPort-AV: E=McAfee;i="6200,9189,10199"; a="300087399"
X-IronPort-AV: E=Sophos;i="5.88,207,1635231600"; d="scan'208";a="300087399"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2021 10:51:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,207,1635231600"; d="scan'208";a="682616089"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga005.jf.intel.com with ESMTP; 15 Dec 2021 10:51:40 -0800
Received: from [10.212.129.234] (jmbills-MOBL.amr.corp.intel.com
 [10.212.129.234])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 3FF53580D42
 for <openbmc@lists.ozlabs.org>; Wed, 15 Dec 2021 10:51:40 -0800 (PST)
Message-ID: <2972f904-b192-fe27-eaea-5b1e2d9c338d@linux.intel.com>
Date: Wed, 15 Dec 2021 11:51:39 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: OpenBMC web sometimes jump back to the login screen problem
Content-Language: en-US
To: openbmc@lists.ozlabs.org
References: <mailman.0.1637828525.15424.openbmc@lists.ozlabs.org>
 <217ffd16.389b.17d5636abb5.Coremail.cld795@163.com>
 <20211125084640.GA22508@home.paul.comp>
 <78340dc9.749f.17d5ab53990.Coremail.cld795@163.com>
 <687802ca.772b.17d5ad02872.Coremail.cld795@163.com>
 <20211126215734.GH22508@home.paul.comp>
 <459566ca.670c.17d6b13a847.Coremail.cld795@163.com>
 <18a75e7d223e2c054e93e9a83a6c0ba474125518.camel@yadro.com>
 <6fc4e62.472c.17d7a6a0885.Coremail.cld795@163.com>
 <2f6c7248.c41.17d9291a38e.Coremail.cld795@163.com>
 <8e645b4.344b.17d93d37f8d.Coremail.cld795@163.com>
 <fabdbd3d04e3db2cef14346bc5b7e3fe71101c40.camel@yadro.com>
 <12f6e3dd.234a.17dbc1c17dd.Coremail.cld795@163.com>
From: "Bills, Jason M" <jason.m.bills@linux.intel.com>
In-Reply-To: <12f6e3dd.234a.17dbc1c17dd.Coremail.cld795@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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



On 12/14/2021 8:21 PM, Landon wrote:
> hello,
> 
> I use https://github.com/AspeedTech-BMC/openbmc 
> <https://github.com/AspeedTech-BMC/openbmc> sdk v7.02 now,
> the Aspeed <https://github.com/AspeedTech-BMC/openbmc> openbmc is forked 
> from https://github.com/openbmc/openbmc 
> <https://github.com/openbmc/openbmc>
> and I found a problem is :
> I input the user password in the login screen, and enter the web，then I 
> Operate some menus ，All of a sudden，the screen will jumps back to the 
> login screen, and input the user password in the login screen,  enter 
> the web again,
> And will jumps back to the login screen Once again, the problem 
> sometimes more than once.
> And I found Operate the "sensors" menus View the Sensor List Trigger it 
> Higher frequency.
> 
> 
> I try update the webui-vue  “webui-vue_git.bb” of the SRCREV, but There 
> is no effect, the problem is still existence.
> sorry to have troubled you so much!
> Thanks !

Hi,

I have a similar issue that is fixed by this change: 
https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/49318.

Please check if this change helps with your issue.  I think all we're 
missing is test data to merge that, so if you have any data, it may help 
with merging that change.

Thanks!
-Jason
