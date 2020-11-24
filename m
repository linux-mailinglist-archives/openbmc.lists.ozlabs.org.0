Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 326B82C3072
	for <lists+openbmc@lfdr.de>; Tue, 24 Nov 2020 20:07:12 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CgYRb5WWzzDqZL
	for <lists+openbmc@lfdr.de>; Wed, 25 Nov 2020 06:07:07 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.126; helo=mga18.intel.com;
 envelope-from=vernon.mauery@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.intel.com
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CgYQY4RnnzDqVF
 for <openbmc@lists.ozlabs.org>; Wed, 25 Nov 2020 06:06:11 +1100 (AEDT)
IronPort-SDR: E7+s9XyViClTMnCFbzFajL9lBZkmXEyI2xc8Tr6wY4B0WArtjoUGv1oCByJbEtlgCFNZuUGa46
 zJfT+jcJdcHw==
X-IronPort-AV: E=McAfee;i="6000,8403,9815"; a="159768367"
X-IronPort-AV: E=Sophos;i="5.78,366,1599548400"; d="scan'208";a="159768367"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2020 11:06:08 -0800
IronPort-SDR: rUsBSiFuTJcaGPYsU/+rT12Rw4++d8U1TQSd24qhlzlEVJYufCqnRpTAXbjGvolwkFIABdsvak
 hh2IC0jk3oxA==
X-IronPort-AV: E=Sophos;i="5.78,366,1599548400"; d="scan'208";a="370463847"
Received: from vmauery-desk.jf.intel.com (HELO mauery.jf.intel.com)
 ([10.7.150.62])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2020 11:06:08 -0800
Date: Tue, 24 Nov 2020 11:06:06 -0800
From: Vernon Mauery <vernon.mauery@linux.intel.com>
To: Tung Nguyen OS <tungnguyen@os.amperecomputing.com>
Subject: Re: ipmi command implementation mismatch with the design document
Message-ID: <20201124190606.GA45289@mauery.jf.intel.com>
References: <BL0PR01MB515650923510989237151B70FFFC0@BL0PR01MB5156.prod.exchangelabs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <BL0PR01MB515650923510989237151B70FFFC0@BL0PR01MB5156.prod.exchangelabs.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: Andrew Geissler <andrewg@us.ibm.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 23-Nov-2020 06:39 AM, Tung Nguyen OS wrote:
>Hi everyone,
>I=E2=80=99m Tung Nguyen, developer for AmpereComputing - Altra system. Whi=
le working with the IPMI commands I have a concern when comparing the desig=
n document and the implementation like the following:
>The state-management-and-external-interfaces.md
>The full mapping of Redfish and IPMI to xyz.openbmc_project.State.* is as =
follows:
>Redfish                 IPMI                xyz.openbmc_project.State.Tran=
sition
>
>ForceOff                power down          Chassis.Off
>ForceOn                 power up            Host.On
>ForceRestart            hard reset          Host.ForceWarmReboot
>GracefulRestart                             Host.GracefulWarmReboot
>GracefulShutdown        soft off            Host.Off
>On                      power up            Host.On
>PowerCycle (host on)    power cycle         Host.Reboot
>PowerCycle (host off)                       Chassis.PowerCycle
>
>the IPMI =E2=80=93 chassishandler.cpp:
>
>ipmi::RspType<> ipmiChassisControl(uint8_t chassisControl)
>
>{
>
>    int rc =3D 0;
>
>    switch (chassisControl)
>
>    {
>
>        case CMD_POWER_ON:
>
>            rc =3D initiate_state_transition(State::Host::Transition::On);
>
>            break;
>
>        case CMD_POWER_OFF:
>
>            // This path would be hit in 2 conditions.
>
>            // 1: When user asks for power off using ipmi chassis command =
0x04
>
>            // 2: Host asking for power off post shutting down.
>
>
>
>            // If it's a host requested power off, then need to nudge Soft=
off
>
>            // application that it needs to stop the watchdog timer if run=
ning.
>
>            // If it is a user requested power off, then this is not really
>
>            // needed. But then we need to differentiate between user and =
host
>
>            // calling this same command
>
>
>
>            // For now, we are going ahead with trying to nudge the soft o=
ff and
>
>            // interpret the failure to do so as a non softoff case
>
>            rc =3D stop_soft_off_timer();
>
>
>
>            // Only request the Off transition if the soft power off
>
>            // application is not running
>
>            if (rc < 0)
>
>            {
>
>                // First create a file to indicate to the soft off applica=
tion
>
>                // that it should not run. Not doing this will result in S=
tate
>
>                // manager doing a default soft power off when asked for p=
ower
>
>                // off.
>
>                indicate_no_softoff_needed();
>
>
>
>                // Now request the shutdown
>
>                rc =3D initiate_state_transition(State::Host::Transition::=
Off);
>
>            }
>
>            else
>
>            {
>
>                log<level::INFO>("Soft off is running, so let shutdown tar=
get "
>
>                                 "stop the host");
>
>            }
>
>            break;
>
>
>
>The redfish =E2=80=93 systems.hpp:
>        else if (resetType =3D=3D "ForceOff")
>        {
>            command =3D "xyz.openbmc_project.State.Chassis.Transition.Off";
>            hostCommand =3D false;
>        }
>
>
>
>
>
>Although the indicate_no_softoff_needed() can prevent the host from soft o=
ff, but it seems like a mismatch b/w the design document and the IPMI imple=
mentation.
>
>So, my question: is it reasonable for IPMI command ?

This code has been in place for quite some time now, so I am not sure if=20
the original authors have the context at this point in time. But nobody=20
else has raised this question. git blame says that Andrew Geissler added=20
this feature, but we would have to see if he still knows why.=20

commit a6e3a3080d532536e02e304c819c1e17214e038a
Author: Andrew Geissler <andrewg@us.ibm.com>
Date:   Wed May 31 19:34:00 2017 -0500

    Create file to indicate host requested off/reboot

    Create a file to ensure the soft power off service is
    not run when the host is requesting a power off
    or reboot.  There's no need to notify the host (i.e.
    soft power off) when they are initiating it.

    Change-Id: Ic9f8e7110d30f477ceae38bba9d684559d9503d3
    Signed-off-by: Andrew Geissler <andrewg@us.ibm.com>


--Vernon

>Reference:
>https://github.com/openbmc/docs/blob/master/designs/state-management-and-e=
xternal-interfaces.md
>
>Best regards,
>Tung
