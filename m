Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C9376167DB0
	for <lists+openbmc@lfdr.de>; Fri, 21 Feb 2020 13:47:05 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48PB6t6ZNnzDqlK
	for <lists+openbmc@lfdr.de>; Fri, 21 Feb 2020 23:47:02 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.120; helo=mga04.intel.com;
 envelope-from=aleksandr.v.tereschenko@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48PB5f5WT0zDqZy
 for <openbmc@lists.ozlabs.org>; Fri, 21 Feb 2020 23:45:56 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 Feb 2020 04:45:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,468,1574150400"; d="scan'208";a="229840808"
Received: from avteresc-mobl1.ger.corp.intel.com (HELO [172.22.245.179])
 ([172.22.245.179])
 by orsmga008.jf.intel.com with ESMTP; 21 Feb 2020 04:45:53 -0800
Subject: Re: Proposal: delete BMCWeb sessions after some kinds of account
 changes
To: openbmc@lists.ozlabs.org
References: <62c905ac-d35b-f670-aed7-589488676db0@linux.ibm.com>
From: Alexander Tereschenko <aleksandr.v.tereschenko@linux.intel.com>
Message-ID: <ef0ff8ae-4e43-1905-c5a8-d8c523c3a82a@linux.intel.com>
Date: Fri, 21 Feb 2020 13:45:52 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <62c905ac-d35b-f670-aed7-589488676db0@linux.ibm.com>
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

On 17-Feb-20 23:10, Joseph Reynolds wrote:
> This proposal is to enhance BMCWeb to terminate login session that are 
> associated with accounts that have incompatible changes.  I understand 
> this practice is allowed Redfish and recommended by OWASP.
>
This makes sense to me, with one specific note - see below

> - The [proposed][] ExpiredPassword D-Bus property and the 
> PasswordChangeRequired Redfish properties set to True.  Sessions where 
> this property is True are needed for a user to change their own password.

While not terminating these sessions (which certainly makes sense), 
should we restrict them to only allow for password change action 
starting immediately after that flag is set? I'm not sure how it works now.

regards,
Alexander

