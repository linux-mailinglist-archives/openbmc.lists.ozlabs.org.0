Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 994A819BCF3
	for <lists+openbmc@lfdr.de>; Thu,  2 Apr 2020 09:44:18 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48tFSb6SrxzDrCW
	for <lists+openbmc@lfdr.de>; Thu,  2 Apr 2020 18:44:15 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.93; helo=mga11.intel.com;
 envelope-from=adrian.ambrozewicz@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48tF9w1FvVzDqs1
 for <openbmc@lists.ozlabs.org>; Thu,  2 Apr 2020 18:31:27 +1100 (AEDT)
IronPort-SDR: av+ImyQWd2FMTC7do7shNbFBBUtaCfK4GgapaT+vB7C+OgRFoYI2rbBEup91Jo+rYvuYRdDaNm
 iUbe2D2tyJqw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2020 00:31:25 -0700
IronPort-SDR: a3JiRr+91/mopbcbFnsgTOex0GpmMWrxpz0Sc+NK7k4NO+JzMPFQyLEyX1gs8k4oO71703JYCR
 E4EbKxG3b5Ug==
X-IronPort-AV: E=Sophos;i="5.72,334,1580803200"; d="scan'208";a="396266288"
Received: from aambroze-mobl1.ger.corp.intel.com (HELO [10.213.10.231])
 ([10.213.10.231])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2020 00:31:23 -0700
Subject: Re: Redfish events?
To: "Hilliard, Jonathan Blake" <jonathan.hilliard@hpe.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <DF4PR8401MB1177ED2C2AA795CF251570EAE0C90@DF4PR8401MB1177.NAMPRD84.PROD.OUTLOOK.COM>
From: =?UTF-8?Q?Adrian_Ambro=c5=bcewicz?= <adrian.ambrozewicz@linux.intel.com>
Message-ID: <c866c2b0-cc27-c5c3-3ff1-3d467ee5b8a0@linux.intel.com>
Date: Thu, 2 Apr 2020 09:31:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <DF4PR8401MB1177ED2C2AA795CF251570EAE0C90@DF4PR8401MB1177.NAMPRD84.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=windows-1252; format=flowed
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

What exact events do you mean?

EventService is currently in the review 
https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/24889

/redfish/v1/Systems/system/LogServices/EventLog is already implemented 
and supports proper proper MessageRegistry files. 
https://github.com/openbmc/docs/blob/master/architecture/redfish-logging-in-bmcweb.md

Regards,
Adrian


W dniu 4/1/2020 o 21:16, Hilliard, Jonathan Blake pisze:
> Are there any plans to support redfish events in openbmc? And if so, is 
> there a rough ETA?
> 
