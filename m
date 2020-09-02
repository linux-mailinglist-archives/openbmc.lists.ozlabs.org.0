Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2443B25B60B
	for <lists+openbmc@lfdr.de>; Wed,  2 Sep 2020 23:40:37 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bhcmx1C9pzDr0T
	for <lists+openbmc@lfdr.de>; Thu,  3 Sep 2020 07:40:33 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.115; helo=mga14.intel.com;
 envelope-from=jason.m.bills@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.intel.com
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bhclx4YkMzDr02
 for <openbmc@lists.ozlabs.org>; Thu,  3 Sep 2020 07:39:40 +1000 (AEST)
IronPort-SDR: Y1lNMy30gau1zgyU8N46dkO9UKSIQQ5QWRG7oz4vykTgS83vD9TC3PmK04CZqMLP6bvdhy+Lro
 U/vI3kbRcUOQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9732"; a="156753058"
X-IronPort-AV: E=Sophos;i="5.76,384,1592895600"; d="scan'208";a="156753058"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2020 14:39:37 -0700
IronPort-SDR: /vNhvVlqF8aDkRe3sw8KFg3+OPRh9myxpP1L0CoR253LWsdQjE1Q3y4OO9ST/sAKSL+gk18G58
 TyNP78QucFLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,384,1592895600"; d="scan'208";a="339056040"
Received: from linux.intel.com ([10.54.29.200])
 by FMSMGA003.fm.intel.com with ESMTP; 02 Sep 2020 14:39:37 -0700
Received: from [10.212.148.106] (jmbills-MOBL.amr.corp.intel.com
 [10.212.148.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id CDECC5807AA
 for <openbmc@lists.ozlabs.org>; Wed,  2 Sep 2020 14:39:36 -0700 (PDT)
Subject: Re: When building OpenBMC . . . ?
To: openbmc@lists.ozlabs.org
References: <c9737b1c67174a4fa9666b1d8afde380@SCL-EXCHMB-13.phoenix.com>
 <20200901122409.GQ3532@heinlein>
 <CACWQX83AjdYMXYzsjed0p6GgEMBb18CtC9qb-9OPcU8HbzK7Bw@mail.gmail.com>
 <2249bb47512947dab406345cfee1206d@SCL-EXCHMB-13.phoenix.com>
 <20200902191019.GY3532@heinlein>
 <5455ced096a74069b08230ad9a46a945@SCL-EXCHMB-13.phoenix.com>
From: "Bills, Jason M" <jason.m.bills@linux.intel.com>
Message-ID: <3d601f16-2a80-bbac-d8f2-010e20a8b482@linux.intel.com>
Date: Wed, 2 Sep 2020 14:39:36 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <5455ced096a74069b08230ad9a46a945@SCL-EXCHMB-13.phoenix.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 9/2/2020 12:50 PM, Patrick Voelker wrote:
>   
>> On Wed, Sep 02, 2020 at 06:50:01PM +0000, Patrick Voelker wrote:
>>> I'm giving the first option below a try.  I've defined an alternative variant
>> and have included the meta-facebook/meta-tiogapass layer in my build.
>>>
>>> One problem I'm running into is that meta-tiogapass includes a
>> rsyslog*.bbappend and one of the other layers I'm using also has a similar
>> rsyslog*.bbappend.
>>>
>>> Each do an append to do_install() and each one tries to remove
>> ${D}${sysconfdir}/rsyslog.d/imjournal.conf.  Of course that file can only be
>> removed once so the build fails.
>>>
>>> My question now, is what's the best way to work around this?  I don't need
>> rsyslog from meta-tiogapass, just the machine specifics.
>>
>> If this is a common pattern, we should try to contribute it upstream to Yocto
>> as a PACKAGECONFIG option.  Then we can add to the PACKAGECONFIG in
>> the bbappend (you can do that as many times as you want).
>>
>> If we don't think Yocto would accept it, or they reject it, but it is still
>> something we're seeing often in our systems we can similarly add it as a
>> common bbappend in meta-phosphor (ideally triggered by a
>> PACKAGECONFIG).
> 
> Thanks for the response but I'm having a hard time connecting the dots.
> 
> My understanding of PACKAGECONFIG is that it's a way to provide build options for individual packages.  In this case, what PACKAGECONFIG option would we be contributing?
> 
> Is there a way now for me to force bitbake to ignore (or not use) rsyslog*.bbappend in meta-tiogapass from another layer?
> 
> The two appends that are conflicting are:
> meta-facebook/meta-tiogapass/recipes-extended/rsyslog/rsyslog_%.bbappend
> meta-intel/meta-common/recipes-extended/rsyslog/rsyslog_%.bbappend
I hit a similar issue when moving this recipe out of my downstream 
build.  I was able to resolve it by putting this change in my downstream 
version:
diff --git a/meta-common/recipes-extended/rsyslog/rsyslog_%.bbappend 
b/meta-common/recipes-extended/rsyslog/rsyslog_%.bbappend
index 7e282804..ef670451 100644
--- a/meta-common/recipes-extended/rsyslog/rsyslog_%.bbappend
+++ b/meta-common/recipes-extended/rsyslog/rsyslog_%.bbappend
@@ -17,7 +17,7 @@ do_install_append() {
          install -d ${D}${systemd_system_unitdir}/rsyslog.service.d
          install -m 0644 ${WORKDIR}/rsyslog-override.conf \
 
${D}${systemd_system_unitdir}/rsyslog.service.d/rsyslog-override.conf
-        rm ${D}${sysconfdir}/rsyslog.d/imjournal.conf
+        rm -f ${D}${sysconfdir}/rsyslog.d/imjournal.conf
  }

  SYSTEMD_SERVICE_${PN} += " rotate-event-logs.service 
rotate-event-logs.timer"

We can apply a similar change to one or both of these upstream recipes. 
Or, is this a candidate for meta-phosphor?

> 
> Can I choose one over the other instead of having them build upon eachother?
> 
