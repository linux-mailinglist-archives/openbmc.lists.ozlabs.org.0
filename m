Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 57AE8E2AD
	for <lists+openbmc@lfdr.de>; Mon, 29 Apr 2019 14:32:16 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44t3vK3Q2mzDqTW
	for <lists+openbmc@lfdr.de>; Mon, 29 Apr 2019 22:32:13 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.93; helo=mga11.intel.com;
 envelope-from=richard.marian.thomaiyar@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44t3t74mtczDqSS
 for <openbmc@lists.ozlabs.org>; Mon, 29 Apr 2019 22:31:07 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Apr 2019 05:31:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,409,1549958400"; d="scan'208";a="341758570"
Received: from rthomaiy-mobl2.gar.corp.intel.com (HELO [10.252.163.224])
 ([10.252.163.224])
 by fmsmga005.fm.intel.com with ESMTP; 29 Apr 2019 05:31:02 -0700
Subject: Re: One-way dbus properties
To: Adriana Kobylak <anoo@linux.ibm.com>, openbmc@lists.ozlabs.org
References: <a25981c28a179307d5b8135e32a072ff@linux.vnet.ibm.com>
From: "Thomaiyar, Richard Marian" <richard.marian.thomaiyar@linux.intel.com>
Message-ID: <b532887c-7354-3dbc-c589-7c422df7ea55@linux.intel.com>
Date: Mon, 29 Apr 2019 18:01:01 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <a25981c28a179307d5b8135e32a072ff@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
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

Adriana,

What's the purpose of this property ? Why we are not using the same in 
RestrictionMode ? Any pointers when RestrictionMode::whitelist / 
blacklist will be used.

Reason: Defining new one, and planning to use Security::RestrictionMode 
itself to indicate that BMC system in not deployed (i.e. not in field), 
or deployed with certain restriction?

Let me know

Regards,

Richard

On 4/24/2019 8:47 PM, Adriana Kobylak wrote:
> Wanted to get thoughts on how attempting to clear one-way dbus 
> properties should be handled.
>
> There are some properties like Field Mode that are intended to be 
> one-way, meaning that you can set them but not clear them:
>
> - 
> https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/xyz/openbmc_project/Control/FieldMode.interface.yaml
>       description: >
>           Keeps track of whether the BMC is in field mode. Enabling 
> field mode
>           is intended to be a one-way operation.
>
> If there's a call to clear the property value, currently this is a 
> no-op and the REST call returns success but the value is not changed.
> Should an error be returned to the user? It's like a read-only 
> property but only after it's being set the first time.
>
