Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 14A6115F9C6
	for <lists+openbmc@lfdr.de>; Fri, 14 Feb 2020 23:30:07 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48K7Nr0c0kzDqfD
	for <lists+openbmc@lfdr.de>; Sat, 15 Feb 2020 09:30:04 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.151; helo=mga17.intel.com;
 envelope-from=james.feist@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48K7NC6dT1zDqfC
 for <openbmc@lists.ozlabs.org>; Sat, 15 Feb 2020 09:29:31 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Feb 2020 14:29:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,442,1574150400"; d="scan'208";a="281953587"
Received: from skyhawk.jf.intel.com (HELO [10.54.51.81]) ([10.54.51.81])
 by FMSMGA003.fm.intel.com with ESMTP; 14 Feb 2020 14:29:27 -0800
Subject: Re: Performance issue with psusensor / dbus-sensors
To: Peter Lundgren <peterlundgren@google.com>, openbmc@lists.ozlabs.org,
 vernon.mauery@linux.intel.com, jae.hyun.yoo@linux.intel.com,
 Josh Lehan <krellan@google.com>, Alex Qiu <xqiu@google.com>,
 Xiang Liu <xiangliu@google.com>, Sui Chen <suichen@google.com>
References: <CAK13xKNkmy5fTgi0xLK=F+fBJbA7EN3bRsinLbN2sTknfiCGwA@mail.gmail.com>
From: James Feist <james.feist@linux.intel.com>
Message-ID: <a47f684f-7007-1f55-190d-0edf79c0c0ba@linux.intel.com>
Date: Fri, 14 Feb 2020 14:29:27 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <CAK13xKNkmy5fTgi0xLK=F+fBJbA7EN3bRsinLbN2sTknfiCGwA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
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

On 2/14/20 2:14 PM, Peter Lundgren wrote:
> We're running into some occasional and hard to reproduce performance 
> issues with sensors on the entity-manager/dbus-sensors/intel-ipmi-oem 
> software stack. I don't have much concrete to say on the subject, but I 
> want to put a feeler out to see if anyone else has seen similar issues. 
> Here's what we think so far:
> 
> Complaints range from IPMI sensor reads being slower than normal to 
> sensors "never" updating.
> 
> Josh got access to one machine in a bad state and observed this:
> 
>  1. All the I2C buses were working normally. i2cdetect ran successfully
>     on each bus.
>  2. hwmon was working fine. He wrote a shell script to read all of the
>     *_input sysfs files and could read every sensor in the system in 3
>     seconds.
>  3. psusensor was running.
>  4. busctl --no-pager monitor | grep -i PropertiesChanged shows no
>     traffic. On a healthy system, it shows many updates per second. No
>     obvious error messages in journalctl --no-pager -f.
>  5. Restarting psusensor alleviates the problem.

Not sure if it's 100% related but Jae is looking into an issue with the 
CPU sensor not reporting data after DC cycles. We haven't root caused it 
completely yet but we'll let you know what we find.

-James

> 
