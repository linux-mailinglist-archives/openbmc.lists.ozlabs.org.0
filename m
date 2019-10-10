Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EF17D33E3
	for <lists+openbmc@lfdr.de>; Fri, 11 Oct 2019 00:22:05 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46q5DB1ZxWzDqSC
	for <lists+openbmc@lfdr.de>; Fri, 11 Oct 2019 09:22:02 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=134.134.136.65; helo=mga03.intel.com;
 envelope-from=ed.tanous@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46q5CX3nvDzDqRD
 for <openbmc@lists.ozlabs.org>; Fri, 11 Oct 2019 09:21:21 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Oct 2019 15:21:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,281,1566889200"; d="scan'208";a="207290787"
Received: from hades.jf.intel.com (HELO [10.54.51.78]) ([10.54.51.78])
 by fmsmga001.fm.intel.com with ESMTP; 10 Oct 2019 15:21:17 -0700
Subject: Re: Virtual Media
To: Adriana Kobylak <anoo@linux.ibm.com>,
 "Rapkiewicz, Pawel" <pawel.rapkiewicz@intel.com>
References: <53D123781965AE42A2ABEE982B242E41A10E3D21@IRSMSX102.ger.corp.intel.com>
 <c87bcee49e5311c0a226816a1d98023e@linux.vnet.ibm.com>
From: Ed Tanous <ed.tanous@intel.com>
Message-ID: <2b222bd9-d806-cc68-7470-fb7dcc80b5ba@intel.com>
Date: Thu, 10 Oct 2019 15:21:17 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <c87bcee49e5311c0a226816a1d98023e@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 10/10/19 12:30 PM, Adriana Kobylak wrote:
> 
> I support the Redfish implementation, let's just make sure that the web UI
> transitions to the new Virtual Media implementation before deprecating
> any existing endpoints.

+1

> 
> As for the bmcweb changes, I'm not really an expert there so will defer to
> the maintainers on approving how it's implemented.

I think the key here is whether or not the community is ok with
completely replacing the BMCWEB_ENABLE_VM_WEBSOCKET option with the new
scheme, or if there's a reason to keep the old one around.  The new one
seems to be a superset of what exists in terms of features.  If the
webui is moved over to the new, multiple-slot scheme, is there any issue
with that, or is there a reason to keep the single-slot variant around?
