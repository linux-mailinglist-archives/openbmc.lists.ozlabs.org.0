Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FD75125CEA
	for <lists+openbmc@lfdr.de>; Thu, 19 Dec 2019 09:46:17 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47dlpZ4WZGzDqf1
	for <lists+openbmc@lfdr.de>; Thu, 19 Dec 2019 19:46:14 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=microsoft.com (client-ip=40.107.244.115;
 helo=nam12-mw2-obe.outbound.protection.outlook.com;
 envelope-from=neladk@microsoft.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none)
 header.from=microsoft.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=microsoft.com header.i=@microsoft.com
 header.b="Xghsd6Y7"; dkim-atps=neutral
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2115.outbound.protection.outlook.com [40.107.244.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47dlng5c1gzDqf1
 for <openbmc@lists.ozlabs.org>; Thu, 19 Dec 2019 19:45:25 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LQ91dolzd59+8hwI4rCZ+yBWN5RrJGSl0S5/FfVPPANsZ35yRV4uOvYwagkpBhbuaZoCNhPwU1ayFR1S/ymX44uW0HCQZkIqCcAe2o46Av//nA+Dpeikh6r82If/aqdT0I+WANLua+TnXJyvegRPcJ5UXglIf0O0YbAArBPa40xAqIO+NqXZcIJG4AOjOijAKwWtn+T2lue6ro9zZ+vuNR6S/9+4LLP9r14CJzg4lWz87oxeX2FhQxNLM785tH6Rrg+zcCxeRcTgY5gW1JjN6cwIiEKAgC2AeIfHVSxCxf8Uc4CSQJ/UD/nAwpbhHO3ufdklm7sZxDoqpa7cUTO1pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d0vqWkIr8FY+Dfj1TgR+ySsKEl3CC4F6ocuMph4N0Fs=;
 b=PlHhOGoUYnMFTWC289lLUkB+z9bnT+ShXyQNdHCmPoHCkSABBlMqyYskMCRA9959bFmyl/cBYPC+nrcxndd+xMQhfqQnhcolQEChWasvXur+eOOE9wlBIHB9NYCiqtmxQSkROYuRac7AoknAmQ8rImL2R1Zuxvz6ZEFKiENpzJrlR2OrE1kEOYd0DaZjY1JzOQaHn1GoelcnmVNesRPPS7z4OhVz3lIr+Iro3MNQLAzVcYiko8C3HU0HAacMGUrgnlXC3sg7/UrESbIQkvAEwJwpvfTwgFo+c6UbrhlDta2VEUxQj1XPgAF3W8r9EtKDdINF1glnHyGgaizkNfPtUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d0vqWkIr8FY+Dfj1TgR+ySsKEl3CC4F6ocuMph4N0Fs=;
 b=Xghsd6Y7Zdri/XnP5C3ZVU7wUsQlQVWcrVSEPR93JJwPKGpNSLVdpnhlfRSW5xqibLzSc/0P8UPD12B9WCwJA+dfNrmxBh7NYX794aFeHNSdBaHSiJph1ooIccwgzkYeAohPPWjMZRpzb21xj8ENCvtSzyDyZRIXTU+qIFc7q/I=
Received: from DM6PR21MB1388.namprd21.prod.outlook.com (20.180.21.213) by
 DM6PR21MB1451.namprd21.prod.outlook.com (20.180.23.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2581.4; Thu, 19 Dec 2019 08:45:20 +0000
Received: from DM6PR21MB1388.namprd21.prod.outlook.com
 ([fe80::b49e:1e60:52e0:69cf]) by DM6PR21MB1388.namprd21.prod.outlook.com
 ([fe80::b49e:1e60:52e0:69cf%6]) with mapi id 15.20.2581.001; Thu, 19 Dec 2019
 08:45:20 +0000
From: Neeraj Ladkani <neladk@microsoft.com>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: RE: [EXTERNAL] how to get pci config space
Thread-Topic: [EXTERNAL] how to get pci config space
Thread-Index: AQHVtPhoFm1LEaTOGUCqyx7AUYNegKe+tCuwgAA63gCAAImDUIAAXJuAgAFO7kA=
Date: Thu, 19 Dec 2019 08:45:20 +0000
Message-ID: <DM6PR21MB138859ED52E4D8B7B1B634FEC8520@DM6PR21MB1388.namprd21.prod.outlook.com>
References: <584F7181-73DB-4090-93D7-87E0E7408F20@fuzziesquirrel.com>
 <DM6PR21MB1388CB8A990972BA09EB5163C8500@DM6PR21MB1388.namprd21.prod.outlook.com>
 <3718EF06-C5DE-4D3D-B2B1-548FEF5A1919@fuzziesquirrel.com>
 <DM6PR21MB138892F44E5B77CCE63F83D4C8530@DM6PR21MB1388.namprd21.prod.outlook.com>
 <D37CC7FB-0199-47A5-930A-B9BBFF02F0D8@fuzziesquirrel.com>
In-Reply-To: <D37CC7FB-0199-47A5-930A-B9BBFF02F0D8@fuzziesquirrel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=True;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Owner=neladk@microsoft.com;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2019-12-19T08:45:19.0386185Z;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=General;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=6e9d67e6-4bab-4dda-8061-6c73af52234e;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Extended_MSFT_Method=Automatic
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=neladk@microsoft.com; 
x-originating-ip: [50.35.81.9]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 18e5ee85-34f8-46e5-0ad6-08d7845fc813
x-ms-traffictypediagnostic: DM6PR21MB1451:
x-microsoft-antispam-prvs: <DM6PR21MB14510D3DF87B8B97482381A2C8520@DM6PR21MB1451.namprd21.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0256C18696
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(346002)(366004)(136003)(39860400002)(376002)(396003)(199004)(189003)(13464003)(5660300002)(8676002)(9686003)(33656002)(86362001)(52536014)(4326008)(81166006)(8990500004)(81156014)(53546011)(6506007)(7696005)(71200400001)(478600001)(66446008)(6916009)(8936002)(10290500003)(64756008)(316002)(55016002)(26005)(2906002)(66946007)(66556008)(66476007)(186003)(76116006);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR21MB1451;
 H:DM6PR21MB1388.namprd21.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microsoft.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pVtojyYvV9Jk9Rgq8lxdVXYmmKMwlwUcDJSiyHQUIwMmC3p69hOjMkCzPmW0sPtJDAHCv3DUtzVu1jfq/jeze0C9PM5y3IIjJuWOz7S5uxSAu+vQZ8BCKATpTmyvrHLgSOKlaL8cgbDlRKTTdN2zJa/HSdXbvxnYCRMZSoDJelKNf5QqspDJqskicBsQJKyXu7z071yb9SDcIqKQiaAGJIiSjgdsLEPPNRcvpNRvAW/fuhhhL5R8I5a0q9HGVdV4qF2F5PD1NeR7ssSgR+0wOjQDJrNjj2nzOQJCHo8WxzNzrxE7rmKo0PhMV+bbBp3kis3eIhC79V6aAV9HNbwpo3w/1IOpBh2Cmf4m8nG5SrBkyuJsv/9VMhXoPj06BOOtytgOWgBgWhREICd05Maa1ePYf1xuWjvkd7nhjuku0W6r5/XslvZewFZ63yjEW46dNM4dqQkgsGbLjXEjE0xJWE61kVo9qJtaWmRBwVnDGH/cqlpX3D+UxybRmDWXMLXB
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18e5ee85-34f8-46e5-0ad6-08d7845fc813
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Dec 2019 08:45:20.8430 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6wzz/JnjpvEzb/ReGtfA0DJ0Kqf1X2qlQJd6ZXPo6ocJHV1glxbFlV3YfMDSLI/OdMoO3iHizSqVoeQF8g8Z9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR21MB1451
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

It depends on requirements like in our use case, our PCIe devices are fixed=
 so we can preprogram a array in JSON file to include all PCI functions fro=
m a device but for someone else for example OEM who is selling the servers,=
 it not possible to predict all PCI device can be connected on PCIe slot so=
 we can let system firmware send this information or do RdPCIRd via PECI.=20

I am not aware of any standards on "Implementation". I have seen typical im=
plementations where system firmware sends post PCIe data ( exact schema) to=
 BMC using redfish and BMC produces this data over redfish ( just act like =
passthrough).=20

Neeraj

-----Original Message-----
From: Brad Bishop <bradleyb@fuzziesquirrel.com>=20
Sent: Wednesday, December 18, 2019 4:35 AM
To: Neeraj Ladkani <neladk@microsoft.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: [EXTERNAL] how to get pci config space

Thanks Neeraj

> On Dec 18, 2019, at 2:18 AM, Neeraj Ladkani <neladk@microsoft.com> wrote:
>=20
> IMO, we only need DeviceID and VendorID fields from PCIe Config space

This would probably meet my need to dynamically tune fan control parameters=
.  Is it possible to populate instances of the pciedevice schema based on d=
evid and vendorid alone?

> and we can let system firmware send this information during boot

This is how it works on Power systems before OpenBMC, but we have a custom =
protocol with a proprietary implementation.  The purpose of my note was to =
find out if there are typical implementations or even standards out there f=
or doing this.

> or preprogram the information to BMC using EntityManager.=20

Can you elaborate on how this would work?  Given the number of pcie devices=
 out there this seems like it would be hard to do it this way without a hug=
e database of some kind on the bmc?

> Regarding BMC-CPU(via PECI), BMC needs to send PECI command to CPU. CPU s=
hould support RdPCICfg as supported PECI command and thus respond with data=
.

Ok - that sounds like its all in hardware.  But above it sounded like you s=
uggest we skip RdPCICfg and instead let system firmware push this informati=
on down to the BMC - do I have it right?  If so why do you prefer that mech=
anism?

thx!

-brad
