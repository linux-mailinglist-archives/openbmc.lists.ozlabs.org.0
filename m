Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 17F461E229D
	for <lists+openbmc@lfdr.de>; Tue, 26 May 2020 15:03:39 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49WZ076xJGzDqT8
	for <lists+openbmc@lfdr.de>; Tue, 26 May 2020 23:03:35 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.43; helo=mga05.intel.com;
 envelope-from=adrian.ambrozewicz@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49WYxR1TbXzDqGN
 for <openbmc@lists.ozlabs.org>; Tue, 26 May 2020 23:01:14 +1000 (AEST)
IronPort-SDR: D2PDC2Ew1vzhWEzNYdN/Sdn3ePfszewSiSqn275bUDDE+52YkxTKR1MDOFUab+w4U00e5X8IT+
 ywUVk1/ewUbw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2020 06:01:11 -0700
IronPort-SDR: GuTC40RS4+R1N59Kdm+pnqj/VzevTZn15aJiTmICmIpwZVdqnoN/yPx8gD+nX3Q4KVjTl2cHer
 Skz761rkN9tg==
X-IronPort-AV: E=Sophos;i="5.73,437,1583222400"; d="scan'208";a="468286434"
Received: from aambroze-mobl1.ger.corp.intel.com (HELO [10.213.26.143])
 ([10.213.26.143])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2020 06:01:10 -0700
Subject: Re: power capping values on dbus
To: Zbyszek <zbigniewku@gmail.com>, openbmc@lists.ozlabs.org
References: <CAB_SOc5KK9D5TGiJZ=LFBF4Y8_dibp1iRZbvenyfscW+gkVEYA@mail.gmail.com>
From: =?UTF-8?Q?Adrian_Ambro=c5=bcewicz?= <adrian.ambrozewicz@linux.intel.com>
Message-ID: <c5460be4-cd62-e913-09a3-a72fb0b63812@linux.intel.com>
Date: Tue, 26 May 2020 15:01:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <CAB_SOc5KK9D5TGiJZ=LFBF4Y8_dibp1iRZbvenyfscW+gkVEYA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
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

I don't think it's clear from your message what you are trying to achieve:
a) ability to expose power capping information as dbus-sensor just as 
read-only information
b) ability to set the cap through D-Bus interface

I suspect it's the former (just exposing data). If that's so I don't 
think you need any new interface at all. You could just add a 'Cap' 
sensor, eg Cpu0PowerCap and all the values fits nicely.

For latter, there already exist interface for configuring power capping 
(https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/xyz/openbmc_project/Control/Power/Cap.interface.yaml), 
however it doesn't specify properties for Min and Max values.

Regards,
Adrian

W dniu 5/26/2020 o 14:46, Zbyszek pisze:
> Hi everyone!
> 
> I would like to expose on dbus values like min and max power capping.
> These values could be read from files provided by hwmon like:
>     power[1-*]_cap_max,
>     power[1-*]_cap_min
> which are describe here:
> https://www.kernel.org/doc/Documentation/hwmon/sysfs-interface
> 
> I have noticed that this interface:
> https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/xyz/openbmc_project/Sensor/Value.interface.yaml
> is already exposing something like MinValue and MaxValue,
> but current implementation in dbus-sensors always sets these
> attributes to some const values.
> My understanding of the power capping values is that they could be used as these
> MinValue and MaxValue if hwmon provides them otherwise some default
> should be used as it is now.
> 
> 
> My questions:
> 1. Should I create a new interface for the capping readings?
> 2. Or should I extend the existing Value.interface.yaml with new
> attributes like MinCapValue, MaxCapValue?
> 3  Or the correct approach would be to read the cap values if provided
> and expose them under already existing MinValue, MaxValue?
> 
> 
> Regards,
> Zbigniew.
> 
