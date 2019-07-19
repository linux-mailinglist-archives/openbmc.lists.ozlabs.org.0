Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CA7256E898
	for <lists+openbmc@lfdr.de>; Fri, 19 Jul 2019 18:21:58 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45qx8z4qrHzDqty
	for <lists+openbmc@lfdr.de>; Sat, 20 Jul 2019 02:21:55 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.24; helo=mga09.intel.com;
 envelope-from=james.feist@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45qx8J0trJzDqcD
 for <openbmc@lists.ozlabs.org>; Sat, 20 Jul 2019 02:21:18 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Jul 2019 09:21:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,283,1559545200"; d="scan'208";a="252197962"
Received: from skyhawk.jf.intel.com (HELO [10.54.51.81]) ([10.54.51.81])
 by orsmga001.jf.intel.com with ESMTP; 19 Jul 2019 09:21:15 -0700
Subject: Re: Using fru-device with 16 Bit EEPROM
To: Phil Eichinger <phil@zankapfel.net>, openbmc@lists.ozlabs.org
References: <20190719065057.nqqmecxbalvoszlo@zankapfel.net>
From: James Feist <james.feist@linux.intel.com>
Message-ID: <92274bed-15e6-48de-4fd7-517867b2a80e@linux.intel.com>
Date: Fri, 19 Jul 2019 09:21:15 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190719065057.nqqmecxbalvoszlo@zankapfel.net>
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
Cc: Amithash Prasad <amithash@fb.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 7/18/19 11:50 PM, Phil Eichinger wrote:
> Hi *,
> 
> I was wondering if anyone is using fru-device from entity-manager with
> EEPROMs that have 16 Bit addressing.
> Initially I got an off-by-one error, I dumped the read header bytes and
> they looked like they came from address 0x01.
> I dug in a little deeper and I think there is an issue with the read
> function - read_block_data() - for 16 Bit addressing.
> I haven't verified it on a scope but I think the i2c_smbus API yields an
> I2C transmission for every API call?

This is a known issue, Amithash was looking into it, but don't think 
we've reached a solution that works well with both 8bit and 16bit eeproms:

https://gerrit.openbmc-project.xyz/c/openbmc/entity-manager/+/18783

> 
> My EEPROM (Microchip 24C128) requires for random reads a 2 Byte write
> with the higher address byte first - current implementation has it
> vice-versa and split over 2 transactions.
>  From then on I can use the continuous read with auto address increment.
> 
> Is the current implementation written for a different EEPROM requiring
> reading this way or is it just broken? In case of the latter I can send
> a patch.
> 
> Why is there basically a user space driver for reading/writing EEPROMs
> instead of using the interface in sysfs (ie.
> /sys/devices/platform/ahb/ahb:apb/ahb:apb:bus@1e78a000/1e78a100.i2c-bus/i2c-3/3-0050/eeprom)?
> 

It's meant to discover devices without explicitly knowing they are 
available, for things like add in cards, psus, etc you might want to 
discover they are available instead of depending on device tree. This 
way you don't have to add support for all components to all platforms, 
they can just be discovered automatically.


> Cheers,
> 
> Phil
> 
