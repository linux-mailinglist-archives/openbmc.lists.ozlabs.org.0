Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 827FD40BDCE
	for <lists+openbmc@lfdr.de>; Wed, 15 Sep 2021 04:36:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H8PVV31cXz2yPJ
	for <lists+openbmc@lfdr.de>; Wed, 15 Sep 2021 12:36:34 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.24; helo=mga09.intel.com;
 envelope-from=vernon.mauery@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H8PV95DvFz2xb8
 for <openbmc@lists.ozlabs.org>; Wed, 15 Sep 2021 12:36:17 +1000 (AEST)
X-IronPort-AV: E=McAfee;i="6200,9189,10107"; a="222232816"
X-IronPort-AV: E=Sophos;i="5.85,292,1624345200"; d="scan'208";a="222232816"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2021 19:35:14 -0700
X-IronPort-AV: E=Sophos;i="5.85,292,1624345200"; d="scan'208";a="482115075"
Received: from vmauery-desk.jf.intel.com (HELO mauery.jf.intel.com)
 ([10.7.150.62])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2021 19:35:14 -0700
Date: Tue, 14 Sep 2021 19:35:13 -0700
From: Vernon Mauery <vernon.mauery@linux.intel.com>
To: "Chris Chen (TPI)" <Chris.Chen3@flex.com>
Subject: Re: =?utf-8?B?5Zue6KaGOiDlm57opoY6IFtwaG9z?=
 =?utf-8?Q?phor-host-ipmid?= =?utf-8?Q?=5D?= Questions about IPMI (OEM)
 command development
Message-ID: <20210915023513.GC6614@mauery.jf.intel.com>
References: <DM6PR08MB5514D818A3029FA77BFB523BDCCE9@DM6PR08MB5514.namprd08.prod.outlook.com>
 <DM6PR08MB55145854126B411F1A9AFE29DCD29@DM6PR08MB5514.namprd08.prod.outlook.com>
 <20210909201516.GA6614@mauery.jf.intel.com>
 <DM6PR08MB5514D9029C3FD3A9C5EB7A08DCD79@DM6PR08MB5514.namprd08.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <DM6PR08MB5514D9029C3FD3A9C5EB7A08DCD79@DM6PR08MB5514.namprd08.prod.outlook.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 11-Sep-2021 03:56 AM, Chris Chen (TPI) wrote:
>Hi Vernon,
>
>Thanks for your detailed explanation, I got a lot of concepts from it and =
realized how should I carry on next.
>
>However, I'm not sure whether my understanding of the filter is correct, s=
o would like to confirm with you further.
>
>
>  *   If I for now have 3 IPMI provider libraries, such as the original li=
brary in "phosphor-host-ipmid", "intel-ipmi-oem" and "my own library", and =
they all have their own filter with whitelist. These 3 filters will all be =
registered. Then, when a command comes in, this command will be passed to e=
ach filter and check if the command exists in their whitelist. Am I correct?

There is an option to disable the built-in phosphor-host-ipmid filter.=20
The one that ships with intel-ipmi-oem was added by Intel to replace the=20
built-in filter for Intel builds. If the intel-ipmi-oem filter does not=20
work for you, but you still want the rest of the provider commands, you=20
might consider adding a patch to your layer that removes the filter so=20
you can create your own.

The filters must all return OK (0) for the command to get executed. They=20
will each be run in priority order, but if any of them return non-zero,=20
then the command will not get executed.

>  *   If yes in above, that means I just need to add the command's NetFn/C=
ommandID in one of these 3 whitelists, the command still will be passed to =
a specific provider once it exists in one of the whitelists? Or I should ad=
d that command's NetFn/Command to the whitelist of its dedicated library?

You would need to make sure that all of the filters are returning OK or=20
the command will not get executed.

>Regards,
>Chris Chen
>
>________________________________
>=E5=AF=84=E4=BB=B6=E8=80=85: Vernon Mauery <vernon.mauery@linux.intel.com>
>=E5=AF=84=E4=BB=B6=E6=97=A5=E6=9C=9F: 2021=E5=B9=B49=E6=9C=8810=E6=97=A5 =
=E4=B8=8A=E5=8D=88 04:15
>=E6=94=B6=E4=BB=B6=E8=80=85: Chris Chen (TPI) <Chris.Chen3@flex.com>
>=E5=89=AF=E6=9C=AC: openbmc@lists.ozlabs.org <openbmc@lists.ozlabs.org>
>=E4=B8=BB=E6=97=A8: Re: =E5=9B=9E=E8=A6=86: [phosphor-host-ipmid] Question=
s about IPMI (OEM) command development
>
>On 06-Sep-2021 09:40 AM, Chris Chen (TPI) wrote:
>>Hi all,
>>
>>I guess this mail was got overwhelmed by bunches of emails, so please let=
 me resend it and hope someone could help me. Another, I add one more quest=
