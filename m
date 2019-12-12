Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2521E11D1A2
	for <lists+openbmc@lfdr.de>; Thu, 12 Dec 2019 16:58:40 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Ydkj0s9SzDqfB
	for <lists+openbmc@lfdr.de>; Fri, 13 Dec 2019 02:58:37 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.100; helo=mga07.intel.com;
 envelope-from=james.feist@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47YdjL2cbtzDqyJ
 for <openbmc@lists.ozlabs.org>; Fri, 13 Dec 2019 02:57:23 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Dec 2019 07:57:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,306,1571727600"; d="scan'208";a="245776732"
Received: from skyhawk.jf.intel.com (HELO [10.54.51.81]) ([10.54.51.81])
 by fmsmga002.fm.intel.com with ESMTP; 12 Dec 2019 07:57:18 -0800
Subject: Re: Faking Sensor Readings
To: rgrs <rgrs@protonmail.com>
References: <QVdDJHlLW9JS_3uowBPTzSCb1dwpqJjml0ORFR_aQGpuKCve1l8Qwy4GF4X0_dgJmExy8sjJQD_VjnI-o4xwoYhivHJlSPBt42fc1cuDKjw=@protonmail.com>
 <0a4bb951-4f85-728a-8426-af629c870908@yadro.com>
 <234c1d26-7b59-0926-d6c2-6c49f75aab3f@linux.intel.com>
 <x5Z3U1jaa8Tf-HK1htUFoCqgAFdtIXGaDyEU7SKkgNkehJEtqaps9BvN2j_D5lsgjEgoTL81fZ8nJLitwFaqW2zRkFK8vXhbCrld3Ziy43o=@protonmail.com>
 <2de3b2e2-9b02-a1c2-d310-f6e546e72c1e@linux.intel.com>
 <JIIzLFDdd2_yAem6ToyksGqeJ7ulaTOylaocMLH19rYqyv3fSzcEL2H9VDJW66iYQY8L8FwjgpZqPFj8rRD0JP52xsAHQ6kD4_ygDAjj0LE=@protonmail.com>
 <e59e36d1-74fc-5f44-a472-26fdfb127af2@linux.intel.com>
 <iSeeVedIu2fcqVt4W4TlDAQNHMjfTxE0NUAs68nlqossQmqy5OdbHgn9YHO1kh88ZpFMHO6bpGL7ki2hS9mQgw2d7Dk2WQFH-o6jOH6e1g4=@protonmail.com>
 <8eb66be0-c5a4-ac3d-2421-8648c2fc4a4f@linux.intel.com>
 <EPYcrss0WRTceNCXy6GM0cmf5GE-4TzTQLyLuYd581ufdbKteABRuQArHVWcPPAHaCBK8_0nIRJ2DP5hSh5jS2AgDPjr_snA5bh91FU-OOI=@protonmail.com>
From: James Feist <james.feist@linux.intel.com>
Message-ID: <8cef3ef8-a275-2f36-dfeb-7b4da97c6f88@linux.intel.com>
Date: Thu, 12 Dec 2019 07:57:17 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <EPYcrss0WRTceNCXy6GM0cmf5GE-4TzTQLyLuYd581ufdbKteABRuQArHVWcPPAHaCBK8_0nIRJ2DP5hSh5jS2AgDPjr_snA5bh91FU-OOI=@protonmail.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Alexander Amelkin <a.amelkin@yadro.com>, "Thomaiyar,
 Richard Marian" <richard.marian.thomaiyar@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 12/11/19 9:28 PM, rgrs wrote:
> Hi James,
> 
> Thanks for the help.
> 
> One more clarification please,
> 
> How is entity-manager different from phoshor-hwmon conf files?
> 

Entity-manager does runtime detection based on available d-bus 
properties. In most cases it's based on Fru Detection, but anything on 
d-bus can be used to configure. So you can write Probe statements (at 
the bottom of the configuration files in most cases) that say when this 
key/value pair exists on d-bus, install this configuration. This is most 
useful for add-in-cards or other removable devices, so that when it 
exists, the configuration gets loaded. For example this retimer card 
https://github.com/openbmc/entity-manager/blob/master/configurations/PCIE%20SSD%20Retimer.json 
says when a Fru Exists with BOARD_PRODUCT_NAME set to a specific value, 
then load these sensors. It can then export sensors to sysfs as well if 
needed. Entity-manager is also not limited to sensors, it also 
configures things like phosphor-pid-control 
https://github.com/openbmc/entity-manager/blob/7d807754cc9153b04b599804464edd9654d7a81e/configurations/WFT%20Baseboard.json#L1678. 
We use it specifically so we can use 1 binary for multiple baseboards 
assuming similar i2c topology. At a high-level view, it takes JSON and 
when appropriate fields are available on d-bus, puts a system 
configuration on d-bus, along with being able to export some i2c devices.

Hope this helps

-James

