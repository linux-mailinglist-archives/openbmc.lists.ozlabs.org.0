Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 56E208EF58
	for <lists+openbmc@lfdr.de>; Thu, 15 Aug 2019 17:31:37 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 468VmP6hK8zDqQY
	for <lists+openbmc@lfdr.de>; Fri, 16 Aug 2019 01:31:33 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=134.134.136.100; helo=mga07.intel.com;
 envelope-from=ed.tanous@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 468VlT57G5zDr7x
 for <openbmc@lists.ozlabs.org>; Fri, 16 Aug 2019 01:30:38 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 15 Aug 2019 08:24:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,389,1559545200"; d="scan'208";a="184645767"
Received: from hades.jf.intel.com (HELO [10.54.51.78]) ([10.54.51.78])
 by FMSMGA003.fm.intel.com with ESMTP; 15 Aug 2019 08:24:26 -0700
Subject: Re: ipmitool FRU write question
To: Harry Sung1 <hsung1@lenovo.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <4a91e18f7195458193f673c26986421a@lenovo.com>
From: Ed Tanous <ed.tanous@intel.com>
Message-ID: <e9ba404c-a35e-1c46-2a0c-a4fd971312a6@intel.com>
Date: Thu, 15 Aug 2019 08:24:26 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <4a91e18f7195458193f673c26986421a@lenovo.com>
Content-Type: text/plain; charset=windows-1252
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

On 8/15/19 6:49 AM, Harry Sung1 wrote:
> Hi Team,
> 
>  
> 
> Current phosphor-host-ipmid does not support fru write command, but
> ipmi-fru-parser supports it.
> 
> We found this fru write command only update the data to dbus inventory,
> but doesn’t sync the data back to the EEPROM.
> 
> Does ipmi-fru-parser has any plans to implement it? I think it is more
> make sense to sync the data to EEPROM when we do fru write.

The alternative FRU daemon from entity manager, FruDevice, supports
writing the FRU directly.
https://github.com/openbmc/entity-manager/blob/master/src/FruDevice.cpp

Happy to see this capability added to ipmi-fru-parser, but you might be
able to model it off FruDevice.  If you want to use FruDevice as-is, you
will need the alternative FruWrite command sets from here.

https://github.com/openbmc/intel-ipmi-oem/blob/159547cdfbf1992737dcecbcb3888af7795f930b/src/storagecommands.cpp#L316

As written, those commands change the behavior a bit, and double buffers
the FRU write commands.  When the last Fru write is sent, the data is
flushed through the FRU parser to ensure that it's valid, and the user
isn't doing anything nefarious (like changing a product name or serial
number) before it writes the EEPROM in one chunk, as quickly as it can
to reduce the possibility of a half written EEPROM.
