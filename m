Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 91D3852517
	for <lists+openbmc@lfdr.de>; Tue, 25 Jun 2019 09:44:39 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Xyq857WczDqMF
	for <lists+openbmc@lfdr.de>; Tue, 25 Jun 2019 17:44:36 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=microsoft.com
 (client-ip=40.107.75.100; helo=nam02-bl2-obe.outbound.protection.outlook.com;
 envelope-from=neladk@microsoft.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none)
 header.from=microsoft.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=microsoft.com header.i=@microsoft.com
 header.b="WT7lqjNA"; dkim-atps=neutral
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750100.outbound.protection.outlook.com [40.107.75.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45XypM23cXzDq5b
 for <openbmc@lists.ozlabs.org>; Tue, 25 Jun 2019 17:43:53 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=testarcselector01; d=microsoft.com; cv=none;
 b=kKVpFAhLQgFBj8wXqgOpGrRT/3Y1kBCwoa+EKQrqlzIxCWUiFyv/6n1dy1oDf7vgiwIegx9Yn+OjwTzO7GmZ4O8XyxHTH2eXJbeczEvcoHGgY3zB3kt4mGauXCCNBfEE4xfx8oMKjd2gFY/vZTci0vb5wyTJOk7Bs0y6isKUGnM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=testarcselector01;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SlVjwpWzMOjkJ3zeqFdc9fIeeF0POaxIpRI5xfoaRw8=;
 b=cjXzzO67CtfcuNvrnhUwl5jN1aczJCJy4o1yiXQTopKP4MbTo+bIT0cdqCyAJ8pY50qzMbECpOaOW0//81E8/IC4RElrjDuGeWW9cNC/FWwloNuNdMzq438acnofzsmnoE8tuqxH2s9M3pljJnAElR6fCV36val7wNmLY75QgrY=
ARC-Authentication-Results: i=1; test.office365.com
 1;spf=none;dmarc=none;dkim=none;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SlVjwpWzMOjkJ3zeqFdc9fIeeF0POaxIpRI5xfoaRw8=;
 b=WT7lqjNAbM2cbQCqbfoWZgjFJfsAETrUdI/+kJHrLohair21ucU38xbes2/aV604PGupboCaQR21INzOZWErMmGhD2xV/YyEUesLZKPIfGeSHcKDvAnGuC+ixAvmUlta1G8gW6uEjw9nsywtkm6TdDsU4Yk2eBtTEhjfN3wrhpg=
Received: from BYAPR21MB1191.namprd21.prod.outlook.com (20.179.56.209) by
 BYAPR21MB1256.namprd21.prod.outlook.com (20.179.57.160) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.1; Tue, 25 Jun 2019 07:43:48 +0000
Received: from BYAPR21MB1191.namprd21.prod.outlook.com
 ([fe80::d8f2:358f:52df:2969]) by BYAPR21MB1191.namprd21.prod.outlook.com
 ([fe80::d8f2:358f:52df:2969%2]) with mapi id 15.20.2052.003; Tue, 25 Jun 2019
 07:43:48 +0000
From: Neeraj Ladkani <neladk@microsoft.com>
To: "Paul.Vancil@dell.com" <Paul.Vancil@dell.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: RE: Platform telemetry and health monitoring
Thread-Topic: Platform telemetry and health monitoring
Thread-Index: AdUqvr91HvDeXicmSfWb6F6uAhq+3wAasZeQ
Date: Tue, 25 Jun 2019 07:43:48 +0000
Message-ID: <BYAPR21MB1191A26EB5622A8095101263C8E30@BYAPR21MB1191.namprd21.prod.outlook.com>
References: <742cb5ad955a42518e15c0c68ed06f94@AUSX13MPS306.AMER.DELL.COM>
In-Reply-To: <742cb5ad955a42518e15c0c68ed06f94@AUSX13MPS306.AMER.DELL.COM>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=True;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Owner=neladk@microsoft.com;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2019-06-25T07:43:46.3783440Z;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=General;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=ac24e326-e7a0-47e1-b311-fde76cc5934e;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Extended_MSFT_Method=Automatic
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=neladk@microsoft.com; 
x-originating-ip: [50.47.128.230]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 17317e67-a22e-4d1d-78f9-08d6f940dbf5
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BYAPR21MB1256; 
x-ms-traffictypediagnostic: BYAPR21MB1256:
x-ms-exchange-purlcount: 3
x-microsoft-antispam-prvs: <BYAPR21MB1256F7142CED1F71B44109B0C8E30@BYAPR21MB1256.namprd21.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0079056367
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(396003)(39860400002)(376002)(136003)(346002)(199004)(189003)(13464003)(6246003)(8936002)(8990500004)(5660300002)(26005)(66446008)(6436002)(305945005)(53546011)(8676002)(66476007)(186003)(7736002)(3846002)(6306002)(73956011)(11346002)(81156014)(102836004)(53936002)(6506007)(229853002)(33656002)(66946007)(22452003)(66066001)(71200400001)(478600001)(68736007)(10090500001)(76116006)(55016002)(81166006)(66556008)(6116002)(9686003)(64756008)(10290500003)(2906002)(2501003)(99286004)(86362001)(110136005)(476003)(256004)(25786009)(486006)(446003)(74316002)(76176011)(71190400001)(52536014)(966005)(7696005)(316002)(14454004);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR21MB1256;
 H:BYAPR21MB1191.namprd21.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microsoft.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: i9KY8fdCrUFGrd/Vj2UR96fbLZlMFxSfmhJDSY+nOq43c0J+SICY6Z9L8oqVDsGGzXgiSs/yZTQr/hqTiMmqMX+eA1FWJ+1z8pLQT/T/p4zNqTsbjvnwsBQ47n/qQ+cjGuocEUlCMj9Tt5Mw4/koA3cPIyuAPQE1eB6hsg+3J5rgjkK900XY86Ce35oLPetVkLUWjVniAiJh/NZ0Fw/jTaR1Y1E9hcyK8WWHGuX/9tlJdkPBonPC3CBmkFkuYPXLbCWC95VBxsO1zIu5xH1Bu/KkSOhFpOSg+l7f9mdGAOJBtllMqyHOC0/3Bi3yav7T3t/WcdH1izh3wudJgF30ywxFTuFTo2+T5lZhHptvteo1LuIUAjRUQvDvyfM+0MBUgLKYlj5QSzEuCncWaYGwY9JUskvIyHQATrSP20+HQlY=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17317e67-a22e-4d1d-78f9-08d6f940dbf5
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2019 07:43:48.0873 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: neladk@microsoft.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR21MB1256
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

This is good stuff Paul. Thank you for detailed explanation in today's call=
. if you can share the Mock up, it would be great.=20

I'll share notes soon.=20

Neeraj

-----Original Message-----
From: openbmc <openbmc-bounces+neladk=3Dmicrosoft.com@lists.ozlabs.org> On =
Behalf Of Paul.Vancil@dell.com
Sent: Monday, June 24, 2019 12:34 PM
To: openbmc@lists.ozlabs.org
Subject: Re: Platform telemetry and health monitoring

Re Redfish support for Telemetry,
Deepak noted that Redfish had a Telemetry schema that is a work-in-progress=
 (wip).
Actually, Redfish Telemetry was release as part of the 2018.2 release in Au=
gust 2018, and is being implemented by some BMCs now.
See:  https://nam06.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fw=
ww.dmtf.org%2Fcontent%2Fnew-redfish-release-adds-openapi-30-support-telemet=
ry&amp;data=3D02%7C01%7Cneladk%40microsoft.com%7Ca3197c4ea71c426c110f08d6f9=
21c441%7C72f988bf86f141af91ab2d7cd011db47%7C1%7C1%7C636970320773102040&amp;=
sdata=3D2U11E0iOrhnRGxl8FgmBrjyaPzHKbWajeT509U5tmXw%3D&amp;reserved=3D0
And  https://nam06.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fww=
w.dmtf.org%2Fsites%2Fdefault%2Ffiles%2FRedfish_2018_Release_2_Overview.pdf&=
amp;data=3D02%7C01%7Cneladk%40microsoft.com%7Ca3197c4ea71c426c110f08d6f921c=
441%7C72f988bf86f141af91ab2d7cd011db47%7C1%7C1%7C636970320773102040&amp;sda=
ta=3D%2B4JjaeCJ870NOUS%2F7%2FhKSu6TFeexSayU45N08YYj0dM%3D&amp;reserved=3D0 =
   (slides 2, 7 )
The White Paper Deepak referred to was released as a wip earlier in the yea=
r.   It was not updated but is accurate as a general overview.
There is a public-telemetry-mockup that is nice for understanding the model=
, but not yet published.   We could push them to do that soon.
In Redfish, there are:
   --MetricDefinitions -- that define a metric property (eg minimumConsumed=
Watts being the min of power consumption over an interval)
   --MetricReportDefinitions -- define a metric report consisting of a set =
of MetricProperties, what triggers the generation of the report (eg schedul=
ed, on trigger...), and how to send the report (log to metricReports Collec=
tion, send RedfishEvent, etc)
   --MetricReports -- the report --which can is logged or sent as an event
   --MetricTriggers -- defines triggers can can trigger a metric report cre=
ation eg a sensor crossing a threshold etc

Metric data can be collected by the BMC, and then read by a client with Red=
fish GET requests, or can be sent autonomously as RedfishEvents.

The data is JSON encoded and formatted along the lines of Redfish responses=
, but the reports generally only contains the relevant telemetry data (with=
 minimal describing metadata) since the descriptive metadata is all defined=
 by the MetricReportDefinitions and MetricDefinitions that are associated w=
ith the report.
=20
The Redfish Telemetry model is very general in nature I think--and thus sup=
ports about any type of metric or telemetry data one might want.
So this is worth a strong consideration as the basis for OpenBMC telemetry.

Note that the model does support allowing users to define metric reports (b=
ased on supported Redfish properties), however it does not require allowing=
 users to define custom reports (which could be complicated to implement).
I think most early implementations will support some set of pre-defined Met=
ricReportDefinitions.
However the DMTF has not officially published any 'standard' Report Definit=
ions.

Thanks,  Paul Vancil   --Dell ESI


----------------------------------------------------------------------

Message: 1
Date: Thu, 20 Jun 2019 14:54:35 +0530
From: Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>
To: Neeraj Ladkani <neladk@microsoft.com>, OpenBMC Maillist
	<openbmc@lists.ozlabs.org>
Subject: Re: Platform telemetry and health monitoring
Message-ID: <582a29cf-e3bf-f7d3-2e78-c743c3a6a2d2@linux.vnet.ibm.com>
Content-Type: text/plain; charset=3Dutf-8; format=3Dflowed

On 19/06/19 11:11 AM, Neeraj Ladkani wrote:
> In last meeting, we discussed that telemetry data can be collected=20
> using ?tools? and exported using binary ?blobs?,
>=20
> Should we define a standard data format so that information can be parsed=
 through standard mechanism and help taking specific actions.
>=20
> Host CPU
> Memory
> Network Adapter
> GPUs/IPUs
> BMCs
>=20

Redfish has a work-in-progress [1] Telemetry schema, and I believe via this=
 schema, one can pull out telemetry information, as well as have the BMC pu=
sh out Telemetry information via server-sent events. Are you looking at thi=
s as an option?

[1]
https://nam06.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fwww.dmt=
f.org%2Fdocuments%2Fredfish-spmf%2Fredfish-telemetry-white-paper-010a&amp;d=
ata=3D02%7C01%7Cneladk%40microsoft.com%7Ca3197c4ea71c426c110f08d6f921c441%7=
C72f988bf86f141af91ab2d7cd011db47%7C1%7C1%7C636970320773102040&amp;sdata=3D=
YhukH6juS%2FbWyFd7PngBHmbHwsY98%2FEVe2zYuYb2d%2Fs%3D&amp;reserved=3D0

Regards,
Deepak

> Thanks
> Neeraj


