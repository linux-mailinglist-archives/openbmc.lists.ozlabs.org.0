Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F7A16B27B
	for <lists+openbmc@lfdr.de>; Wed, 17 Jul 2019 01:44:03 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45pH6S5VT1zDqYY
	for <lists+openbmc@lfdr.de>; Wed, 17 Jul 2019 09:44:00 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=192.55.52.120; helo=mga04.intel.com;
 envelope-from=ed.tanous@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45pH5v6M4pzDqN7
 for <openbmc@lists.ozlabs.org>; Wed, 17 Jul 2019 09:43:25 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 16 Jul 2019 16:43:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,272,1559545200"; d="scan'208";a="175552359"
Received: from hades.jf.intel.com (HELO [10.54.51.78]) ([10.54.51.78])
 by FMSMGA003.fm.intel.com with ESMTP; 16 Jul 2019 16:43:21 -0700
Subject: Re: BMC websocket
To: openbmc@lists.ozlabs.org
References: <82B71204-7C02-4A78-93A7-6AF55AF6C5A9@linkedin.biz>
 <e054b880-000f-2104-32de-a1377d475da2@linux.vnet.ibm.com>
 <CF86FE31-BA37-4CE1-B039-5AADEB8A3E4C@linkedin.biz>
From: Ed Tanous <ed.tanous@intel.com>
Message-ID: <bc05af5b-ca69-a010-e95c-65ab82fb5c51@intel.com>
Date: Tue, 16 Jul 2019 16:43:20 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <CF86FE31-BA37-4CE1-B039-5AADEB8A3E4C@linkedin.biz>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 7/16/19 2:01 PM, Ping Mao wrote:
> I did,  tried in index.html with:
> 
> var ws = new WebSocket("wss://<BMC IP>/subscribe")
> 

This is almost exactly how the webui functions, and it seems to be
working.  I'd recommend comparing with that to see where you differ.

If you're running locally, I suspect you're hitting limitations with
cross site scripting policy, which should be apparent in your web
browser console.
