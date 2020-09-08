Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DFF1A261868
	for <lists+openbmc@lfdr.de>; Tue,  8 Sep 2020 19:54:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BmCTj2B93zDq9n
	for <lists+openbmc@lfdr.de>; Wed,  9 Sep 2020 03:54:49 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.126; helo=mga18.intel.com;
 envelope-from=james.feist@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.intel.com
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BmCSj4HS7zDqLP
 for <openbmc@lists.ozlabs.org>; Wed,  9 Sep 2020 03:53:56 +1000 (AEST)
IronPort-SDR: OtSCU1KpbT23EH4Hh9ezBEDzfD8n50iGkQl3Hx33cPCWczGvLK2MJTL4OsDHKOQWFIm2uF61Yc
 FGY3FKqddn9A==
X-IronPort-AV: E=McAfee;i="6000,8403,9738"; a="145906484"
X-IronPort-AV: E=Sophos;i="5.76,406,1592895600"; d="scan'208";a="145906484"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2020 10:53:51 -0700
IronPort-SDR: AUNA82KUkEBeVssf0HfcaYUWVnK459UR/xTZzUPo4t7fkRCPnSmwQnumnusBFbmz4XqDMm+ECl
 GVWqX432G9Cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,406,1592895600"; d="scan'208";a="284593663"
Received: from jfeist-mobl2.amr.corp.intel.com (HELO [10.209.7.56])
 ([10.209.7.56])
 by fmsmga007.fm.intel.com with ESMTP; 08 Sep 2020 10:53:51 -0700
Subject: Re: time control on wolfpass BMC
To: Ivan Mikhaylov <i.mikhaylov@yadro.com>, Ed Tanous <ed@tanous.net>
References: <a140b8dd494792d0d814cd20e6e4ab4b2714c16c.camel@yadro.com>
From: James Feist <james.feist@linux.intel.com>
Message-ID: <e1bb6593-63a7-4460-b5cd-f53d0e85384b@linux.intel.com>
Date: Tue, 8 Sep 2020 10:53:50 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <a140b8dd494792d0d814cd20e6e4ab4b2714c16c.camel@yadro.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 9/8/2020 7:47 AM, Ivan Mikhaylov wrote:
> Hey James, Ed, Is there any way to control RTC/PCH time inside BMC on
> wolfpass?In intel-bmc rep there is the pch-time-sync service which is doing
> sync.
> The service just reads out date via i2c regs and do the sync with system time. I
> didn't find any other utilities or something which can help with time set from
> BMC.

We default to NTP and use pch-time-sync as a fallback. NTP is configured 
by systemd-timesyncd https://wiki.archlinux.org/index.php/Systemd-timesyncd.


> 
> Thanks.
> 
