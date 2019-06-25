Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D08F755452
	for <lists+openbmc@lfdr.de>; Tue, 25 Jun 2019 18:19:20 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45YBF22YQpzDqSW
	for <lists+openbmc@lfdr.de>; Wed, 26 Jun 2019 02:19:18 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.43; helo=mga05.intel.com;
 envelope-from=richard.marian.thomaiyar@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45YBDK1WlSzDqJg
 for <openbmc@lists.ozlabs.org>; Wed, 26 Jun 2019 02:18:39 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 25 Jun 2019 09:18:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,416,1557212400"; d="scan'208";a="166729067"
Received: from rthomaiy-mobl2.gar.corp.intel.com (HELO [10.252.67.211])
 ([10.252.67.211])
 by orsmga006.jf.intel.com with ESMTP; 25 Jun 2019 09:18:33 -0700
To: wak@google.com, Vernon Mauery <vernon.mauery@linux.intel.com>,
 ed.tanous@intel.com, openbmc@lists.ozlabs.org
From: "Thomaiyar, Richard Marian" <richard.marian.thomaiyar@linux.intel.com>
Subject: Reg sdbusplus - async handlers - D-Bus error not getting reflected
Message-ID: <8f7ab4ab-99fe-edeb-f0dd-5eb38c480f79@linux.intel.com>
Date: Tue, 25 Jun 2019 21:48:32 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
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

Hi,

In sdbusplus code, async_send_handler callback() uses the 
sdbusplus::message::message.get_errorno() 
https://github.com/openbmc/sdbusplus/blob/master/sdbusplus/asio/detail/async_send_handler.hpp#L66 
function to instantiate the boost::system::error_code. Unfortunately, 
none of our D-Bus exception throwing functionality sets the error_no to 
a proper one, but instead updates only the error_message field 
https://github.com/openbmc/sdbusplus/blob/master/tools/sdbusplus/templates/method.mako.prototype.hpp.in#L171 
causing the error_code instance to always return a generic error code 
value, instead of a proper one. Because of this applications which uses 
the asio logic will not be able to differentiate between exceptions 
thrown / errors from D-Bus.

Planning to fix the same in 2 step,

1. To make all D-Bus exception to set the errorno properly using 
sd_bus_error_set_errno and getting the error from the yaml if available 
else return generic one (so that no change in existing daemon will be 
required).

2. make change in async_send_handler_callaback, such that derived class 
of boost::system::error_code is returned, which will hold the error 
message too. Any daemon which uses asio logic, can depend on ec.value() 
as primary exception identifier or ec.message() for any detailed 
exception thrown.

Let me know your thoughts , and if agree, will start implementing the same.

Regards,

Richard

