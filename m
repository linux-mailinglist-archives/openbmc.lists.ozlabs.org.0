Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B063A210993
	for <lists+openbmc@lfdr.de>; Wed,  1 Jul 2020 12:42:49 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49xd926qlLzDqpk
	for <lists+openbmc@lfdr.de>; Wed,  1 Jul 2020 20:42:46 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=mga12.intel.com (client-ip=192.55.52.136; helo=mga12.intel.com;
 envelope-from=adrian.ambrozewicz@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.intel.com
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49xd7z300dzDqvW
 for <openbmc@lists.ozlabs.org>; Wed,  1 Jul 2020 20:41:48 +1000 (AEST)
IronPort-SDR: qdBQ7wBZZYMNZqInNiN01hcjdQAVvBs3abmUCNRmJLZiWvaMIU3fB1LGxD77IQUkujkagWDYOe
 Y6a4TDVkf1Yg==
X-IronPort-AV: E=McAfee;i="6000,8403,9668"; a="126157636"
X-IronPort-AV: E=Sophos;i="5.75,299,1589266800"; d="scan'208";a="126157636"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2020 03:41:45 -0700
IronPort-SDR: CV/tT/x8JX9OUfr/ahxQV4rF37DzBlQsGsIGXiLJTZoR6urUOBG4gtctQZWWzo1FUg1EYKeo2j
 iIBQUuy41PoA==
X-IronPort-AV: E=Sophos;i="5.75,299,1589266800"; d="scan'208";a="455058061"
Received: from aambroze-mobl1.ger.corp.intel.com (HELO [10.249.154.40])
 ([10.249.154.40])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2020 03:41:43 -0700
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 jozef.wludzik@intel.com, krzysztof.grobelny@intel.com,
 "Matuszczak, Piotr" <piotr.matuszczak@intel.com>
From: =?UTF-8?Q?Adrian_Ambro=c5=bcewicz?= <adrian.ambrozewicz@linux.intel.com>
Subject: TelemetryService - all pieces delivered, help needed
Message-ID: <bde6b048-9588-075b-ef86-04972288c1c4@linux.intel.com>
Date: Wed, 1 Jul 2020 12:41:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello everyone,

Thanks to commitment of Piotr Matuszczak, Jozef Wludzik and Krzysztof 
Grobelny we are finally able to publish all pieces of OpenBMC Telemetry
solution designed here: 
https://github.com/openbmc/docs/blob/master/designs/telemetry.md

Application sources:
https://gerrit.openbmc-project.xyz/c/openbmc/telemetry/+/34273

DBus interface specification:
https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-dbus-interfaces/+/34095

Redfish frontend:
https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/31692 and several 
on top of that.

I would like to invite all interested parties to participate in 
reviewing the code and making it part of OpenBMC solution.

We have more challenges ahead of us, which we will try to address as 
next steps:
- enabling Jenkins build (will appreciate hints here on getting started),
- enabling automated UT execution, formatting etc,
- working on new features, as whole design was not yet addressed.

Regards,
Adrian
