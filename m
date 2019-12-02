Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 169F910EEF8
	for <lists+openbmc@lfdr.de>; Mon,  2 Dec 2019 19:11:56 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47RY9432TjzDqP3
	for <lists+openbmc@lfdr.de>; Tue,  3 Dec 2019 05:11:52 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.100; helo=mga07.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47RY6T2t7XzDqNr
 for <openbmc@lists.ozlabs.org>; Tue,  3 Dec 2019 05:09:35 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 Dec 2019 10:09:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,270,1571727600"; d="scan'208";a="293500165"
Received: from yoojae-mobl1.amr.corp.intel.com (HELO [10.7.153.147])
 ([10.7.153.147])
 by orsmga001.jf.intel.com with ESMTP; 02 Dec 2019 10:09:30 -0800
Subject: Re: Dropping PECI patches
To: Joel Stanley <joel@jms.id.au>
References: <CACPK8XffZqTq3YqEEcA7mm4d1k0V30o1TLE79nBOGrVcEBCjog@mail.gmail.com>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <be709e4f-1215-3d88-9974-1989b9867e60@linux.intel.com>
Date: Mon, 2 Dec 2019 10:09:30 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CACPK8XffZqTq3YqEEcA7mm4d1k0V30o1TLE79nBOGrVcEBCjog@mail.gmail.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Joel,

Thanks for letting me know this. Also, thanks a lot for carrying the
out-of-tree PECI patches in OpenBMC kernel tree so far.

Can I submit updated PECI patches to OpenBMC upstream if I'm gonna add
it back? Linux upstreaming isn't ready yet because configfs support
should be implemented to address subsystem maintainer's comments but it
needs at this moment in OpenBMC kernel tree to keep developing
dbus-sensors support.

Thanks,
Jae

On 12/1/2019 8:35 PM, Joel Stanley wrote:
> Hi Jae,
> 
> As I have not seen an upstream submission of PECI for a number of
> release cycles (since January, over 10 months ago) it will be dropped
> from the OpenBMC kernel tree.
> 
> If you still want this code in the kernel you will need to make a new
> upstream submission.
> 
> This aligns with the OpenBMC kernel development process, where a patch
> is carried to assist developers who are actively working to get their
> drivers merged upstream
> 
> Cheers,
> 
> Joel
> 
