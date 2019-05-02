Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AD831250D
	for <lists+openbmc@lfdr.de>; Fri,  3 May 2019 01:25:56 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44wBGB02PXzDqPf
	for <lists+openbmc@lfdr.de>; Fri,  3 May 2019 09:25:54 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0b-00082601.pphosted.com;
 envelope-from=prvs=0025cb1aae=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="kS1Ql/hA"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="Euu8BU/J"; dkim-atps=neutral
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44wBDm2PLBzDqHJ
 for <openbmc@lists.ozlabs.org>; Fri,  3 May 2019 09:24:35 +1000 (AEST)
Received: from pps.filterd (m0109331.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x42NHQZ9006948; Thu, 2 May 2019 16:24:30 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=facebook;
 bh=HrpDSERSdLVVRIizAKKrcocDb4nF8vCrBEnOMn0APIo=;
 b=kS1Ql/hA41/6yBPVkBVyoGswOSohbTXtYnWwY1p7fHfUbw+p1IZwuVIUt+m072KgtXGi
 t/OxsCjm4TSM1Xs6E1V306qpdXii2SteMF3KsHNFINHRIH2BCB+cSGGCEoEniTwQ9XLu
 sgeAC7BV5OeQIJrZkOpvn4cuqLitv2QmRac= 
Received: from mail.thefacebook.com (mailout.thefacebook.com [199.201.64.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2s82v19j8t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Thu, 02 May 2019 16:24:30 -0700
Received: from prn-hub06.TheFacebook.com (2620:10d:c081:35::130) by
 prn-hub04.TheFacebook.com (2620:10d:c081:35::128) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1713.5; Thu, 2 May 2019 16:24:28 -0700
Received: from NAM04-BN3-obe.outbound.protection.outlook.com (192.168.54.28)
 by o365-in.thefacebook.com (192.168.16.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1713.5
 via Frontend Transport; Thu, 2 May 2019 16:24:28 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HrpDSERSdLVVRIizAKKrcocDb4nF8vCrBEnOMn0APIo=;
 b=Euu8BU/JI2jADIzBKJMYk88USjfKxvTvKeIwI10yTTOgHImLLjN/qW39myywSzefP3bIrkQ1j3TwvEd82xcWMZo30+CwbVDNNozLNbNN/4+14xG+W14ibYydmtMGJB2DMxK+Gz73Cnu2cNAlaUyXkcYvTi470ZsRQjXPVelysds=
Received: from CY4PR15MB1269.namprd15.prod.outlook.com (10.172.177.11) by
 CY4PR15MB1479.namprd15.prod.outlook.com (10.172.162.17) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.10; Thu, 2 May 2019 23:24:27 +0000
Received: from CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::1039:c5b1:f43e:14e9]) by CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::1039:c5b1:f43e:14e9%3]) with mapi id 15.20.1835.018; Thu, 2 May 2019
 23:24:27 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Ed Tanous <ed.tanous@intel.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: Re: pid control configuration
Thread-Topic: pid control configuration
Thread-Index: AQHVAHC+JTVF079u7EWEF1cz6ijBgKZW49mAgAEiSgA=
Date: Thu, 2 May 2019 23:24:27 +0000
Message-ID: <7D337AEA-CB20-4E39-8A9A-58E21EDA0F31@fb.com>
References: <96A52DC2-7B18-4F69-B8E8-3B489BDA84C6@fb.com>
 <1c5566ba-696e-42eb-c193-22eaca33a1db@intel.com>
In-Reply-To: <1c5566ba-696e-42eb-c193-22eaca33a1db@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::3:606a]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4841f630-5a1d-498f-fd28-08d6cf5551f6
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);
 SRVR:CY4PR15MB1479; 
