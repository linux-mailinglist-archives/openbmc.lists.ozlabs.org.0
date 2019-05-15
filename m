Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DAE21FC73
	for <lists+openbmc@lfdr.de>; Wed, 15 May 2019 23:51:45 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4547YS6NSRzDqXt
	for <lists+openbmc@lfdr.de>; Thu, 16 May 2019 07:51:40 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=192.55.52.120; helo=mga04.intel.com;
 envelope-from=ed.tanous@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4547XQ1ZhSzDqVL
 for <openbmc@lists.ozlabs.org>; Thu, 16 May 2019 07:50:38 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 15 May 2019 14:50:34 -0700
X-ExtLoop1: 1
Received: from hades.jf.intel.com (HELO [10.54.51.78]) ([10.54.51.78])
 by orsmga006.jf.intel.com with ESMTP; 15 May 2019 14:50:34 -0700
Subject: Re: pid control configuration
To: Vijay Khemka <vijaykhemka@fb.com>, Patrick Venture <venture@google.com>
References: <96A52DC2-7B18-4F69-B8E8-3B489BDA84C6@fb.com>
 <1c5566ba-696e-42eb-c193-22eaca33a1db@intel.com>
 <7D337AEA-CB20-4E39-8A9A-58E21EDA0F31@fb.com>
 <1b82951d-4293-0525-a562-000899544c2e@intel.com>
 <14F05B01-0B7D-44D1-A599-5EDD8CC3A6C8@fb.com>
 <CAO=notzQc2CX9Dx4gjX6HwnuCKnjmD_3ek+tv-XAfO+LxdQ3WA@mail.gmail.com>
 <b058940e-ae1b-d238-c9b1-885252ba2464@intel.com>
 <235B9067-D22E-439F-9009-F3D6C2A70993@fb.com>
From: Ed Tanous <ed.tanous@intel.com>
Message-ID: <945b4275-2441-8562-7efe-5bc7a9eca4f7@intel.com>
Date: Wed, 15 May 2019 14:50:34 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <235B9067-D22E-439F-9009-F3D6C2A70993@fb.com>
Content-Type: text/plain; charset=utf-8
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

On 5/15/19 12:21 PM, Vijay Khemka wrote:
> 
> 
> Ed, please see if following declaration in entity manager would work as I am not defining any pid values here.
>         {
>             "Class": "fan",
>             "Inputs": [
>                 "MB_FAN0_TACH"
>             ],
>             "Name": "MB_FAN0_TACH",
>             "Outputs": [
>                 "Pwm 1"
>             ],
>             "Type": "Pid",
>             "Zones": [
>                 "Pid 1"
>             ]
>         },
>     
>     >>
>     >> Regards
>     >> -Vijay
>     >>
>     
> 

I'm assuming you loaded this on a system.  If it gave you the behavior
you're looking for, you're done.  If it didn't, it's probably time to
start debugging and tuning.

I run my systems in the cascade controller setup.  If you're deviating
from that, you'll likely find some places that need better documentation
and code improvements.
