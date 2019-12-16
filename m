Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 96AEB120791
	for <lists+openbmc@lfdr.de>; Mon, 16 Dec 2019 14:49:41 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47c2h22YNMzDqVC
	for <lists+openbmc@lfdr.de>; Tue, 17 Dec 2019 00:49:38 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.20; helo=mga02.intel.com;
 envelope-from=richard.marian.thomaiyar@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47c2g53WRszDqTY
 for <openbmc@lists.ozlabs.org>; Tue, 17 Dec 2019 00:48:48 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 16 Dec 2019 05:48:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,321,1571727600"; d="scan'208";a="205112511"
Received: from rthomaiy-mobl2.gar.corp.intel.com (HELO [10.251.55.243])
 ([10.251.55.243])
 by orsmga007.jf.intel.com with ESMTP; 16 Dec 2019 05:48:43 -0800
Subject: Re: Redfish: Disable/enable out of band IPMI
To: Carol Wang <karo33bug@gmail.com>, Joseph Reynolds <jrey@linux.ibm.com>,
 "Puli, Apparao" <apparao.puli@linux.intel.com>
References: <CALzeG+-bxR0oqA_h8Gaf-RQLJygL1QYXy3y2DU=GKdLC9nhWhw@mail.gmail.com>
 <aa329f9e-9e66-d5e7-ecac-e54c23e16a48@linux.ibm.com>
 <d6b94dbe-a6c5-1b19-63e7-1695c3794e78@linux.ibm.com>
 <CALzeG+-dbvwLseu9agpKp5L8vVkNMabM76UOmuDo2sh0uS_qFA@mail.gmail.com>
From: "Thomaiyar, Richard Marian" <richard.marian.thomaiyar@linux.intel.com>
Message-ID: <696721cc-2cf4-373e-027d-475ff8d357dc@linux.intel.com>
Date: Mon, 16 Dec 2019 19:18:42 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <CALzeG+-dbvwLseu9agpKp5L8vVkNMabM76UOmuDo2sh0uS_qFA@mail.gmail.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This came a month back, and i wanted to push the changes in intel repo 
to the OpenBMC community repo, due to other priority missed to push the 
same.

https://github.com/Intel-BMC/provingground/tree/master/srvcfg-manager

Will push the document in few day and the changes for the same.

Regards,

Richard

On 12/16/2019 11:38 AM, Carol Wang wrote:
> rface in phosphor-dbus-interface to indicate the status
> of net IPMI.
> Have a daemon to monitor the status, if the status is changed, then
> enable or
> disable the net IPMI service and socket.
> 2. Check the net IPMI socket state by getData()[1] in bmcweb. If the
> state is
> "running" or "listening", the net IPMI status is true, otherwise, the
> status is
> false. Then bmcweb can enable or disable the service and socket.
>
> Wondering if anyone has any thoughts on this feature, which way is
> better.
> If add interface, in which daemon this interface should be implemented?
