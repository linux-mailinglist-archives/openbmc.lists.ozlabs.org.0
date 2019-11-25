Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BEB22109736
	for <lists+openbmc@lfdr.de>; Tue, 26 Nov 2019 01:08:49 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47MPQ72QKdzDqTV
	for <lists+openbmc@lfdr.de>; Tue, 26 Nov 2019 11:08:47 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.151; helo=mga17.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47MNmv1SqLzDqfY
 for <openbmc@lists.ozlabs.org>; Tue, 26 Nov 2019 10:39:57 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 25 Nov 2019 15:39:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,243,1571727600"; d="scan'208";a="220448999"
Received: from yoojae-mobl1.amr.corp.intel.com (HELO [10.7.153.148])
 ([10.7.153.148])
 by orsmga002.jf.intel.com with ESMTP; 25 Nov 2019 15:39:55 -0800
Subject: Re: i2c error for ME port
To: Vijay Khemka <vijaykhemka@fb.com>,
 James Feist <james.feist@linux.intel.com>,
 "jason.m.bills@linux.intel.com" <jason.m.bills@linux.intel.com>
References: <45A2E82C-17C3-470A-9756-DBC2CDFE0356@fb.com>
 <fcbbbc1b-d85c-d3d5-c2b6-9798828385ae@linux.intel.com>
 <69833bb8-89b6-2b06-818a-c8d16ce19ca5@linux.intel.com>
 <C4ECF587-E301-4FB7-AF5A-BB20F90F9083@fb.com>
 <960f28cb-3e53-14af-a2e7-63abeb0f9310@linux.intel.com>
 <78D819B8-5A29-444C-9048-2D2A0238BF11@fb.com>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <d49b1081-0423-010d-44c7-70b14b64869e@linux.intel.com>
Date: Mon, 25 Nov 2019 15:39:55 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <78D819B8-5A29-444C-9048-2D2A0238BF11@fb.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 11/25/2019 3:37 PM, Vijay Khemka wrote:
> 
> 
> ﻿On 11/25/19, 3:21 PM, "Jae Hyun Yoo" <jae.hyun.yoo@linux.intel.com> wrote:
> 
>      > &i2c4 {
>      >    status = "okay";
>      >    // BMC Debug Header
>      >    ipmb0@10 {
>      >      compatible = "ipmb-dev";
>      >      reg = <0x10>;
>      >      i2c-protocol;
>      >    };
>      > };
>      
>      If it's for BMC-ME channel, you should add 'multi-master;' to enable H/W
>      arbitration. Also, you should set the slave address like below after
>      including '#include <dt-bindings/i2c/i2c.h>' in dts file.
>      
>      reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
>      
> I changed to this
> &i2c4 {
>    status = "okay";
>    multi-master;
>    // BMC Debug Header
>    ipmb0@10 {
>      compatible = "ipmb-dev";

What happens if you use "slave-mqueue" instead? Are you modifying IPMB
channel support using the ipmb kernel driver?

>      reg = <0x40000010>;
>      i2c-protocol;
>    };
> };
> But no improvement. In fact sometimes I am unable to communicate with ME via i2c.
>      Cheers,
>      
>      Jae
>      
> 
