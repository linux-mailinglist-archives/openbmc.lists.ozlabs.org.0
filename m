Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B2E5956D95
	for <lists+openbmc@lfdr.de>; Wed, 26 Jun 2019 17:24:41 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45YmzV298ZzDqMK
	for <lists+openbmc@lfdr.de>; Thu, 27 Jun 2019 01:24:38 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.100; helo=mga07.intel.com;
 envelope-from=richard.marian.thomaiyar@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Ymwx1WJSzDqWx
 for <openbmc@lists.ozlabs.org>; Thu, 27 Jun 2019 01:22:22 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Jun 2019 08:22:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,420,1557212400"; d="scan'208";a="162320545"
Received: from rthomaiy-mobl2.gar.corp.intel.com (HELO [10.252.75.193])
 ([10.252.75.193])
 by fmsmga008.fm.intel.com with ESMTP; 26 Jun 2019 08:22:17 -0700
Subject: Re: Reg sdbusplus - async handlers - D-Bus error not getting reflected
To: Lei YU <mine260309@gmail.com>
References: <8f7ab4ab-99fe-edeb-f0dd-5eb38c480f79@linux.intel.com>
 <CAARXrtkyGn6ZxGPeCwFLbAtvQW44O=5sDyjvTHQci7E6CmwfEg@mail.gmail.com>
From: "Thomaiyar, Richard Marian" <richard.marian.thomaiyar@linux.intel.com>
Message-ID: <dc937b26-2194-b93e-398d-d15b51ebf9e5@linux.intel.com>
Date: Wed, 26 Jun 2019 20:52:16 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <CAARXrtkyGn6ZxGPeCwFLbAtvQW44O=5sDyjvTHQci7E6CmwfEg@mail.gmail.com>
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
Cc: Vernon Mauery <vernon.mauery@linux.intel.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, "Tanous,
 Ed" <ed.tanous@intel.com>, William Kennington <wak@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Lei,

https://gerrit.openbmc-project.xyz/c/openbmc/sdbusplus/+/21611  is exactly what i had in mind for #2 but still looking for #1, so that error_no can be propagated, at this point of time, it is not set from D-Bus daemon.

https://gerrit.openbmc-project.xyz/c/openbmc/sdbusplus/+/22481 - is merged, and it solves async_send, but doesn't work for async_method_call(). Any situation in which you have used in async_method_call() ?

regards,
Richard

On 6/26/2019 12:40 PM, Lei YU wrote:
> On Wed, Jun 26, 2019 at 12:19 AM Thomaiyar, Richard Marian
> <richard.marian.thomaiyar@linux.intel.com> wrote:
>> Hi,
>>
>> In sdbusplus code, async_send_handler callback() uses the
>> sdbusplus::message::message.get_errorno()
>> https://github.com/openbmc/sdbusplus/blob/master/sdbusplus/asio/detail/async_send_handler.hpp#L66
>> function to instantiate the boost::system::error_code. Unfortunately,
>> none of our D-Bus exception throwing functionality sets the error_no to
>> a proper one, but instead updates only the error_message field
>> https://github.com/openbmc/sdbusplus/blob/master/tools/sdbusplus/templates/method.mako.prototype.hpp.in#L171
>> causing the error_code instance to always return a generic error code
>> value, instead of a proper one. Because of this applications which uses
>> the asio logic will not be able to differentiate between exceptions
>> thrown / errors from D-Bus.
>>
>> Planning to fix the same in 2 step,
>>
>> 1. To make all D-Bus exception to set the errorno properly using
>> sd_bus_error_set_errno and getting the error from the yaml if available
>> else return generic one (so that no change in existing daemon will be
>> required).
>>
>> 2. make change in async_send_handler_callaback, such that derived class
>> of boost::system::error_code is returned, which will hold the error
>> message too. Any daemon which uses asio logic, can depend on ec.value()
>> as primary exception identifier or ec.message() for any detailed
>> exception thrown.
>>
>> Let me know your thoughts , and if agree, will start implementing the same.
>>
>> Regards,
>>
>> Richard
> I am glad that you feel the same way!
> The patch https://gerrit.openbmc-project.xyz/c/openbmc/sdbusplus/+/21611 was
> submitted trying to resolve the issue.
> And during review, it's noticed that there is a better way to achieve the goal,
> that the DBus error is returned by the message.
>
> So we have https://gerrit.openbmc-project.xyz/c/openbmc/sdbusplus/+/22481
>
> Now in sdbusplus, message::get_error() is added, and the caller could get the
> sd_bus_error* from the returned message, and get the DBus exception details
> from the sd_bus_error.
>
> See examples at
> https://github.com/openbmc/bmcweb/blob/e4a4b9a95622b8e1c1bae93718699ad19f4882ac/include/openbmc_dbus_rest.hpp#L1385-L1403
> https://github.com/openbmc/bmcweb/blob/e4a4b9a95622b8e1c1bae93718699ad19f4882ac/include/openbmc_dbus_rest.hpp#L1882-L1893
