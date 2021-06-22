Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 989BA3AFA51
	for <lists+openbmc@lfdr.de>; Tue, 22 Jun 2021 02:49:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G878Y2swqz3083
	for <lists+openbmc@lfdr.de>; Tue, 22 Jun 2021 10:49:49 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=mga12.intel.com (client-ip=192.55.52.136; helo=mga12.intel.com;
 envelope-from=jason.m.bills@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G878L2GpMz2yWn
 for <openbmc@lists.ozlabs.org>; Tue, 22 Jun 2021 10:49:33 +1000 (AEST)
IronPort-SDR: Pd2OALRACGoFlxqMVK/KM7gnKBOhEXdN5UBQLw6nRPaOI4LY1PSC2l3IBeI1hJb4rGzbhY0ReH
 Peott2RS25XA==
X-IronPort-AV: E=McAfee;i="6200,9189,10022"; a="186650459"
X-IronPort-AV: E=Sophos;i="5.83,290,1616482800"; d="scan'208";a="186650459"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2021 17:49:29 -0700
IronPort-SDR: E60lyvm13ihBjMSsUHG5Ks9xdDgtBiJ7kZN3mbvy8veK7jmpFSeJjQLs0BaywXpxD/C2vnd0tJ
 k/+vglNz0s3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,290,1616482800"; d="scan'208";a="556437487"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga001.fm.intel.com with ESMTP; 21 Jun 2021 17:49:29 -0700
Received: from [10.212.255.136] (jmbills-MOBL.amr.corp.intel.com
 [10.212.255.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 429B65808BA
 for <openbmc@lists.ozlabs.org>; Mon, 21 Jun 2021 17:49:29 -0700 (PDT)
Subject: Re: Are redfish event logs persistent across reboot?
To: openbmc@lists.ozlabs.org
References: <SG2PR02MB2796FB3D6D6A8C7E7E478878850E9@SG2PR02MB2796.apcprd02.prod.outlook.com>
From: "Bills, Jason M" <jason.m.bills@linux.intel.com>
Message-ID: <106950ac-8977-a84b-3178-577e519f62c2@linux.intel.com>
Date: Mon, 21 Jun 2021 18:49:28 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <SG2PR02MB2796FB3D6D6A8C7E7E478878850E9@SG2PR02MB2796.apcprd02.prod.outlook.com>
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



On 6/16/2021 9:22 PM, Udupa.Ashwini ISV wrote:
> Hi,
> 
> Are redfish event logs(/var/log/redfish) persistent across reboot?
This depends on how your filesystem is mounted.

We used to directly mount /var to our non-volatile flash partitions but 
because of another feature requirement we now mount /var as an overlay 
on /tmp:
https://github.com/Intel-BMC/openbmc/blob/intel/meta-openbmc-mods/meta-common/recipes-phosphor/preinit-mounts/preinit-mounts/init#L76

Then we have another service that periodically rsyncs the /tmp overlay 
into the non-volatile flash partition to persist the redfish logs:
https://github.com/Intel-BMC/openbmc/blob/intel/meta-openbmc-mods/meta-common/recipes-core/nv-sync/nv-sync/nv-syncd
> 
> Currently, I see that old logs are lost after reboot and 
> /var/log/redfish is newly written.
> 
> Is this the current design?
> 
> Regards,
> 
> Ashwini
> 
