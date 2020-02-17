Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B2BCE16102E
	for <lists+openbmc@lfdr.de>; Mon, 17 Feb 2020 11:37:30 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48LgRC4XSczDqlr
	for <lists+openbmc@lfdr.de>; Mon, 17 Feb 2020 21:37:27 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.100; helo=mga07.intel.com;
 envelope-from=richard.marian.thomaiyar@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48LgQK3B38zDqhF
 for <openbmc@lists.ozlabs.org>; Mon, 17 Feb 2020 21:36:39 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Feb 2020 02:36:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,452,1574150400"; 
 d="scan'208,217";a="258231048"
Received: from rthomaiy-mobl2.gar.corp.intel.com (HELO [10.66.103.72])
 ([10.66.103.72])
 by fmsmga004.fm.intel.com with ESMTP; 17 Feb 2020 02:36:32 -0800
Subject: OpenBMC PMCI Working group - Meeting Minutes - Feb 17th.
From: "Thomaiyar, Richard Marian" <richard.marian.thomaiyar@linux.intel.com>
To: Bruce Mitchell <Bruce_Mitchell@phoenix.com>,
 Andrew Jeffery <andrew@aj.id.au>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>, Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>,
 "tomjoseph@in.ibm.com" <tomjoseph@in.ibm.com>,
 "Winiarska, Iwona" <iwona.winiarska@intel.com>,
 "piotr.matuszczak@intel.com" <piotr.matuszczak@intel.com>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>,
 "sumanth.bhat@linux.intel.com" <sumanth.bhat@linux.intel.com>,
 James Mihm <james.mihm@intel.com>, Richard Hanley <rhanley@google.com>,
 Vijay Khemka <vijaykhemka@fb.com>
References: <67e599e4-0b45-aa01-1e27-d49c52873646@linux.intel.com>
 <4469ca80-8df5-43be-876b-f3e393407e59@www.fastmail.com>
 <acadebfec93f429e804443d76462456e@SCL-EXCHMB-13.phoenix.com>
 <7333abcd-873d-422d-fc94-2a0bc91f6d5d@linux.intel.com>
Message-ID: <d9247191-3110-13c1-7463-f3580cfd842b@linux.intel.com>
Date: Mon, 17 Feb 2020 16:06:31 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <7333abcd-873d-422d-fc94-2a0bc91f6d5d@linux.intel.com>
Content-Type: multipart/alternative;
 boundary="------------B3B65E2DB51D9992DC1D2263"
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

This is a multi-part message in MIME format.
--------------B3B65E2DB51D9992DC1D2263
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

All,

Meeting minutes for Feb17th & Feb10th or posted in 
https://github.com/openbmc/openbmc/wiki/OpenBMC-PMCI-WG.
<https://github.com/openbmc/openbmc/wiki/OpenBMC-PMCI-WG>

Please feel free to add any agenda topics / Offline questions if any.

Minutes Feb17th - Brief: (Refer above link for details).

1. Repo for MCTP daemon

2. MCTP Design - offline review, and further discussion in next week call.

3. PLDM (regarding multiple application using / instead of D-Bus query).

4. BIOS attributes.

Minutes Feb10th - Brief:

1. Socket / D-Bus approach - As socket based doesn't have standard way 
to expose discovered devices, will do D-Bus based approach. Ultimate 
goal is to support socket based approach to have better performance 
(Andrew & Richard)

2. libmctp - c based library, scope & coverage

3. MCTP, PLDM - Feature list needed, Maintainer-ship discussion.


Regards,

Richard


--------------B3B65E2DB51D9992DC1D2263
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>All, <br>
    </p>
    <p>Meeting minutes for Feb17th &amp; Feb10th or posted in <a
        href="https://github.com/openbmc/openbmc/wiki/OpenBMC-PMCI-WG">https://github.com/openbmc/openbmc/wiki/OpenBMC-PMCI-WG.<br>
      </a></p>
    <p>Please feel free to add any agenda topics / Offline questions if
      any.</p>
    <p>Minutes Feb17th - Brief: (Refer above link for details).<br>
    </p>
    <p>1. Repo for MCTP daemon</p>
    <p>2. MCTP Design - offline review, and further discussion in next
      week call.<br>
    </p>
    <p>3. PLDM (regarding multiple application using / instead of D-Bus
      query).</p>
    <p>4. BIOS attributes.</p>
    <p>Minutes Feb10th - Brief:</p>
    <p>1. Socket / D-Bus approach - As socket based doesn't have
      standard way to expose discovered devices, will do D-Bus based
      approach. Ultimate goal is to support socket based approach to
      have better performance (Andrew &amp; Richard)</p>
    <p>2. libmctp - c based library, scope &amp; coverage</p>
    <p>3. MCTP, PLDM - Feature list needed, Maintainer-ship discussion.<br>
    </p>
    <p><br>
    </p>
    <p>Regards,</p>
    <p>Richard<br>
    </p>
  </body>
</html>

--------------B3B65E2DB51D9992DC1D2263--
