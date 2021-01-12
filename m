Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EBC9B2F29CE
	for <lists+openbmc@lfdr.de>; Tue, 12 Jan 2021 09:15:33 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DFNg540pYzDqyP
	for <lists+openbmc@lfdr.de>; Tue, 12 Jan 2021 19:15:29 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.151; helo=mga17.intel.com;
 envelope-from=zbigniew.lukwinski@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.intel.com
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DFNfD4CffzDqwp
 for <openbmc@lists.ozlabs.org>; Tue, 12 Jan 2021 19:14:40 +1100 (AEDT)
IronPort-SDR: E5j4Y0DvSAw0pOvGBbzQhplRUJBDaTe3iPkeTYjkSTmyZ47Ilinme8b/n8XikMQ0D7TJ2pLqY+
 0A88Z5lI8agg==
X-IronPort-AV: E=McAfee;i="6000,8403,9861"; a="157779324"
X-IronPort-AV: E=Sophos;i="5.79,340,1602572400"; d="scan'208";a="157779324"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2021 00:14:35 -0800
IronPort-SDR: ZyKZ2tgpPQxX4i1LXhj/sFGmCJ7HD07Vu/Y3tG6JjfdojU4Gxb7MsrNJLraxes6v4cuMgtnDy4
 AqE7/oatCLfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,340,1602572400"; d="scan'208";a="400093070"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga002.fm.intel.com with ESMTP; 12 Jan 2021 00:14:35 -0800
Received: from [10.91.127.224] (zlukwins-pc.igk.intel.com [10.91.127.224])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 46460580679;
 Tue, 12 Jan 2021 00:14:35 -0800 (PST)
Subject: Re: READ_EIN/READ_EOUT
To: Mike Jones <proclivis@gmail.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <9E1C7198-6C02-4A72-BE5C-5CF05AF2E9BB@gmail.com>
From: zlukwins <zbigniew.lukwinski@linux.intel.com>
Message-ID: <4fc21302-a3e1-075f-cc34-a73881d34499@linux.intel.com>
Date: Tue, 12 Jan 2021 09:08:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <9E1C7198-6C02-4A72-BE5C-5CF05AF2E9BB@gmail.com>
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


On 1/11/21 10:48 PM, Mike Jones wrote:
> Within the PMBus standard are two commands for energy: READ_EIN, READ_EOUT.
>
> These commands exist on both regulators and hot swap devices.
>
> - Are these functions getting used?
Right now these commands are not used. There is no hwmon implementation yet.
>   -And if so, to what purpose, examples of where to look in the layers for the usage, and any other helpful pointers

These commands are alternative for READ_PIN/READ_POUT. They could be 
used to calculate input/output power on your own. They allow you to 
implement your own algorithm (different averaging period, different 
sampling freq, etc.) for power calulcation


------------

Regards

Zbigniew Lukwinski

