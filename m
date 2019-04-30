Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C3EEBEE1D
	for <lists+openbmc@lfdr.de>; Tue, 30 Apr 2019 03:02:04 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44tNXV1LSxzDqQP
	for <lists+openbmc@lfdr.de>; Tue, 30 Apr 2019 11:02:02 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fuzziesquirrel.com
 (client-ip=173.167.31.197; helo=bajor.fuzziesquirrel.com;
 envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=fuzziesquirrel.com
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44tNWY4X87zDqPm
 for <openbmc@lists.ozlabs.org>; Tue, 30 Apr 2019 11:01:12 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Date: Mon, 29 Apr 2019 21:01:55 -0400
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: ed.tanous@intel.com
Subject: A draft Redfish logging proposal
Message-ID: <20190430010155.4jnoyqkug3qohsb5@thinkpad>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
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
Cc: openbmc@lists.ozlabs.org, thalerj@us.ibm.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Ed, OpenBMC community

Thanks for the great discussion about OEM in Redfish on OpenBMC on the
community call today.

I decided to start a new thread rather than add on to Andrews
(https://lists.ozlabs.org/pipermail/openbmc/2019-April/015916.html) becau=
se
that thread is at 10000ft and for this one I'd like to come down to 50ft.

Below you will find some mock-ups that have been floating around over her=
e that
show where we are headed in terms of logging support on our IBM systems.

The hope is we can keep the conversation from the community call today go=
ing
but with something concrete (and written down) to talk over.  So please h=
ave a
look and offer impressions, poke holes, etc.

The JSON below looks great in Mutt but just incase someones MUAs trashes =
the
code formatting I've put these in a paste too: https://pastebin.com/fWnqW=
H77

The first object is a problem log entry, the second an audit log entry an=
d the
third a maintenance log entry.

Thanks!
-brad

{
    "@odata.context": "/redfish/v1/$metadata#LogEntry.LogEntry",
    "@odata.id":        "/redfish/v1/Managers/BMC/LogServices/Problems/En=
tries/1/",
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
            "@odata.id": "LinkToPEL" //provides a link to the PEL locatio=
n
        }
    },
    "Severity": "Critical, Warning, or Info",
    "Oem":=20
    {
        "IBM":=20
        {
            "@odata.context": "/redfish/v1/$metadata#IBMLogEntry.IBMLogEn=
try",
            "@odata.type": "#HpeLogEntry.v2_1_0.IBMLogEntry",
            "Serviceable": true or false,
            "Resolved": true or false,
            "UpdatedTime" : <timestamp>,
            "EventType": < 1 of IBM EventTypes>,
            "AffectedSubsystem": <Take from PEL or PolicyTable>,

            "CallHome": true or false,
            "Notified": [
                //Maybe use this instead?
                //https://www.dmtf.org/sites/default/files/Redfish%20Scho=
ol%20-%20Events.pdf
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
    "Message": "Description of the problem", //ex. =E2=80=9CUser <ID> ADM=
IN logged in from 192.168.1.5=E2=80=9D,
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
            "AffectedSubsystem": "Systems Management - Core / Virtual App=
liance",
            "CallHome": false,
            "Notified": [
                "<UUID>": true or false
            ]
        }
    },
    "OemRecordFormat": "IBM-OpenLogging",
}

{
    "@odata.context": "/redfish/v1/$metadata#LogEntry.LogEntry",
    "@odata.id": "/redfish/v1/Managers/BMC/LogServices/Maintenance/Entrie=
s/1/",
    "@odata.type": "#LogEntry.v1_0_0.LogEntry",
    "Created": "2018-06-15T14:07:47Z",
    "EntryType": "OEM",
    "Id": "1", //log position
    "Message": "Description of the problem", //ex CPU changed from SN: 12=
345 to SN: 12445
    "MessageID": "SRC or LC Common Event ID",
    "MessageArgs": ["Arg1", "Arg2"...."ArgN"],
    "Name": "OpenBMC Log",
    "Severity": "Info",
    "Links": {
        "OriginOfCondition": {
            //"This is the URI of the resource that caused the log entry.=
 Think FRU List"
            "@odata.id": "Link to inventory item."
        }
        "Oem": {
            "@odata.id": "LinkToPEL" //provides a link to the PEL locatio=
n
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
