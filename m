Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 752E89C1DE
	for <lists+openbmc@lfdr.de>; Sun, 25 Aug 2019 06:38:05 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46GMnj2dkJzDrBs
	for <lists+openbmc@lfdr.de>; Sun, 25 Aug 2019 14:38:01 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=lenovo.com
 (client-ip=67.219.250.213; helo=mail1.bemta24.messagelabs.com;
 envelope-from=pyang4@lenovo.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=lenovo.com
Received: from mail1.bemta24.messagelabs.com (mail1.bemta24.messagelabs.com
 [67.219.250.213])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46GMmx4J3zzDqbp
 for <openbmc@lists.ozlabs.org>; Sun, 25 Aug 2019 14:37:20 +1000 (AEST)
Received: from [67.219.250.198] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-1.bemta.az-b.us-west-2.aws.symcld.net id EA/5C-16178-B70126D5;
 Sun, 25 Aug 2019 04:37:15 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprDKsWRWlGSWpSXmKPExsWS8eIhr26VQFK
 swbFfmhanWl6wWOy9MYPJgclj3slAj/MzFjIGMEWxZuYl5VcksGZs/Wxa8FC8ouX7e6YGxqPC
 XYxcHEICDUwSX24cZu5i5ARyXjNKTNgTDZHYxygxZ/VZVpAEm4CKxJylO1hAbBEBQ4m3LxvZQ
 WxmAUuJzR8vAdkcHMICqhIt/wUgStQkdn/5xwISFhHQk9jRZwMSZgGq+PBjGxuIzQvUueb0T0
 YQm1FATOL7qTVMEBPFJc5dbAWbLiEgILFkz3lmCFtU4uXjf6wQtoJE857XLBD1OhILdn9ig7C
 1JZYtfM0MMV9Q4uTMJywTGIVnIRk7C0nLLCQts5C0LGBkWcVokVSUmZ5RkpuYmaNraGCga2ho
 pGtobAKkjfUSq3ST9EqLdctTi0t0jfQSy4v1iitzk3NS9PJSSzYxAqMlpaCtcAfj1llv9A4xS
 nIwKYnyVl1LjBXiS8pPqcxILM6ILyrNSS0+xCjDwaEkwbudLylWSLAoNT21Ii0zBxi5MGkJDh
 4lEd4QkDRvcUFibnFmOkTqFKM9x4SXcxcxcxw8Og9ILtm4BEhunrt0EbMQS15+XqqUOK8yP1C
 bAEhbRmke3FBYornEKCslzMvIwMAgxFOQWpSbWYIq/4pRnINRSZh3C8hynsy8Erjdr4DOYgI6
 a+vaRJCzShIRUlINTM+uNOSzvF5RV6VjfLjnTrJE0t2Se4mLAx4ZxXcEH3nDeabsz+6CplfiS
 ga3bRUPlFbXaX91O5zqdqO3zDpnReYVbeX0EsVp7s/PzmAIFdvTnXtL9Pq2nu8fuy4c/iaz9b
 v8v7TXX6ZuC+Dp3+u50VL3XvOaA7w7Ksukpti3rhAwmy2a++GB4fGpG9t0ojl65h8vPDznyuv
 3Ajy6H/x7VO/aC5ywr9qgpyV+00AgpmxF/T3BU3++ueoKX9z2vZb7+PYFWlPnBVR/P2ifN1Xe
 LlLU9Xu8yJefhTPTO6YbzpfU/jvnqtbq+Twc3nM5t3Vx+7n4maef//Th/7bsBevc/zZKpClN5
 Jia8NHAds06TSWW4oxEQy3mouJEACf7Wr+vAwAA
X-Env-Sender: pyang4@lenovo.com
X-Msg-Ref: server-9.tower-346.messagelabs.com!1566707833!202554!1
X-Originating-IP: [104.232.225.13]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.43.9; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 11077 invoked from network); 25 Aug 2019 04:37:14 -0000
Received: from unknown (HELO aesmtp.lenovo.com) (104.232.225.13)
 by server-9.tower-346.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 25 Aug 2019 04:37:14 -0000
