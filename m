Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C77941B7DF5
	for <lists+openbmc@lfdr.de>; Fri, 24 Apr 2020 20:39:48 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4982yp2kLTzDqfL
	for <lists+openbmc@lfdr.de>; Sat, 25 Apr 2020 04:39:46 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.151; helo=mga17.intel.com;
 envelope-from=james.feist@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4982y33bMlzDqFS
 for <openbmc@lists.ozlabs.org>; Sat, 25 Apr 2020 04:39:05 +1000 (AEST)
IronPort-SDR: UbLHzQXylxQKPx5sZHZmN4bZ8ziVui0oMR8NN1T9Olt4Y4rBK8Yzwlq0FOj1knMN+bx1SMbvFL
 uFn2xyH4vaXA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2020 11:39:03 -0700
IronPort-SDR: BfGcnqgxH9WajkJryWNtMDFnZ6Tp+YemNSxBzc0HfCp83spxEsb0Afi7O1QhWespeyhaSQx4CP
 Y8dCRZuYxipQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,313,1583222400"; d="scan'208";a="335449834"
Received: from jfeist-mobl2.amr.corp.intel.com (HELO [10.212.71.73])
 ([10.212.71.73])
 by orsmga001.jf.intel.com with ESMTP; 24 Apr 2020 11:38:48 -0700
Subject: Re: Intel-BMC: Fan control
To: openbmc@lists.ozlabs.org
References: <e3297385bee9483989607bce1e9837d9@SCL-EXCHMB-13.phoenix.com>
 <e05f77ca-b69c-0e8a-3b4d-3e20a2f87b02@linux.ibm.com>
 <FF397713-D6F3-4E6A-BA22-34EEA5C07236@fb.com>
From: James Feist <james.feist@linux.intel.com>
Message-ID: <90c0f54a-24c4-ab8c-4f45-df1c631d006c@linux.intel.com>
Date: Fri, 24 Apr 2020 11:38:48 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <FF397713-D6F3-4E6A-BA22-34EEA5C07236@fb.com>
Content-Type: text/plain; charset=utf-8; format=flowed
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

On 4/24/2020 10:41 AM, Vijay Khemka wrote:
> I can’t comment for Intel-bmc but in openbmc, entity manager supports 
> for phosphor-fan-control and yaml config is not required if there is EM 
> config available.

Slight correction, phosphor-pid-control is what EM supports, and there 
is no yaml config required. It does not use phosphor-fan-control.


> 
> *From: *openbmc <openbmc-bounces+vijaykhemka=fb.com@lists.ozlabs.org> on 
> behalf of Matthew Barth <msbarth@linux.ibm.com>
> *Date: *Friday, April 24, 2020 at 8:08 AM
> *To: *Patrick Voelker <Patrick_Voelker@phoenix.com>, "OpenBMC 
> (openbmc@lists.ozlabs.org)" <openbmc@lists.ozlabs.org>
> *Subject: *Re: Intel-BMC: Fan control
> 
> No, phosphor-fan-control is currently driven by yaml configs at build 
> time. There is work slated to enable use of runtime json configs for 
> phosphor-fan-control.
> 
> I believe entity-manager can be used to provide config data to the 
> phosphor-pid-control fan control application though.
> 
> On 4/23/20 6:48 PM, Patrick Voelker wrote:
> 
>     Fan control related question for Intel-BMC: Do the entity-manager
>     tachs, PWMs, and zones inform phosphor-fan-control? Or is
>     phosphor-fan-control driven purely from the yaml configurations at
>     build time?
> 
