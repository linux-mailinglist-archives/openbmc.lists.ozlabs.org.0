Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B2C3164B91
	for <lists+openbmc@lfdr.de>; Wed, 19 Feb 2020 18:12:09 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48N45f2vjtzDqMw
	for <lists+openbmc@lfdr.de>; Thu, 20 Feb 2020 04:12:06 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.115; helo=mga14.intel.com;
 envelope-from=james.feist@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48N4550XcLzDqDB
 for <openbmc@lists.ozlabs.org>; Thu, 20 Feb 2020 04:11:36 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Feb 2020 09:11:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,461,1574150400"; d="scan'208";a="254160982"
Received: from skyhawk.jf.intel.com (HELO [10.54.51.81]) ([10.54.51.81])
 by orsmga002.jf.intel.com with ESMTP; 19 Feb 2020 09:11:33 -0800
Subject: Re: dbus-sensor: setting the upper non-critical(unc) threshold value
 smaller than reading value would get 3 logs ( assert log,
 de-assert log and then assert log)
To: Max Lai/WYHQ/Wiwynn <Max_Lai@wiwynn.com>
References: <HK2PR02MB38260025D3279EB8DBF0523CEA100@HK2PR02MB3826.apcprd02.prod.outlook.com>
From: James Feist <james.feist@linux.intel.com>
Message-ID: <900ef2d7-3755-a3f1-ad40-4cd9e849ebf7@linux.intel.com>
Date: Wed, 19 Feb 2020 09:11:28 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <HK2PR02MB38260025D3279EB8DBF0523CEA100@HK2PR02MB3826.apcprd02.prod.outlook.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Delphine Chiu/WYHQ/Wiwynn <DELPHINE_CHIU@wiwynn.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 2/18/20 5:32 PM, Max Lai/WYHQ/Wiwynn wrote:
> *Hi James,*
> 
> *Our validation team met a problem in dbus-sensor recently. The bug is 
> about that if we set the upper non-critical (unc) threshold value 
> smaller than reading value, we should get only one assert log but we got 
> 3 logs ( assert log, de-assert log and then assert log) .*
> 
> *We traced the code of Ipmbsensor. The picture below is the code flow of 
> Ipmbsensor.*
> 
> **
> 
> **
> 
> **
> 
> *We found that when we set the threshold , the function match 
> (configMatch) which is registered in Ipmbsensor would catch the signal 
> like the below*
> 
> **
> 
> **
> 
> **
> 
> *When it trigger the handler (eventhandler) and then enter the function 
> of createsensor() and later enter the function of 
> setInitialProperties(). In the setInitialProperties(), It would initial 
> the property (setting the threshold of alarm to default (false) is the 
> root cause). This would trigger Ipmbsensor to send the deassert log. We 
> was wondering that why setting the threshold would initial the property. 
> Is the code flow we draw is correct? Is there any misunderstanding in 
> our thought ? What is the purpose of registering match this signal ?*

Because configurations can change at runtime. For instance if you change 
a threshold, or you add/remove a card. This gets persisted back to 
entity-manager 
https://github.com/openbmc/dbus-sensors/blob/a97f1343379bbb52371195bc613a689cbfb374f3/src/Thresholds.cpp#L118 
and that will trigger an update.

I'm guessing this todo is what is needed to fix your issue:
https://github.com/openbmc/dbus-sensors/blob/a97f1343379bbb52371195bc613a689cbfb374f3/include/sensor.hpp#L117

I was wondering when I wrote this if the config can just update the 
threshold, and updating it locally was not needed. Deleting lines 117 
and 118 might fix your issue.


> 
> **
> 
> *Our source revision :**fb64f45d3399b182ceadffb8fa86ee68c0aa0a11*
> 
> **
> 
> *Note: We found that this issue didn’t happen in CPUSensor and 
> HwmonTempSensor.*
> 
> **
> 
> *Regards,*
> 
> *Max Lai*
> 
> *---------------------------------------------------------------------------------------------------------------------------------------------------------------*
> 
> *This email contains confidential or legally privileged information and 
> is for the sole use of its intended recipient. *
> 
> *Any unauthorized review, use, copying or distribution of this email or 
> the content of this email is strictly prohibited.*
> 
> *If you are not the intended recipient, you may reply to the sender and 
> should delete this e-mail immediately.*
> 
> *---------------------------------------------------------------------------------------------------------------------------------------------------------------*
> 
