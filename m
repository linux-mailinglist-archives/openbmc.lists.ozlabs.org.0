Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B3D1523DB7B
	for <lists+openbmc@lfdr.de>; Thu,  6 Aug 2020 17:59:59 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BMtVM2svbzDqF3
	for <lists+openbmc@lfdr.de>; Fri,  7 Aug 2020 01:59:55 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=mga12.intel.com (client-ip=192.55.52.136; helo=mga12.intel.com;
 envelope-from=jason.m.bills@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.intel.com
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BMtT35Y6xzDqpK
 for <openbmc@lists.ozlabs.org>; Fri,  7 Aug 2020 01:58:45 +1000 (AEST)
IronPort-SDR: 3LaFTv7A7ZAJvJbEfw2F64qqwIzibNQFgfCCMjXlSPMmv1H3EzmwzrnGWxX3ZojwdUjROog3kc
 PthsqDr6y/pw==
X-IronPort-AV: E=McAfee;i="6000,8403,9704"; a="132396275"
X-IronPort-AV: E=Sophos;i="5.75,441,1589266800"; d="scan'208";a="132396275"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2020 08:58:42 -0700
IronPort-SDR: rTkcr7Fdb2metmI5dAtaUgP+2kFEYyRHwf78W+koQHUpePFDTsHG1Z3JqKmXn3HVPAX3H+VNOB
 EvklsiE+rs6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,441,1589266800"; d="scan'208";a="276420671"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga008.fm.intel.com with ESMTP; 06 Aug 2020 08:58:42 -0700
Received: from [10.213.186.212] (jmbills-mobl.amr.corp.intel.com
 [10.213.186.212])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id E53F2580718
 for <openbmc@lists.ozlabs.org>; Thu,  6 Aug 2020 08:58:41 -0700 (PDT)
Subject: Re: [OpenBMC] ADD SEL Command , support or not
To: openbmc@lists.ozlabs.org
References: <07e7b91809d3425aa5b3b41e5a63d834@zhaoxin.com>
From: "Bills, Jason M" <jason.m.bills@linux.intel.com>
Message-ID: <219483d6-802b-8ff4-93ff-40690b3e8334@linux.intel.com>
Date: Thu, 6 Aug 2020 08:58:41 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <07e7b91809d3425aa5b3b41e5a63d834@zhaoxin.com>
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



On 8/5/2020 7:19 PM, Tiger Liu(BJ-RD) wrote:
> Hi, Experts:
> 
> I have a question about “ADD SEL” command.
> 
> I am trying OpenBMC Code with a motherboard(with AST2500 chip).
> 
> I tried to send an ADD SEL command to BMC FW, but failed.
> 
> The response data’s record ID is all FF, it seemed not a normal record ID.
> 
> So, my question is:
> 
> Current OpenBMC Firmware supports “ADD SEL” command?
In intel-ipmi-oem, we don't support adding raw data to the IPMI SEL, so 
the ADD SEL command is overridden to add the raw SEL data to the Redfish 
event log.  It will return 0xFFFF to show that the command was 
successful but no valid IPMI SEL entry was added, which may be what you 
are seeing if you use intel-ipmi-oem.

> 
> Thanks
> 
> 
> 
> 保密声明：
> 本邮件含有保密或专有信息，仅供指定收件人使用。严禁对本邮件或其内容做任何 
> 未经授权的查阅、使用、复制或转发。
> /CONFIDENTIAL NOTE: /
> /This email contains confidential or legally privileged information and 
> is for the sole use of its intended recipient. Any unauthorized review, 
> use, copying or forwarding of this email or the content of this email is 
> strictly prohibited./
