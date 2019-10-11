Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B390ED448D
	for <lists+openbmc@lfdr.de>; Fri, 11 Oct 2019 17:38:49 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46qXDQ5wXHzDqcw
	for <lists+openbmc@lfdr.de>; Sat, 12 Oct 2019 02:38:46 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.24; helo=mga09.intel.com;
 envelope-from=jason.m.bills@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46qXCd361qzDqZb
 for <openbmc@lists.ozlabs.org>; Sat, 12 Oct 2019 02:38:04 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Oct 2019 08:38:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,284,1566889200"; d="scan'208";a="184797421"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga007.jf.intel.com with ESMTP; 11 Oct 2019 08:38:01 -0700
Received: from [10.241.244.103] (unknown [10.241.244.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 5800E5802B0;
 Fri, 11 Oct 2019 08:38:01 -0700 (PDT)
Subject: Re: why sel-logger not add all info to journal?
To: www <ouyangxuan10@163.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <6db4fd1b.3ba4.16db89fcc8b.Coremail.ouyangxuan10@163.com>
From: "Bills, Jason M" <jason.m.bills@linux.intel.com>
Message-ID: <7977c2a2-1432-3db2-e598-1f434dfd166e@linux.intel.com>
Date: Fri, 11 Oct 2019 08:38:01 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <6db4fd1b.3ba4.16db89fcc8b.Coremail.ouyangxuan10@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 10/10/2019 7:22 PM, www wrote:
> Dear all,
> 
> Add sel-logger to openbmc project, when threshold sensor generate log, 
> sel-logger will add message to journal, but why the message is incomplete?

By incomplete do you mean that you do not see the journal fields as 
shown in the sd_journal_send() call (MESSAGE_ID, IPMI_SEL_RECORD_ID, etc.)?

Journal entries are made up of various fields each of the form 
"VARIABLE=value".  By default, journalctl only shows the contents of the 
MESSAGE field which is what you show below.  If you want to see all of 
the fields in the journal entry you can use 'journalctl -o json-pretty' 
which will print the full journal entry as a JSON-style object.

> 
> |sd_journal_send("MESSAGE=%s", message.c_str(), "PRIORITY=%i", 
> selPriority, "MESSAGE_ID=%s", selMessageId, "IPMI_SEL_RECORD_ID=%d", 
> recordId, "IPMI_SEL_RECORD_TYPE=%x", selSystemType, 
> "IPMI_SEL_GENERATOR_ID=%x", genId, "IPMI_SEL_SENSOR_PATH=%s", 
> path.c_str(), "IPMI_SEL_EVENT_DIR=%x", assert, "IPMI_SEL_DATA=%s", 
> selDataStr, NULL);|
> 
> |Sep 30 01:39:48 demoboard sel-logger[1187]: P12V sensor crossed a 
> warning low threshold going low. Reading=0.089000 Threshold=11.400000. 
> Sep 30 01:39:48 demoboard sel-logger[1187]: P12V sensor crossed a 
> critical low threshold going low. Reading=0.089000 Threshold=10.220000. 
> Sep 30 01:39:48 demoboard sel-logger[1187]: P5V sensor crossed a warning 
> low threshold going low. Reading=0.231000 Threshold=4.750000. Sep 30 
> 01:39:48 demoboard sel-logger[1187]: P5V sensor crossed a critical low 
> threshold going low. Reading=0.231000 Threshold=4.500000. Sep 30 
> 01:39:48 demoboard sel-logger[1187]: P3V3 sensor crossed a warning low 
> threshold going low. Reading=0.002000 Threshold=3.100000. Sep 30 
> 01:39:48 demoboard sel-logger[1187]: P3V3 sensor crossed a critical low 
> threshold going low. Reading=0.002000 Threshold=3.070000. Sep 30 
> 01:39:49 demoboard sel-logger[1187]: PVCCIN_CPU1 sensor crossed a 
> warning low threshold going low. Reading=0.001000 Threshold=1.170000. 
> Sep 30 01:39:49 demoboard sel-logger[1187]: PVCCIN_CPU1 sensor crossed a 
> critical low threshold going low. Reading=0.001000 Threshold=1.070000.|||
> 
> |thanks,|
> |Byron|
> 
> 