Received: from HKGWPEMAIL04.lenovo.com (unknown [10.128.3.72])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by Forcepoint Email with ESMTPS id 0EE304CEBC9421B2F858;
 Sun, 25 Aug 2019 00:37:12 -0400 (EDT)
Received: from HKGWPEMAIL04.lenovo.com (10.128.3.72) by
 HKGWPEMAIL04.lenovo.com (10.128.3.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1591.10; Sun, 25 Aug 2019 12:37:11 +0800
Received: from HKGWPEMAIL04.lenovo.com ([fe80::f1ef:1ffe:9927:6613]) by
 HKGWPEMAIL04.lenovo.com ([fe80::f1ef:1ffe:9927:6613%5]) with mapi id
 15.01.1591.008; Sun, 25 Aug 2019 12:37:11 +0800
From: Payne Yang <pyang4@lenovo.com>
To: Vernon Mauery <vernon.mauery@linux.intel.com>
Subject: Re: Question for ACPI status
Thread-Topic: Question for ACPI status
Thread-Index: AdVa/RUZnPAlZmLNQR6XELveHAFXTA==
Date: Sun, 25 Aug 2019 04:37:10 +0000
Message-ID: <01040816e6cf4b429f137cfbf727742c@lenovo.com>
Accept-Language: en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.128.115.1]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
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

Hi Vernon,

Thanks for your quick reply.
Please see my comment as below.

> -----Original Message-----
> From: Vernon Mauery <vernon.mauery@linux.intel.com>
> Sent: Saturday, August 24, 2019 4:11 AM
> To: Payne Yang <pyang4@lenovo.com>
> Cc: openbmc@lists.ozlabs.org
> Subject: [External] Re: Question for ACPI status
>=20
> On 23-Aug-2019 09:18 AM, Payne Yang wrote:
> >Hi Team,
> >
> >Is there any ACPI service to update the ACPI state ?
> >I could find that the property of ACPI state is defined in dbus, and the=
 ipmi
> command is also done in package "phosphor-host-ipmid".
> >https://github.com/openbmc/phosphor-host-ipmid/blob/b90a53280c74e8c
> 65e8
> >dc58c8964d93a08cfd65e/apphandler.cpp#L202
> >
> >However, I could not find other services to update the property
> "ACPIPowerState".
> >https://github.com/search?q=3Dorg%3Aopenbmc+ACPIPowerState&type=3DCode
>=20
> That is because the host is the only entity that should be modifying that
> property.
[Payne]
Yes, I know that the host is the only entity.
Therefore, the host may need to send set ACPI state to BMC when it is shutd=
own.

>=20
> >Do I miss something ?
> >If yes, please help to share your comment or suggestion:)
>=20
> According to the IPMI specification:
> 	The Set ACPI Power State command can also be used as a mechanism
> for
> 	setting elements of the platform management subsystem to a
> 	particular power state. This is an independent setting that may not
> 	necessarily match the actual power state of the system. This command
> 	is used to enable the reporting of the power state, it does not
> 	control or change the power state.
>=20
[Payne]
It is correct.
However, actually, I just want to make the power state correct.

> >If no, it seems to me that I have to write a service as ACPI state monit=
or.
>=20
> Your particular platform may have different needs than other platforms
> running OpenBMC. A platform that needs to effect system-wide changes
> based on the Host-reported state (or possibly intended state) could liste=
n for
> the property changed signal for the ACPIPowerState property and take
> action.
>=20
> But as the command is currently written, it conforms to the IPMI
> specification. There just happens to be no public consumers of that
> property.
>=20
[Payne]
Well, as I said previous, I just want to correct the power state.
My system is with a PWRGOOD pin connect to BMC as other platforms, but ther=
e is no service to monitor the PWRGOOD pin if the host shutdown is not caus=
ed by BMC.
In entity manager, the power state won`t change if there is no service to s=
et the power related property.
Therefore, I want to clarify if I miss some package which could monitor PWR=
GOOD pin even if the PWRGOOD state change is not caused by BMC (eg. "shutdo=
wn/init 0" command in OS, "reset -s" command in BIOS shell or global reset)=
.
If there is no service, I may have service design to monitor PWRGOOD pin to=
 handle this situation.
And it may be better to sync the power state and ACPI state:)

> --Vernon

Best Regards,
Payne


