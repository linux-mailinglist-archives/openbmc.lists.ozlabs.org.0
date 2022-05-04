Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98853519929
	for <lists+openbmc@lfdr.de>; Wed,  4 May 2022 10:03:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KtTqZ333Kz3bfR
	for <lists+openbmc@lfdr.de>; Wed,  4 May 2022 18:03:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MX9cmwc6;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=mga12.intel.com (client-ip=192.55.52.136; helo=mga12.intel.com;
 envelope-from=przemyslaw.hawrylewicz.czarnowski@linux.intel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=MX9cmwc6; dkim-atps=neutral
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KtTq65hfwz2yWn
 for <openbmc@lists.ozlabs.org>; Wed,  4 May 2022 18:03:28 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651651411; x=1683187411;
 h=message-id:date:mime-version:from:subject:to:
 content-transfer-encoding;
 bh=47MDGrikji/FpGTET0sa8uy3TMzVytd0UQuz63wEqfw=;
 b=MX9cmwc69i0BW00KzVbbwYaQiPeoL3Xs/oAEmXSXy26CMCZH0oLHtVel
 Kelp7xy3T5xKFfO9YQ+pj8NU+vc3QBEagkkcD7MQQXPw4Ni9/8yavB7pz
 JRVGuubnk4qGzhf/8hNSF4+UiK6LtcxuAlBIWE7l9Xwk58N+ILOZcPIZp
 brx2yhhZvvpKTmuTfJ5ITv7aKD3Ajlye7xXwpJIUZrMpRIQoy6Ko9+yuq
 kg8qGSq/ccJiVvaowme0aaTjBbxWKALb5X2RSdb+oPXfIdXB4Bg3X+hua
 IfSi3mwV94xuXdxAZZdkmeaZ6xNxOBwLcoxFIEWcEZW7fWJXSbQrwOsfF A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10336"; a="247604757"
X-IronPort-AV: E=Sophos;i="5.91,197,1647327600"; d="scan'208";a="247604757"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2022 01:02:25 -0700
X-IronPort-AV: E=Sophos;i="5.91,197,1647327600"; d="scan'208";a="516922857"
Received: from dkowalsk-mobl1.ger.corp.intel.com (HELO [10.249.134.116])
 ([10.249.134.116])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2022 01:02:24 -0700
Message-ID: <793f0d90-64fd-1899-6a74-c1434152ad64@linux.intel.com>
Date: Wed, 4 May 2022 10:02:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
From: "Czarnowski, Przemyslaw"
 <przemyslaw.hawrylewicz.czarnowski@linux.intel.com>
Subject: Virtual Media upstream status
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Ed Tanous <ed@tanous.net>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
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

Hi group.

In response to Ed's request, I started this topic to discuss upstreaming 
activities (to both existing and new code). And to make update seamless 
and effective.

As service upstream is little stalled waiting for UT to be completed 
(almost completed), I wanted to attack the problem from another surface. 
I've pushed bmcweb patches as it got old since first submission.

There are two blocking problems I am aware of in current nbd_proxy code. 
First is that compilation fails. The second is a race appearing 
sometimes during disconnection. But those are the simple ones.

There is more to rework for redfish part. There are two patches
* Make status of InsertMedia action consistent (I29d53483) 
https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/53343/1
* Apply async dbus API (I1d016126) 
https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/53345/1

First one addresses simple problem with inconsistent responses from rest 
api calls connected with actions. Proxy mode does not support 
InsertMedia action, but is implemented for legacy so response has to be 
applied accordingly. It has been fixed with some code generalization.

The second one applies latest design changes 
(https://github.com/openbmc/docs/blob/master/designs/virtual-media.md, 
dbus communication part).

Those are must-have changes to work with the service state we upstream 
at the moment.

After service upstream is completed changes removing nbd_proxy option in 
meson has to be reverted as the last part.

No more activities are planned now from out side, but later on we may 
focus on adding privileges support for websockets (AFAIK it is not 
supported on level of web server yet).

-- 
Best regards,
Przemyslaw Czarnowski
