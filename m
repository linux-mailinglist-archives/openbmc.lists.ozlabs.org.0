Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E1E29591C9
	for <lists+openbmc@lfdr.de>; Wed, 21 Aug 2024 02:27:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WpRxW495Jz301v
	for <lists+openbmc@lfdr.de>; Wed, 21 Aug 2024 10:27:43 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=67.231.153.30 arc.chain=microsoft.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=s2048-2021-q4 header.b=asEzo0Dw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=meta.com (client-ip=67.231.153.30; helo=mx0b-00082601.pphosted.com; envelope-from=prvs=39624dd364=amithash@meta.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 598 seconds by postgrey-1.37 at boromir; Wed, 21 Aug 2024 03:18:22 AEST
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WpGQ60bPYz2y8f
	for <openbmc@lists.ozlabs.org>; Wed, 21 Aug 2024 03:18:20 +1000 (AEST)
Received: from pps.filterd (m0148460.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47KGFX77024145
	for <openbmc@lists.ozlabs.org>; Tue, 20 Aug 2024 10:08:18 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=from
	:to:cc:subject:date:message-id:content-type
	:content-transfer-encoding:mime-version; s=s2048-2021-q4; bh=Ohk
	BSngkpb6xBBbJS2+7bOx7k0HY044whe0KRVfitNc=; b=asEzo0DwZbrm8aMYPr9
	3LCePDqRmEj+V/WJkpHgAVQcw2VkxUfJt3Bvs3RjOWqB9tmYpoMzq0WCbyCouzRp
	bKBoo95MIDibX9lWgnXZliVStvGJmxXfE2dW0GjzH6vVJs9uUX49Jyxxj5Z4oceT
	dlHjcmvBtV/nqwGt0ueXk1t59eeaGbkCZXYK8RSVI9p/K6+MC4Xhj0JeafhExcqM
	b4gC5H+Rvp+9019ZlGbpknEHKuGcsXWjItfPcL5E4wIogYUMpGxZROjxDhdew+te
	VkAeY6SobLwAMnjLP7Li9xo2oK9MYB7eLNcofIPFDzjrjXWv+FBEZxdTUeHDAgbH
	46A==
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2170.outbound.protection.outlook.com [104.47.59.170])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 414xgj8d6t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openbmc@lists.ozlabs.org>; Tue, 20 Aug 2024 10:08:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LJNb4A4LODur6VvJFV2YRAEMndiBNv5hUFoIIP57iY58SBxKBgb6Q9MGhMgkuy2EWNJWL85uUWoasu7g+H6NMperrEdRCwEDNkQrNEyEnVNn6F9MouYlnCyVr/HhaFprfHoPJvDJuiQuYDAMZ7Q1ymf/tiBY9OtiiopchtVMbua0Iyi7Z6vJI4IFhIFxSRO/iOGBtu0Z/b/K8kNTr0YDAGLn41ge6/QCbJo43mw0MzMNeE1kLjIKEAr8Mren/P6w62YI7ihNa5jm+FJ3vtBukog5hUKlhfYKaFKxdBSuDi4LY24LueTB7ctyp8Wxo9C94ZOHDqOi2vuSD4JYbMI59A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OhkBSngkpb6xBBbJS2+7bOx7k0HY044whe0KRVfitNc=;
 b=pw2y8m9N7yaMefQouglA407wrfxOZf8y4wLPMaDjiRWBo5LvQnaEdQ+U0pz8cUky3OutNBEeqOh9gxufWS/HMEwxFgpIIIbrrIUd/WlbhUCbNEhsDjHEvEEjvNLuvTpt5RwMkpLR0xj5WGABYTx6RA40gVsJcEVuGb7l6irqv192WDhpqnzJMHASIOw42OqImjM855DD2r7l403oTGMtkbDH2GfSZgfS2x/Vxq6k9ujqp/9gZTwjAm8KPO/jSnQI9AXtYlFuN7jjQJopi0XV09aoQkq3SzEgEDPdILl5eY0SPTrTL3Zzj6XWNthFqBsaIVyIZv3/jnLJGz4quQD8fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=meta.com; dmarc=pass action=none header.from=meta.com;
 dkim=pass header.d=meta.com; arc=none
Received: from SJ2PR15MB5801.namprd15.prod.outlook.com (2603:10b6:a03:4f7::19)
 by SA1PR15MB5187.namprd15.prod.outlook.com (2603:10b6:806:237::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Tue, 20 Aug
 2024 17:08:14 +0000
Received: from SJ2PR15MB5801.namprd15.prod.outlook.com
 ([fe80::349c:882f:cf5d:277]) by SJ2PR15MB5801.namprd15.prod.outlook.com
 ([fe80::349c:882f:cf5d:277%5]) with mapi id 15.20.7875.019; Tue, 20 Aug 2024
 17:08:14 +0000
From: Amithash Prasad <amithash@meta.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: [Proposal] Implementing SensorEvent message registry
Thread-Topic: [Proposal] Implementing SensorEvent message registry
Thread-Index: AQHa8yFJM+K2k7rX+EaloVW6ePzT9w==
Date: Tue, 20 Aug 2024 17:08:14 +0000
Message-ID:  <SJ2PR15MB5801EA7FA684D3B21EE32CE3AB8D2@SJ2PR15MB5801.namprd15.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2PR15MB5801:EE_|SA1PR15MB5187:EE_
x-ms-office365-filtering-correlation-id: 6f16281d-5ec3-444a-1168-08dcc13aada0
x-fb-source: Internal
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:  BCL:0;ARA:13230040|366016|1800799024|376014|38070700018|3613699012;
x-microsoft-antispam-message-info:  =?Windows-1252?Q?aE9HMoVH4+tWx/aLv2WjSC84Vz8P1HCXptyLjMOSFE9p0ihDFjFZSdu8?=
 =?Windows-1252?Q?L/gm2q/Jr6iyI34zJKV7sjaSACO+JAppccuhQqg77GjleKL72lw7PAd2?=
 =?Windows-1252?Q?eZ/BnrXJZCHXzD+ejOss7RaGTjjAhkKK55obPsU2I8wubywxJPXLz7tV?=
 =?Windows-1252?Q?0mrk3bCOj6YOkHO+ZfG2lg2eNt1V15IipGQJr/Jb0boXOqph8P/9XA1Z?=
 =?Windows-1252?Q?iQOiMvVFsrWEmQqVTBODM1cQ0pNaPlanb/xjqPaub0roW5WyTZiUqWRS?=
 =?Windows-1252?Q?m2ZyJBmHtLX4Z0GWbkW7U5oSHP6yTojsB/PzSR6YfDH7JhZM4XCY4+mG?=
 =?Windows-1252?Q?wQlWnhB6Y4WNBGzI8BqsIBfLGRi+1qHRm0lTy6xsehkNdsZHIRcE+40p?=
 =?Windows-1252?Q?k5k57u0jJVMIIVoBVgn+EW9ro9KXrsSYp+ockfCO0oXAXsBDH0A6oaMP?=
 =?Windows-1252?Q?sN/WwucVATtZgSrhT1dgA7mM5yuto9G9agax2xV4GhiAoW+Aw9p7J//K?=
 =?Windows-1252?Q?1dBnosHv2xkyLys82hMiiJ41vo9aRFW7tTZaREUvmCyxVaJcdQGpRrNb?=
 =?Windows-1252?Q?posQH+ry/ycPfUqPYPzH78EluRA7758nvtSzl+iWU0Z1hDxMPSlHKqe4?=
 =?Windows-1252?Q?BnhoHD+douPQWmeWmH30FYGSHOYX8bMwitSeIkE5rsXX2QOOmhJU/dGm?=
 =?Windows-1252?Q?yFapLKXrVyVv6vI2ZTOyjCG9/t0beUVHZPfhrZotGiWe+fCbxqk/IHUI?=
 =?Windows-1252?Q?HzxLriIUrUwvQBPuxfodNkEjs5UjCculxssh/N754INCQY8Am/Gca1If?=
 =?Windows-1252?Q?FYKb2WJ1d2Ttlv8vv90FTSi6/a/xaQqwjtoahI9uzSAPnJBWk6n/c/vO?=
 =?Windows-1252?Q?KTUzx+vN+grriY/Iec8HM8MfJ+qh8ttkg4Do4pzmeP0mKMKoYR4I9h3i?=
 =?Windows-1252?Q?tLdlRqTQlz12cAvwdfHf2ZFXGUt8JO3CDQat/MxjECi6pee6+ZvsTF/u?=
 =?Windows-1252?Q?iW6F+qhcEQUaBnjdkjCdIFNz0Znfmf1+/ttQceFw7VALRPCvwe4ZAhHJ?=
 =?Windows-1252?Q?UhXxv5t8UThz5HewoiIvl5xNREz/wyo41YoK6wd/q4NV1Al4qml98J29?=
 =?Windows-1252?Q?W6UY2r560nmPhOF70om6x7HzFBPVNBtuML5ZuxCbl9SewAUPYIWj3D4R?=
 =?Windows-1252?Q?HP85bud2+kxPbsURhUTUzOfkMlhtdUKr0Ri5Xf9/2TQLVju829JMqn/+?=
 =?Windows-1252?Q?fiv2kqZQyEb2JsICwAEEl6Zpt66FF5IkzlqnEWr6MWtcc5Byrg9a2DoU?=
 =?Windows-1252?Q?vrnm0H5VR62oiBDItGSDjj106AcxpfqH/XphwQXGMANKhnKrcMbfgxjq?=
 =?Windows-1252?Q?UoAs6TtgIa+NYyQLSJeSL84YC46k6M4h8Na6LlRq5stur3mFnza5nDts?=
 =?Windows-1252?Q?5alV52QVrRHFgEOpgwHh53Vvey6hBuX00unY3n5Z7AIJHHoyzQSJ8HVb?=
 =?Windows-1252?Q?cLNPBLw8h0+mGBLbI01e7C5SG3TO1g=3D=3D?=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR15MB5801.namprd15.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018)(3613699012);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?Windows-1252?Q?mAaeqEXJCNYf+CK13uYbpHlpsJnZ2CmHLJLcp7YTTx7MUUmw+ZYAR2XR?=
 =?Windows-1252?Q?JsmeaKfRtFzqkOPPPhMso2qTKlfZKP8FMAuiOd5p8V2qg//VheMOORRT?=
 =?Windows-1252?Q?K2m7CHws2lF9CykNT9FPvOf2cPGw+zGiGiVnGZyb6prUQl3sUApV7gBi?=
 =?Windows-1252?Q?ohaTpPIcAy3TdjtCcE8SBG6r4zV3djKhovH2euB+rMlZXbAP9KpqA7MJ?=
 =?Windows-1252?Q?V4lYP6kegNeamSDGbqKpM/cueHy1eH69OkQLsousi/GQErtxsydy268o?=
 =?Windows-1252?Q?KpNGMq5w2UOwSdge51NyCBMFIuHxGo+6N0p6x807JvL+8InQza9fd/c4?=
 =?Windows-1252?Q?FW0BVoz4iqtolujBpBnG+FrA0vcOPdjNPN8KFrzNpobNzt9r/kWDGAO7?=
 =?Windows-1252?Q?omW5LMEBQ/kVqBW2W72GZ7esIBQiOQYpRbUUT/hPphGeexj7P547Kk9A?=
 =?Windows-1252?Q?H9NzPz8oKbBm8JNAOG/msQHhjjy20LDF1rMm32ZFIczJSyT8Fwz/2WuB?=
 =?Windows-1252?Q?1Hdz219moESCN/4ospf7+suKA74Qn0g3ANdAPbpjmAlLBP3cvAyCmE7H?=
 =?Windows-1252?Q?D+6dhy7xGAmhlKx6Yx9new14nu38Na76OL+/rp3Lb+wGaFZrh35JwXhN?=
 =?Windows-1252?Q?4y2L/Pn/F07S/OqCzFv/pO76c2UWOSwpUxzEqtlZAErlgbvJ8f6I4O+f?=
 =?Windows-1252?Q?bjuF50fyWnu9m5112CrXTgTpIMtewU/DOZGv3U7tJaSxFvfnnrI4WTGp?=
 =?Windows-1252?Q?0JSHOTpaAX3mTf7EPVTFM4Q26B6Lc2kht2pitv5iedbOl9qy7cbLXozM?=
 =?Windows-1252?Q?B8x2Sm3J3Atw9KlErh2aPzBbPZCG/kZK1RkMfuSf9GtVqvksfhhmfgLO?=
 =?Windows-1252?Q?5vkKXYWg0JIj1Vr2wIdcXVxHMbHc98FtFLuRmW0E1GXmkwRvxEmtld5c?=
 =?Windows-1252?Q?yUS1MmoMUCXdmsYv3PeHlYMCo6fdCP/fCOBAMMHtAa7aKvQDQ6ALL/FH?=
 =?Windows-1252?Q?ljBSL9p1UqtqNMMd0vmgMZHxpG+gkWqz2CigkcbJeQ5c+ok1PXCxmcgn?=
 =?Windows-1252?Q?Hg0YT1Ep+CxXb+ZFpQHtqsls9knX3mbjffbxmqyS89SemCRMGi4k+lI7?=
 =?Windows-1252?Q?oEjboXJ9Nt6LhEv81J95MTb0ITEtZMB/bVP8GWkilR6t8LRu1o7lgHsb?=
 =?Windows-1252?Q?PuEHw8a/HCdW3pttTWnsFOyDUpPmmR4pWrsrn/BAZ/JXv/pgDWt8Pw23?=
 =?Windows-1252?Q?dEg/1yFOOu0VF6M1biq6Pxq9KHnkPQMj1Fq/McZFwdLyB7Y5rpoicAh7?=
 =?Windows-1252?Q?ZnRyBRUxUqh+QqpAy8ELBkO4QL7EiJp5SU3zyqujqam4Bxk92/YnKywT?=
 =?Windows-1252?Q?b8uzu2ILTv7rrsC02hpNoy3OAbG2lILR5DL8JWwLc9TPcS2PiqRf9fgg?=
 =?Windows-1252?Q?eRtva58eOQbiETuxE0Ax3ud9cWj5uVDnNQQM8beWVUuUbT85eYBn0qFh?=
 =?Windows-1252?Q?boG6d7FgChljJZx03j6Surd1gozdVdFPWMjOuOMzR1nTRJuqUmRHLkaI?=
 =?Windows-1252?Q?F+2LSQI+IAbkcWACbnGeXiJ+ksYeqRw2VkiT9y45cd32wFhdWK7Y3nJs?=
 =?Windows-1252?Q?q3v29COgcITShDVF6CU+WFT/r7F6ddAVyOvb36k+oW2xM7F0CGdb2180?=
 =?Windows-1252?Q?fvtKvLh48R3AkMZwngH14l5Ab39vqTSfa4tWPcjKSerp+lw47Qxsig?=
 =?Windows-1252?Q?=3D=3D?=
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: meta.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR15MB5801.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f16281d-5ec3-444a-1168-08dcc13aada0
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Aug 2024 17:08:14.4635
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HwdYC9s27IAtK942c4BcwlzOfh4hPMZJtcQtltQtXRXX6KeNS8XfcqMbX3YXtrDhd8bPdZwXcCA2055SYv48rQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR15MB5187
X-Proofpoint-GUID: q64bChUYMf8ifYqClVgRLfELoHCKtIiK
X-Proofpoint-ORIG-GUID: q64bChUYMf8ifYqClVgRLfELoHCKtIiK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-20_12,2024-08-19_03,2024-05-17_01
X-Mailman-Approved-At: Wed, 21 Aug 2024 10:27:41 +1000
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
Cc: openbmc_compute <openbmc_compute@meta.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Folks,=0A=
=0A=
I am requesting feedback from the community on a direction to get our senso=
r services to log threshold events compatible to=0A=
ones defined in redfish message registry -- SensorEvent [7, ch2.14].=0A=
This will be based on and probably the first implementation of the recently=
 proposed enhancements to event logging[1].=0A=
=0A=
Problem Statement:=0A=
=0A=
We have two primary methods of creating threshold based events.=0A=
(1) Legacy, used only by dbus-sensors, set the ThresholdAsserted signal[2] =
and subscribed by phosphor-sel-logger[3] Which creates redfish events/messa=
ges.=0A=
(2) New, used by others as specified in phosphor-dbus-sensors for Critical[=
4] and Warning[5]. Current sensor services which raise this signal:=0A=
Phosphor-hwmon[6], phosphor-nvme, and phosphor-virtual-sensor raises a diff=
erent set of signal[6], using the phosphor-dbus-interface=0A=
=0A=
Phosphor-sel-logger subscribes to both these signals (Legacy[2] and New[3])=
 in different implementations both translating them to Redfish Message IDs:=
=0A=
```=0A=
OpenBMC.0.1.SensorThresholdCriticalLowGoingLow=0A=
OpenBMC.0.1.SensorThresholdCriticalLowGoingHigh=0A=
OpenBMC.0.1.SensorThresholdWarningLowGoingLow=0A=
OpenBMC.0.1.SensorThresholdWarningLowGoingHigh=0A=
OpenBMC.0.1.SensorThresholdWarningHighGoingHigh=0A=
OpenBMC.0.1.SensorThresholdWarningHighGoingLow=0A=
OpenBMC.0.1.SensorThresholdCriticalHighGoingHigh=0A=
OpenBMC.0.1.SensorThresholdCriticalHighGoingLow=0A=
```=0A=
These messages export 3 args: Sensor name, Sensor Reading Value, Threshold =
Value.=0A=
=0A=
While these provide value and have served us well, they have a main drawbac=
k:=0A=
=0A=
They are not part of the redfish standard which specifies explicit messages=
 around sensor threshold events.=0A=
Having events emitted which are specified in the redfish standard message r=
egistry have very specific advantages=0A=
for the client side who can use a consistent library.=0A=
=0A=
Proposed Messages:=0A=
I plan on creating new events which are based and intended to provide Redfi=
sh SensorEvent 1.0.0[7, ch2.14]. =0A=
```=0A=
SensorEvent.1.0.ReadingAboveLowerCriticalThreshold (Warning)=0A=
SensorEvent.1.0.ReadingAboveLowerFatalThreshold (Critical)=0A=
SensorEvent.1.0.ReadingAboveUpperCautionThreshold (Warning)=0A=
SensorEvent.1.0.ReadingAboveUpperCriticalThreshold (Critical)=0A=
SensorEvent.1.0.ReadingAboveUpperFatalThreshold (Critical)=0A=
SensorEvent.1.0.ReadingBelowLowerCautionThreshold (Warning)=0A=
SensorEvent.1.0.ReadingBelowLowerCriticalThreshold (Critical)=0A=
SensorEvent.1.0.ReadingBelowLowerFatalThreshold (Critical)=0A=
SensorEvent.1.0.ReadingBelowUpperCriticalThreshold (Warning)=0A=
SensorEvent.1.0.ReadingBelowUpperFatalThreshold (Critical)=0A=
SensorEvent.1.0.SensorReadingNormalRange (OK)=0A=
```=0A=
All except the last one of these provide 4 arguments:=0A=
string: The name or identifier of the sensor. This argument shall contain a=
 string that identifies or describes the Sensor resource.=0A=
number: The reading of the sensor. This argument shall contain a number tha=
t equals the value of the Reading property of the=0A=
Sensor resource.=0A=
string: The reading units of measure. This argument shall contain a string =
that equals the value of the ReadingUnits property=0A=
of the Sensor resource. Unitless readings should use count .=0A=
number: The threshold value. This argument shall contain a number that equa=
ls the value of the Reading property within the=0A=
<threshold> property of the Sensor resource.=0A=
SensorEvent.1.0.0.SensorReadingNormalRange would have only the first 3 argu=
ments.=0A=
=0A=
Example behavior (as proposed in the spec): as the sensor value rises above=
 nominal range, You will see =0A=
ReadingAboveUpperCautionThreshold, then=0A=
ReadingAboveUpperCriticalThreshold then=0A=
ReadingAboveUpperFatalThreshold.=0A=
=0A=
As the sensor readings start to drop, we would see the reverse order:=0A=
ReadingBelowUpperFatalThreshold (Marks ReadingAboveUpperFatalThreshold as r=
esolved), then=0A=
ReadingBelowUpperCriticalThreshold (Marks ReadingAboveUpperCriticalThreshol=
d as resolved) then=0A=
SensorReadingNormalRange (Marks ReadingAboveUpperCautionThreshold as resolv=
ed)=0A=
=0A=
This is an imperfect match to our existing sensor events from phosphor-sel-=
logger:=0A=
(1) While Caution and Critical matches are 1:1 match to Warning and Critica=
l respectively from phosphor-sel-logging,=0A=
we have multiple equivalents for Fatal (SoftShutdown/HardShutdown).=0A=
(2) Redfish adds an explicit message SensorEvent.1.0.0.SensorReadingNormalR=
ange to indicate that the sensor is truly=0A=
back in normal operating range, with the existing messages we need to infer=
 from pre-knowledge of thresholds.=0A=
(3) The args are similar, but OpenBMC.0.1.* events do not contain the "Unit=
s"[3] of the sensor.=0A=
=0A=
Having OpenBMC implement the standard redfish messages would really help in=
 allowing a more standard operation=0A=
from the end user which allows for better code sharing on the client side.=
=0A=
=0A=
Implementation Proposal:=0A=
=0A=
(1) Add a new phosphor-dbus-interfaces/yaml/xyz/openbmc_project/Sensor/Thre=
shold.events.yaml=0A=
(which will define the Redfish SensorEvents.1.0 events).=0A=
This will be a downstream effort from the events enhancement design proposa=
l[1].=0A=
=0A=
This will add definitions for all of SensorEvent.1.0.* (Not just the ones p=
rovided as examples earlier),=0A=
but the first wave of implementation will focus more on threshold events.=
=0A=
=0A=
Example snipped of the Threshold.events.yaml=0A=
```=0A=
version: 1.0.0=0A=
=0A=
errors:=0A=
  - name: ReadingAboveUpperCriticalThreshold=0A=
    severity: critical=0A=
    metadata:=0A=
      - name: sensor_name=0A=
        type: string=0A=
        primary: true=0A=
      - name: reading_value=0A=
        type: double=0A=
        primary: true=0A=
      - name: units=0A=
        type: enum[Value.interface.Unit]=0A=
        primary: true=0A=
      - name: threshold_value=0A=
        type: double=0A=
        primary: true=0A=
    redfish-mapping: SensorEvent.1.0.0.ReadingAboveUpperCriticalThreshold=
=0A=
=0A=
events:=0A=
=0A=
  - name: SensorReadingNormalRange=0A=
    severity: notice=0A=
    metadata:=0A=
      - name: sensor_name=0A=
        type: string=0A=
        primary: true=0A=
      - name: reading_value=0A=
        type: float/double=0A=
        primary: true=0A=
      - name: units=0A=
        type: string/might be better to be a enum=0A=
        primary: true=0A=
    redfish-mapping: SensorEvent.1.0.0.SensorReadingNormalRange=0A=
```=0A=
=0A=
(2) Have each of the sensor monitoring services (dbus-sensors[9], pldm [10]=
 when it lands, virtual-sensors[11],=0A=
phosphor-hwmon[12]) updated to use the appropriate new message/exceptions.=
=0A=
We can track thresholds as they exceed and log.=0A=
Each service will log an appropriate event as the value exceeds a threshold=
. (Example, reading exceeding Caution=0A=
Threshold and then exceeding Critical Threshold) will log two events. Each =
logged event will have an appropriate=0A=
uniquely identifiable Hint. (More at [8]). The service should also keep loc=
al state of what alerts were already raised=0A=
(so it does not raise a duplicated alert).=0A=
As the reading starts moving towards nominal value, the service can query t=
he logging service and resolve the=0A=
previously raised alerts. This is done using the Hint parameter used previo=
usly. At each point the service will=0A=
mark the local alert (Critical/Caution etc) as resolved for that sensor.=0A=
Once there are no longer any alarms. (Sensor value below Caution threshold)=
 and a previous alert was raised.=0A=
The service can clear its local assert and log the SensorReadingNormalRange=
 event. This would not need an=0A=
associated hint.=0A=
=0A=
Keep Backward Compatibility=0A=
=0A=
Let the existing services continue to use the signals as is. If there are n=
o listeners, it's probably a no-op. We can keep the=0A=
Threshold signal and Threshold Alarms. These are also good mechanisms for o=
ther services to take actions based on=0A=
sensor thresholds since this only changes the logging behavior around these=
 events; we should not expect additional behavior changes.=0A=
=0A=
Users could use the capability planned for the changes to turn off these ne=
w events for systems already using phosphor-sel-logger.=0A=
=0A=
Alternative Considered=0A=
=0A=
While SensorEvent.1.0.X is the most generic and comprehensive, Redfish Mess=
age Registry[7] also specifies more sensor specific type events.=0A=
Example:=0A=
Power 1.0.0 specifies:=0A=
```=0A=
[Power|Current|Voltage][Above|Below][Upper|Lower][Caution|Critical|Fatal]Th=
reshold and [Power|Current|Voltage]NoLongerCritical=0A=
```=0A=
Arguments are the same as SensorEvent args with the obvious omission of the=
 =93Units=94 argument.=0A=
Environmental 1.0.0 specifies=0A=
```=0A=
[Humidity|Temperature][Above|Below][Upper|Lower][Caution|Critical|Fatal]Thr=
eshold and TemperatureNoLongerCritical, HumidityNormal.=0A=
```=0A=
Arguments are the same as SensorEvent args with the omission of the =93Unit=
s=94 argument.=0A=
=0A=
The reason I chose not to consider these are:=0A=
(1) There are no entries for some sensor types like Airflow (CFM), Fan spee=
d (RPM), Fan PWM. Hence for a majority of these we would=0A=
need to default to the SensorEvent.=0A=
(2) I found the Humidity events inconsistent with Temperature.=0A=
(3) The code would be less elegant with a lot of units based case switch st=
atements splattered all over.=0A=
=0A=
Thus my recommendation of sticking to the more generic SensorEvent.1.0.0.=
=0A=
=0A=
References:=0A=
[1] https://github.com/openbmc/docs/blob/master/designs/event-logging.md=0A=
[2] https://github.com/openbmc/dbus-sensors/blob/master/src/Thresholds.cpp#=
L468=0A=
[3] https://github.com/openbmc/phosphor-sel-logger/blob/master/include/thre=
shold_event_monitor.hpp#L329C27-L329C45=0A=
[4] https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/yaml/xy=
z/openbmc_project/Sensor/Threshold/Critical.interface.yaml=0A=
[5] https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/yaml/xy=
z/openbmc_project/Sensor/Threshold/Warning.interface.yaml=0A=
[6] https://github.com/openbmc/phosphor-hwmon/blob/master/thresholds.hpp#L7=
5=0A=
[7] https://www.dmtf.org/sites/default/files/standards/documents/DSP2065_20=
23.1.pdf=0A=
[8] https://github.com/openbmc/docs/blob/master/designs/event-logging.md#ph=
osphor-logging=0A=
[9] https://github.com/openbmc/dbus-sensors/blob/master/src/Thresholds.cpp=
=0A=
[10] https://gerrit.openbmc.org/c/openbmc/pldm/+/51489/135/platform-mc/nume=
ric_sensor.cpp#657=0A=
[11] https://github.com/openbmc/phosphor-virtual-sensor/blob/master/thresho=
lds.hpp#L173=0A=
[12] https://github.com/openbmc/phosphor-hwmon/blob/master/thresholds.hpp=
=0A=
=0A=
Thanks,=0A=
Amithash=