x-ms-traffictypediagnostic: CY4PR15MB1479:
x-microsoft-antispam-prvs: <CY4PR15MB14798569085477809EA6C16FDD340@CY4PR15MB1479.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0025434D2D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39860400002)(136003)(396003)(376002)(346002)(366004)(199004)(189003)(81156014)(81166006)(6246003)(25786009)(8676002)(305945005)(6506007)(53546011)(76176011)(73956011)(91956017)(8936002)(66946007)(68736007)(2906002)(256004)(6116002)(6436002)(6512007)(102836004)(7736002)(71200400001)(5660300002)(2501003)(6486002)(229853002)(71190400001)(7116003)(316002)(99286004)(3480700005)(86362001)(446003)(11346002)(2616005)(36756003)(46003)(110136005)(478600001)(76116006)(33656002)(186003)(82746002)(66446008)(64756008)(66556008)(83716004)(66476007)(53936002)(476003)(14454004)(486006);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR15MB1479;
 H:CY4PR15MB1269.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Zz4AZUHDQmIn6Y4X6FHTrZXnqyZ255CSBFDWzUt7YDP6K7/cDxMVY3eZhU5lkBEqRI7/kStvnWPwRZ3xWvFGi8M4+jVUPHhuPeoYIVTqKYUkladClfDXKirI5cLOI4pMPNb0Kny0EH5ArjaomRB4WlXtG2c+WICcEWZhYjGKlIiLU3k62XLD3XZ1HtVCiNdUPrbACQ88r1Mvs8bZdRLCpalNrkzidCEYgGHIf2jxNKWqfhjU/U483rEniVXCL76zgqmRwB6yswkDhgXNhCsOPZLIZHNWQLClMsL/0M526DDxmFBy9tO+j6Bay3YrcCUkvuHrvtmGWtIDLm5Y2VBOlwXbLyccJS2ljk6FuxOYdmCvYbwvXPXWzdh+iFO+zbV/Xp9z2zupmwmvz4Yi5LVroI0eYW4KIiq+BmJmWPiwuVQ=
Content-Type: text/plain; charset="utf-8"
Content-ID: <15AB407D43DE12459F36AE4ABC7D545E@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 4841f630-5a1d-498f-fd28-08d6cf5551f6
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 May 2019 23:24:27.2834 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR15MB1479
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-02_12:, , signatures=0
X-Proofpoint-Spam-Reason: safe
X-FB-Internal: Safe
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

