Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4761F16B109
	for <lists+openbmc@lfdr.de>; Mon, 24 Feb 2020 21:38:51 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48RDRr2SkHzDqTD
	for <lists+openbmc@lfdr.de>; Tue, 25 Feb 2020 07:38:48 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.151; helo=mga17.intel.com;
 envelope-from=james.feist@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48RDQz1yvDzDqJg
 for <openbmc@lists.ozlabs.org>; Tue, 25 Feb 2020 07:38:02 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 Feb 2020 12:38:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,481,1574150400"; d="scan'208";a="255704115"
Received: from skyhawk.jf.intel.com (HELO [10.54.51.81]) ([10.54.51.81])
 by orsmga002.jf.intel.com with ESMTP; 24 Feb 2020 12:37:59 -0800
Subject: Re: dbus-sensor: setting the upper non-critical(unc) threshold value
 smaller than reading value would get 3 logs ( assert log,
 de-assert log and then assert log)
To: Max Lai/WYHQ/Wiwynn <Max_Lai@wiwynn.com>
References: <HK2PR02MB38260025D3279EB8DBF0523CEA100@HK2PR02MB3826.apcprd02.prod.outlook.com>
 <900ef2d7-3755-a3f1-ad40-4cd9e849ebf7@linux.intel.com>
 <HK2PR02MB3826381BDA6F9AEE8CF67D7FEAEC0@HK2PR02MB3826.apcprd02.prod.outlook.com>
From: James Feist <james.feist@linux.intel.com>
Message-ID: <0db737a0-c83c-445d-d0bf-05e6aa3d20fa@linux.intel.com>
Date: Mon, 24 Feb 2020 12:37:59 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <HK2PR02MB3826381BDA6F9AEE8CF67D7FEAEC0@HK2PR02MB3826.apcprd02.prod.outlook.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "LF_OpenBMC.WYHQ.Wiwynn" <LF_OpenBMC.WYHQ.Wiwynn@Wiwynn.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 2/24/20 3:31 AM, Max Lai/WYHQ/Wiwynn wrote:
> Hi James,
> 
> We had tried your fix solution (Deleting lines 117 and 118). Deleting 
> the lines 117 and 118 would stop sending the PropertiesChanged signal 
> and even stop updating threshold value on Dbus. The result we want is we 
> can change threshold value on Dbus and get assert sel log when we 
> trigger the threshold mechanism. And we also tried the latest source 
> revision on upstream dbus-sensor repository. We found that latest source 
> revision in IpmbSensor.cpp, struct sensor's "objectType" member which 
> was set "xyz.openbmc_project.Configuration.ExitAirTemp" was different 
> than our "xyz.openbmc_project.EntityManager". So this issue doesn�t happen.
> 
> What's the purpose of this changing?

Can you send a diff? I'm not exactly sure the line you're mentioning.


