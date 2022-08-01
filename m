Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DA22586F10
	for <lists+openbmc@lfdr.de>; Mon,  1 Aug 2022 18:56:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LxPR22VpWz2yxF
	for <lists+openbmc@lfdr.de>; Tue,  2 Aug 2022 02:56:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=V+kW5xqU;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.55.52.151; helo=mga17.intel.com; envelope-from=jason.m.bills@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=V+kW5xqU;
	dkim-atps=neutral
X-Greylist: delayed 63 seconds by postgrey-1.36 at boromir; Tue, 02 Aug 2022 02:56:05 AEST
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LxPQY2Zz8z2xG6
	for <openbmc@lists.ozlabs.org>; Tue,  2 Aug 2022 02:56:05 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1659372965; x=1690908965;
  h=message-id:date:mime-version:from:subject:to:references:
   in-reply-to:content-transfer-encoding;
  bh=MYUrQbMfLqfl7H0xVMxyO+NZFoGH1q07MkSnZ9Mp2HE=;
  b=V+kW5xqUyjY6X42W7WYOk+UGjifp4GuOFIAWP+egRaQGlFUNm4xGx45/
   3P+mS78XZ6RYG3pEDqxpnHvVQpnLP3dAAUwwIQ82WUPL2x9f6NyH02btd
   yeeVJxs6D2k5BjasP3HxMAzmV/6dLWaNnCZFvZqVGs+N0FFQNxujOimZT
   ME8D8x3wA6d5a6Fjua5cbcuzgJFGYpaZ9EiU+JIbSzqr09N8Z+wNusy6X
   2Q/8fr9JC+xBGCfQkDnTBizhkuhfDODPXuxo7aG2RbkT46vww/7yYI2H0
   lEC1tsgQRRcFw0bfINTpXu0bFkLdFQGHPJtOCxFXJUZsBKxPD1yqVowMX
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10426"; a="269575949"
X-IronPort-AV: E=Sophos;i="5.93,208,1654585200"; 
   d="scan'208";a="269575949"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2022 09:54:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,208,1654585200"; 
   d="scan'208";a="691523934"
Received: from linux.intel.com ([10.54.29.200])
  by FMSMGA003.fm.intel.com with ESMTP; 01 Aug 2022 09:54:57 -0700
Received: from [10.213.189.49] (jmbills-mobl1.amr.corp.intel.com [10.213.189.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTPS id 3E7A4580AA7;
	Mon,  1 Aug 2022 09:54:57 -0700 (PDT)
Message-ID: <e30e72d9-a089-32fb-5ae3-66958149d8cd@linux.intel.com>
Date: Mon, 1 Aug 2022 10:54:56 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.0.3
From: "Bills, Jason M" <jason.m.bills@linux.intel.com>
Subject: Re: Intrusion sensor problem on Lewisburg C621
To: Georgiy Matyukhin <g.matyukhin@yadro.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <0b5a3942e3a24fa6ab5daafeea23a0c4@yadro.com>
Content-Language: en-US
In-Reply-To: <0b5a3942e3a24fa6ab5daafeea23a0c4@yadro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

Hi Georgiy,

On 7/27/2022 6:28 AM, Georgiy Matyukhin wrote:
> Hi guys.
> I faced a problem with intrusion sensor on a Lewisburg C621 PCH.
> In dbus-sensors there is intrusion sensor daemon which intended to work
> with Lewisburg PCH, but there is only code to read intruder state 
> (INTRD_DET) and
> no any mention about intrusion sensor reset (ChassisIntrusionSensor.cpp).
> We are looking for a way to reset INTRD_DET from BMC.
> 
> According to the C621 datasheet, this bit must be cleared by writing 1 
> to it.
> But reading the documentation led to the conclusion that one set of 
> registers is
> available for reading via SMBUS (table 26-8 of the C621 datasheet),
> and for writing - another (table 26-5). Probably the idea of the C621 
> developers
> is that the INTRD_DET bit can both be read and cleared via PCIe, but 
> only read via SMBUS?

For details on the behavior of this feature and register in the PCH, 
please contact your Intel support representative.
> 
> If it isn't possibly to reset intruder from intrusion sensor, how it 
> supposed to work in Intel BMC?
> Or is there some way to clear this bit over SMBUS?

I have asked internally, and it sounds like we didn't ever get the PCH 
intrusion sensor fully working, so we don't currently support it on any 
of our platforms.

Should we remove this code from dbus-sensors, or is there something 
useful there even if it doesn't fully work?
> 
> 
> 
