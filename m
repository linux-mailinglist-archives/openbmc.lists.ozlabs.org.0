Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 96519114347
	for <lists+openbmc@lfdr.de>; Thu,  5 Dec 2019 16:10:35 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47TK0Q2yyLzDqTn
	for <lists+openbmc@lfdr.de>; Fri,  6 Dec 2019 02:10:30 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.136; helo=mga12.intel.com;
 envelope-from=piotr.matuszczak@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47TJzN0yPzzDq8B
 for <openbmc@lists.ozlabs.org>; Fri,  6 Dec 2019 02:09:34 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Dec 2019 07:09:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,281,1571727600"; d="scan'208";a="214205167"
Received: from irsmsx107.ger.corp.intel.com ([163.33.3.99])
 by orsmga003.jf.intel.com with ESMTP; 05 Dec 2019 07:09:30 -0800
Received: from irsmsx101.ger.corp.intel.com ([169.254.1.76]) by
 IRSMSX107.ger.corp.intel.com ([169.254.10.18]) with mapi id 14.03.0439.000;
 Thu, 5 Dec 2019 15:09:29 +0000
From: "Matuszczak, Piotr" <piotr.matuszczak@intel.com>
To: "Matuszczak, Piotr" <piotr.matuszczak@intel.com>, Neeraj Ladkani
 <neladk@microsoft.com>
Subject: RE: Adding new metric definition use case
Thread-Topic: Adding new metric definition use case
Thread-Index: AdWl3aOwRZz1PlNdQ6G816tHTiv0cwDzn2jQAA9eSMAAYJcIgA==
Date: Thu, 5 Dec 2019 15:09:29 +0000
Message-ID: <DBA24EEE99A3B3489FF472F5E94DE6D7A310A5EB@IRSMSX101.ger.corp.intel.com>
References: <DBA24EEE99A3B3489FF472F5E94DE6D7A3108ED1@IRSMSX101.ger.corp.intel.com>
 <BY5PR21MB1377E4996FF4D8AB139BA5D2C8420@BY5PR21MB1377.namprd21.prod.outlook.com>
 <DBA24EEE99A3B3489FF472F5E94DE6D7A3109D0D@IRSMSX101.ger.corp.intel.com>
In-Reply-To: <DBA24EEE99A3B3489FF472F5E94DE6D7A3109D0D@IRSMSX101.ger.corp.intel.com>
Accept-Language: pl-PL, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiMDFkYTNlNzgtZTJjYS00N2UzLWIxMzUtYzNhNGRlOGZiNjM4IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiZnFCbmRqWWR3Y2dtZFdnbm40bE5uTVBoRDM4SlBnZ0NjWXd1N3ErK2R3TTBzSkhJR3gzWmRGbHFcL3p3Mm1nWHgifQ==
x-ctpclassification: CTP_NT
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: request-justification,no-action
x-originating-ip: [163.33.239.181]
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "Ambrozewicz,
 Adrian" <adrian.ambrozewicz@intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Neeraj,=20

I've analyzed your use case with Adrian. It looks like you want to define n=
ew, synthesized metric from existing D-Bus sensors. We would like to propos=
e a design to implement user-defined metrics, which are synthesized from ot=
her metrics using mathematical formulas defined by the user. Such formula m=
ay be provided by the user in runtime, not requiring recompilation of OpenB=
MC. We can discuss  it during the next Telemetry WG meeting.=20


-----Original Message-----
From: openbmc <openbmc-bounces+piotr.matuszczak=3Dintel.com@lists.ozlabs.or=
g> On Behalf Of Matuszczak, Piotr
Sent: Tuesday, December 3, 2019 4:42 PM
To: Neeraj Ladkani <neladk@microsoft.com>
Cc: openbmc@lists.ozlabs.org; Ambrozewicz, Adrian <adrian.ambrozewicz@intel=
.com>
Subject: RE: Adding new metric definition use case

Hi Neeraj,=20

