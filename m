Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A3C57C89D
	for <lists+openbmc@lfdr.de>; Wed, 31 Jul 2019 18:27:17 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45zJjR630SzDqnf
	for <lists+openbmc@lfdr.de>; Thu,  1 Aug 2019 02:27:07 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.115; helo=mga14.intel.com;
 envelope-from=james.feist@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45zJhZ0wMpzDqY4
 for <openbmc@lists.ozlabs.org>; Thu,  1 Aug 2019 02:26:20 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 31 Jul 2019 09:26:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,330,1559545200"; d="scan'208";a="256199232"
Received: from skyhawk.jf.intel.com (HELO [10.54.51.81]) ([10.54.51.81])
 by orsmga001.jf.intel.com with ESMTP; 31 Jul 2019 09:26:16 -0700
Subject: Re: exposing device-tree populated eeproms in FruDevice
To: Patrick Venture <venture@google.com>
References: <CAO=notzfZriPyq6tazS_0UxiZLPPbD_+z-YEDfFTvTT6utxcVg@mail.gmail.com>
 <CAO=notxhF3DHd7dTi09FRfGBrYUuTMD1YV-h-7jgLkJW9TGt7w@mail.gmail.com>
From: James Feist <james.feist@linux.intel.com>
Message-ID: <dd4592e8-0fb6-615a-55f4-4493896891bc@linux.intel.com>
Date: Wed, 31 Jul 2019 09:26:16 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <CAO=notxhF3DHd7dTi09FRfGBrYUuTMD1YV-h-7jgLkJW9TGt7w@mail.gmail.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, "Tanous,
 Ed" <ed.tanous@intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 7/31/19 8:36 AM, Patrick Venture wrote:
> On Mon, Jul 29, 2019 at 10:59 AM Patrick Venture <venture@google.com> wrote:
>>
>> Per the previous email, some eeproms aren't supported by FruDevice.  I
>> was curious if it made sense to have it not only search for responding
>> i2c devices on a bus, but also look at ones that have the "eeprom"
>> sysfs file, and talk to those as well?  So that we can put things in
>> the device tree where the kernel will expose it with the known
>> driver/configuration, and then it can be read by FruDevice -- although
>> at that point, it may make sense to have a hybrid approach if possible
>> that uses ipmi-fru-parser (which uses the eeprom sysfs entry).
> 
> Just wanted to promote this to the top of inboxes.  It isn't clear
> from reading the code that this is doing anything beyond "installing"
> the device via Exposes.  If it's a temperature sensor, it sets up the
> dbus configuration, but otherwise not.
> 

Correct. It isn't doing anything with the eeproms. The patch in this 
issue tried to use the sysfs files, but it broke 8bit support 
https://github.com/openbmc/entity-manager/issues/1. If someone wants to 
take it up and make both work, that'd be great.


>>
>> Patrick
