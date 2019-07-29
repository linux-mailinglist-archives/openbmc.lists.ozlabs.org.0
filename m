Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DC5BF791C6
	for <lists+openbmc@lfdr.de>; Mon, 29 Jul 2019 19:06:49 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45y5h63pxvzDqNK
	for <lists+openbmc@lfdr.de>; Tue, 30 Jul 2019 03:06:46 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.65; helo=mga03.intel.com;
 envelope-from=james.feist@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45y5fY4n4pzDqGB
 for <openbmc@lists.ozlabs.org>; Tue, 30 Jul 2019 03:05:23 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Jul 2019 10:05:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,323,1559545200"; d="scan'208";a="255319656"
Received: from skyhawk.jf.intel.com (HELO [10.54.51.81]) ([10.54.51.81])
 by orsmga001.jf.intel.com with ESMTP; 29 Jul 2019 10:05:19 -0700
Subject: Re: Limitations of entity-manager:FruDevice
To: Patrick Venture <venture@google.com>, "Tanous, Ed" <ed.tanous@intel.com>
References: <CAO=notwJd4QkJVP2qRiB56DWf+D=qs6S9cMCcfiywpOJZO03mA@mail.gmail.com>
From: James Feist <james.feist@linux.intel.com>
Message-ID: <b5f26e39-965d-4c64-bd51-5e83b86a12d4@linux.intel.com>
Date: Mon, 29 Jul 2019 10:05:19 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <CAO=notwJd4QkJVP2qRiB56DWf+D=qs6S9cMCcfiywpOJZO03mA@mail.gmail.com>
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

On 7/29/19 9:11 AM, Patrick Venture wrote:
> Hi;
> 
> I don't know much about FRUs.  However, I know that for some eeproms
> on the device-tree for my platform, the default eeprom driver instance
> isn't correct and I need to explicitly use 24c64.
> 
> root@semitruck:~# echo "eeprom 0x50" > /sys/bus/i2c/devices/i2c-14/new_device
> i2c i2c-14: new_device: Instantiated device eeprom at 0x50
> root@semitruck:~#
> root@semitruck:~# ls -l /sys/bus/i2c/devices/14-0050/
> -r--r--r--    1 root     root          4096 Jul 29 15:20 modalias
> -r--r--r--    1 root     root          4096 Jul 29 15:20 name
> drwxr-xr-x    2 root     root             0 Jul 29 15:20 power
> lrwxrwxrwx    1 root     root             0 Jul 29 15:20 subsystem ->
> ../../../../../../../bus/i2c
> -rw-r--r--    1 root     root          4096 Jul 29 15:20 uevent
> 
> root@semitruck:~# echo "24c64 0x50" > /sys/bus/i2c/devices/i2c-14/new_device
> at24 14-0050: 8192 byte 24c64 EEPROM, writable, 1 bytes/write
> i2c i2c-14: new_device: Instantiated device 24c64 at 0x50
> root@semitruck:~# ls -l /sys/bus/i2c/devices/14-0050/
> drwxr-xr-x    3 root     root             0 Jul 29 15:46 14-00500
> lrwxrwxrwx    1 root     root             0 Jul 29 15:46 driver ->
> ../../../../../../../bus/i2c/drivers/at24
> -rw-------    1 root     root          8192 Jul 29 15:46 eeprom
> -r--r--r--    1 root     root          4096 Jul 29 15:46 modalias
> -r--r--r--    1 root     root          4096 Jul 29 15:46 name
> drwxr-xr-x    2 root     root             0 Jul 29 15:46 power
> lrwxrwxrwx    1 root     root             0 Jul 29 15:46 subsystem ->
> ../../../../../../../bus/i2c
> -rw-r--r--    1 root     root          4096 Jul 29 15:46 uevent
> 
> For entity-manager, I can add the type and it'll do the right thing.
> However, when FruDevice runs first and populates the FRUs, it doesn't
> seem to detect the difference in the eeproms.  I don't know enough (as
> previously stated) to jump into fixing this, so I wanted to check if
> this was a known limitation (presumably) and whether there was a plan
> to fix it?

FruDevice basically does a i2cdetect, i2cdump, then reads the fru data 
and sees if it looks like a fru. Do i2cdetect and i2cdump work with this 
eeprom?

I know for 16 bit eeproms, that it doesn't work correctly, as in this 
thread:
https://lists.ozlabs.org/pipermail/openbmc/2019-July/017134.html

There's also a issue: https://github.com/openbmc/entity-manager/issues/1 
with a link to using device tree.

I don't have any of these eeproms available to try that don't work, I 
can't comment on others attempts to get them going.

-James

> 
> Patrick
> 
