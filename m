Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EF77215516
	for <lists+openbmc@lfdr.de>; Mon,  6 Jul 2020 12:04:48 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B0h4q5m25zDqg1
	for <lists+openbmc@lfdr.de>; Mon,  6 Jul 2020 20:04:43 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.151; helo=mga17.intel.com;
 envelope-from=suryakanth.sekar@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.intel.com
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B0h416szdzDqHg
 for <openbmc@lists.ozlabs.org>; Mon,  6 Jul 2020 20:04:00 +1000 (AEST)
IronPort-SDR: +zVUxZ0oM98y83jCQq3wBtJHf1HhWPZoVgbQHOlTbZdtahrSfdCOOD/JntgQeM3ecseP1d10xr
 7nnJKba2T7AA==
X-IronPort-AV: E=McAfee;i="6000,8403,9673"; a="127457773"
X-IronPort-AV: E=Sophos;i="5.75,318,1589266800"; d="scan'208";a="127457773"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2020 03:03:57 -0700
IronPort-SDR: 3z20W96GYwukfhw+yX0SLirmbT4lNUKnE3ziUIOZoIpFF11byAytoYH/pHwcL+JuWy9v+02B6U
 HNm6kNdaYtcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,318,1589266800"; d="scan'208";a="305233083"
Received: from ssekar-mobl1.gar.corp.intel.com (HELO [10.215.206.224])
 ([10.215.206.224])
 by fmsmga004.fm.intel.com with ESMTP; 06 Jul 2020 03:03:56 -0700
Subject: Re: Reg new repository for Remote BIOS Configuration feature
To: Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
References: <OF695C3E91.9C1FA4CC-ON00258598.00304468-00258598.00304971@LocalDomain>
 <8c52e6de-d785-6e28-c186-eb05bc405831@linux.intel.com>
 <OF4F9A7C8E.67B55B6A-ON00258598.00314874-00258598.003165E6@notes.na.collabserv.com>
 <3631d9fa-52b1-0918-bf9c-af8cb21e0c4f@linux.intel.com>
 <204b12fe-85c3-97f1-fd16-a2b5a64e9c6b@linux.vnet.ibm.com>
From: "Sekar, Suryakanth" <suryakanth.sekar@linux.intel.com>
Message-ID: <0a75da4d-0254-c2dc-562d-956bd8a21786@linux.intel.com>
Date: Mon, 6 Jul 2020 15:33:55 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <204b12fe-85c3-97f1-fd16-a2b5a64e9c6b@linux.vnet.ibm.com>
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Ok bios-settings-mgr is fine.

On 7/6/2020 3:13 PM, Deepak Kodihalli wrote:
>>>         ----- Original message -----
>>>         From: "Sekar, Suryakanth" <suryakanth.sekar@linux.intel.com>
>>>         To: dkodihal@in.ibm.com, bradleyb@fuzziesquirrel.com,
>>>         jason.m.bills@linux.intel.com, patrick@stwcx.xyz, "Thomaiyar,
>>>         Richard Marian" <richard.marian.thomaiyar@linux.intel.com>
>>>         Cc:
>>>         Subject: [EXTERNAL] Reg new repository for Remote BIOS
>>>         Configuration feature
>>>         Date: Wed, Jul 1, 2020 2:12 PM
>>>         Hi Brad,
>>>
>>>         Can you please create new repository (repo name :
>>>         Remote-BIOSConfig )
>
>
> Surya, would you be too opposed to the name bios-settings-mgr?
>
> Regards,
> Deepak
>
