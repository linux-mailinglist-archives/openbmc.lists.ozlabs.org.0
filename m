Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FC2D1FD490
	for <lists+openbmc@lfdr.de>; Wed, 17 Jun 2020 20:31:13 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49nDCy59hnzDqyJ
	for <lists+openbmc@lfdr.de>; Thu, 18 Jun 2020 04:31:10 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::329;
 helo=mail-ot1-x329.google.com; envelope-from=geissonator@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=NJxIi06e; dkim-atps=neutral
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [IPv6:2607:f8b0:4864:20::329])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49nDC43R89zDqth
 for <openbmc@lists.ozlabs.org>; Thu, 18 Jun 2020 04:30:22 +1000 (AEST)
Received: by mail-ot1-x329.google.com with SMTP id u23so2418689otq.10
 for <openbmc@lists.ozlabs.org>; Wed, 17 Jun 2020 11:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=7Kdq2jDC9gFVtlTardpj30n1290cZ8H2HzraQhsKVAc=;
 b=NJxIi06enw1nqTtysTsNfbHw0hU5mlc4/k2EDf3YmjezpQPjKnQvATYRE0lIC2zi1I
 dsFAdhCjJAGi6dyrWVl413BP1/XYISGkz1I6Ej2ACXqMZ+qw4a3g5g4uW4Vb7tbr+TdX
 pJNPH6VrONikrWN+9MuPIM+/NV5GN/wf5KEzPNk98zdsclQc0tAc3CWNBtEmew0hPwM1
 7VxRw5ZZH+bOTcP0kWaAUm9m6iR3Q73J3TwgEUL3P4MO6W+BDpjwGNSZsfyfrhfijszu
 KOXOFXP90axXRjuz7yyuP89Vy74O4sp3yYFFaVoMXJMYUcjP7eDhQzbnbwZ0tA4DRv2A
 r2Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=7Kdq2jDC9gFVtlTardpj30n1290cZ8H2HzraQhsKVAc=;
 b=Lsb3dcOkd8OzcVAXx0qp5gmuUd8bI/9EGBA9gwSncKpoUR3gt93NoElYksJw5jdi0E
 YgRICmp5KFgeTU11/XuHK6H2xzKZVs6U5diPQ7MXPHVO2ZNbk7dVW7srPtwn5MPVsOlf
 5QkQnyT7NNW5MvEmSrCwBX5v8MwlzLoAwywNzbUAbFo8bjwlSG0le4hp+YZzOHBr55E7
 F/gIUSwzRTyXpC86WUF0qCc1wrs+3OSGspI2g4SBIw0qWPMFf25nuTfgPHJRlWLMsQ7P
 wTKKFxTK69dFuhO8UvScOTLjHKtSvcTye9iBUeR9HQ7kSnd6hXAoB2Yx9csKaUz+MQSJ
 2xSA==
X-Gm-Message-State: AOAM533PvEz1tmcdn63aT2axllsozOAlFKc5+ieOSXRBSJNYv31FHdhI
 BahhXSsQjjhtiPnytKXvAiM=
X-Google-Smtp-Source: ABdhPJxH4GtZlvXlh5EFj5ihh2BzQK9XWbQFvp+hPZeblhK68kaHafLk4XSs7x6ve7F8EtGMnUGILQ==
X-Received: by 2002:a05:6830:1443:: with SMTP id
 w3mr288992otp.142.1592418618709; 
 Wed, 17 Jun 2020 11:30:18 -0700 (PDT)
Received: from andrews-mbp-2.attlocal.net
 ([2600:1700:19e0:3310:f544:a6ff:a8a3:4ebb])
 by smtp.gmail.com with ESMTPSA id t8sm127605oor.42.2020.06.17.11.30.17
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 17 Jun 2020 11:30:17 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: Redfish EventService Implementation
From: Andrew Geissler <geissonator@gmail.com>
In-Reply-To: <97353a7d-38f8-9fd4-bbe7-2c75746302c1@linux.intel.com>
Date: Wed, 17 Jun 2020 13:30:17 -0500
Content-Transfer-Encoding: quoted-printable
Message-Id: <00AA94F4-94DD-4C71-9AF7-4FBCE7AE537B@gmail.com>
References: <019f5263-a7b2-9cb8-4420-cb597bd29afd@gmail.com>
 <b80d18b2bc2766d58158e9c93f05201e87b445cd.camel@fuzziesquirrel.com>
 <c31b2941-dc48-349a-68cf-c5292ccfc621@linux.intel.com>
 <1d2ad757-826d-1993-b88a-e92010b984ed@linux.vnet.ibm.com>
 <05ec7793-2efa-42da-ef56-94cc1477d2bb@linux.intel.com>
 <20200616152428.GA4618@heinlein>
 <7e16df1c-38b0-d488-dbbf-75fe9ac818ab@linux.intel.com>
 <68f31493-6db6-8e8e-8486-e03c14685abe@linux.vnet.ibm.com>
 <97353a7d-38f8-9fd4-bbe7-2c75746302c1@linux.intel.com>
To: "Bills, Jason M" <jason.m.bills@linux.intel.com>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
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



