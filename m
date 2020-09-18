Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 20DB42703D8
	for <lists+openbmc@lfdr.de>; Fri, 18 Sep 2020 20:20:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BtMZw08M8zDqV8
	for <lists+openbmc@lfdr.de>; Sat, 19 Sep 2020 04:20:40 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.115; helo=mga14.intel.com;
 envelope-from=jason.m.bills@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.intel.com
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BtMYj53w5zDqjj
 for <openbmc@lists.ozlabs.org>; Sat, 19 Sep 2020 04:19:36 +1000 (AEST)
IronPort-SDR: pdtN1Hjiuyt8FMHhnhiUqElBKuI/t3TPalj+W+Dg+p2cSZtxB1bKmvCQWOvntRmypNHzImM9Oy
 Naxn0BLiuPBQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9748"; a="159317813"
X-IronPort-AV: E=Sophos;i="5.77,274,1596524400"; d="scan'208";a="159317813"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2020 11:19:28 -0700
IronPort-SDR: L5krA82s4XFkNg0a0DL4VA9GaIck7xylZDLeIQfDQR3xhljjO/1VF+7JeAIvR7EgLSlqQZdlJp
 Hv44v3unstjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,274,1596524400"; d="scan'208";a="332725338"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga004.fm.intel.com with ESMTP; 18 Sep 2020 11:19:27 -0700
Received: from [10.212.103.200] (jmbills-MOBL.amr.corp.intel.com
 [10.212.103.200])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id AA3AA580812
 for <openbmc@lists.ozlabs.org>; Fri, 18 Sep 2020 11:19:27 -0700 (PDT)
Subject: Re: Proposal to make webui-vue the standard
To: openbmc@lists.ozlabs.org
References: <29b244dc-5a8b-a82f-b62c-30791d2c0962@linux.vnet.ibm.com>
From: "Bills, Jason M" <jason.m.bills@linux.intel.com>
Message-ID: <b884e7df-0408-6ca8-3b6b-48d3274f4dd6@linux.intel.com>
Date: Fri, 18 Sep 2020 11:19:27 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <29b244dc-5a8b-a82f-b62c-30791d2c0962@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
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



On 9/18/2020 9:31 AM, Gunnar Mills wrote:
> Hi All,
> 
> From some continued discussion yesterday in the GUI Design Workgroup, we 
> would like to see the community move away from phosphor-webuiand for 
> webui-vueto become the standard. All companies on the call were in favor 
> of this but I’ll let them chime in for themselves.

 From Intel, we use a custom fork of phosphor-webui for our current 
platforms.  We plan to abandon this fork and move to webui-vue for our 
future platforms.  Thanks!

> 
> As stated in previous emails there are many benefits to the webui-vueGUI.
> webui-vueadds:
> 
>   * Improved user experience based on feedback from OpenBMC users
>   * Conformance with the W3C Web Content Accessibility Guidelines 2.1
>     specification
>   * Ability to easily theme to meet brand guidelines
>   * Dynamically generate navigation
>   * Language translation-ready
>   * Full Redfish
>   * Modern front-end framework with an active community and future
>     development roadmap
> 
> The phosphor-webuifront-end framework, AngularJS, will sunset in June of 
> 2021. Based on this, the most active contributing companies have moved 
> to webui-vueresulting in a decrease of development activity on 
> phosphor-webuiover the past six months.
> We also believe webui-vueallows us to move forward other areas, for 
> example, turning off exposing the D-Bus interfaces as a REST API. This 
> change would break phosphor-webui. Since webui-vueuses Redfish this is 
> not the case for it. 
> https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/29344
> As requested, below is an updated timeline:
> With Virtual Media merged, 8 identified issues to reach parity:
> https://github.com/openbmc/webui-vue/issues?q=is%3Aissue+is%3Aopen+label%3Aphosphor-webui-feature-parity
> IBM plans to work on, with an estimated completion of mid-October:
> 
>   * Two file Firmware upload (#9)
>   * Loading webui-vue from the BMC causes content-security-policy errors
>     (#32)
>   * Radio button for DHCP - Network settings (#36)
> 
> And will work on when the Redfish interfaces for these are implemented:
> 
>   * Remote Logging (#34)
>   * SNMP (#33)
> 
> The last 2 identified issues, we are looking for community help but 
> might take these up ourselves one day:
> 
>   * Mutual TLS (#30)
>   * CSRF allow list (#29)
> 
> The last issue, Next URL forward (#28) has a review up.  Thanks Mateusz!
> 
> Please let us know if we have missed any features needed to reach parity 
> with phosphor-webui.
> 
> Would any of these outstanding issues keep the community from accepting 
> webui-vueas the standard?
> 
> Not sure officially making webui-vuethe standard means a lot, we plan to 
> update docs/ links to point at webui-vueandview as the first step 
> towards eventually deprecating / archiving phosphor-webui.
> 
> Is there any objection to this?
> 
> Some previous discussion on these topics here:
> https://lists.ozlabs.org/pipermail/openbmc/2020-August/022637.html
> https://lists.ozlabs.org/pipermail/openbmc/2020-February/020491.html
> 
> Thanks,
> Derick, Gunnar, and Yoshie
