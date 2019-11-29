Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DBAAD10D601
	for <lists+openbmc@lfdr.de>; Fri, 29 Nov 2019 14:14:00 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47PZhj5kRYzDrCG
	for <lists+openbmc@lfdr.de>; Sat, 30 Nov 2019 00:13:57 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.151; helo=mga17.intel.com;
 envelope-from=adrian.ambrozewicz@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47PZgd5sMszDr8r
 for <openbmc@lists.ozlabs.org>; Sat, 30 Nov 2019 00:13:00 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Nov 2019 05:12:55 -0800
X-IronPort-AV: E=Sophos;i="5.69,257,1571727600"; d="scan'208";a="203734522"
Received: from aambroze-mobl1.ger.corp.intel.com (HELO [10.102.85.150])
 ([10.102.85.150])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
 29 Nov 2019 05:12:54 -0800
To: vernon.mauery@linux.intel.com, wak@google.com, spinler@us.ibm.com
From: =?UTF-8?Q?Adrian_Ambro=c5=bcewicz?= <adrian.ambrozewicz@linux.intel.com>
Subject: sdbusplus - unit test failing on CI (VtableTest::SameContent)
Message-ID: <4c60de1f-d143-0024-d6b5-815e51df5bf2@linux.intel.com>
Date: Fri, 29 Nov 2019 14:12:52 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello,

Both my (https://gerrit.openbmc-project.xyz/c/openbmc/sdbusplus/+/27630) 
and Matts 
(https://gerrit.openbmc-project.xyz/c/openbmc/sdbusplus/+/27426) patches 
have been blocked by fail in VtableTest::SameContent 
(./test/vtable/vtable.cpp).

Both of those changes seems not very related to merit of the test, which 
verifies consistency in mapping between native sd_bus_vtable 
initializers and sdbusplus counterpart.

On my machine this test is passing so I'm afraid there is some runtime 
factor which breaks that test in some cases..

Vernon, William - any suggestions?

Regards,
Adrian
