Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 119F134FC8
	for <lists+openbmc@lfdr.de>; Tue,  4 Jun 2019 20:22:55 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45JKzJ2ZyHzDqT6
	for <lists+openbmc@lfdr.de>; Wed,  5 Jun 2019 04:22:52 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.24; helo=mga09.intel.com;
 envelope-from=vernon.mauery@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45JKyv2ZyDzDqFL
 for <openbmc@lists.ozlabs.org>; Wed,  5 Jun 2019 04:22:30 +1000 (AEST)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Jun 2019 11:22:26 -0700
Received: from vmauery-desk.jf.intel.com (HELO mauery.jf.intel.com)
 ([10.7.150.62])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Jun 2019 11:22:25 -0700
Date: Tue, 4 Jun 2019 11:22:24 -0700
From: Vernon Mauery <vernon.mauery@linux.intel.com>
To: Lei YU <mine260309@gmail.com>
Subject: Re: [Design] PSU firmware update
Message-ID: <20190604182224.GC46814@mauery.jf.intel.com>
References: <CAARXrt=6mZtVuwdTxamjUWXJk5RXNKaNM9aVZE5nEyTjowVjEQ@mail.gmail.com>
 <CALLMt=pdm=Nk5sCZvZBORb+N5suT7-FK0xbvWUy3Qxg5KcttKA@mail.gmail.com>
 <BL0PR2101MB09320BD7856E280C04852CB1C8140@BL0PR2101MB0932.namprd21.prod.outlook.com>
 <CAARXrtnJ1SsSVb2Y=5tvVVQtOouUpmZR4XoY4p=vhgizHmh4hA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAARXrtnJ1SsSVb2Y=5tvVVQtOouUpmZR4XoY4p=vhgizHmh4hA@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Neeraj Ladkani <neladk@microsoft.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 04-Jun-2019 10:58 AM, Lei YU wrote:
>On Tue, Jun 4, 2019 at 1:23 AM Neeraj Ladkani <neladk@microsoft.com> wrote:
>>
>> 1. Why host power off is a pre-condition? We should add this a PSU pre-requisite to support Live upgrade and activation.
>
>Derek's reply explains the reason why we want to the host power off as
>pre-condition.

I don't think host power off should be a requirement. Our power supplies 
run safely in their bootloader while doing a firmware update and can 
keep the power on.

--Vernon

>> 2. How should PSU update impact PSU and battery monitoring ? should there be coordination between sensor monitoring task during update ?
>
>This is a good point. During PSU update, the driver probably should be unbind,
>and after the update is one, rebind the driver.
>Does that sounds OK?
>
>> 3. PSU may have multiple regions like bootloader, active region and inactive region. We should design to support multiple region update.
>
>I do not have detailed information about this, which is more suitable to let
>the vendor-specific tool to handle the multiple regions.
>What do you think?
>
>> 4. Can you propose required SEL logs and telemetry requirements as well ?
>
>While I was writing this design doc, I was not thinking about the detailed SEL
>logs.
>Will need some time to discuss this and see if it shall be covered in this doc
>or not.
