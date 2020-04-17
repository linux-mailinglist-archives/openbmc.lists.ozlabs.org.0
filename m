Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A2F71AE513
	for <lists+openbmc@lfdr.de>; Fri, 17 Apr 2020 20:48:09 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 493lTf4lgFzDsFG
	for <lists+openbmc@lfdr.de>; Sat, 18 Apr 2020 04:48:06 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.100; helo=mga07.intel.com;
 envelope-from=james.feist@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 493lSq4cw3zDrR7
 for <openbmc@lists.ozlabs.org>; Sat, 18 Apr 2020 04:47:21 +1000 (AEST)
IronPort-SDR: 1DfHvuPgVy9JaL4hqfpx0VgwpPoFMELCnBVPluQ68vz8S0coCl7bgkLwb+DJYmD3ioWeCn9cA7
 s/lHHp3wAcrw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2020 11:47:16 -0700
IronPort-SDR: +6gVW7i17V7eAY5ZFmBbN0oVCnqsSOn8L+znyM7px9FOSoUBTgdT1kpkJ72Uo4RAmzkIEZ528i
 t5CqULFXYyAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,395,1580803200"; d="scan'208";a="243093831"
Received: from jfeist-mobl2.amr.corp.intel.com (HELO [10.134.46.11])
 ([10.134.46.11])
 by orsmga007.jf.intel.com with ESMTP; 17 Apr 2020 11:47:15 -0700
Subject: Re: nvme sensors
To: Vijay Khemka <vijaykhemka@fb.com>, Andrew Jeffery <andrew@aj.id.au>,
 Neeraj Ladkani <neladk@microsoft.com>
References: <0F332F74-FF51-4239-8B52-2EBA770AE6CC@fb.com>
 <8022481D-7C72-4A7B-AF9C-D144177B4C88@fb.com>
 <CH2PR21MB1510E11F9772C45D12EEA0F1C8DB0@CH2PR21MB1510.namprd21.prod.outlook.com>
 <82E67AAA-1BD8-41D8-BE27-966F840236E2@fb.com>
 <CH2PR21MB1510AEF844D82AC9D897B902C8DB0@CH2PR21MB1510.namprd21.prod.outlook.com>
 <4770a42d-d012-4e95-9347-d5c287c2e288@www.fastmail.com>
 <5CD00373-FD92-4E57-90C5-21FB8AD6DD25@fb.com>
From: James Feist <james.feist@linux.intel.com>
Message-ID: <954154ef-14f8-69fd-677b-e414cbdb0ae2@linux.intel.com>
Date: Fri, 17 Apr 2020 11:47:15 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <5CD00373-FD92-4E57-90C5-21FB8AD6DD25@fb.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 4/16/2020 4:15 PM, Vijay Khemka wrote:
> Currently, dbus-sensors support reading NVME sensors via mctp only. It uses
> libmctp and some of smbus patch from Intel. It also uses slave mqueue mctp
> kernel driver which is not upstream.
> 
> So currently it is not matured and fully upstreamed.
> 
> James, how can we use this without mctp. I don't see any non mctp support like
> Sending direct smbus command, please advise if I missed it.

Currently it only supports MCTP. Should be easy to change it to support 
both with some flag if you require it.

> 
> Regards
> -Vijay
>      
> 