> On Jun 17, 2020, at 12:19 PM, Bills, Jason M =
<jason.m.bills@linux.intel.com> wrote:
>=20
>=20
>=20
> On 6/17/2020 5:08 AM, Ratan Gupta wrote:
>> Hi James,Pattrick.
>> Thanks for giving the feedback
>> On 6/16/20 9:41 PM, James Feist wrote:
>>> On 6/16/2020 8:24 AM, Patrick Williams wrote:
>>>> On Mon, Jun 15, 2020 at 02:42:11PM -0700, James Feist wrote:
>>>>> On 6/15/2020 5:50 AM, Ratan Gupta wrote:
>>>>>>       eg:
>>>>>>           sd_journal_send("MESSAGE=3D%s", "Account Modified",
>>>>>>               "PRIORITY=3D%i", LOG_INFO, "REDFISH_MESSAGE_ID=3D%s",=

>>>>>> "REDFISH_RESOURCE_PATH=3D/redfish/v1/AccountService/accounts/<id>",=

>>>>>>               "REDFISH_RESOURCE_TYPE=3DComputerSystem"
>>>>>> "REDFISH_REGISTRY_PREFIX=3DTask/Base/Resource/Oem",
>>>>>>               "REDFISH_MESSAGE_ARGS=3D%s", "Off", NULL);
>>>>>=20
>>>>> If we're going to go down the path of re-implementing logging, I =
think
>>>>> the goal should be to stop logging things in the Journal that are
>>>>> Redfish specific, and instead log them in some generic format that
>>>>> phosphor logging controls the map. Right now we are bifurcated =
because
>>>>> the dbus-event-logs, SEL, PEL, and Redfish are all using different
>>>>> methods of logging, that play to their own set of rules.
>>>>=20
>>>> Absolutely agree with you here.  There is zero reason that =
applications
>>>> should start logging specially formed messages with REDFISH_* =
meta-data.
>>>> We shouldn't have any applications explicitly know about Redfish =
except
>>>> the Redfish providers themselves.  This is no different from IPMI, =
PLDM,
>>>> or any other external interface.
>>>>=20
>>>> The kind of information presented here as being interesting to =
expose
>>>> via Redfish is equally as interesting to me to be able to add to =
one of
>>>> our 'FFDC dumps', which could be used for security / forensic work.
>>>>=20
>>>>> Most repos use
>>>>> phosphor-logging, so instead of creating yet another daemon, if we =
added
>>>>> support to create a 'System Level' or 'External User' log that has
>>>>> predefined dictionaries of required and optional keys, something =
like
>>>>> phosphor-dbus-interfaces, we might be able to drop some of these
>>>>> transport specific logs, and have the transports based on the same
>>>>> database (the journal). Then each transport could filter these =
based on
>>>>> journal entry type, and transform them into the correct log for =
that
>>>>> transport. I think adding more Redfish specifics into the logs =
hinders
>>>>> those who do not want Redfish in their systems.
>>>>=20
>>>> Can't we do this already today by defining a simple errors/metadata =
file
>>>> in phosphor-dbus-interfaces and calling 'logging::report<...>' on =
it?
>>>> This will create a record on dbus in phosphor-logging.
>>>>=20
>>> I think the original concern was with supporting on the order of =
10,000 log entries, having this on d-bus seemed impractical. Also the =
free log rotation the journal provides is useful. Now modifying the =
logging::report<...> to conditionally log to the journal seems =
realistic.
>> My intention was not to re-implement the logging, my intention was to =
extend/use the existing design which we already have it below.
>> =
https://github.com/openbmc/docs/blob/master/architecture/redfish-logging-i=
n-bmcweb.md I was trying not to bring the Redfish specific stuff in each =
individual repo, instead each transport can listen for
>> Dbus events and write to the journal which goes to their app specific =
file.
>> Your point is valid that we would be polluting the journal if each =
and every transport start writing as per their needs.
>> ***** As per the Redfish one of the requirement is we need the log =
for most of the Dbus Property update/interface added as they
>> are mapped to some Redfish Resource and the bmcweb has to send the =
Resource updated/modified signal to the
>> Redfish client. ******
> Why do we want to log on D-Bus property updates?  This seems like it =
will be too noisy for the EventLog.

I don=E2=80=99t think it would be all, just the one=E2=80=99s the =
different transport layers need.

So to get my head straight on this, there is a commit in state-manager =
to log
the redfish events to the journal:
=
https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-state-manager/+/3349=
4

With what Ratan proposed above, we have two options?
1) A separate application that listens for the chassis properties to =
change and logs those
    events to the journal in the format the transport layer wants
2) Code within phosphor-state-manager that logs a generic event to the
    journal which then can be post processed by the different transport=20=

    layer code.

>=20
>> As we are in agreement that we want to use the journal for =
persistence and log rotate feature.
>> We have two options:
>>     1) Each transport interface listens for the Dbus signals and =
write it to their app specific file.
>>     2) Each openbmc repo must use log::report for each D-bus property =
update/ interface added.
>>        To make this happen, we need the following
>>         * common message format which can be used by the all other =
application (SEL,Redfish) etc.
>>         * Transport application will read this common message from =
the journal and use it as per their needs.
>> Option no 2:   It is ideal solution but that requires good amount of =
work as
>>              either each and every D-bus repo  should write to the =
journal for any property update/interface added.
>>                      or
>>              Should SDbusplus do this as each and every application =
uses the sdbusplus framework to manage the dbus objects
>> Please let me know your thoughts.
>> Ratan

