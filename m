Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BC16160B9A
	for <lists+openbmc@lfdr.de>; Mon, 17 Feb 2020 08:30:51 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48LbHr2clzzDqgL
	for <lists+openbmc@lfdr.de>; Mon, 17 Feb 2020 18:30:48 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.88; helo=mga01.intel.com;
 envelope-from=richard.marian.thomaiyar@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48LbGs5BMDzDqcl
 for <openbmc@lists.ozlabs.org>; Mon, 17 Feb 2020 18:29:55 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 16 Feb 2020 23:29:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,451,1574150400"; d="scan'208";a="258180806"
Received: from rthomaiy-mobl2.gar.corp.intel.com (HELO [10.66.103.72])
 ([10.66.103.72])
 by fmsmga004.fm.intel.com with ESMTP; 16 Feb 2020 23:29:49 -0800
Subject: Re: New Redfish roles for ServiceRep and OemRep
To: Joseph Reynolds <jrey@linux.ibm.com>, openbmc <openbmc@lists.ozlabs.org>
References: <a0c457af-88a5-08dd-91fa-357f47dfe93d@linux.ibm.com>
From: "Thomaiyar, Richard Marian" <richard.marian.thomaiyar@linux.intel.com>
Message-ID: <6bb93465-ee23-ee6b-3d82-bfd944ea0706@linux.intel.com>
Date: Mon, 17 Feb 2020 12:59:48 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <a0c457af-88a5-08dd-91fa-357f47dfe93d@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
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

We need to make sure user account are not getting created in this role 
by end-user. i.e. when creating a new user, these options must not be 
provided. We need to have a separate way of selecting this role or 
instead of not defining as role, we can add this as some mode in redfish.

Note: Currently we are using SpecialMode 
(https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/xyz/openbmc_project/Control/Security/SpecialMode.interface.yaml) 
called Manufacturing mode, and certain activity can be done, when we are 
in this mode (i.e. Administrator role user in this mode will be able to 
do certain operations).

Regards,

Richard

On 2/15/2020 1:51 AM, Joseph Reynolds wrote:
> This is to propose two new Redfish roles:
>
> The BMC Administrator should not have access to operations involving 
> the manufacturing process or servicing the host because these 
> operations can damage the system or cause unintended operation.
>
> Examples of access needed:
> 1. ServiceRep - Needs to access BMC operations to service the system, 
> such as re-enabling locked out field replaceable units (FRUs) after 
> replacing a defective unit.
> 2. OemRep - Needs to access BMC operations to test the host system, 
> such as how the system responds to overheating.
>
> I believe these roles are clearly distinct from role=Administrator or 
> any other role.
>
> The roles should NOT have access to the BMC's configuration or user 
> management.  For example, the BMC admin will be able to lock out any 
> service agent or OemRep using the regular user management functions.
>
> Does anyone else need for these roles?  If so, I will try to get them 
> into Redfish.
>
>
> - Joseph
>
> This topic was discussed briefly in the OpenBMC security working 
> group, 2019-11-27: 
> https://docs.google.com/document/d/1b7x9BaxsfcukQDqbvZsU2ehMq4xoJRQvLxxsDUWmAOI
>
> See also: https://github.com/ibm-openbmc/dev/issues/1529
>
