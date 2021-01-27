Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C22C2306183
	for <lists+openbmc@lfdr.de>; Wed, 27 Jan 2021 18:04:51 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DQqhw64jhzDqtQ
	for <lists+openbmc@lfdr.de>; Thu, 28 Jan 2021 04:04:48 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.126; helo=mga18.intel.com;
 envelope-from=adrian.ambrozewicz@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DQqgy23pdzDqZH
 for <openbmc@lists.ozlabs.org>; Thu, 28 Jan 2021 04:03:54 +1100 (AEDT)
IronPort-SDR: Idp+G08HSkpubUoZtpjlkI0lor1XDqkQ95Hs8qbY7ZH8s7D0wXuxM/wOxpRo+3CQ9YLUrL5ojF
 xv6+ugbvy/ew==
X-IronPort-AV: E=McAfee;i="6000,8403,9877"; a="167773313"
X-IronPort-AV: E=Sophos;i="5.79,380,1602572400"; d="scan'208";a="167773313"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2021 09:03:48 -0800
IronPort-SDR: 8cB3hr8XuW2gLe8vyKgPfdhwI1g0QoRkqcWmpHl8Vmq3gcA+hUqSmCQVQrf2PERkNILZYrgeS7
 18cTy8kxtBkQ==
X-IronPort-AV: E=Sophos;i="5.79,380,1602572400"; d="scan'208";a="362496462"
Received: from aambroze-mobl.ger.corp.intel.com (HELO [10.213.25.151])
 ([10.213.25.151])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2021 09:03:47 -0800
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
From: "Ambrozewicz, Adrian" <adrian.ambrozewicz@linux.intel.com>
Subject: ObjectMapper - quantity limitations?
Message-ID: <8fc3b7be-42bc-fc28-6bbd-c5d8de95feaf@linux.intel.com>
Date: Wed, 27 Jan 2021 18:03:35 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
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

I'm doing some performance measurements of OpenBMC telemetry subsystem. 
I'm using my custom app, which spawns valid D-Bus Sensors, I configure 
TelemetryService to monitor them and EventService to push MetricReports 
to external server.

I observe certain limitation on my system. Each sensor is mapped as two 
objects in ObjectMapper hierarchy. It seems that I am able to correctly 
create up to 1500 sensors. When I go above this limit part of the 
sensors are not represented in ObjectMapper tree.

Our use-case would most likely require creating even more sensors than 
the limit I've reached now. I'm just starting to investigate the issue 
and I would be happy if you could give me pointers or ideas what could 
be the culprit here.

Regards,
Adrian