ion marked #5 below.
>
>Thanks for being persistent :)
>
>>
>>Hi all,
>>
>>I have studied "phosphor-host-ipmid" package for a couple of weeks and go=
t understanding that it has implemented some mandatory and optional command=
s already. And I also knew that I'm able to leverage "intel-ipmi-oem" packa=
ge to get more command handlers. But there're some questions raised in my m=
ind, I hope someone could give me some suggestions.
>>
>>  1.  What's the normal development procedure in case I want to make our =
own OEM commands? I mean do you guys encourage me to create a new "xxx-ipmi=
-oem" package or to leverage "intel-ipmi-oem" and then add our own commands=
 in it?
>
>First some common language:
>1) xxx-ipmi-oem is an IPMI provider library. It doesn't need to be
>called xxx-ipmi-oem, but that is just a convenient naming convention.
>2) whitelist (prefer allowlist) is one kind of filter. Filters are
>registered like command handlers, with a priority. Filters can do more
>than just block or allow the commands coming in. The filter is passed
>the request and can do anything it wants before passing it on. Logging,
>mangling, blocking, etc.
>
>It depends on a lot of things. Maybe yes, create a new repo? More
>discussion below.
>
>>  2.  I for now added "intel-ipmi-oem" package only for using its "<Chass=
is>:<Set Front Panel Enables>" command because I figured out the same comma=
nd in the "phosphor-host-ipmid" is not able to match the d-bus interface in=
 the "x86-power-control". I'm not sure if I will need other commands in the=
 "intel-ipmi-oem", but what if I don't need other commands, how to remove t=
hem? to use the whitelist mechanism?
>
>There is not a method to remove them, but you can filter them as you
>suggested. Also, if you want to add a different implementation (from a
>different IPMI provider library) at a higher priority, only the higher
>priority implementation will be used.
>
>>  3.  Is it okay to add more than 1 xxx-ipmi-ome packages? If yes, how to=
 manage the whitelist between these 2 OEM packages?
>
>You can have as many IPMI provider libraries on the BMC as needed.
>
>The filtering mechanism does not discriminate between the provider, it
>is used at execution time when a command comes in. Every command is
>passed to each filter
>
>>  4.  Am I able to use "intel-ipmi-oem" on a platform that is using AMD C=
PU?
>
>IANAL, but, yes. It is open source and the license does not make that
>restriction. It might look kind of weird though :)
>
>If you like all the IPMI functions implemented by the intel-ipmi-oem, it
>is fine to use it as is. If there are things you want to change, there
>are different ways to go about it.
>
>Here are a couple of scenarios with some options:
>1) You like the behavior of an IPMI provider library, but want some
>changes. Talk with the owner and see if you can come to some consensus
>that works for everyone. This is the most opensource,
>community-building, good-will behavior of all. Submit a change and see
>if you can get it merged.
>
>2) You like all the IPMI commands in an IPMI provider library except for
>one or two. If you want to own the work to keep a patch up to date, it
>is possible to just add a bbappend and a patch to modify the code prior
>to building. This is okay, but maybe not as ideal. It may end up with a
>smaller image size than adding a new provider library to overload the
>command implementation.
>
>3) You like all the IPMI commands in an IPMI provider library except for
>one or two. You can create a new IPMI provider library for your
>organization that can filter out and/or provide overloads for any
>existing implementation of IPMI commands from any number of other IPMI
>providers.
>
>4) You only like some bits of another IPMI provider. You may be best off
>to just copy those bits into a new IPMI provider library of your own,
>add your own other OEM commands and/or implementations and carry on.
>
>Really, none of the 'solutions' are ideal, but we are trying to make
>trade-offs here that allow individual contributing organizations freedom
>to implement OEM commands as they wish without any one organization
>being a gatekeeper.
>
>--Vernon
>
>Legal Disclaimer :
>The information contained in this message may be privileged and confidenti=
al.
>It is intended to be read only by the individual or entity to whom it is a=
ddressed
>or by their designee. If the reader of this message is not the intended re=
cipient,
>you are on notice that any distribution of this message, in any form,
>is strictly prohibited. If you have received this message in error,
>please immediately notify the sender and delete or destroy any copy of thi=
s message!
