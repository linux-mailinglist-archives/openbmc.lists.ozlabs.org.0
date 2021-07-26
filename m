Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C05273D64D8
	for <lists+openbmc@lfdr.de>; Mon, 26 Jul 2021 18:50:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GYQs15YyFz30Fx
	for <lists+openbmc@lfdr.de>; Tue, 27 Jul 2021 02:50:13 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.31; helo=mga06.intel.com;
 envelope-from=jason.m.bills@linux.intel.com; receiver=<UNKNOWN>)
X-Greylist: delayed 124 seconds by postgrey-1.36 at boromir;
 Tue, 27 Jul 2021 02:50:00 AEST
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GYQrm0LYKz303L
 for <openbmc@lists.ozlabs.org>; Tue, 27 Jul 2021 02:49:59 +1000 (AEST)
X-IronPort-AV: E=McAfee;i="6200,9189,10057"; a="273359366"
X-IronPort-AV: E=Sophos;i="5.84,270,1620716400"; d="scan'208";a="273359366"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2021 09:46:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,270,1620716400"; d="scan'208";a="516167270"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga002.fm.intel.com with ESMTP; 26 Jul 2021 09:46:49 -0700
Received: from [10.212.219.165] (jmbills-MOBL.amr.corp.intel.com
 [10.212.219.165])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 45A55580808
 for <openbmc@lists.ozlabs.org>; Mon, 26 Jul 2021 09:46:49 -0700 (PDT)
Subject: =?UTF-8?B?UmU6IOWbnuimhjogW3g4Ni1wb3dlci1jb250cm9sXTogcHJlc3MgdGhl?=
 =?UTF-8?Q?_power_button_for_a_long_time_that_can=27t_force_turn_off_system_?=
 =?UTF-8?Q?power?=
To: openbmc@lists.ozlabs.org
References: <DM6PR08MB55145CD3DC0AD96D30B70771DCE59@DM6PR08MB5514.namprd08.prod.outlook.com>
 <8fcc9529-0f7b-df46-aa28-1569d254eb20@linux.intel.com>
 <DM6PR08MB551464D29CE9BD91FFE1B20ADCE69@DM6PR08MB5514.namprd08.prod.outlook.com>
From: "Bills, Jason M" <jason.m.bills@linux.intel.com>
Message-ID: <b133d936-c788-1800-7b72-e197b69387cc@linux.intel.com>
Date: Mon, 26 Jul 2021 10:46:48 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <DM6PR08MB551464D29CE9BD91FFE1B20ADCE69@DM6PR08MB5514.namprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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



On 7/23/2021 9:04 PM, Chris Chen (TPI) wrote:
> Hi Jason,
> 
> Thanks for your prompt reply.
> 
> The system stays on, because I can hear the fan in PSU is still running 
> and CPU heatsink is hot, besides, the log would show "Graceful power-off 
> timer completed" and "Host0: Moving to "On" state" after 5 minutes. Here 
> are all logs of the power-control for your reference. Hope this can 
> provide more details.
The BMC depends on PS_PWROK de-asserting to know that the system has 
shut down.  If the Graceful power-off timer is expiring, it means that 
the BMC didn't see PS_PWROK de-assert.

Holding the power button should cause the power button override forced 
shutdown in hardware.  It sounds like this isn't happening correctly on 
your system.  I'd suggest reaching out to your Intel representative to 
get help investigating what is happening in the hardware to prevent the 
power button override from fully shutting down the system.

