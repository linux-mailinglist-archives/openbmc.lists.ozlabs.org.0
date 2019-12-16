Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AA7F911FE9B
	for <lists+openbmc@lfdr.de>; Mon, 16 Dec 2019 07:50:38 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47bsNW5ZpSzDqTk
	for <lists+openbmc@lfdr.de>; Mon, 16 Dec 2019 17:50:35 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.93; helo=mga11.intel.com;
 envelope-from=richard.marian.thomaiyar@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47bsMY3FdBzDqNN
 for <openbmc@lists.ozlabs.org>; Mon, 16 Dec 2019 17:49:45 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 15 Dec 2019 22:48:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,320,1571727600"; d="scan'208";a="205015332"
Received: from rthomaiy-mobl2.gar.corp.intel.com (HELO [10.66.97.224])
 ([10.66.97.224])
 by orsmga007.jf.intel.com with ESMTP; 15 Dec 2019 22:48:30 -0800
Subject: Re: How can I add a user for openbmc and remove the default root user?
To: =?UTF-8?B?5Y2X6YeO44Og44Or44K344Ko44Op44K0?= <1181052146@qq.com>,
 openbmc <openbmc@lists.ozlabs.org>
References: <tencent_BBCBA6D64E821CDC3E0AD497B3C0FD77E509@qq.com>
From: "Thomaiyar, Richard Marian" <richard.marian.thomaiyar@linux.intel.com>
Message-ID: <4b32b6d0-da99-62c1-52f2-c2a7d4221dec@linux.intel.com>
Date: Mon, 16 Dec 2019 12:18:29 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <tencent_BBCBA6D64E821CDC3E0AD497B3C0FD77E509@qq.com>
Content-Type: text/plain; charset=gb18030; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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

Hi Liu,

Please refer earlier response on the same

https://lists.ozlabs.org/pipermail/openbmc/2019-June/016515.html

Lately i am seeing many people asking for this password override for 
IPMI, Will try to override the same using bbclass for ipmi password too

Regards,

Richard

On 12/14/2019 3:27 PM, 南野ムルシエラゴ wrote:
> Greetings!
>     I am using openbmc, and I want to remove the default root user and 
> add a new user.
>     I use useradd add a user, I can use curl with this username and 
> passwd to connect to openbmc, But when I use ipmitool, it fails
>     Can any one tell me what can I  do?
>
> Best Regards!
> Liu Hongwei
