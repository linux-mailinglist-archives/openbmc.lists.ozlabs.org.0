Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC53BFA6A
	for <lists+openbmc@lfdr.de>; Thu, 26 Sep 2019 22:08:19 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46fQwJ5sKhzDr02
	for <lists+openbmc@lfdr.de>; Fri, 27 Sep 2019 06:08:16 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=134.134.136.20; helo=mga02.intel.com;
 envelope-from=ed.tanous@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46fQvZ4K6XzDqyn
 for <openbmc@lists.ozlabs.org>; Fri, 27 Sep 2019 06:07:31 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Sep 2019 13:07:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,553,1559545200"; d="scan'208";a="219531886"
Received: from hades.jf.intel.com (HELO [10.54.51.78]) ([10.54.51.78])
 by fmsmga002.fm.intel.com with ESMTP; 26 Sep 2019 13:07:27 -0700
Subject: Re: Is it required that regulator sensors implement threshold
 interfaces?
To: openbmc@lists.ozlabs.org
References: <0519f084-a20d-a338-2875-c5a4110e02ff@linux.vnet.ibm.com>
From: Ed Tanous <ed.tanous@intel.com>
Message-ID: <1dd65323-231d-8a18-40d4-a0e00c48a184@intel.com>
Date: Thu, 26 Sep 2019 13:07:27 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <0519f084-a20d-a338-2875-c5a4110e02ff@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8
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

On 9/26/19 11:15 AM, Shawn McCarney wrote:
> Hi,
> 
> I am working on an application that will configure voltage regulators
> (VRMs) and read their sensors.
> 
> I'll be putting about 9 sensors per VRM on D-Bus that will implement the
> Sensor.Value interface.  However, I'd rather not implement the warning
> and critical Threshold interfaces for those sensors.
> 
> Is there any reason that would cause a problem?

Nope.  There are plenty of sensors that don't implement warning or
critical interfaces, although I would recommend you do for logging
purposes, even if they are artificially high, but that's up to what
you're wanting to implement.

> 
> Also, the Sensor.Value interface has MinValue and MaxValue properties. 
> Are these required to have valid (non-zero) values? What breaks if they
> are just set to 0?  I'd rather not provide these values as well.
> 

For some implementations, these are used to appropriately scale the SDR,
and provide the redfish interfaces for those properties.  pid-control
also uses it to scale readings to 0-100% for ease in defining clamp
values.  I'm not really following why you wouldn't want to implement
those.  They don't have to be exact, and there are plenty of cases where
they are set to INT8_MAX and INT8_MIN.  Usually you will know based on
the spec you're implementing if the values fall into a
uint8/int8/int16/uint16 range, and you can just put in the specified
range limits.
