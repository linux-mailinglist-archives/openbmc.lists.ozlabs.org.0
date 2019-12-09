Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3622A11712A
	for <lists+openbmc@lfdr.de>; Mon,  9 Dec 2019 17:07:47 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Wp4c1sFhzDqK6
	for <lists+openbmc@lfdr.de>; Tue, 10 Dec 2019 03:07:44 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.65; helo=mga03.intel.com;
 envelope-from=aleksandr.v.tereschenko@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Wp3n6Vr2zDqP8
 for <openbmc@lists.ozlabs.org>; Tue, 10 Dec 2019 03:06:59 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Dec 2019 08:06:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,296,1571727600"; d="scan'208";a="202873309"
Received: from avteresc-mobl1.ger.corp.intel.com (HELO [10.251.83.124])
 ([10.251.83.124])
 by orsmga007.jf.intel.com with ESMTP; 09 Dec 2019 08:06:49 -0800
Subject: Re: BMC update via TFTP
To: openbmc@lists.ozlabs.org
References: <q7_GhCRdlxUNHfFX0Y4tW7FPq5Md7qwdFWbwd39V_S5zxrSBYtoXtvlNpQdZchvPB27edbJ3-QKFyZ97kzXoeH3Bby8IIHSWhxle9jzteKA=@protonmail.com>
 <5747d991-27b7-4bb1-8a25-f46d1de832e1@linux.vnet.ibm.com>
 <f778ce0c-f395-7528-ed05-cec194707a14@linux.vnet.ibm.com>
 <9e0303e5beb34b9bb50b050cd56e35d8@linux.vnet.ibm.com>
 <ed917fd0-61e1-3ff8-05f9-863d3e451c93@linux.ibm.com>
 <20191204213650.GB9613@mauery.jf.intel.com>
 <94b297b5-81d1-1e07-498f-155a9160cb1d@linux.intel.com>
 <20191205223708.GC9613@mauery.jf.intel.com>
 <1c75671d-904e-8a06-07f5-c93fcf0e5e50@linux.intel.com>
 <d6b4685e-5834-7bfb-609e-c53159a54176@linux.ibm.com>
From: Alexander Tereschenko <aleksandr.v.tereschenko@linux.intel.com>
Message-ID: <f6254181-64e8-e923-8d60-9f7632a899e5@linux.intel.com>
Date: Mon, 9 Dec 2019 17:06:48 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <d6b4685e-5834-7bfb-609e-c53159a54176@linux.ibm.com>
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

On 06-Dec-19 23:52, Joseph Reynolds wrote:
> I was thinking along the lines of adding [SFTP][] (or SCP) support and 
> then migrating existing TFTP users to the new secure solution.
>
> That is, the BMC admin performing [code update][] can currently get a 
> firmware image via POST DownloadViaTFTP to URI 
> /xyz/openbmc_project/software.
> My idea is to offer a DownloadViaSFTP method (or preferably a Redfish 
> API) for this.  Note that the TFTP download is disabled by default per 
> [bmcweb config][].
>
> Once OpenBMC supports downloading firmware via SFTP, we can encourage 
> our users to set up their SFTP servers and take down their TFTP 
> servers.  I realize that sounds easy, but I don't have a feeling how 
> difficult that would be in practice.
>
> Does that sound feasible?
>
> - Joseph
>
> [SFTP]: https://man.openbsd.org/sftp-server
> [code update]: 
> https://github.com/openbmc/docs/blob/master/code-update/code-update.md
> [bmcweb config]: 
> https://github.com/openbmc/bmcweb/blob/41d1d1833f476766f88cfb624e66eef7906bdf8c/CMakeLists.txt#L98

Yes, that could be a solution for the problem we discuss, providing both 
integrity and confidentiality, without any major OpenBMC development 
necessary - but it would mean more operational burden for BMC admins. 
The problem with SCP/SFTP in this context is that for this to work in 
the same manner as TFTP, the BMC must be an SSH client - i.e. have some 
sort of identity/credentials for the SCP/SFTP server provisioned first. 
That might not be the easiest solution to setup, but it's of course 
possible and can be automated if OpenBMC provides respective config knobs.

Existing ways we have in code-update.md either don't require credentials 
(TFTP), so being a client is easy, or are not making a "client" from 
BMC, it's the admin who uploads stuff (SCP/REST).

regards,
Alexander

