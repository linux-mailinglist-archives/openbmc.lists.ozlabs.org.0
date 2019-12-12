Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C3F11D376
	for <lists+openbmc@lfdr.de>; Thu, 12 Dec 2019 18:14:25 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47YgQ61f9NzDr55
	for <lists+openbmc@lfdr.de>; Fri, 13 Dec 2019 04:14:22 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.20; helo=mga02.intel.com;
 envelope-from=james.feist@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47YgFv6zJVzDr76
 for <openbmc@lists.ozlabs.org>; Fri, 13 Dec 2019 04:07:13 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Dec 2019 09:07:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,306,1571727600"; d="scan'208";a="245805045"
Received: from skyhawk.jf.intel.com (HELO [10.54.51.81]) ([10.54.51.81])
 by fmsmga002.fm.intel.com with ESMTP; 12 Dec 2019 09:07:09 -0800
Subject: Re: GPIO-Direction issue
To: Kumar Thangavel <thangavel.k@hcl.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <SG2PR04MB302999E339EF294C04B14DB6FD5A0@SG2PR04MB3029.apcprd04.prod.outlook.com>
From: James Feist <james.feist@linux.intel.com>
Message-ID: <b4de5043-0408-688b-f23b-396f7e21f0b1@linux.intel.com>
Date: Thu, 12 Dec 2019 09:07:08 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <SG2PR04MB302999E339EF294C04B14DB6FD5A0@SG2PR04MB3029.apcprd04.prod.outlook.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
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

On 12/11/19 4:50 AM, Kumar Thangavel wrote:
> Hi All,
> 
>          I am using entity manager configuration file(.json) to enable 
> the GPIO pin.
> 
>          The gpio node was created in /sys/class/gpio/* using 
> configuration files.
> 
>          I set Direction as "Out" in json. But it was not getting 
> changed in /sys/class/gpio/gpio*/Direction. The Direction was still 
> remains as "in".

Gpio usage via sysfs is deprecated. We're currently working to remove 
all usages of it ourselves that we have in entity-manager. I would 
suggest using libgpiod to use gpio via character device instead.

https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/tree/bindings/cxx

