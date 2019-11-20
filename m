Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FD8F1046DA
	for <lists+openbmc@lfdr.de>; Thu, 21 Nov 2019 00:13:23 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47JJQQ6gM5zDqmq
	for <lists+openbmc@lfdr.de>; Thu, 21 Nov 2019 10:13:18 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.115; helo=mga14.intel.com;
 envelope-from=jason.m.bills@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47JJPq3b42zDqk7
 for <openbmc@lists.ozlabs.org>; Thu, 21 Nov 2019 10:12:46 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Nov 2019 15:12:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,223,1571727600"; d="scan'208";a="209907317"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga006.jf.intel.com with ESMTP; 20 Nov 2019 15:12:43 -0800
Received: from [10.241.245.76] (unknown [10.241.245.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 15DE55800FE
 for <openbmc@lists.ozlabs.org>; Wed, 20 Nov 2019 15:12:43 -0800 (PST)
Subject: Re: Is Intel-BMC/openbmc https://github.com/Intel-BMC/openbmc being
 kept up-to-date?
To: openbmc@lists.ozlabs.org
References: <d410e08e4d1b48a5831f1af784f76a99@SCL-EXCHMB-13.phoenix.com>
From: "Bills, Jason M" <jason.m.bills@linux.intel.com>
Message-ID: <54b60348-ca89-9801-7101-0926e56fd5ad@linux.intel.com>
Date: Wed, 20 Nov 2019 15:12:42 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <d410e08e4d1b48a5831f1af784f76a99@SCL-EXCHMB-13.phoenix.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 11/20/2019 3:07 PM, Bruce Mitchell wrote:
> Is Intel-BMC/openbmc https://github.com/Intel-BMC/openbmc being kept up-to-date?
> It seems openbmc/openbmc https://github.com/openbmc/openbmc gets merges that are not being merged into Intel-BMC/openbmc.
Yes, I am responsible for keeping Intel-BMC in sync.  Unfortunately, I 
am a few weeks behind due to some internal issues and priorities.  I am 
working to get back to a normal sync schedule as soon as possible.

Thanks,
-Jason

> 
> Thanks!
> 