There are two cases:
1. Sensor is already monitored and you want to define new Metric Definition=
. It is done on the Redfish level. Also in the case when you want to create=
 calculated metric ("Implementation" property equals "Calculated"). In this=
 case min/max/average can be calculated (as defined by the "CalculationAlgo=
rithm" property).
2. You want to create Metric Definition for Synthesized sensor ("Implementa=
tion" property equals "Synthesized"). This is the example you shown below. =
In such case, there is no way to provide BMC the algorithm how the metric s=
hall be synthesized from source metrics. In this case, the calculation algo=
rithm has to be implemented as virtual sensor in the BMC prior to defining =
the Metric Definition. If you want to be able to create synthesized sensors=
 in runtime, additional design will have to be provided.=20

Regards
Piotr

-----Original Message-----
From: Neeraj Ladkani <neladk@microsoft.com>=20
Sent: Tuesday, December 3, 2019 8:40 AM
To: Matuszczak, Piotr <piotr.matuszczak@intel.com>
Cc: openbmc@lists.ozlabs.org; Ambrozewicz, Adrian <adrian.ambrozewicz@intel=
.com>
Subject: RE: Adding new metric definition use case

Hi Piotr,=20

The use case is simple that if we want to add new metric definition which i=
s already monitored on DBUS and exposed on redfish , we should be able to c=
onfigure it without changing BMC code. =20

For example:
{
    "@odata.type": "#MetricDefinition.v1_0_3.MetricDefinition",
    "Id": "OutletAirflowTemp",
    "Name": "Definition of Outlet Airflow Temperature",
    "MetricType": "Numeric",
    "Implementation": "Synthesized",
    "PhysicalContext": "Exhaust",
    "Units": "Cel",
    "Wildcards": [
        {
            "Name": "ChassisID",
            "Values": [
                "1"
            ]
        }
    ],
    "CalculationParameters": [
        {
            "SourceMetric": "/redfish/v1/Chassis/{ChassisID}/Thermal#/Tempe=
ratures/2/ReadingCelsius"
        },
        {
            "SourceMetric": "/redfish/v1/Chassis/{ChassisID}/Thermal#/Fans/=
0/Reading"
        },
        {
            "SourceMetric": "/redfish/v1/Chassis/{ChassisID}/Thermal#/Fans/=
1/Reading"
        },
        {
            "SourceMetric": "/redfish/v1/Chassis/{ChassisID}/Power#/PowerCo=
ntrol/0/PowerConsumedWatts",
            "ResultMetric": "/redfish/v1/Chassis/{ChassisID}/Power#/PowerCo=
ntrol/0/PowerMetrics/AverageConsumedWatts"
        }
    ],
    "@odata.id": "/redfish/v1/TelemetryService/MetricDefinitions/OutletAirf=
lowTemp",
    "@Redfish.Copyright": "Copyright 2014-2019 DMTF. For the full DMTF copy=
right policy, see http://www.dmtf.org/about/policies/copyright."
}

-----Original Message-----
From: Matuszczak, Piotr <piotr.matuszczak@intel.com>=20
Sent: Thursday, November 28, 2019 3:33 AM
To: Neeraj Ladkani <neladk@microsoft.com>
Cc: openbmc@lists.ozlabs.org; Ambrozewicz, Adrian <adrian.ambrozewicz@intel=
.com>
Subject: [EXTERNAL] Adding new metric definition use case

Hi Neeraj,

	As we talked recently during the Telemetry WG meeting, you were asking abo=
ut adding new metric definitions. Please, let me better understand your use=
 case, you have HW sensor present on the board (for example, let it be CPU0=
 VR temperature), you have already HWmon reading it and exposing it as the =
sensor on D-Bus. You want to be able to add the new Metric Definition for p=
roper interpretation of sensor's reading and new metric definition shall al=
so modify sensor's D-Bus parameters (Scale and Unit) ? Do I understand it c=
orrectly?=20
	Monitoring Service does not have to interpret the metric from the sensors,=
 because it is used only for report management.=20
	=20

Piotr Matuszczak
---------------------------------------------------------------------
Intel Technology Poland sp. z o.o.=20
ul. Slowackiego 173, 80-298 Gdansk
KRS 101882
NIP 957-07-52-316

