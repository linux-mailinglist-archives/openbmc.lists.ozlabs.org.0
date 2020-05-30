Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EE9F81E8D53
	for <lists+openbmc@lfdr.de>; Sat, 30 May 2020 05:01:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49YmRj64K3zDqs2
	for <lists+openbmc@lfdr.de>; Sat, 30 May 2020 13:01:37 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.151; helo=mga17.intel.com;
 envelope-from=apparao.puli@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49YmQn4vrPzDqp5
 for <openbmc@lists.ozlabs.org>; Sat, 30 May 2020 13:00:48 +1000 (AEST)
IronPort-SDR: RDGTFwX0Ua3b6RmHCphbepSkyneL26V1f9Dkcae41AelsdjiPfUanDfo579c0jQMX6baVli/kK
 nOtz/wNl86cQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2020 20:00:43 -0700
IronPort-SDR: 9o+LETZ0UTDd/lhOyklL4pqaaH1SDDfto6KuSGtnrZtQUET6iOjuaawaSb4tVsCp6vQn2VTYsD
 E3wH5sPFsY2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,451,1583222400"; d="scan'208";a="443622562"
Received: from apuli-mobl.gar.corp.intel.com (HELO [10.213.72.54])
 ([10.213.72.54])
 by orsmga005.jf.intel.com with ESMTP; 29 May 2020 20:00:41 -0700
Subject: Re: request to add pfr-manager repo to CI
To: Andrew Geissler <geissonator@yahoo.com>
References: <63ac8cfd-86b9-43fe-91a0-60f60b4469ee@linux.intel.com>
 <B5A32CFD-5E30-41C3-AA91-C0918DD79195@yahoo.com>
From: "Puli, Apparao" <apparao.puli@linux.intel.com>
Message-ID: <c7436d70-7ca9-b78c-73d2-5a391aa1582a@linux.intel.com>
Date: Sat, 30 May 2020 08:30:40 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <B5A32CFD-5E30-41C3-AA91-C0918DD79195@yahoo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 vikram.bodireddy@linux.intel.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Thanks Andrew.

On 5/30/2020 1:21 AM, Andrew Geissler wrote:
>
>> On May 29, 2020, at 10:33 AM, Puli, Apparao <apparao.puli@linux.intel.com> wrote:
>>
>> Hi Andrew,
>>
>>     Can you please add "pfr-manager" repo to CI builds?
> Hey Apparao, sure, done.
>
>> https://github.com/openbmc/pfr-manager
>>
>> https://gerrit.openbmc-project.xyz/#/q/project:openbmc/pfr-manager
>>
>>
>> Thanks,
>>
>> -Appu
>>