> 
> =====
> root@hudsonbay-obmc:~# journalctl | grep -e "power-control" -e "power 
> control" -e "Power Control"
> Jul 24 10:36:06 hudsonbay-obmc systemd[1]: Starting Intel Power Control...
> Jul 24 10:36:09 hudsonbay-obmc power-control[198]: Start Chassis power 
> control service...
> Jul 24 10:36:09 hudsonbay-obmc systemd[1]: Started Intel Power Control.
> Jul 24 10:36:09 hudsonbay-obmc power-control[198]: NMI_OUT set to 0
> Jul 24 10:36:09 hudsonbay-obmc power-control[198]: POWER_OUT set to 1
> Jul 24 10:36:09 hudsonbay-obmc power-control[198]: RESET_OUT set to 1
> Jul 24 10:36:09 hudsonbay-obmc power-control[198]: NMI Source Property 
> Monitor
> Jul 24 10:36:09 hudsonbay-obmc power-control[198]: Initializing power state.
> Jul 24 10:36:09 hudsonbay-obmc power-control[198]: Host0: Moving to "On" 
> state
> Jul 24 10:36:09 hudsonbay-obmc power-control[198]: POH timer started
> Jul 24 10:36:38 hudsonbay-obmc power-control[198]: powerStateOn: POST 
> Complete assert event received
> Jul 24 10:36:38 hudsonbay-obmc power-control[198]: No action taken.
> Jul 24 10:36:41 hudsonbay-obmc power-control[198]: powerStateOn: POST 
> Complete de-assert event received
> Jul 24 10:36:41 hudsonbay-obmc power-control[198]: Host0: Moving to 
> "Check for Warm Reset" state
> Jul 24 10:36:41 hudsonbay-obmc power-control[198]: Warm reset check 
> timer started
> Jul 24 10:36:41 hudsonbay-obmc power-control[198]: RestartCause set to 
> xyz.openbmc_project.State.Host.RestartCause.SoftReset
> Jul 24 10:36:41 hudsonbay-obmc power-control[198]: Host system DC power 
> is off
> Jul 24 10:36:41 hudsonbay-obmc power-control[198]: POH timer canceled
> Jul 24 10:36:41 hudsonbay-obmc power-control[198]: failed to reset 
> ACBoot property
> Jul 24 10:36:42 hudsonbay-obmc power-control[198]: Warm reset check 
> timer completed
> Jul 24 10:36:42 hudsonbay-obmc power-control[198]: 
> powerStateCheckForWarmReset: warm reset detected event received
> Jul 24 10:36:42 hudsonbay-obmc power-control[198]: Host0: Moving to "On" 
> state
> Jul 24 10:36:42 hudsonbay-obmc power-control[198]: POH timer started
> Jul 24 10:36:42 hudsonbay-obmc power-control[198]: Host system DC power 
> is on
> Jul 24 10:38:16 hudsonbay-obmc power-control[198]: powerStateOn: POST 
> Complete assert event received
> Jul 24 10:38:16 hudsonbay-obmc power-control[198]: No action taken.
> Jul 24 10:38:34 hudsonbay-obmc power-control[198]: PowerControl: power 
> button pressed
> Jul 24 10:38:34 hudsonbay-obmc power-control[198]: powerStateOn: power 
> button pressed event received
> Jul 24 10:38:34 hudsonbay-obmc power-control[198]: Host0: Moving to 
> "Graceful Transition to Off" state
> Jul 24 10:38:34 hudsonbay-obmc power-control[198]: Graceful power-off 
> timer started
> Jul 24 10:43:34 hudsonbay-obmc power-control[198]: Graceful power-off 
> timer completed
> Jul 24 10:43:34 hudsonbay-obmc power-control[198]: 
> powerStateGracefulTransitionToOff: graceful power-off timer expired 
> event received
> Jul 24 10:43:34 hudsonbay-obmc power-control[198]: Host0: Moving to "On" 
> state
> =====
> 
> Thanks.
> 
> Regards,
> Chris Chen
> 
> ------------------------------------------------------------------------
> *寄件者:* openbmc <openbmc- 
> bounces+chris.chen3=flex.com@lists.ozlabs.org> 代表 Bills, Jason M 
> <jason.m.bills@linux.intel.com>
> *寄件日期:* 2021年7月24日 上午 04:36
> *收件者:* openbmc@lists.ozlabs.org <openbmc@lists.ozlabs.org>
> *主旨:* Re: [x86-power-control]: press the power button for a long time 
> that can't force turn off system power
> 
> 
> On 7/23/2021 4:28 AM, Chris Chen (TPI) wrote:
>> Hi all,
>> 
>> I am working on an ast2600 with Intel CPU.
>> The system power currently is able to turn on during Phosphor OpenBMC 
>> boot up after I completed works following:
>> 
>>  1. enable ACPI in u-boot
>>  2. set GPIOP0 ~ P3 pass-through in u-boot
>>  3. porting ESPI driver from AST SDK v6.01 to linux-aspeed repository
>>  4. add "&gpio0" with gpio-line-names which has POWER_BUTTON, POWER_OUT,
>>     SIO_S3, SIO_S5, etc. defintion in the dts, I think the
>>     "x86-power-control" repository required these.
>>  5. append "x86-power-control" and "intel-ipmi-oem" repositories to image
>> 
>> However, I always only got the following logs when I pressed the power 
>> button for a long time (> 4s).
>> =====
>> power-control[263]: PowerControl: power button pressed
>> power-control[263]: powerStateOn: power button pressed event received
>> power-control[263]: Host0: Moving to "Graceful Transition to Off" state
>> power-control[263]: Graceful power-off timer started
>> =====
>> 
>> It doesn't occur "SIO_ONCONTROL value changed: 1 -> SIO power good 
>> de-assert event received", etc. operations and then to turn off the power.
>> 
>> Can anyone do me a favor to give me some clues for what I was wrong?
> Hi Chris,
> 
> Holding the power button should force a hardware shutdown.  The BMC only
> monitors this flow and doesn't participate.
> 
> Did your system shut down correctly and you just not see the logs in
> BMC?  Or, did the system stay on?
> 
> Thanks,
> -Jason
>> 
>> 
>> Thank you in advance for your help.
>> 
>> Regards,
>> Chris Chen
>> 
>> Legal Disclaimer :
>> The information contained in this message may be privileged and 
>> confidential.
>> It is intended to be read only by the individual or entity to whom it is 
>> addressed
>> or by their designee. If the reader of this message is not the intended 
>> recipient,
>> you are on notice that any distribution of this message, in any form,
>> is strictly prohibited. If you have received this message in error,
>> please immediately notify the sender and delete or destroy any copy of 
>> this message!