SGkgRWQsDQpUaGFua3MgZm9yIGRldGFpbGVkIGRlZmluaXRpb24gb2YgZWFjaCBwYXJhbWV0ZXIs
IGl0IHJlYWxseSBoZWxwcy4gSSBoYXZlIGEgZm9sbG93IHVwIHF1ZXN0aW9uIGZyb20gUjEwMCBD
aGFzc2lzLmpzb24gaW4gZW50aXR5IG1hbmFnZXIgd2hlcmUgImZhbiIgY2xhc3MgaXMgYWxzbyBk
ZWZpbmVkIGFzIHBpZCBjb250cm9sbGVyLiBJIGRvbid0IHRoaW5rIHdlIGhhdmUgYW55IHBpZCBk
YXRhIGZvciBmYW5zLCB3ZSBvbmx5IGhhdmUgcGlkIGRhdGEgZm9yIHRlbXBlcmF0dXJlIHNlbnNv
cnMuIE15IHVuZGVyc3RhbmRpbmcgaGVyZSBpcyBwaWQgZGF0YSBhcmUgb25seSBkZWZpbmVkIGZv
ciB0ZW1wIHNlbnNvcnMgd2hpY2ggd2lsbCBnZW5lcmF0ZSBwd20gdmFsdWVzIGZvciBmYW4uIEkg
bWlnaHQgYmUgbWlzc2luZyBzb21ldGhpbmcgaGVyZSwgcGxlYXNlIGNsYXJpZnkuDQoNClJlZ2Fy
ZHMNCi1WaWpheQ0KDQrvu79PbiA1LzEvMTksIDQ6MDYgUE0sICJvcGVuYm1jIG9uIGJlaGFsZiBv
ZiBFZCBUYW5vdXMiIDxvcGVuYm1jLWJvdW5jZXMrdmlqYXlraGVta2E9ZmIuY29tQGxpc3RzLm96
bGFicy5vcmcgb24gYmVoYWxmIG9mIGVkLnRhbm91c0BpbnRlbC5jb20+IHdyb3RlOg0KDQogICAg
T24gNS8xLzE5IDM6NTMgUE0sIFZpamF5IEtoZW1rYSB3cm90ZToNCiAgICA+IEhpIFBhdHJpY2sv
SmFtZXMsDQogICAgPiANCiAgICA+IEkgYW0gbm90IHVuZGVyc3RhbmRpbmcgaG93IHRvIGdldCB0
aGVzZSBmb2xsb3dpbmcgZGF0YSBmb3IgY29uZmlndXJhdGlvbg0KICAgID4gZmlsZSBmb3IgcGlk
LiBJIG9ubHkgaGFkIHAocHJvcG9ydGlvbmFsKSwgaShpbnRlZ3JhbCkgYW5kDQogICAgPiBkKGRp
ZmZlcmVudGlhbCkgdmFsdWVzIGZyb20gbXkgdGhlcm1hbCB0ZWFtLiBCdXQgdW5hYmxlIHRvIG1h
b3AgdGhlc2UgdG8NCiAgICA+IHJlcXVpcmVkIHBhcmFtZXRlci4NCiAgICA+IA0KICAgID4gIA0K
ICAgID4gDQogICAgPiAgICAgInJlcXVpcmVkIjogWw0KICAgID4gDQogICAgPiAgICAgICAgICJD
bGFzcyIsDQogICAgVGhpcyB3aWxsIGJlIFBJRENvbnRyb2xsZXIgaW4gdGhlIGNhc2Ugb2YgUElE
LCBhbmQgaXMgcGFydCBvZiBob3cgZW50aXR5DQogICAgbWFuYWdlciBkaXZpZGVzIHVwIHRoZSBj
b25maWcgaW5mb3JtYXRpb24gdG8gdGhlIHZhcmlvdXMgY29tcG9uZW50cy4NCiAgICA+IA0KICAg
ID4gICAgICAgICAiRkZHYWluQ29lZmZpY2llbnQiLA0KICAgID4gDQogICAgPiAgICAgICAgICJG
Rk9mZkNvZWZmaWNpZW50IiwNCiAgICBJbiB5b3VyIGNhc2UsIGJvdGggb2YgdGhlc2UgRkYgdmFy
aWFibGVzIHdvdWxkIGJlIDAuMA0KICAgID4gDQogICAgPiAgICAgICAgICJJQ29lZmZpY2llbnQi
LA0KICAgIFdvdWxkIGJlIHRoZSBJIHZhbHVlIGZyb20geW91ciB0aGVybWFsIHRlYW0uDQogICAg
DQogICAgPiANCiAgICA+ICAgICAgICAgIklMaW1pdE1heCIsDQogICAgPiANCiAgICA+ICAgICAg
ICAgIklMaW1pdE1pbiIsDQogICAgDQogICAgVGhlc2Ugc2V0cyB0aGUgbGltaXRzIHRvIHRoZSBp
bnRlZ3JhbCBjb2VmZmljaWVudCB0byBwcmV2ZW50IGludGVncmFsDQogICAgcnVuYXdheSBpbiB0
aGUgY2FzZSB3aGVyZSB0aGUgY29udHJvbGxlciBjYW5ub3QgZXZlciByZWFjaCB0aGUgdGFyZ2V0
DQogICAgdGVtcGVyYXR1cmUuICBJZiB5b3UgZG9uJ3Qgd2FudCB0byB1c2UgdGhlc2UgYXQgYWxs
ICh3aGljaCBJIHdvdWxkbid0DQogICAgcmVjb21tZW5kIGZyb20gYSBjb250cm9sIHBlcnNwZWN0
aXZlKSB5b3UgY2FuIHNldCB0aGVtIHRvIHVucmVhc29uYWJseQ0KICAgIGxhcmdlIGFuZCB1bnJl
YXNvbmFibHkgc21hbGwgdmFsdWVzLCBhbmQgdGhleSB3aWxsIGhhdmUgbm8gZWZmZWN0Lg0KICAg
IA0KICAgID4gDQogICAgPiAgICAgICAgICJJbnB1dHMiLA0KICAgIA0KICAgIFRoZSBzZW5zb3Jz
IHlvdSB3YW50IHRvIGNvbnRyb2wsIGJ5IG5hbWUuDQogICAgDQogICAgPiANCiAgICA+ICAgICAg
ICAgIk5hbWUiLA0KICAgIFRoaXMgaXMgdGhlICJwcmV0dHkiIG5hbWUgZm9yIHRoaXMgY29udHJv
bGxlciwgYW5kIGNhbiBiZSB3aGF0ZXZlciB5b3UNCiAgICB3YW50LiAgVGhlIGNvbnRyb2xsZXIg
d2lsbCBzaG93IHVwIGluIERCdXMgYW5kIFJlZGZpc2ggdW5kZXIgdGhpcyBuYW1lLg0KICAgIA0K
ICAgID4gDQogICAgPiAgICAgICAgICJPdXRMaW1pdE1heCIsDQogICAgPiANCiAgICA+ICAgICAg
ICAgIk91dExpbWl0TWluIiwNCiAgICA+IA0KICAgIA0KICAgIEkgYmVsaWV2ZSBib3RoIG9mIHRo
ZXNlIGFyZSBpbiAlIG9mIGZhbiBzcGVlZCB0aGVzZSBkYXlzLCBzbyBzZXR0aW5nDQogICAgdGhl
bSB0byAxMDAgYW5kIDAlIHJlc3BlY3RpdmVseSB3aWxsIHByb2JhYmx5IGdpdmUgeW91IHRoZSBi
ZWhhdmlvciB5b3UNCiAgICB3YW50IGlmIHlvdSBkb24ndCBoYXZlIG90aGVyIGRhdGEgZnJvbSB5
b3VyIHRoZXJtYWwgdGVhbSBhcm91bmQgbGltaXRzLg0KICAgIA0KICAgID4gICAgICAgICAiUENv
ZWZmaWNpZW50IiwNCiAgICBZb3VyIFAgdmFsdWUgZnJvbSB5b3VyIHRoZXJtYWwgdGVhbS4NCiAg
ICANCiAgICA+IA0KICAgID4gICAgICAgICAiU2xld05lZyIsDQogICAgPiANCiAgICA+ICAgICAg
ICAgIlNsZXdQb3MiLA0KICAgIA0KICAgIFRoZXNlIHR3byByZWZsZWN0IHRoZSBEIHZhbHVlcyBm
cm9tIHlvdXIgdGhlcm1hbCB0ZWFtLiAgSWYgdGhleSBvbmx5DQogICAgZ2F2ZSB5b3Ugb25lIEQg
dmFsdWUsIHRoZXJlIGFyZSB0d28gdGhpbmdzIGhlcmUuICAxLiBJdCBjb3VsZCB1c2UgdGhlDQog
ICAgc2FtZSBjb2VmZmljaWVudHMgZm9yIGJvdGggcG9zaXRpdmUgYW5kIG5lZ2F0aXZlIGRlcml2
YXRpdmUgdmFsdWVzLiAgT3INCiAgICAyLiBJdCBvbmx5IGFwcGxpZXMgdG8gUG9zaXRpdmUgc2xl
dyByYXRlcywgYW5kIG5lZ2F0aXZlIGlzIHplcm8uICBZb3UNCiAgICB3b3VsZCBuZWVkIHRvIHRh
bGsgdG8geW91ciB0ZWFtIHRvIHVuZGVyc3RhbmQgd2hhdCB0aGV5IGludGVuZGVkLg0KICAgIA0K
ICAgID4gDQogICAgPiAgICAgICAgICJUeXBlIiwNCiAgICBUaGUgRW50aXR5IG1hbmFnZXIgdHlw
ZSwgd2hpY2ggSSBiZWxpZXZlIGl0IFBJRENvbnRyb2xsZXIsIGJ1dCBJIGRvbid0DQogICAgaGF2
ZSB0aGUgZXhhbXBsZXMgaW4gZnJvbnQgb2YgbWUuDQogICAgDQogICAgPiANCiAgICA+ICAgICAg
ICAgIlpvbmVzIg0KICAgIEZhbiB6b25lcyBpbiB3aGljaCB0aGlzIGNvbnRyb2xsZXIgYXBwbGll
cyB0by4gIEZvciBUaW9nYSBwYXNzIEkgd291bGQNCiAgICBleHBlY3QgeW91IHRvIG9ubHkgaGF2
ZSBhIHNpbmdsZSBmYW4gem9uZSBmb3IgdGhlIHdob2xlIG5vZGUuDQogICAgDQogICAgPiANCiAg
ICA+ICAgICBdDQogICAgPiANCiAgICA+ICANCiAgICA+IA0KICAgID4gIA0KICAgID4gDQogICAg
PiBBbHNvIHdlIGhhdmUgYSByZXF1aXJlbWVudCBvZiBzdGVwd2lzZSBhbmQgcGlkIHRvZ2V0aGVy
IGZvciBzb21lDQogICAgPiBzZW5zb3JzLCBpcyBpdCBwb3NzaWJsZSB0byBjb25maWd1cmUgc2Ft
ZSBzZW5zb3IgZm9yIGJvdGggdHlwZXMuWWVzLCB5b3UgY2FuIGRlY2xhcmUgbXVsdGlwbGUgY29u
dHJvbGxlcnMuICBXaGljaGV2ZXIgY29udHJvbGxlcg0KICAgIHJlcXVlc3RzIHRoZSBoaWdoIGZh
biBzcGVlZCB3aWxsIGJlIHRoZSBvbmUgdGhhdCdzIHVzZWQgZm9yIHRoZSBQV00gb3V0cHV0Lg0K
ICAgIA0KDQo=
