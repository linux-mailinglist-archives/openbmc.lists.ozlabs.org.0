Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 329B34BE49
	for <lists+openbmc@lfdr.de>; Wed, 19 Jun 2019 18:32:08 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45TVpY3vfBzDqT3
	for <lists+openbmc@lfdr.de>; Thu, 20 Jun 2019 02:32:05 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.151; helo=mga17.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45TVnr3KbhzDqDy
 for <openbmc@lists.ozlabs.org>; Thu, 20 Jun 2019 02:31:26 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Jun 2019 09:31:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,392,1557212400"; d="scan'208";a="170611741"
Received: from yoojae-mobl1.amr.corp.intel.com (HELO [10.7.153.148])
 ([10.7.153.148])
 by orsmga002.jf.intel.com with ESMTP; 19 Jun 2019 09:31:10 -0700
Subject: Re: One question is regarding of PECI driver.
To: Derek Lin23 <dlin23@lenovo.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <1616aac7ca904100be2e0a7dddcc6127@lenovo.com>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <b01e1e4e-e723-bae2-32e0-20b47d38efcf@linux.intel.com>
Date: Wed, 19 Jun 2019 09:31:10 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <1616aac7ca904100be2e0a7dddcc6127@lenovo.com>
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
Cc: Duke KH Du <dukh@lenovo.com>, Andrew MS1 Peng <pengms1@lenovo.com>,
 Harry Sung1 <hsung1@lenovo.com>, Haitao HT11 Wang <wanght11@lenovo.com>,
 Yonghui YH21 Liu <liuyh21@lenovo.com>, Lisa YJ19 Liu <liuyj19@lenovo.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 6/14/2019 2:24 AM, Derek Lin23 wrote:
> Hi team:
> 
>            We have a question for PECI driver, hope we can have some 
> inputs and feedbacks.
> 
>            When PECI driver starts, it checks the availabilities for 
> CPUs by the addresses defining in the device tree.

Yes, it's what PECI driver does.

>            But, when none of the CPUs are available, in our cases, CPUs 
> are powered off, PECI driver responses with error messages of PECI 
> clients and devices are not registered.

It's an expected result because PECI works only when the host CPU is
powered on.

>            Is it possible that PECI driver would listen the events for 
> power-on? So, PECI driver would be reloaded and PECI clients and devices 
> become available.

No. Instead, we are using CPU ping from user space and register PECI
clients at run time. Please check these services:

https://github.com/openbmc/dbus-sensors
https://github.com/openbmc/entity-manager

Thanks,
Jae

>            Or, other thoughts and ideas?
> 
> Thank you,
> 
> 
> Derek Lin
> 
