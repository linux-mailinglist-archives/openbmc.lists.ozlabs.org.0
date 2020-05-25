Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BECA21E12A7
	for <lists+openbmc@lfdr.de>; Mon, 25 May 2020 18:29:20 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49W2bx730XzDqQv
	for <lists+openbmc@lfdr.de>; Tue, 26 May 2020 02:29:17 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.24; helo=mga09.intel.com;
 envelope-from=richard.marian.thomaiyar@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49W2b33dcnzDqJs
 for <openbmc@lists.ozlabs.org>; Tue, 26 May 2020 02:28:29 +1000 (AEST)
IronPort-SDR: oQQ9DbpxxGLq6gEhmazKqn3s05OnUuxYyxh+v1hDHxUsz4VYLnikhk6KwJOfIL989mCQGazdcb
 k4a0B55qvdrQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2020 09:28:24 -0700
IronPort-SDR: Qg7jze5S5PJmaxtN0md/UYFbL4QiSjmyCrbL9ou69bcThDdHivUGvnbl/yNESw8ZuFMK8kuoi1
 AolbTOMd0paw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,434,1583222400"; d="scan'208";a="290914573"
Received: from rthomaiy-mobl2.gar.corp.intel.com (HELO [10.252.68.93])
 ([10.252.68.93])
 by fmsmga004.fm.intel.com with ESMTP; 25 May 2020 09:28:20 -0700
Subject: Re: Question of ipmi command "Set User Access" in phosphor-host-ipmid
To: =?UTF-8?B?VG9ueSBMZWUgKOadjuaWh+WvjCk=?= <Tony.Lee@quantatw.com>
References: <e46d19fbea37479ca10df26e35d474b2@quantatw.com>
From: "Thomaiyar, Richard Marian" <richard.marian.thomaiyar@linux.intel.com>
Message-ID: <e4c12ff6-3387-3dc6-eafa-42e5ac830079@linux.intel.com>
Date: Mon, 25 May 2020 21:58:17 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <e46d19fbea37479ca10df26e35d474b2@quantatw.com>
Content-Type: text/plain; charset=big5; format=flowed
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Tony,

Only IPMI offers channel based user level privilege as of now, Redfish 
uses single privilege across all channels. OpenBMC user management is 
designed to have single user level privilege. IPMI is designed to bind 
one of the channel privilege user to the user management, and rest 
maintain in it's own database. LAN 1 is used for that sync.

Note: Discussion started in Redfish forum to have a channel based 
restriction, but it's not yet materialized and requires more takers.

Regards,

Richard

On 5/25/2020 12:58 PM, Tony Lee (§õ¤å´I) wrote:
> In the process of creating an user,
> I used the ipmi command "ipmitool priv <user id> <privilege level> [<channel number>]".
> The "UserPrivilege" of the user I created in dbus is empty. Because my LAN channel number is not 1.
>
> https://github.com/openbmc/phosphor-host-ipmid/blob/master/user_channel/user_mgmt.cpp#L878
>
> Why did it need to check the request channel number before setting the dbus?
> I can't find the related restriction of it in "Set User Access Command" in IPMI SPEC.
>
> Thanks
> Best Regards,
> Tony
