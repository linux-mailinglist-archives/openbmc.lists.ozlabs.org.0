Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E758E725B5
	for <lists+openbmc@lfdr.de>; Wed, 24 Jul 2019 06:10:46 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45thj00bvrzDq9B
	for <lists+openbmc@lfdr.de>; Wed, 24 Jul 2019 14:10:44 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 45tPQl35jYzDqFJ
 for <openbmc@lists.ozlabs.org>; Wed, 24 Jul 2019 02:42:21 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Jul 2019 09:42:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,299,1559545200"; d="scan'208";a="368429787"
Received: from unknown (HELO [10.251.18.151]) ([10.251.18.151])
 by fmsmga005.fm.intel.com with ESMTP; 23 Jul 2019 09:42:18 -0700
Subject: Re: ipmi-fru-parser + entity-manager
To: Patrick Venture <venture@google.com>,
 Benjamin Fair <benjaminfair@google.com>
References: <CAO=notwpKm8KLiXbL_+02DLUsvjjZqAPBCujnTLCd8GnheQQvA@mail.gmail.com>
 <CADKL2t4DztiWaWDFpYK_iHqyJxxk2+dgOhGTgayT2uUPVqGcKg@mail.gmail.com>
 <CAO=notz0U8o-29JAy2_bJYCO4Sp_8ii3KZ4r88Y=QFwWTZd6-A@mail.gmail.com>
From: James Feist <james.feist@linux.intel.com>
Message-ID: <06aa38d3-a0b0-fea9-21ae-6b0eb126aadd@linux.intel.com>
Date: Tue, 23 Jul 2019 09:42:17 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAO=notz0U8o-29JAy2_bJYCO4Sp_8ii3KZ4r88Y=QFwWTZd6-A@mail.gmail.com>
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
 Ed" <ed.tanous@intel.com>, Ofer Yehielli <ofery@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 7/23/2019 7:20 AM, Patrick Venture wrote:
> On Mon, Jul 22, 2019 at 6:34 PM Benjamin Fair <benjaminfair@google.com> wrote:
>>
>> On Mon, Jul 22, 2019 at 3:25 PM Patrick Venture <venture@google.com> wrote:
>>>
>>> Does entity-manager manage the FRU eeprom devices?  Or does one still
>>> need to configure ipmi-fru-parser, etc?
>>>
>>> Patrick
>>
>> There is a FRU parser shipped with entity-manager which searches for
>> FRU EEPROMs and attempts to read them:
>> https://github.com/openbmc/entity-manager/blob/master/src/FruDevice.cpp
> 
> I saw that, but is that a replacement for the support provided by
> ipmi-fru-parser?  I'm assuming yes, I just want an authoritative,
> "yes, you get this and don't worry about ipmi-fru-parser when using
> entity-manager."
> 
I haven't used ipmi-fru-parser, so I'm not sure. Basically fru-device 
scans all i2c channels, looks for things that 'look like a fru' and 
populates them on d-bus. It doesn't do much more than that. 
Entity-manager can then "probe" it's properties and load configurations. 
If that is what ipmi-fru-parser does then it might be a replacement.

-James
