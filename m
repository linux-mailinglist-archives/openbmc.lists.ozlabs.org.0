Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D3FEE1EC038
	for <lists+openbmc@lfdr.de>; Tue,  2 Jun 2020 18:40:57 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49byTf2GBpzDqJ5
	for <lists+openbmc@lfdr.de>; Wed,  3 Jun 2020 02:40:54 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.120; helo=mga04.intel.com;
 envelope-from=james.feist@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49bySp4cTkzDqML
 for <openbmc@lists.ozlabs.org>; Wed,  3 Jun 2020 02:40:09 +1000 (AEST)
IronPort-SDR: IVmuNvkg6LUbOUamPVzzboZgJEkRK6SFZYIwm/U41kpRXmpmtSDnXRZl8UZoXPZssmrIONhpSu
 LzZTtsdecxTw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2020 09:40:04 -0700
IronPort-SDR: O7/hELWnPLXaP5HXP9eGrA+ZIlJkqBBCPbGHZO8ufV7v0SuEVVGVJkgSdrUZaZftHZqkBhfs0f
 O6GVpq0kG11Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,465,1583222400"; d="scan'208";a="377813732"
Received: from jfeist-mobl2.amr.corp.intel.com (HELO [10.212.28.19])
 ([10.212.28.19])
 by fmsmga001.fm.intel.com with ESMTP; 02 Jun 2020 09:40:04 -0700
Subject: Re: add Node<x> as /redfish/v1/Systems/Node<x>/ for multi-node system
To: "yugang.chen" <yugang.chen@linux.intel.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "Leung, John" <john.leung@linux.intel.com>, jason.m.bills@linux.intel.com,
 chunhui.jia@linux.intel.com, gmills@us.ibm.com
References: <b6aab1d7-3437-c402-7574-c2dcbd5567b3@linux.intel.com>
From: James Feist <james.feist@linux.intel.com>
Message-ID: <ac5dd8bc-fc11-02ec-9701-193f2d68e284@linux.intel.com>
Date: Tue, 2 Jun 2020 09:40:03 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <b6aab1d7-3437-c402-7574-c2dcbd5567b3@linux.intel.com>
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
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 6/1/2020 11:39 PM, yugang.chen wrote:
> Dear All,
> 
> May I have your attention? For a multi-node system,  there is an option 
> for master to use name "Node<x>" as ​{ComputerSystemId} to stand for 
> slave node, to show slave node's event log in master redfish,
> 
> Could you please share your comment/idea for naming ("Node<x>")? thanks.

Has there been any design docs for multiple systems in Redfish? This is 
much bigger than just adding support for multiple logs, this is adding 
support for multiple Systems interfaces, and many things need to be 
considered such as the mapping of multiple CPUs, Memory, logs, and how 
this fits into the inventory picture. On IRC a while back we had 
discussed making the systems schema based on associations to different 
systems interfaces, and I believe a design was going to be written on 
this topic by Deepak. The name should probably come from the Systems 
interfaces that are provided. I'm not sure why we would need to hardcode 
these. How these interfaces get created, and what they map to, needs to 
be discussed.


> 
> here is the patch for code review:
> https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/32971 ;
> 
> for example, Node1:
> 
> /​redfish/​v1/​Systems/​{ComputerSystemId}/​LogServices/​{LogServiceId}/ 
> ​Entries/​{LogEntryId} -->
> /​redfish/​v1/​Systems/​Node1/​LogServices/​{LogServiceId}/​Entries/​ 
> {LogEntryId}
> 
> Best Regards
> 
> Daniel(Yugang)
> 
