Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DDCBA3FA2
	for <lists+openbmc@lfdr.de>; Fri, 30 Aug 2019 23:26:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Kswt3dpkzDrDD
	for <lists+openbmc@lfdr.de>; Sat, 31 Aug 2019 07:26:22 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (helo) smtp.helo=mga12.intel.com
 (client-ip=192.55.52.136; helo=mga12.intel.com;
 envelope-from=terry.s.duncan@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46KswG5C8vzDqRn
 for <openbmc@lists.ozlabs.org>; Sat, 31 Aug 2019 07:25:48 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 30 Aug 2019 14:25:45 -0700
X-IronPort-AV: E=Sophos;i="5.64,447,1559545200"; d="scan'208";a="175731756"
Received: from tsduncan-ubuntu.jf.intel.com (HELO [10.7.169.130])
 ([10.7.169.130])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/AES256-SHA;
 30 Aug 2019 14:25:44 -0700
Subject: Re: [PATCH] ncsi-netlink: support sending NC-SI commands over Netlink
 interface
To: Ben Wei <benwei@fb.com>, "sam@mendozajonas.com" <sam@mendozajonas.com>,
 "davem@davemloft.net" <davem@davemloft.net>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "Justin.Lee1@Dell.com" <Justin.Lee1@Dell.com>
References: <CH2PR15MB36860EECD2EA6D63BEA70110A3A40@CH2PR15MB3686.namprd15.prod.outlook.com>
From: Terry Duncan <terry.s.duncan@linux.intel.com>
Message-ID: <0da11d73-b3ab-53f6-f695-30857a743a7b@linux.intel.com>
Date: Fri, 30 Aug 2019 14:25:44 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CH2PR15MB36860EECD2EA6D63BEA70110A3A40@CH2PR15MB3686.namprd15.prod.outlook.com>
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

On 8/22/19 5:02 PM, Ben Wei wrote:
> This patch extends ncsi-netlink command line utility to send NC-SI command to kernel driver
> via NCSI_CMD_SEND_CMD command.
> 
> New command line option -o (opcode) is used to specify NC-SI command and optional payload.
> 

Thank you for posting this Ben.
Something looks off on this next line but it looks fine in your pull 
request in the github.com/sammj/ncsi-netlink repo.

> +static int send_cb(struct nl_msg *msg, void *arg) { #define
> +ETHERNET_HEADER_SIZE 16
> +

Do you have plans to upstream your yocto recipe for this repo?
