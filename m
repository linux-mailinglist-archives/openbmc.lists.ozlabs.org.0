Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A07AE10F904
	for <lists+openbmc@lfdr.de>; Tue,  3 Dec 2019 08:40:29 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Rv624WNSzDqVx
	for <lists+openbmc@lfdr.de>; Tue,  3 Dec 2019 18:40:26 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=microsoft.com (client-ip=40.107.73.128;
 helo=nam05-dm3-obe.outbound.protection.outlook.com;
 envelope-from=neladk@microsoft.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none)
 header.from=microsoft.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=microsoft.com header.i=@microsoft.com
 header.b="Jl2jfbDv"; dkim-atps=neutral
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730128.outbound.protection.outlook.com [40.107.73.128])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Rv573NkczDqV9
 for <openbmc@lists.ozlabs.org>; Tue,  3 Dec 2019 18:39:38 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ev+bC7rRYDqIOSXG2Qy0nj87wSrMMM9I293bjPjNzLBlFsxkIzpG2mqLfvi1O8/A7fnHExgnoH8PemXdu2p7BW0mUbVDXitufysvGqck1Si6bC2kEuAhuFrTbA9E4sVambYg83+Dbwd395cmbAaVnwWq81AuvFUAW452MiPBJ1zfSnqXelLRc4a1GpmPu+EFtFvXFWFAOY6eYKKJpp9ULXWaaiLV3yLPTDGVEP+LrfV9L8bND6DlLr1Ggj5RPBaEefT39k935T43EUJ4Z+LSWnu2XflUsGMR6TGU51BRGLo+M8rNjQSnIMAuFLYr2P3G2eHx19Vi+xw9EX2UomefFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gapRevQxJXIikWWBoswCBWDfxPk4ofHcJsB6arzqm4w=;
 b=kRaHItkFJFeB5OWsDvpjuGORs91mPCzwYUOVAXq/rm8Wtk1GSrts0atBWRqI1TjmqIxubOU6uO7zAxkZyF7ad5MLG8NP51kSNK9uf0XlKNafk3J2i5D1XKPQ9XccJ5Gmnj9gsyHqFUFQ2tYvweXqXaZ5XnEGWFvxpBmrBpoPTI0o71eZosANQFyijwS5L/A55pHdXLH7YPYYRFCam8PSgJi9o+2NjufczNLhAqltRN8R8+1m1C9Ymw5Y0n9++NpK1ryxGPp/i5nMDDYq9M4xfrwbJ4og6Z540zTZ7o4Ov8VANNhBt62tyKfwALSBMn5s0d0Wi7wwWfKjtY46I1G0Qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gapRevQxJXIikWWBoswCBWDfxPk4ofHcJsB6arzqm4w=;
 b=Jl2jfbDvZh8B0w3TL2hlYokwRFdTVyFysCxdwQlY7q5NNBX543FioNH1Vf6iuztcBwNODOqYk8v8C5E3au+Fj8zTtwWPsNoAoynrclqy0+G64C/+sNfHbbXQH9XbZKWSe3pftBXLXYrnRIOPnFc4V2vcStWjB5mmjwHFOzM/MQY=
Received: from BY5PR21MB1377.namprd21.prod.outlook.com (20.180.35.8) by
 BY5PR21MB1442.namprd21.prod.outlook.com (20.180.33.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2538.3; Tue, 3 Dec 2019 07:39:33 +0000
Received: from BY5PR21MB1377.namprd21.prod.outlook.com
 ([fe80::513a:edf3:16a3:ff34]) by BY5PR21MB1377.namprd21.prod.outlook.com
 ([fe80::513a:edf3:16a3:ff34%6]) with mapi id 15.20.2538.000; Tue, 3 Dec 2019
 07:39:33 +0000
From: Neeraj Ladkani <neladk@microsoft.com>
To: "Matuszczak, Piotr" <piotr.matuszczak@intel.com>
Subject: RE: Adding new metric definition use case
Thread-Topic: Adding new metric definition use case
Thread-Index: AdWl3aOwRZz1PlNdQ6G816tHTiv0cwDzn2jQ
Date: Tue, 3 Dec 2019 07:39:33 +0000
Message-ID: <BY5PR21MB1377E4996FF4D8AB139BA5D2C8420@BY5PR21MB1377.namprd21.prod.outlook.com>
References: <DBA24EEE99A3B3489FF472F5E94DE6D7A3108ED1@IRSMSX101.ger.corp.intel.com>
In-Reply-To: <DBA24EEE99A3B3489FF472F5E94DE6D7A3108ED1@IRSMSX101.ger.corp.intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=True;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Owner=neladk@microsoft.com;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2019-12-03T07:39:31.5021536Z;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=General;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=f50a9834-1b5e-4d9e-a3bf-f5ac41b1e427;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Extended_MSFT_Method=Automatic
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=neladk@microsoft.com; 
x-originating-ip: [50.35.81.9]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: df359c78-4740-431b-64a5-08d777c3f065
x-ms-traffictypediagnostic: BY5PR21MB1442:
x-microsoft-antispam-prvs: <BY5PR21MB14422B2EDB157686BE5AEAA9C8420@BY5PR21MB1442.namprd21.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 02408926C4
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(13464003)(199004)(189003)(22452003)(9686003)(6306002)(55016002)(14454004)(33656002)(6246003)(3846002)(6116002)(5660300002)(11346002)(229853002)(446003)(81166006)(81156014)(66066001)(66556008)(64756008)(86362001)(8936002)(498600001)(8676002)(25786009)(8990500004)(305945005)(10090500001)(52536014)(966005)(6436002)(71200400001)(66476007)(99286004)(66446008)(10290500003)(6916009)(7736002)(54906003)(186003)(76176011)(74316002)(26005)(6506007)(53546011)(4326008)(7696005)(2906002)(76116006)(256004)(71190400001)(102836004)(66946007);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR21MB1442;
 H:BY5PR21MB1377.namprd21.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microsoft.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jbSO7gClRWGdqPKxdFiL3lmT233W8Y26BK1gmtwMEQkmwwDu+EnlhhdzcO2MlZNg00c4lWApGpfaOMaXUSLswBdcV6a21NwX0sXkpw71Vv7kWD9AFd6n4tItba7L/IICGWsQ3Gsd2Xmb0hkKUl69wy9TDJKB3M575AR3ZZaYAz7Ksj5Z+lrlMtl+AyIB0ZTLEO8/z5G2yvtthswOFRKq+H3sRr4HDIEY9XEKnIm+NlYVMjPtYIGEernE9B0s8EjiLa9BF7Ij1/Zw/KPlnTJGWkVlWWsvUNrtL6Z0tCRurAan1mVKnr8YVlC2BfeLGNpScasCWNwJyLuVsswrxLxiI+/duLVlQKgHRUSwOUW768D9YWwPue9kksaxoVvyt5koSYOKPnEoZ8EPeh/CocMtijQbfKn2hwNIePQfCfeIe9gacSiyUuz5ms7lr2ke9v+FGNq7ODSC99h5qqrZZxnAyfFVhKGQrFMd6WrWvz2SiZ8=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df359c78-4740-431b-64a5-08d777c3f065
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Dec 2019 07:39:33.0644 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZTbwY0DXNseRJRwgDemtybegXX2fynll/Sf7HZQXBR3Q62OT7eJtINXtTC0ASKHeUaZP/WKXo1i0vpUAafnL6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR21MB1442
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

