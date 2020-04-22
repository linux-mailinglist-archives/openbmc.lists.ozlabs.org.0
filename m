Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BE76A1B428C
	for <lists+openbmc@lfdr.de>; Wed, 22 Apr 2020 13:02:34 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 496cw76v6HzDq7j
	for <lists+openbmc@lfdr.de>; Wed, 22 Apr 2020 21:02:31 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=mga12.intel.com (client-ip=192.55.52.136; helo=mga12.intel.com;
 envelope-from=adrian.ambrozewicz@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 496ctD4jbjzDqbF
 for <openbmc@lists.ozlabs.org>; Wed, 22 Apr 2020 21:00:49 +1000 (AEST)
IronPort-SDR: BEhhqaPVENp+MLvDdFnoO/CsE47osCBXd1gxI2GB+yhOvSRa7cRUWHnZekqp/JFHFR2tf5z0uM
 vlGWUFcpr8DA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2020 04:00:43 -0700
IronPort-SDR: Jo7MYunG4DAwKyJCQr+OyGHK1ncvxxt+FU7ab46tuhVuLxgyOmEEJOK3DbDjye3LV8D84TzoMz
 IywVoxF2gnTA==
X-IronPort-AV: E=Sophos;i="5.72,414,1580803200"; d="scan'208";a="244481353"
Received: from aambroze-mobl1.ger.corp.intel.com (HELO [10.249.143.235])
 ([10.249.143.235])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2020 04:00:42 -0700
From: =?UTF-8?Q?Adrian_Ambro=c5=bcewicz?= <adrian.ambrozewicz@linux.intel.com>
Subject: phosphor-dbus-interfaces modification process for existing YAML
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Message-ID: <29a3376f-d82d-057c-e2d5-0fe250b55951@linux.intel.com>
Date: Wed, 22 Apr 2020 13:00:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
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

Hello,

OpenBMC Sensor interface is specified here:
https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/xyz/openbmc_project/Sensor/Value.interface.yaml

We would need to extend it with new hierarchy/namespace : utilization, 
and corresponding Unit: Percent.

Should I push change directly to review or do I need to discuss it 
earlier with someone? My first thought was to address 
https://github.com/openbmc/docs/blob/master/architecture/sensor-architecture.md 
, however this document doesn't seem to address these details.

Regards,
Adrian
