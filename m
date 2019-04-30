Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DBFB10227
	for <lists+openbmc@lfdr.de>; Wed,  1 May 2019 00:04:20 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44twXx47K7zDqTL
	for <lists+openbmc@lfdr.de>; Wed,  1 May 2019 08:04:17 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=192.55.52.43; helo=mga05.intel.com;
 envelope-from=ed.tanous@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44twX44frXzDqDp
 for <openbmc@lists.ozlabs.org>; Wed,  1 May 2019 08:03:32 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 30 Apr 2019 15:03:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,415,1549958400"; d="scan'208";a="153691591"
Received: from hades.jf.intel.com (HELO [10.54.51.78]) ([10.54.51.78])
 by FMSMGA003.fm.intel.com with ESMTP; 30 Apr 2019 15:03:30 -0700
Subject: Re: Phosphor pid control
To: Vijay Khemka <vijaykhemka@fb.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <303477D5-BB35-4FC8-98FB-9C59A188064C@fb.com>
 <CAO=notzKTpC-6zAGODatyDJL5p1Y3+mW5-LbxRh7qtg1hNmufQ@mail.gmail.com>
 <AF2ED931-7FB2-4AFE-AFCE-D0AEC3646A44@fb.com>
 <CAO=notyhSG=E6kwv63ODRQQz7SD3rindmtAYxa=OuFvSv=mELg@mail.gmail.com>
 <71BFF33B-20DA-428A-979F-A896011142AE@fb.com>
 <59D3A2C1-2E74-4055-B33A-6FF746E62FD2@fb.com>
 <a388c5ac-9384-9c03-74e4-9cb0c8bcb4b6@intel.com>
 <B337527D-440D-4C88-A0BA-D8ABAE6EBCEE@fb.com>
From: Ed Tanous <ed.tanous@intel.com>
Message-ID: <561071fd-1daa-91fc-46fd-00de7eedaa7e@intel.com>
Date: Tue, 30 Apr 2019 15:03:30 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <B337527D-440D-4C88-A0BA-D8ABAE6EBCEE@fb.com>
Content-Type: text/plain; charset=utf-8
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

On 4/30/19 3:00 PM, Vijay Khemka wrote:
> Also once this is fixed, how do I test this if fan controller is kicking based on temperature change.


All of the dbus-sensors daemons support the SetProperty method on their
value interface, so you can simulate raising and lowering temperatures
(or any sensor for that matter) to make sure fan control reacts.

-Ed

