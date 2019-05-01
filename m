Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6682D103AD
	for <lists+openbmc@lfdr.de>; Wed,  1 May 2019 03:26:43 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44v12S6dsXzDqTd
	for <lists+openbmc@lfdr.de>; Wed,  1 May 2019 11:26:40 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=lenovo.com
 (client-ip=67.219.246.1; helo=mail1.bemta23.messagelabs.com;
 envelope-from=skochar@lenovo.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=lenovo.com
Received: from mail1.bemta23.messagelabs.com (mail1.bemta23.messagelabs.com
 [67.219.246.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44v11Y5jcrzDqMr
 for <openbmc@lists.ozlabs.org>; Wed,  1 May 2019 11:25:49 +1000 (AEST)
Received: from [67.219.246.102] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-1.bemta.az-b.us-east-1.aws.symcld.net id 1D/2A-23849-A95F8CC5;
 Wed, 01 May 2019 01:25:46 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprFKsWRWlGSWpSXmKPExsWSLveKTXfW1xM
 xBq+FLU61vGBxYPQ4P2MhYwBjFGtmXlJ+RQJrxpqfaQXN3hVLmz+xNjA+tupi5OIQEljCJLG6
 5SQzhDOZUeLO/OOsXYycHGwCGhKrH91hBrFFBCwlljxoZ+ti5OAQFrCSeLwyHCJsLbHy3FpGk
 LCIgJHEpz++IGEWARWJUz/esoHYvAJOEs3P1oLZQgIOEs+//wUr5xRwlNj2VBUkzCggJvH91B
 omEJtZQFzi1pP5YLaEgIDEkj3nmSFsUYmXj/+xQtiKEu37+5gh6nUkFuz+xAZha0ssW/iaGWK
 toMTJmU9YJjAKz0IydhaSlllIWmYhaVnAyLKK0SypKDM9oyQ3MTNH19DAQNfQ0EjXWNfI0Fgv
 sUo3Sa+0WDc1sbhE11AvsbxYr7gyNzknRS8vtWQTIzAmUgqYr+5gnN+RfohRkoNJSZR3+4ITM
 UJ8SfkplRmJxRnxRaU5qcWHGGU4OJQkeLd/BMoJFqWmp1akZeYAoxMmLcHBoyTC+/0zUJq3uC
 AxtzgzHSJ1itGb48Cih3OZOfo2PgOSM+6DyBcPQeTMmc+B5L2DQFKIJS8/L1VKnLf6C9AIAZA
 RGaV5cAtgSeYSo6yUMC8jAwODEE9BalFuZgmq/CtGcQ5GJWFeE5ApPJl5JXB3vAI6kQnoxPh5
 x0BOLElESEk1MN5Wcs3Z/VTb/dqrSUqWunO2983e0cS7d98b1k1bb5VJSJ+qzZrubpnqHCnfs
 +fIla82B+oWaWS/3tSia3HuSMSr0799Fn1+EdDlWyGtytceNfGquFnhXc75/5wuVH6Z5+kuL3
 D5gaxi8aNieyGOC5Gms027up7uP8AWOs9j0lLPpScuJO/YtVOJpTgj0VCLuag4EQAJhHktLQM
 AAA==
X-Env-Sender: skochar@lenovo.com
X-Msg-Ref: server-9.tower-386.messagelabs.com!1556673943!7217354!1
X-Originating-IP: [103.30.234.6]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.31.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 2282 invoked from network); 1 May 2019 01:25:45 -0000
Received: from unknown (HELO apsmtp.lenovo.com) (103.30.234.6)
 by server-9.tower-386.messagelabs.com with DHE-RSA-AES256-GCM-SHA384 encrypted
 SMTP; 1 May 2019 01:25:45 -0000
Received: from USMAILCH01.lenovo.com (unknown [10.62.32.5])
 (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by Forcepoint Email with ESMTPS id B557EA51C78C323544B5
 for <openbmc@lists.ozlabs.org>; Wed,  1 May 2019 09:25:42 +0800 (CST)
Received: from USMAILMBX02.lenovo.com ([10.62.32.2]) by USMAILCH01.lenovo.com
 ([::1]) with mapi id 14.03.0415.000; Tue, 30 Apr 2019 18:25:40 -0700
From: Sumeet Kochar <skochar@lenovo.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: RE: [External]  openbmc Digest, Vol 44, Issue 120
Thread-Topic: [External]  openbmc Digest, Vol 44, Issue 120
Thread-Index: AQHU/vh6bLiXC61y8EGwkuha1raWSaZVcM2g
Date: Wed, 1 May 2019 01:25:40 +0000
Message-ID: <7F0BA69AEB211847B189840D81AA97F0EAAFEE47@USMAILMBX02>
References: <mailman.5.1556589602.3525.openbmc@lists.ozlabs.org>
In-Reply-To: <mailman.5.1556589602.3525.openbmc@lists.ozlabs.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.38.101.195]
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

I want to seek input from the community on QEMU support from BMC chip vendo=
rs for their new BMC chips. OpenBMC has gone a long way in driving a consis=
tent BMC chip abstraction layer to make it easy for multiple BMC chips to b=
e supported but there is still a lead time to gain confidence to port on a =
new chip. We all know next gen BMC chips will come out in coming years. Per=
sonally to us, if BMC chip vendors can support QEMU models to go with their=
 BSP drops then it will be a big benefit to both chip vendors and integrato=
rs of code stack. It will promote early work for new chip, weed out obvious=
 new driver quality issues hence lessen the concerns around switch and exte=
nd early reach of new chip development beyond what EVB like hardware vehicl=
es can achieve. Credit to those who have done this QEMU work in past, even =
though they have had integration roles, but we could all benefit with knowl=
edge chip vendors have to get more complete QEMU models while integrators f=
ocus on features higher up the stack. There is value in using the QEMU mode=
ls, as we know, even after initial new chip support as part of continuous i=
ntegration sniff test concepts this community has been promoting already. I=
f early model access needs to be restricted to parties authorized to such i=
nformation, that could be a discussion.=20

-----Original Message-----
From: openbmc <openbmc-bounces+skochar=3Dlenovo.com@lists.ozlabs.org> On Be=
half Of openbmc-request@lists.ozlabs.org
Sent: Monday, April 29, 2019 10:00 PM
To: openbmc@lists.ozlabs.org
Subject: [External] openbmc Digest, Vol 44, Issue 120

Send openbmc mailing list submissions to
	openbmc@lists.ozlabs.org

To subscribe or unsubscribe via the World Wide Web, visit
	https://lists.ozlabs.org/listinfo/openbmc
or, via email, send a message with subject or body 'help' to
	openbmc-request@lists.ozlabs.org

You can reach the person managing the list at
	openbmc-owner@lists.ozlabs.org

When replying, please edit your Subject line so it is more specific than "R=
e: Contents of openbmc digest..."


Today's Topics:

   1. A draft Redfish logging proposal (Brad Bishop)
   2. Re: ikvm refresh failed on host screen 1680x1050 resolution
      (=3D?ISO-8859-1?B?eGl1emhp?=3D)


----------------------------------------------------------------------

Message: 1
Date: Mon, 29 Apr 2019 21:01:55 -0400
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: ed.tanous@intel.com
Cc: openbmc@lists.ozlabs.org, thalerj@us.ibm.com
Subject: A draft Redfish logging proposal
Message-ID: <20190430010155.4jnoyqkug3qohsb5@thinkpad>
Content-Type: text/plain; charset=3Dutf-8; format=3Dflowed

Hi Ed, OpenBMC community

Thanks for the great discussion about OEM in Redfish on OpenBMC on the comm=
unity call today.

I decided to start a new thread rather than add on to Andrews
(https://lists.ozlabs.org/pipermail/openbmc/2019-April/015916.html) because=
 that thread is at 10000ft and for this one I'd like to come down to 50ft.

Below you will find some mock-ups that have been floating around over here =
that show where we are headed in terms of logging support on our IBM system=
s.

The hope is we can keep the conversation from the community call today goin=
g but with something concrete (and written down) to talk over.  So please h=
ave a look and offer impressions, poke holes, etc.

The JSON below looks great in Mutt but just incase someones MUAs trashes th=
e code formatting I've put these in a paste too: https://pastebin.com/fWnqW=
H77

The first object is a problem log entry, the second an audit log entry and =
the third a maintenance log entry.

Thanks!
-brad

{
    "@odata.context": "/redfish/v1/$metadata#LogEntry.LogEntry",
    "@odata.id":        "/redfish/v1/Managers/BMC/LogServices/Problems/Entr=
ies/1/",
    "@odata.type": "#LogEntry.v1_0_0.LogEntry",
    "Created": "2018-06-15T14:07:47Z",
    "EntryType": "Event",
    "Id": "1", // Log Position
    "Message": "Description of the problem",
    "MessageID": "SRC or LC CommonEventID",
    "MessageArgs": ["Arg1", "Arg2"...."ArgN"],
    "Name": "OpenBMC Event Log",
    "Links": {
        "OriginOfCondition": {
            //This is the URI of the resource that caused the log entry.
            //Think FRU List
            "@odata.id": "Link to inventory item."
        }
        "Oem": {
            "@odata.id": "LinkToPEL" //provides a link to the PEL location
        }
    },
    "Severity": "Critical, Warning, or Info",
    "Oem":=20
    {
        "IBM":=20
        {
            "@odata.context": "/redfish/v1/$metadata#IBMLogEntry.IBMLogEntr=
y",
            "@odata.type": "#HpeLogEntry.v2_1_0.IBMLogEntry",
            "Serviceable": true or false,
            "Resolved": true or false,
            "UpdatedTime" : <timestamp>,
            "EventType": < 1 of IBM EventTypes>,
            "AffectedSubsystem": <Take from PEL or PolicyTable>,

            "CallHome": true or false,
            "Notified": [
                //Maybe use this instead?
                //https://www.dmtf.org/sites/default/files/Redfish%20School=
%20-%20Events.pdf
                //page 5
                <UUID>: true or false
            ],=20
            "Version": 1.0
        }
    },
}

{
    "@odata.context": "/redfish/v1/$metadata#LogEntry.LogEntry",
    "@odata.id": "/redfish/v1/Managers/BMC/LogServices/Audit/Entries/1/",
    "@odata.type": "#LogEntry.v1_0_0.LogEntry",
    "Created": "2018-06-15T14:07:47Z",
    "EntryType": "Event",
    "Id": "1", //log position
    "Message": "Description of the problem", //ex. ?User <ID> ADMIN logged =
in from 192.168.1.5?,
    "MessageID": "SRC or LC Common Event ID",
    "MessageArgs": ["Arg1", "Arg2"...."ArgN"],
    "Name": "OpenBMC Audit Log",
    "Severity": "Warning, or Info",
    "Oem":=20
    {
        "IBM":=20
        {
            "EventNumber": "<logPosition>",
            "Serviceable": false,
            "Resolved": true, //Do we really need this?
            "UpdatedTime": "", //<timestamp>,
            "EventType": "", //< 1 of Administrative, Security>,
            "AffectedSubsystem": "Systems Management - Core / Virtual Appli=
ance",
            "CallHome": false,
            "Notified": [
                "<UUID>": true or false
            ]
        }
    },
    "OemRecordFormat": "IBM-OpenLogging", }

{
    "@odata.context": "/redfish/v1/$metadata#LogEntry.LogEntry",
    "@odata.id": "/redfish/v1/Managers/BMC/LogServices/Maintenance/Entries/=
1/",
    "@odata.type": "#LogEntry.v1_0_0.LogEntry",
    "Created": "2018-06-15T14:07:47Z",
    "EntryType": "OEM",
    "Id": "1", //log position
    "Message": "Description of the problem", //ex CPU changed from SN: 1234=
5 to SN: 12445
    "MessageID": "SRC or LC Common Event ID",
    "MessageArgs": ["Arg1", "Arg2"...."ArgN"],
    "Name": "OpenBMC Log",
    "Severity": "Info",
    "Links": {
        "OriginOfCondition": {
            //"This is the URI of the resource that caused the log entry. T=
hink FRU List"
            "@odata.id": "Link to inventory item."
        }
        "Oem": {
            "@odata.id": "LinkToPEL" //provides a link to the PEL location
        }
    },
    "Oem":=20
    {
        "IBM":=20
        {
            "Serviceable": false,
            "Resolved": true,
            "UpdatedTime" : "<timestamp>",
            "EventType": "< 1 of EventTypes>",
            "AffectedSubsystem": "", //<Take from PEL or PolicyTable>
            "CallHome": false,
            "Notified": [
                "<UUID>": true or false
            ]
        }
    },
    "OemRecordFormat": "IBM-OpenLogging",
    "Version": 1.0
}


------------------------------

Message: 2
Date: Tue, 30 Apr 2019 09:30:43 +0800
From: "=3D?ISO-8859-1?B?eGl1emhp?=3D" <1450335857@qq.com>
To: "=3D?ISO-8859-1?B?amFlLmh5dW4ueW9v?=3D"
	<jae.hyun.yoo@linux.intel.com>, "=3D?ISO-8859-1?B?b3BlbmJtYw=3D=3D?=3D"
	<openbmc@lists.ozlabs.org>, "=3D?ISO-8859-1?B?ZWQ=3D?=3D" <ed@tanous.net>,
	"=3D?ISO-8859-1?B?RWRkaWUgSmFtZXM=3D?=3D" <eajames@linux.vnet.ibm.com>
Subject: Re: ikvm refresh failed on host screen 1680x1050 resolution
Message-ID: <tencent_5FB0BF811DCC8BEA504F5A8F@qq.com>
Content-Type: text/plain; charset=3D"iso-8859-1"

Hi Jae,
    Did you reproduce the resolution issue? CentOS7 or RedHat7 has this res=
olution.
  Bets,
Xiuzhi
Hi Jae,
   My host OS is RedHat7.=20
Both "Refresh" button on ikvm web Page and "View--Reload This Page" or relo=
ad button on chrome browser menu works.
Xiuzhi


------------------ Original ------------------
From:  "jae.hyun.yoo";<jae.hyun.yoo@linux.intel.com>;
Date:  Apr 5, 2019
To:  "xiuzhi"<1450335857@qq.com>; "openbmc"<openbmc@lists.ozlabs.org>; "ed"=
<ed@tanous.net>; "Eddie James"<eajames@linux.vnet.ibm.com>;=20

Subject:  Re: ikvm refresh failed on host screen 1680x1050 resolution



On 4/3/2019 10:21 PM, xiuzhi wrote:
> Hi Jae, Ed,
>      The ikvm screen cann't refresh on ikvm webui screen when setting=20
> the host screen resolution to 1680*1050 . I must click the "Refresh"
> button to get the new host screen.  Other resolutions works very well.
>    Please check it.

Hi Xiuzhi,

I can't see the resolution option in Ubuntu 18.03. What host OS did you use=
 for the test? Let me clarify one more. Do you mean the "Refresh"
button in KVM web page, or reload button of the web browser?

Thanks,
Jae

> Best,
> xiuzhi
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.ozlabs.org/pipermail/openbmc/attachments/20190430/b9d3f1=
3a/attachment-0001.htm>

End of openbmc Digest, Vol 44, Issue 120
****************************************
