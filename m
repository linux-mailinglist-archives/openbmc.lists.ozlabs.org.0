Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C8EA41B641D
	for <lists+openbmc@lfdr.de>; Thu, 23 Apr 2020 21:00:12 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 497RSp1BVdzDr61
	for <lists+openbmc@lfdr.de>; Fri, 24 Apr 2020 05:00:10 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=1382a73f5b=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=quarantine dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=JF+Em+7R; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-fb-onmicrosoft-com header.b=PEDw2X18; 
 dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 497RRt47JXzDr43
 for <openbmc@lists.ozlabs.org>; Fri, 24 Apr 2020 04:59:21 +1000 (AEST)
Received: from pps.filterd (m0109334.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03NIrVJi026858; Thu, 23 Apr 2020 11:59:14 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 mime-version; s=facebook; bh=G1/cq3BaP41+uNM93OYb0vwwHJVkYXWTtrqHRoITmqc=;
 b=JF+Em+7RuzmG8hKHDWouZxcCf7owJUGSSkEPbSxgc8H7qkCz4/ElZer0+dLtD1CunSjY
 Xl//O5s3hMFQaaQLvgdipjHCQzmqQkaC0G4WI+aIeNbgbfPiMKZjtVxwWq1m2UFiGSqD
 6rYcQVRjg0oYJaHK4HSjbmvzdfDXTLgAWmM= 
Received: from mail.thefacebook.com ([163.114.132.120])
 by mx0a-00082601.pphosted.com with ESMTP id 30ghjwt4ns-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 23 Apr 2020 11:59:14 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (100.104.98.9) by
 o365-in.thefacebook.com (100.104.94.198) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1847.3; Thu, 23 Apr 2020 11:59:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MRp/+K/HsUM6WWkap7P88ERbDrhHSksz19zroDhXHcPF19G7wtG/Difa3byFDHB5zHVPiD9LPL++1zlIKkCmybDXa8TjWI+TGqrB6XuH/G5E6Bo4vvHdrBqhbTpgbHQBt1HQN1OGAiq4EAlsjzVsJ6cNPx0mAX1uL7yxeeoa2VcMBUuXjOO0P8GgqJLApB5hS1cejZK9u77uKJnb91HI5CFzuIfTdHiFc1gAgfOim7P7IKvMSIpLTFw/NbGUYI71OOJ2LHM2KISX6qZ556p6hvws4QQqtzKSdoZosDOL7Nj3GlbfiCpxSCMxwBZ/hPuVJdKBv4LLyhVwMUqQ8uV6ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G1/cq3BaP41+uNM93OYb0vwwHJVkYXWTtrqHRoITmqc=;
 b=ZxYNAcq5kJxoxxY8dkJOHUn4wLuJyEoV+cUzvMRF74ykauq46OSr6wYrqLAcDjHq/8cncuHgXJZJFE73R0x4Qr8l5lSEl/3PMenM/Y8zf9wMVbpPxdX2SNodxZMZFx1UaOybbp4QH9I4gqxpzlvLe7HPLRdB61bNP1ejfywamHAEECfJ1ER33C4YDmy7xERX5UNpZ1hb7ylfP6BjbL+7nguSqC6HBvNnFYLOeyEXq3zzS6oWsfgBb19O2aIl8SC+ym2nUhMY2IEIbADCBsCj1ImUUlri8I+5ujCx30pZSUdem+hpRZr56zvzNfVA7KreRGDGxuSeA6J1WxyePcbaug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G1/cq3BaP41+uNM93OYb0vwwHJVkYXWTtrqHRoITmqc=;
 b=PEDw2X18I7voKEgI2AC0wxDNHvsTB4q/I01yYZ4LV0Fp8EvGD4Y+mXMmwidI2TRQg+37BbaCGtacvd7umC/34Gtek4WtrGyuq5Z/YokeFwximZAon//V44jS8NE8zjRstdyFbjrHDjOEkYOm/YOe7zYv0Iicd28OZ6hxwGmiDK0=
Received: from BYAPR15MB2374.namprd15.prod.outlook.com (2603:10b6:a02:8b::16)
 by BYAPR15MB3398.namprd15.prod.outlook.com (2603:10b6:a03:10e::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.29; Thu, 23 Apr
 2020 18:59:12 +0000
Received: from BYAPR15MB2374.namprd15.prod.outlook.com
 ([fe80::e43b:5f8d:799:39a4]) by BYAPR15MB2374.namprd15.prod.outlook.com
 ([fe80::e43b:5f8d:799:39a4%3]) with mapi id 15.20.2921.030; Thu, 23 Apr 2020
 18:59:12 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Oskar Senft <osk@google.com>
Subject: Re: Access Intel ME IPMB from BMC
Thread-Topic: Access Intel ME IPMB from BMC
Thread-Index: AQHWFexuK6oXnP3TQkeAetsUpPklTKiB3UuAgAB7mID//6wGgIAE18eAgAAAvoD//8PsgA==
Date: Thu, 23 Apr 2020 18:59:12 +0000
Message-ID: <403834AD-B194-44E8-8904-21610A30D727@fb.com>
References: <CABoTLcSOQYY+gk=7Q2w6Ny02L15yM19vTPmJxDfZVst6FV5r+Q@mail.gmail.com>
 <70D0A47B-9C5B-418C-BC1F-7379493C60AA@fb.com>
 <CABoTLcTa-7Fnu9rodg9PrbeZ9wYM7vYPHZK2meEZLx2XW+ZE1Q@mail.gmail.com>
 <B3FB3174-1794-4A57-B850-61F0D8200339@fb.com>
 <CABoTLcStCvQ2fAVudN6q7bexNjuT1_NcEFwjMOR0yePWZ+d=Dg@mail.gmail.com>
 <CABoTLcSriF37EgG9dtwZGfPm-arBG66hsnn380nxYXP4cY1W4w@mail.gmail.com>
In-Reply-To: <CABoTLcSriF37EgG9dtwZGfPm-arBG66hsnn380nxYXP4cY1W4w@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:400::5:6774]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6c9e7a08-a947-421d-9ebe-08d7e7b8698e
x-ms-traffictypediagnostic: BYAPR15MB3398:
x-microsoft-antispam-prvs: <BYAPR15MB339883EBB35465935C40A598DDD30@BYAPR15MB3398.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 03827AF76E
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR15MB2374.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10019020)(366004)(346002)(376002)(39860400002)(396003)(136003)(8936002)(36756003)(71200400001)(86362001)(66446008)(64756008)(66476007)(76116006)(8676002)(81156014)(91956017)(66556008)(66946007)(966005)(316002)(6506007)(2906002)(478600001)(53546011)(6486002)(186003)(33656002)(6512007)(5660300002)(4326008)(2616005)(6916009);
 DIR:OUT; SFP:1102; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VPlrnpSLF4mj56y+4W/+nS11vkQFFfePDvDifkpIdTNl/afQetaLaAHLZqQHY9ahJM5fV/TddaT8tgkDiO/hXDl59S89J4Ts7snucZPyHsE1JPFSk8NUaxSC0WT9Z/oZNXHhyJtR7v5OEuiRjeTVL5SbF7EpK233K0MnKRGgsX0aTBeZQeDfRLN61pXUYQsLXmz5xYqnuV8pSbZBaHkkU3hPEFlW/+9nczzNArpSySmGCKC8Q9wO36EQkejIdwHs5d7ueRzNF3Z2ivnu1NvJKxKASeas/lipwfAVPC2D/eJokUXuzAmsyQbOqbD8GQXqVeUvdCQyTMRyuPW5lmcM2F2Wq7OihC5Pdt/t9g3SnhQVOB/oF/8S78CpvTBc77xmgdyvCOQbEbI8v+gJvq5APANa2mnCYeVyJjE6t87KFuQDudnbmiixLtgrrkEUaEaFI3LtLyT5QurntEZXxogfjwCq0TlSp7YpU2t467UdSnvJrL7dn1b6R3YfyjmlQ8QDzZDj0NJLurIdR7vM/tvDSA==
x-ms-exchange-antispam-messagedata: sqD6l7QbJUJd2bJd0OitzPDAMHB0oq5YRMgmjqLpFBl+BTUuMExwuXeJyMgphQhXzHUSqKt+RHzZxJxSTHTgNARcBTwFkzdUtIGSvW2PAo2qRN4IFPGIHzUnZzvEn6Va63GiWkGy5WwRSVSDRBVikrj0vxJ1VPlMBL7MkurAQauuPO5pKpTiAVBiapxt5F5D
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_403834ADB19444E8890421610A30D727fbcom_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c9e7a08-a947-421d-9ebe-08d7e7b8698e
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Apr 2020 18:59:12.6538 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CPjsIcUKMsWFmz/ffZpal51YdY3rxInBzJ70igzByMp9GcSAjKaqTOvu5QgX92UaLJNamO4Y6TCFwE1qG6/n0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB3398
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-23_13:2020-04-23,
 2020-04-23 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 bulkscore=0 phishscore=0
 mlxscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 adultscore=0 mlxlogscore=999 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004230145
X-FB-Internal: deliver
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

--_000_403834ADB19444E8890421610A30D727fbcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

QXMgaTJjIHNsYXZlIG1xdWV1ZSBkcml2ZXIgaXMgbm90IHVwc3RyZWFtZWQgYW5kIHdpdGggYWxy
ZWFkeSBoYXZpbmcgc2FtZSBmdW5jdGlvbmFsaXR5IGluIGlwbWItZGV2IGRyaXZlciB3aGljaCBp
cyBhbHJlYWR5IGluIHVvc3RyZWFtIGtlcm5lbCwgSSBkb27igJl0IHNlZSBhbnkgcmVhc29uIHRv
IHVzZSBpMmMgc2xhdmUgbXF1ZXVlIGRyaXZlci4gSSBoaWdobHkgaW5jb3VyYWdlIHBlb3BsZSB0
byB1c2UgaXBtYi1kZXYgZHJpdmVyIHdpdGggbGF0ZXN0IGlwbWJicmlkZ2UuIElmIHRoZXJlIGFy
ZSBhbnkgaXNzdWVzLCBwbGVhc2UgbGV0IHVzIGtub3cuDQoNClJlZ2FyZHMNCi1WaWpheQ0KDQpG
cm9tOiBPc2thciBTZW5mdCA8b3NrQGdvb2dsZS5jb20+DQpEYXRlOiBUaHVyc2RheSwgQXByaWwg
MjMsIDIwMjAgYXQgODozNCBBTQ0KVG86IFZpamF5IEtoZW1rYSA8dmlqYXlraGVta2FAZmIuY29t
Pg0KQ2M6IE9wZW5CTUMgTWFpbGxpc3QgPG9wZW5ibWNAbGlzdHMub3psYWJzLm9yZz4NClN1Ympl
Y3Q6IFJlOiBBY2Nlc3MgSW50ZWwgTUUgSVBNQiBmcm9tIEJNQw0KDQpPbiBhIHNpZGUgbm90ZSBy
ZWdhcmRpbmcgdGhlIGlwbWItZGV2IGRyaXZlcjogSXQgc2VlbXMgdGhhdCB0aGUgRG9jdW1lbnRh
dGlvbi9JUE1CLnR4dCBoYXMgZ290dGVuICJsb3N0Ii4gVGhlIG9ubHkgdmVyc2lvbiBJIGNvdWxk
IGZpbmQgaXMgdGhpczogaHR0cHM6Ly9naXRodWIuY29tL29wZW5ibWMvbGludXgvYmxvYi81MWJk
NmYyOTE1ODM2ODRmNDk1ZWE0OTg5ODRkZmMyMjA0OWQ3ZmQyL0RvY3VtZW50YXRpb24vSVBNQi50
eHQuIEJ1dCBpdCdzIG5vdCBpbiBhbnkgb2YgdGhlIHJlY2VudCBicmFuY2hlcyAoZGV2LTUuMyBv
ciBkZXYtNS40KS4NCg0KU2hvdWxkIHRoaXMgZmlsZSBiZSByZXN1cnJlY3RlZD8NCg0KT3NrYXIu
DQoNCk9uIFRodSwgQXByIDIzLCAyMDIwIGF0IDExOjMxIEFNIE9za2FyIFNlbmZ0IDxvc2tAZ29v
Z2xlLmNvbTxtYWlsdG86b3NrQGdvb2dsZS5jb20+PiB3cm90ZToNClRoYW5rcyBhZ2FpbiENCg0K
aXBtYmJyaWRnZSBzb2x2ZWQgbXkgcHJvYmxlbS4gSSBmb3VuZCB0aGF0IG15IHZlcnNpb24gb2Yg
T3BlbkJNQyAoaW5jbC4ga2VybmVsKSB1c2VkIGEgc2xpZ2h0bHkgb2xkZXIgdmVyc2lvbiBvZiBp
cG1iYnJpZGdlIHdoaWNoIHN0aWxsIHVzZWQgdGhlIGkyYyBzbGF2ZSBtcXVldWUsIHdoaWNoIHdv
cmtlZCBmaW5lLiBSZWFkaW5nIGEgYml0IG9mIHNvdXJjZSBjb2RlIG1hZGUgaXQgY2xlYXIgaG93
IGl0IHdvcmtlZC4gVGhlIGtleSBpcyB0byBjb25maWd1cmUgaXBibS1jaGFubmVscy5qc29uIHdp
dGggdGhlIGNvcnJlY3QgaTJjIGRldmljZSBhbmQgdGhlIHJlc3QgImp1c3Qgd29ya3MiLg0KDQpG
b3IgdGhlIGJlbmVmaXQgb2Ygb3RoZXJzOiBNeSB1bmRlcnN0YW5kaW5nIGlzIHRoYXQgdGhlIGN1
cnJlbnQgdmVyc2lvbiBvZiBpcG1iYnJpZGdlIG5vIGxvbmdlciB1c2VzIHRoZSBpMmMgc2xhdmUg
bXF1ZXVlIGJ1dCByZXF1aXJlcyB0aGUgaXBtYi1kZXYgZHJpdmVyIGluIHRoZSBrZXJuZWwuIEl0
J3Mgbm90IG5lY2Vzc2FyeSB0byBhY3R1YWxseSBhdHRhY2ggdGhlIGRyaXZlciB0byBhbiBpMmMg
ZGV2aWNlIGFzIHRoYXQgY2FuIGhhcHBlbiBhdCBydW50aW1lLg0KDQpPc2thci4NCg0KDQpPbiBN
b24sIEFwciAyMCwgMjAyMCBhdCA0OjM0IFBNIFZpamF5IEtoZW1rYSA8dmlqYXlraGVta2FAZmIu
Y29tPG1haWx0bzp2aWpheWtoZW1rYUBmYi5jb20+PiB3cm90ZToNCkhpIE9za2FyLA0KWW91IG5l
ZWQgdG8gdXNlIGlwbWItZGV2IGRyaXZlciB3aGljaCBpcyBpcyBiZWluZyB1c2VkIGJ5IGlwbWJi
cmlkZ2UuIFlvdSBkb27igJl0IG5lZWQgaXBtYi1ob3N0IGFzIHdlIGFyZSBoYXZpbmcgaXBtYmJy
aWRnZSB0byByZXBsYWNlIHRoYXQuDQoNClJlZ2FyZHMNCi1WaWpheQ0KDQpGcm9tOiBPc2thciBT
ZW5mdCA8b3NrQGdvb2dsZS5jb208bWFpbHRvOm9za0Bnb29nbGUuY29tPj4NCkRhdGU6IE1vbmRh
eSwgQXByaWwgMjAsIDIwMjAgYXQgMTE6MzUgQU0NClRvOiBWaWpheSBLaGVta2EgPHZpamF5a2hl
bWthQGZiLmNvbTxtYWlsdG86dmlqYXlraGVta2FAZmIuY29tPj4NCkNjOiBPcGVuQk1DIE1haWxs
aXN0IDxvcGVuYm1jQGxpc3RzLm96bGFicy5vcmc8bWFpbHRvOm9wZW5ibWNAbGlzdHMub3psYWJz
Lm9yZz4+DQpTdWJqZWN0OiBSZTogQWNjZXNzIEludGVsIE1FIElQTUIgZnJvbSBCTUMNCg0KSGkg
VmlqYXkNCg0KVGhhbmtzIGZvciB0aGUgcG9pbnRlciENCg0KSSBhbHNvIGZvdW5kIGJvdGggaHR0
cHM6Ly9naXRodWIuY29tL01lbGxhbm94L2lwbWItaG9zdCBhbmQgaHR0cHM6Ly9naXRodWIuY29t
L29wZW5ibWMvbGludXgvYmxvYi9kZXYtNS40L2RyaXZlcnMvY2hhci9pcG1pL2lwbWJfZGV2X2lu
dC5jLg0KDQpJcyBpdCByaWdodCB0aGF0IHdpdGggaXBtYmJyaWRnZSBJIGRvbid0IG5lZWQgZWl0
aGVyIG9mIHRoZW0gc2luY2UgaXBtYmJyaWRnZSB1c2VzIHRoZSByYXcgaTJjIGRldj8NCg0KVGhh
bmtzDQpPc2thci4NCg0KT24gTW9uLCBBcHIgMjAsIDIwMjAgYXQgMjoxMiBQTSBWaWpheSBLaGVt
a2EgPHZpamF5a2hlbWthQGZiLmNvbTxtYWlsdG86dmlqYXlraGVta2FAZmIuY29tPj4gd3JvdGU6
DQpIaSBPc2thciwNCllvdSBuZWVkIHRvIGNvbmZpZ3VyZSB5b3VyIE1FIGNoYW5uZWwgaW4gaXBt
YiBjaGFubmVsIGNvbmZpZyBmaWxlIGh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuYm1jL2lwbWJicmlk
Z2UvYmxvYi9tYXN0ZXIvaXBtYi1jaGFubmVscy5qc29uDQpBbmQgbWFrZSBzdXJlIGlwbWJicmlk
Z2UgaXMgcnVubmluZy4gVGhlbiB5b3UgY2FuIHNlbmQgZ2V0IGRldmljZSBpZCBjb21tYW5kIHRv
IE1FIGZyb20gY29tbWFuZCBsaW5lIGl0c2VsZiB0byB0ZXN0IGlmIGV2ZXJ5dGhpbmcgaXMgd29y
a2luZy4NCg0KDQoNCmJ1c2N0bCBjYWxsIHh5ei5vcGVuYm1jX3Byb2plY3QuSXBtaS5DaGFubmVs
LklwbWIgL3h5ei9vcGVuYm1jX3Byb2plY3QvSXBtaS9DaGFubmVsL0lwbWIgb3JnLm9wZW5ibWMu
SXBtYiBzZW5kUmVxdWVzdCB5eXl5YXkgMSA2IDAgMHgxIDANCg0KUmVnYXJkcw0KLVZpamF5DQoN
CkZyb206IG9wZW5ibWMgPG9wZW5ibWMtYm91bmNlcyt2aWpheWtoZW1rYT1mYi5jb21AbGlzdHMu
b3psYWJzLm9yZzxtYWlsdG86ZmIuY29tQGxpc3RzLm96bGFicy5vcmc+PiBvbiBiZWhhbGYgb2Yg
T3NrYXIgU2VuZnQgPG9za0Bnb29nbGUuY29tPG1haWx0bzpvc2tAZ29vZ2xlLmNvbT4+DQpEYXRl
OiBTYXR1cmRheSwgQXByaWwgMTgsIDIwMjAgYXQgNjo0NyBQTQ0KVG86IE9wZW5CTUMgTWFpbGxp
c3QgPG9wZW5ibWNAbGlzdHMub3psYWJzLm9yZzxtYWlsdG86b3BlbmJtY0BsaXN0cy5vemxhYnMu
b3JnPj4NClN1YmplY3Q6IEFjY2VzcyBJbnRlbCBNRSBJUE1CIGZyb20gQk1DDQoNCkhpIGV2ZXJ5
b25lDQoNCkknbSB0cnlpbmcgdG8gZmluZCBvdXQgaG93IEkgY2FuIGFjY2VzcyB0aGUgSW50ZWwg
TUUgdmlhIElQTUIgZnJvbSB0aGUgQk1DIChPcGVuQk1DKS4NCg0KRnJvbSB3aGF0IEkgZ2F0aGVy
ZWQsIEludGVsIE1FJ3MgSVBNQiBpcyBvbiB0aGUgUENIJ3MgU01MaW5rMC4gSSBrbm93IHRoaXMg
aXMgY29ubmVjdGVkIHRvIG9uZSBvZiB0aGUgU01CdXMgbW9kdWxlcyBvbiBteSBBU1QyNTAwLiBC
dXQgd2hhdCBJIGNhbid0IGZpbmQgb3V0IGlzIGhvdyBJIGFjdHVhbGx5IHNlbmQgY29tbWFuZHMg
dGhlcmU/IEknbSBzdXJlIEknbSBtaXNzaW5nIGEgZG9jdW1lbnQgdGhhdCBtYWtlcyB0aGlzIG9i
dmlvdXMuDQoNCk9yIGlzIGl0IGFzIHNpbXBsZSBhcyBkcm9wcGluZyBJUE1JIHBhY2tldHMgb250
byB0aGUgYnVzPw0KDQpJcyB0aGlzIGJ5IGFueSBjaGFuY2UgYWxyZWFkeSBpbXBsZW1lbnRlZCBp
biBPcGVuQk1DPw0KDQpUaGFua3MgZm9yIGFueSBoaW50cyENCg0KT3NrYXINCg==

--_000_403834ADB19444E8890421610A30D727fbcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <66420524578C434492CF37AA3A84E52E@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64

PGh0bWwgeG1sbnM6bz0idXJuOnNjaGVtYXMtbWljcm9zb2Z0LWNvbTpvZmZpY2U6b2ZmaWNlIiB4
bWxuczp3PSJ1cm46c2NoZW1hcy1taWNyb3NvZnQtY29tOm9mZmljZTp3b3JkIiB4bWxuczptPSJo
dHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL29mZmljZS8yMDA0LzEyL29tbWwiIHhtbG5zPSJo
dHRwOi8vd3d3LnczLm9yZy9UUi9SRUMtaHRtbDQwIj4NCjxoZWFkPg0KPG1ldGEgaHR0cC1lcXVp
dj0iQ29udGVudC1UeXBlIiBjb250ZW50PSJ0ZXh0L2h0bWw7IGNoYXJzZXQ9dXRmLTgiPg0KPG1l
dGEgbmFtZT0iR2VuZXJhdG9yIiBjb250ZW50PSJNaWNyb3NvZnQgV29yZCAxNSAoZmlsdGVyZWQg
bWVkaXVtKSI+DQo8c3R5bGU+PCEtLQ0KLyogRm9udCBEZWZpbml0aW9ucyAqLw0KQGZvbnQtZmFj
ZQ0KCXtmb250LWZhbWlseToiQ2FtYnJpYSBNYXRoIjsNCglwYW5vc2UtMToyIDQgNSAzIDUgNCA2
IDMgMiA0O30NCkBmb250LWZhY2UNCgl7Zm9udC1mYW1pbHk6Q2FsaWJyaTsNCglwYW5vc2UtMToy
IDE1IDUgMiAyIDIgNCAzIDIgNDt9DQovKiBTdHlsZSBEZWZpbml0aW9ucyAqLw0KcC5Nc29Ob3Jt
YWwsIGxpLk1zb05vcm1hbCwgZGl2Lk1zb05vcm1hbA0KCXttYXJnaW46MGluOw0KCW1hcmdpbi1i
b3R0b206LjAwMDFwdDsNCglmb250LXNpemU6MTEuMHB0Ow0KCWZvbnQtZmFtaWx5OiJDYWxpYnJp
IixzYW5zLXNlcmlmO30NCmE6bGluaywgc3Bhbi5Nc29IeXBlcmxpbmsNCgl7bXNvLXN0eWxlLXBy
aW9yaXR5Ojk5Ow0KCWNvbG9yOmJsdWU7DQoJdGV4dC1kZWNvcmF0aW9uOnVuZGVybGluZTt9DQpz
cGFuLkVtYWlsU3R5bGUxOQ0KCXttc28tc3R5bGUtdHlwZTpwZXJzb25hbC1yZXBseTsNCglmb250
LWZhbWlseToiQ2FsaWJyaSIsc2Fucy1zZXJpZjsNCgljb2xvcjp3aW5kb3d0ZXh0O30NCi5Nc29D
aHBEZWZhdWx0DQoJe21zby1zdHlsZS10eXBlOmV4cG9ydC1vbmx5Ow0KCWZvbnQtc2l6ZToxMC4w
cHQ7fQ0KQHBhZ2UgV29yZFNlY3Rpb24xDQoJe3NpemU6OC41aW4gMTEuMGluOw0KCW1hcmdpbjox
LjBpbiAxLjBpbiAxLjBpbiAxLjBpbjt9DQpkaXYuV29yZFNlY3Rpb24xDQoJe3BhZ2U6V29yZFNl
Y3Rpb24xO30NCi0tPjwvc3R5bGU+DQo8L2hlYWQ+DQo8Ym9keSBsYW5nPSJFTi1VUyIgbGluaz0i
Ymx1ZSIgdmxpbms9InB1cnBsZSI+DQo8ZGl2IGNsYXNzPSJXb3JkU2VjdGlvbjEiPg0KPHAgY2xh
c3M9Ik1zb05vcm1hbCI+QXMgaTJjIHNsYXZlIG1xdWV1ZSBkcml2ZXIgaXMgbm90IHVwc3RyZWFt
ZWQgYW5kIHdpdGggYWxyZWFkeSBoYXZpbmcgc2FtZSBmdW5jdGlvbmFsaXR5IGluIGlwbWItZGV2
IGRyaXZlciB3aGljaCBpcyBhbHJlYWR5IGluIHVvc3RyZWFtIGtlcm5lbCwgSSBkb27igJl0IHNl
ZSBhbnkgcmVhc29uIHRvIHVzZSBpMmMgc2xhdmUgbXF1ZXVlIGRyaXZlci4gSSBoaWdobHkgaW5j
b3VyYWdlIHBlb3BsZSB0byB1c2UgaXBtYi1kZXYNCiBkcml2ZXIgd2l0aCBsYXRlc3QgaXBtYmJy
aWRnZS4gSWYgdGhlcmUgYXJlIGFueSBpc3N1ZXMsIHBsZWFzZSBsZXQgdXMga25vdy48bzpwPjwv
bzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxvOnA+Jm5ic3A7PC9vOnA+PC9wPg0KPHAg
Y2xhc3M9Ik1zb05vcm1hbCI+UmVnYXJkczxvOnA+PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05v
cm1hbCI+LVZpamF5PG86cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48bzpwPiZu
YnNwOzwvbzpwPjwvcD4NCjxkaXYgc3R5bGU9ImJvcmRlcjpub25lO2JvcmRlci10b3A6c29saWQg
I0I1QzRERiAxLjBwdDtwYWRkaW5nOjMuMHB0IDBpbiAwaW4gMGluIj4NCjxwIGNsYXNzPSJNc29O
b3JtYWwiPjxiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTIuMHB0O2NvbG9yOmJsYWNrIj5Gcm9t
OiA8L3NwYW4+PC9iPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTIuMHB0O2NvbG9yOmJsYWNrIj5P
c2thciBTZW5mdCAmbHQ7b3NrQGdvb2dsZS5jb20mZ3Q7PGJyPg0KPGI+RGF0ZTogPC9iPlRodXJz
ZGF5LCBBcHJpbCAyMywgMjAyMCBhdCA4OjM0IEFNPGJyPg0KPGI+VG86IDwvYj5WaWpheSBLaGVt
a2EgJmx0O3ZpamF5a2hlbWthQGZiLmNvbSZndDs8YnI+DQo8Yj5DYzogPC9iPk9wZW5CTUMgTWFp
bGxpc3QgJmx0O29wZW5ibWNAbGlzdHMub3psYWJzLm9yZyZndDs8YnI+DQo8Yj5TdWJqZWN0OiA8
L2I+UmU6IEFjY2VzcyBJbnRlbCBNRSBJUE1CIGZyb20gQk1DPG86cD48L286cD48L3NwYW4+PC9w
Pg0KPC9kaXY+DQo8ZGl2Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PG86cD4mbmJzcDs8L286cD48
L3A+DQo8L2Rpdj4NCjxkaXY+DQo8ZGl2Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+T24gYSBzaWRl
IG5vdGUgcmVnYXJkaW5nIHRoZSBpcG1iLWRldiBkcml2ZXI6IEl0IHNlZW1zIHRoYXQgdGhlIERv
Y3VtZW50YXRpb24vSVBNQi50eHQgaGFzIGdvdHRlbiAmcXVvdDtsb3N0JnF1b3Q7LiBUaGUgb25s
eSB2ZXJzaW9uIEkgY291bGQgZmluZCBpcyB0aGlzOiZuYnNwOzxhIGhyZWY9Imh0dHBzOi8vZ2l0
aHViLmNvbS9vcGVuYm1jL2xpbnV4L2Jsb2IvNTFiZDZmMjkxNTgzNjg0ZjQ5NWVhNDk4OTg0ZGZj
MjIwNDlkN2ZkMi9Eb2N1bWVudGF0aW9uL0lQTUIudHh0IiB0YXJnZXQ9Il9ibGFuayI+aHR0cHM6
Ly9naXRodWIuY29tL29wZW5ibWMvbGludXgvYmxvYi81MWJkNmYyOTE1ODM2ODRmNDk1ZWE0OTg5
ODRkZmMyMjA0OWQ3ZmQyL0RvY3VtZW50YXRpb24vSVBNQi50eHQ8L2E+Lg0KIEJ1dCBpdCdzIG5v
dCBpbiBhbnkgb2YgdGhlIHJlY2VudCBicmFuY2hlcyAoZGV2LTUuMyBvciBkZXYtNS40KS48bzpw
PjwvbzpwPjwvcD4NCjwvZGl2Pg0KPGRpdj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxvOnA+Jm5i
c3A7PC9vOnA+PC9wPg0KPC9kaXY+DQo8ZGl2Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+U2hvdWxk
IHRoaXMgZmlsZSBiZSByZXN1cnJlY3RlZD88bzpwPjwvbzpwPjwvcD4NCjwvZGl2Pg0KPGRpdj4N
CjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxvOnA+Jm5ic3A7PC9vOnA+PC9wPg0KPC9kaXY+DQo8ZGl2
Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+T3NrYXIuPG86cD48L286cD48L3A+DQo8L2Rpdj4NCjwv
ZGl2Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PG86cD4mbmJzcDs8L286cD48L3A+DQo8ZGl2Pg0K
PGRpdj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPk9uIFRodSwgQXByIDIzLCAyMDIwIGF0IDExOjMx
IEFNIE9za2FyIFNlbmZ0ICZsdDs8YSBocmVmPSJtYWlsdG86b3NrQGdvb2dsZS5jb20iPm9za0Bn
b29nbGUuY29tPC9hPiZndDsgd3JvdGU6PG86cD48L286cD48L3A+DQo8L2Rpdj4NCjxibG9ja3F1
b3RlIHN0eWxlPSJib3JkZXI6bm9uZTtib3JkZXItbGVmdDpzb2xpZCAjQ0NDQ0NDIDEuMHB0O3Bh
ZGRpbmc6MGluIDBpbiAwaW4gNi4wcHQ7bWFyZ2luLWxlZnQ6NC44cHQ7bWFyZ2luLXJpZ2h0OjBp
biI+DQo8ZGl2Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+VGhhbmtzIGFnYWluISA8bzpwPjwvbzpw
PjwvcD4NCjxkaXY+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48bzpwPiZuYnNwOzwvbzpwPjwvcD4N
CjwvZGl2Pg0KPGRpdj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPmlwbWJicmlkZ2Ugc29sdmVkIG15
IHByb2JsZW0uIEkgZm91bmQgdGhhdCBteSB2ZXJzaW9uIG9mIE9wZW5CTUMgKGluY2wuIGtlcm5l
bCkgdXNlZCBhIHNsaWdodGx5IG9sZGVyIHZlcnNpb24gb2YgaXBtYmJyaWRnZSB3aGljaCBzdGls
bCB1c2VkIHRoZSBpMmMgc2xhdmUgbXF1ZXVlLCB3aGljaCB3b3JrZWQgZmluZS4gUmVhZGluZyBh
IGJpdCBvZiBzb3VyY2UgY29kZSBtYWRlIGl0IGNsZWFyIGhvdyBpdCB3b3JrZWQuDQogVGhlIGtl
eSBpcyB0byBjb25maWd1cmUgaXBibS1jaGFubmVscy5qc29uIHdpdGggdGhlIGNvcnJlY3QgaTJj
IGRldmljZSBhbmQgdGhlIHJlc3QgJnF1b3Q7anVzdCB3b3JrcyZxdW90Oy48bzpwPjwvbzpwPjwv
cD4NCjwvZGl2Pg0KPGRpdj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxvOnA+Jm5ic3A7PC9vOnA+
PC9wPg0KPC9kaXY+DQo8ZGl2Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+Rm9yIHRoZSBiZW5lZml0
IG9mIG90aGVyczogTXkgdW5kZXJzdGFuZGluZyBpcyB0aGF0IHRoZSBjdXJyZW50IHZlcnNpb24g
b2YgaXBtYmJyaWRnZSBubyBsb25nZXIgdXNlcyB0aGUgaTJjIHNsYXZlIG1xdWV1ZSBidXQgcmVx
dWlyZXMgdGhlIGlwbWItZGV2IGRyaXZlciBpbiB0aGUga2VybmVsLiBJdCdzIG5vdCBuZWNlc3Nh
cnkgdG8gYWN0dWFsbHkgYXR0YWNoIHRoZSBkcml2ZXIgdG8gYW4gaTJjIGRldmljZQ0KIGFzIHRo
YXQgY2FuIGhhcHBlbiBhdCBydW50aW1lLjxvOnA+PC9vOnA+PC9wPg0KPC9kaXY+DQo8ZGl2Pg0K
PHAgY2xhc3M9Ik1zb05vcm1hbCI+PG86cD4mbmJzcDs8L286cD48L3A+DQo8L2Rpdj4NCjxkaXY+
DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj5Pc2thci48bzpwPjwvbzpwPjwvcD4NCjxkaXY+DQo8ZGl2
Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PG86cD4mbmJzcDs8L286cD48L3A+DQo8L2Rpdj4NCjwv
ZGl2Pg0KPC9kaXY+DQo8L2Rpdj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxvOnA+Jm5ic3A7PC9v
OnA+PC9wPg0KPGRpdj4NCjxkaXY+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj5PbiBNb24sIEFwciAy
MCwgMjAyMCBhdCA0OjM0IFBNIFZpamF5IEtoZW1rYSAmbHQ7PGEgaHJlZj0ibWFpbHRvOnZpamF5
a2hlbWthQGZiLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPnZpamF5a2hlbWthQGZiLmNvbTwvYT4mZ3Q7
IHdyb3RlOjxvOnA+PC9vOnA+PC9wPg0KPC9kaXY+DQo8YmxvY2txdW90ZSBzdHlsZT0iYm9yZGVy
Om5vbmU7Ym9yZGVyLWxlZnQ6c29saWQgI0NDQ0NDQyAxLjBwdDtwYWRkaW5nOjBpbiAwaW4gMGlu
IDYuMHB0O21hcmdpbi1sZWZ0OjQuOHB0O21hcmdpbi1yaWdodDowaW4iPg0KPGRpdj4NCjxkaXY+
DQo8cCBjbGFzcz0iTXNvTm9ybWFsIiBzdHlsZT0ibXNvLW1hcmdpbi10b3AtYWx0OmF1dG87bXNv
LW1hcmdpbi1ib3R0b20tYWx0OmF1dG8iPkhpIE9za2FyLDxvOnA+PC9vOnA+PC9wPg0KPHAgY2xh
c3M9Ik1zb05vcm1hbCIgc3R5bGU9Im1zby1tYXJnaW4tdG9wLWFsdDphdXRvO21zby1tYXJnaW4t
Ym90dG9tLWFsdDphdXRvIj5Zb3UgbmVlZCB0byB1c2UgaXBtYi1kZXYgZHJpdmVyIHdoaWNoIGlz
IGlzIGJlaW5nIHVzZWQgYnkgaXBtYmJyaWRnZS4gWW91IGRvbuKAmXQgbmVlZCBpcG1iLWhvc3Qg
YXMgd2UgYXJlIGhhdmluZyBpcG1iYnJpZGdlIHRvIHJlcGxhY2UgdGhhdC48bzpwPjwvbzpwPjwv
cD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiIHN0eWxlPSJtc28tbWFyZ2luLXRvcC1hbHQ6YXV0bztt
c28tbWFyZ2luLWJvdHRvbS1hbHQ6YXV0byI+Jm5ic3A7PG86cD48L286cD48L3A+DQo8cCBjbGFz
cz0iTXNvTm9ybWFsIiBzdHlsZT0ibXNvLW1hcmdpbi10b3AtYWx0OmF1dG87bXNvLW1hcmdpbi1i
b3R0b20tYWx0OmF1dG8iPlJlZ2FyZHM8bzpwPjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3Jt
YWwiIHN0eWxlPSJtc28tbWFyZ2luLXRvcC1hbHQ6YXV0bzttc28tbWFyZ2luLWJvdHRvbS1hbHQ6
YXV0byI+LVZpamF5PG86cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIiBzdHlsZT0i
bXNvLW1hcmdpbi10b3AtYWx0OmF1dG87bXNvLW1hcmdpbi1ib3R0b20tYWx0OmF1dG8iPiZuYnNw
OzxvOnA+PC9vOnA+PC9wPg0KPGRpdiBzdHlsZT0iYm9yZGVyOm5vbmU7Ym9yZGVyLXRvcDpzb2xp
ZCAjQjVDNERGIDEuMHB0O3BhZGRpbmc6My4wcHQgMGluIDBpbiAwaW4iPg0KPHAgY2xhc3M9Ik1z
b05vcm1hbCIgc3R5bGU9Im1zby1tYXJnaW4tdG9wLWFsdDphdXRvO21zby1tYXJnaW4tYm90dG9t
LWFsdDphdXRvIj48Yj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjEyLjBwdDtjb2xvcjpibGFjayI+
RnJvbToNCjwvc3Bhbj48L2I+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMi4wcHQ7Y29sb3I6Ymxh
Y2siPk9za2FyIFNlbmZ0ICZsdDs8YSBocmVmPSJtYWlsdG86b3NrQGdvb2dsZS5jb20iIHRhcmdl
dD0iX2JsYW5rIj5vc2tAZ29vZ2xlLmNvbTwvYT4mZ3Q7PGJyPg0KPGI+RGF0ZTogPC9iPk1vbmRh
eSwgQXByaWwgMjAsIDIwMjAgYXQgMTE6MzUgQU08YnI+DQo8Yj5UbzogPC9iPlZpamF5IEtoZW1r
YSAmbHQ7PGEgaHJlZj0ibWFpbHRvOnZpamF5a2hlbWthQGZiLmNvbSIgdGFyZ2V0PSJfYmxhbmsi
PnZpamF5a2hlbWthQGZiLmNvbTwvYT4mZ3Q7PGJyPg0KPGI+Q2M6IDwvYj5PcGVuQk1DIE1haWxs
aXN0ICZsdDs8YSBocmVmPSJtYWlsdG86b3BlbmJtY0BsaXN0cy5vemxhYnMub3JnIiB0YXJnZXQ9
Il9ibGFuayI+b3BlbmJtY0BsaXN0cy5vemxhYnMub3JnPC9hPiZndDs8YnI+DQo8Yj5TdWJqZWN0
OiA8L2I+UmU6IEFjY2VzcyBJbnRlbCBNRSBJUE1CIGZyb20gQk1DPC9zcGFuPjxvOnA+PC9vOnA+
PC9wPg0KPC9kaXY+DQo8ZGl2Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCIgc3R5bGU9Im1zby1tYXJn
aW4tdG9wLWFsdDphdXRvO21zby1tYXJnaW4tYm90dG9tLWFsdDphdXRvIj4mbmJzcDs8bzpwPjwv
bzpwPjwvcD4NCjwvZGl2Pg0KPGRpdj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiIHN0eWxlPSJtc28t
bWFyZ2luLXRvcC1hbHQ6YXV0bzttc28tbWFyZ2luLWJvdHRvbS1hbHQ6YXV0byI+SGkgVmlqYXkN
CjxvOnA+PC9vOnA+PC9wPg0KPGRpdj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiIHN0eWxlPSJtc28t
bWFyZ2luLXRvcC1hbHQ6YXV0bzttc28tbWFyZ2luLWJvdHRvbS1hbHQ6YXV0byI+Jm5ic3A7PG86
cD48L286cD48L3A+DQo8L2Rpdj4NCjxkaXY+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIiBzdHlsZT0i
bXNvLW1hcmdpbi10b3AtYWx0OmF1dG87bXNvLW1hcmdpbi1ib3R0b20tYWx0OmF1dG8iPlRoYW5r
cyBmb3IgdGhlIHBvaW50ZXIhPG86cD48L286cD48L3A+DQo8L2Rpdj4NCjxkaXY+DQo8cCBjbGFz
cz0iTXNvTm9ybWFsIiBzdHlsZT0ibXNvLW1hcmdpbi10b3AtYWx0OmF1dG87bXNvLW1hcmdpbi1i
b3R0b20tYWx0OmF1dG8iPiZuYnNwOzxvOnA+PC9vOnA+PC9wPg0KPC9kaXY+DQo8ZGl2Pg0KPHAg
Y2xhc3M9Ik1zb05vcm1hbCIgc3R5bGU9Im1zby1tYXJnaW4tdG9wLWFsdDphdXRvO21zby1tYXJn
aW4tYm90dG9tLWFsdDphdXRvIj5JIGFsc28gZm91bmQgYm90aCZuYnNwOzxhIGhyZWY9Imh0dHBz
Oi8vZ2l0aHViLmNvbS9NZWxsYW5veC9pcG1iLWhvc3QiIHRhcmdldD0iX2JsYW5rIj5odHRwczov
L2dpdGh1Yi5jb20vTWVsbGFub3gvaXBtYi1ob3N0PC9hPiZuYnNwO2FuZCZuYnNwOzxhIGhyZWY9
Imh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuYm1jL2xpbnV4L2Jsb2IvZGV2LTUuNC9kcml2ZXJzL2No
YXIvaXBtaS9pcG1iX2Rldl9pbnQuYyIgdGFyZ2V0PSJfYmxhbmsiPmh0dHBzOi8vZ2l0aHViLmNv
bS9vcGVuYm1jL2xpbnV4L2Jsb2IvZGV2LTUuNC9kcml2ZXJzL2NoYXIvaXBtaS9pcG1iX2Rldl9p
bnQuYzwvYT4uJm5ic3A7PG86cD48L286cD48L3A+DQo8L2Rpdj4NCjxkaXY+DQo8cCBjbGFzcz0i
TXNvTm9ybWFsIiBzdHlsZT0ibXNvLW1hcmdpbi10b3AtYWx0OmF1dG87bXNvLW1hcmdpbi1ib3R0
b20tYWx0OmF1dG8iPiZuYnNwOzxvOnA+PC9vOnA+PC9wPg0KPC9kaXY+DQo8ZGl2Pg0KPHAgY2xh
c3M9Ik1zb05vcm1hbCIgc3R5bGU9Im1zby1tYXJnaW4tdG9wLWFsdDphdXRvO21zby1tYXJnaW4t
Ym90dG9tLWFsdDphdXRvIj5JcyBpdCByaWdodCB0aGF0IHdpdGgmbmJzcDtpcG1iYnJpZGdlJm5i
c3A7SSBkb24ndCBuZWVkIGVpdGhlciBvZiB0aGVtIHNpbmNlIGlwbWJicmlkZ2UmbmJzcDt1c2Vz
IHRoZSByYXcgaTJjIGRldj88bzpwPjwvbzpwPjwvcD4NCjwvZGl2Pg0KPGRpdj4NCjxwIGNsYXNz
PSJNc29Ob3JtYWwiIHN0eWxlPSJtc28tbWFyZ2luLXRvcC1hbHQ6YXV0bzttc28tbWFyZ2luLWJv
dHRvbS1hbHQ6YXV0byI+Jm5ic3A7PG86cD48L286cD48L3A+DQo8L2Rpdj4NCjxkaXY+DQo8cCBj
bGFzcz0iTXNvTm9ybWFsIiBzdHlsZT0ibXNvLW1hcmdpbi10b3AtYWx0OmF1dG87bXNvLW1hcmdp
bi1ib3R0b20tYWx0OmF1dG8iPlRoYW5rczxvOnA+PC9vOnA+PC9wPg0KPC9kaXY+DQo8ZGl2Pg0K
PHAgY2xhc3M9Ik1zb05vcm1hbCIgc3R5bGU9Im1zby1tYXJnaW4tdG9wLWFsdDphdXRvO21zby1t
YXJnaW4tYm90dG9tLWFsdDphdXRvIj5Pc2thci48bzpwPjwvbzpwPjwvcD4NCjwvZGl2Pg0KPC9k
aXY+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIiBzdHlsZT0ibXNvLW1hcmdpbi10b3AtYWx0OmF1dG87
bXNvLW1hcmdpbi1ib3R0b20tYWx0OmF1dG8iPiZuYnNwOzxvOnA+PC9vOnA+PC9wPg0KPGRpdj4N
CjxkaXY+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIiBzdHlsZT0ibXNvLW1hcmdpbi10b3AtYWx0OmF1
dG87bXNvLW1hcmdpbi1ib3R0b20tYWx0OmF1dG8iPk9uIE1vbiwgQXByIDIwLCAyMDIwIGF0IDI6
MTIgUE0gVmlqYXkgS2hlbWthICZsdDs8YSBocmVmPSJtYWlsdG86dmlqYXlraGVta2FAZmIuY29t
IiB0YXJnZXQ9Il9ibGFuayI+dmlqYXlraGVta2FAZmIuY29tPC9hPiZndDsgd3JvdGU6PG86cD48
L286cD48L3A+DQo8L2Rpdj4NCjxibG9ja3F1b3RlIHN0eWxlPSJib3JkZXI6bm9uZTtib3JkZXIt
bGVmdDpzb2xpZCAjQ0NDQ0NDIDEuMHB0O3BhZGRpbmc6MGluIDBpbiAwaW4gNi4wcHQ7bWFyZ2lu
LWxlZnQ6NC44cHQ7bWFyZ2luLXRvcDo1LjBwdDttYXJnaW4tcmlnaHQ6MGluO21hcmdpbi1ib3R0
b206NS4wcHQiPg0KPGRpdj4NCjxkaXY+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIiBzdHlsZT0ibXNv
LW1hcmdpbi10b3AtYWx0OmF1dG87bXNvLW1hcmdpbi1ib3R0b20tYWx0OmF1dG8iPkhpIE9za2Fy
LDxvOnA+PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCIgc3R5bGU9Im1zby1tYXJnaW4t
dG9wLWFsdDphdXRvO21zby1tYXJnaW4tYm90dG9tLWFsdDphdXRvIj5Zb3UgbmVlZCB0byBjb25m
aWd1cmUgeW91ciBNRSBjaGFubmVsIGluIGlwbWIgY2hhbm5lbCBjb25maWcgZmlsZQ0KPGEgaHJl
Zj0iaHR0cHM6Ly9naXRodWIuY29tL29wZW5ibWMvaXBtYmJyaWRnZS9ibG9iL21hc3Rlci9pcG1i
LWNoYW5uZWxzLmpzb24iIHRhcmdldD0iX2JsYW5rIj4NCmh0dHBzOi8vZ2l0aHViLmNvbS9vcGVu
Ym1jL2lwbWJicmlkZ2UvYmxvYi9tYXN0ZXIvaXBtYi1jaGFubmVscy5qc29uPC9hPjxvOnA+PC9v
OnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCIgc3R5bGU9Im1zby1tYXJnaW4tdG9wLWFsdDph
dXRvO21zby1tYXJnaW4tYm90dG9tLWFsdDphdXRvIj5BbmQgbWFrZSBzdXJlIGlwbWJicmlkZ2Ug
aXMgcnVubmluZy4gVGhlbiB5b3UgY2FuIHNlbmQgZ2V0IGRldmljZSBpZCBjb21tYW5kIHRvIE1F
IGZyb20gY29tbWFuZCBsaW5lIGl0c2VsZiB0byB0ZXN0IGlmIGV2ZXJ5dGhpbmcgaXMgd29ya2lu
Zy48bzpwPjwvbzpwPjwvcD4NCjxwPiZuYnNwOzxvOnA+PC9vOnA+PC9wPg0KPHA+YnVzY3RsIGNh
bGwgeHl6Lm9wZW5ibWNfcHJvamVjdC5JcG1pLkNoYW5uZWwuSXBtYiAveHl6L29wZW5ibWNfcHJv
amVjdC9JcG1pL0NoYW5uZWwvSXBtYiBvcmcub3BlbmJtYy5JcG1iIHNlbmRSZXF1ZXN0IHl5eXlh
eSAxIDYgMCAweDEgMDxvOnA+PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCIgc3R5bGU9
Im1zby1tYXJnaW4tdG9wLWFsdDphdXRvO21zby1tYXJnaW4tYm90dG9tLWFsdDphdXRvIj4mbmJz
cDs8bzpwPjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiIHN0eWxlPSJtc28tbWFyZ2lu
LXRvcC1hbHQ6YXV0bzttc28tbWFyZ2luLWJvdHRvbS1hbHQ6YXV0byI+UmVnYXJkczxvOnA+PC9v
OnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCIgc3R5bGU9Im1zby1tYXJnaW4tdG9wLWFsdDph
dXRvO21zby1tYXJnaW4tYm90dG9tLWFsdDphdXRvIj4tVmlqYXk8bzpwPjwvbzpwPjwvcD4NCjxw
IGNsYXNzPSJNc29Ob3JtYWwiIHN0eWxlPSJtc28tbWFyZ2luLXRvcC1hbHQ6YXV0bzttc28tbWFy
Z2luLWJvdHRvbS1hbHQ6YXV0byI+Jm5ic3A7PG86cD48L286cD48L3A+DQo8ZGl2IHN0eWxlPSJi
b3JkZXI6bm9uZTtib3JkZXItdG9wOnNvbGlkICNCNUM0REYgMS4wcHQ7cGFkZGluZzozLjBwdCAw
aW4gMGluIDBpbiI+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIiBzdHlsZT0ibXNvLW1hcmdpbi10b3At
YWx0OmF1dG87bXNvLW1hcmdpbi1ib3R0b20tYWx0OmF1dG8iPjxiPjxzcGFuIHN0eWxlPSJmb250
LXNpemU6MTIuMHB0O2NvbG9yOmJsYWNrIj5Gcm9tOg0KPC9zcGFuPjwvYj48c3BhbiBzdHlsZT0i
Zm9udC1zaXplOjEyLjBwdDtjb2xvcjpibGFjayI+b3BlbmJtYyAmbHQ7b3BlbmJtYy1ib3VuY2Vz
JiM0Mzt2aWpheWtoZW1rYT08YSBocmVmPSJtYWlsdG86ZmIuY29tQGxpc3RzLm96bGFicy5vcmci
IHRhcmdldD0iX2JsYW5rIj5mYi5jb21AbGlzdHMub3psYWJzLm9yZzwvYT4mZ3Q7IG9uIGJlaGFs
ZiBvZiBPc2thciBTZW5mdCAmbHQ7PGEgaHJlZj0ibWFpbHRvOm9za0Bnb29nbGUuY29tIiB0YXJn
ZXQ9Il9ibGFuayI+b3NrQGdvb2dsZS5jb208L2E+Jmd0Ozxicj4NCjxiPkRhdGU6IDwvYj5TYXR1
cmRheSwgQXByaWwgMTgsIDIwMjAgYXQgNjo0NyBQTTxicj4NCjxiPlRvOiA8L2I+T3BlbkJNQyBN
YWlsbGlzdCAmbHQ7PGEgaHJlZj0ibWFpbHRvOm9wZW5ibWNAbGlzdHMub3psYWJzLm9yZyIgdGFy
Z2V0PSJfYmxhbmsiPm9wZW5ibWNAbGlzdHMub3psYWJzLm9yZzwvYT4mZ3Q7PGJyPg0KPGI+U3Vi
amVjdDogPC9iPkFjY2VzcyBJbnRlbCBNRSBJUE1CIGZyb20gQk1DPC9zcGFuPjxvOnA+PC9vOnA+
PC9wPg0KPC9kaXY+DQo8ZGl2Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCIgc3R5bGU9Im1zby1tYXJn
aW4tdG9wLWFsdDphdXRvO21zby1tYXJnaW4tYm90dG9tLWFsdDphdXRvIj4mbmJzcDs8bzpwPjwv
bzpwPjwvcD4NCjwvZGl2Pg0KPGRpdj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiIHN0eWxlPSJtc28t
bWFyZ2luLXRvcC1hbHQ6YXV0bzttc28tbWFyZ2luLWJvdHRvbS1hbHQ6YXV0byI+SGkgZXZlcnlv
bmUNCjxvOnA+PC9vOnA+PC9wPg0KPGRpdj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiIHN0eWxlPSJt
c28tbWFyZ2luLXRvcC1hbHQ6YXV0bzttc28tbWFyZ2luLWJvdHRvbS1hbHQ6YXV0byI+Jm5ic3A7
PG86cD48L286cD48L3A+DQo8L2Rpdj4NCjxkaXY+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIiBzdHls
ZT0ibXNvLW1hcmdpbi10b3AtYWx0OmF1dG87bXNvLW1hcmdpbi1ib3R0b20tYWx0OmF1dG8iPkkn
bSB0cnlpbmcgdG8gZmluZCBvdXQgaG93IEkgY2FuIGFjY2VzcyB0aGUgSW50ZWwgTUUgdmlhIElQ
TUIgZnJvbSB0aGUgQk1DIChPcGVuQk1DKS48bzpwPjwvbzpwPjwvcD4NCjwvZGl2Pg0KPGRpdj4N
CjxwIGNsYXNzPSJNc29Ob3JtYWwiIHN0eWxlPSJtc28tbWFyZ2luLXRvcC1hbHQ6YXV0bzttc28t
bWFyZ2luLWJvdHRvbS1hbHQ6YXV0byI+Jm5ic3A7PG86cD48L286cD48L3A+DQo8L2Rpdj4NCjxk
aXY+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIiBzdHlsZT0ibXNvLW1hcmdpbi10b3AtYWx0OmF1dG87
bXNvLW1hcmdpbi1ib3R0b20tYWx0OmF1dG8iPkZyb20gd2hhdCBJIGdhdGhlcmVkLCBJbnRlbCBN
RSdzIElQTUIgaXMgb24gdGhlIFBDSCdzIFNNTGluazAuIEkga25vdyB0aGlzIGlzIGNvbm5lY3Rl
ZCB0byBvbmUgb2YgdGhlIFNNQnVzIG1vZHVsZXMgb24gbXkgQVNUMjUwMC4gQnV0IHdoYXQgSSBj
YW4ndCBmaW5kIG91dCBpcyBob3cgSSBhY3R1YWxseSBzZW5kDQogY29tbWFuZHMgdGhlcmU/IEkn
bSBzdXJlIEknbSBtaXNzaW5nIGEgZG9jdW1lbnQgdGhhdCBtYWtlcyB0aGlzIG9idmlvdXMuPG86
cD48L286cD48L3A+DQo8L2Rpdj4NCjxkaXY+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIiBzdHlsZT0i
bXNvLW1hcmdpbi10b3AtYWx0OmF1dG87bXNvLW1hcmdpbi1ib3R0b20tYWx0OmF1dG8iPiZuYnNw
OzxvOnA+PC9vOnA+PC9wPg0KPC9kaXY+DQo8ZGl2Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCIgc3R5
bGU9Im1zby1tYXJnaW4tdG9wLWFsdDphdXRvO21zby1tYXJnaW4tYm90dG9tLWFsdDphdXRvIj5P
ciBpcyBpdCBhcyBzaW1wbGUgYXMmbmJzcDtkcm9wcGluZyBJUE1JIHBhY2tldHMgb250byB0aGUg
YnVzPzxvOnA+PC9vOnA+PC9wPg0KPC9kaXY+DQo8ZGl2Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCIg
c3R5bGU9Im1zby1tYXJnaW4tdG9wLWFsdDphdXRvO21zby1tYXJnaW4tYm90dG9tLWFsdDphdXRv
Ij4mbmJzcDs8bzpwPjwvbzpwPjwvcD4NCjwvZGl2Pg0KPGRpdj4NCjxwIGNsYXNzPSJNc29Ob3Jt
YWwiIHN0eWxlPSJtc28tbWFyZ2luLXRvcC1hbHQ6YXV0bzttc28tbWFyZ2luLWJvdHRvbS1hbHQ6
YXV0byI+SXMgdGhpcyBieSBhbnkgY2hhbmNlIGFscmVhZHkgaW1wbGVtZW50ZWQgaW4gT3BlbkJN
Qz88bzpwPjwvbzpwPjwvcD4NCjwvZGl2Pg0KPGRpdj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiIHN0
eWxlPSJtc28tbWFyZ2luLXRvcC1hbHQ6YXV0bzttc28tbWFyZ2luLWJvdHRvbS1hbHQ6YXV0byI+
Jm5ic3A7PG86cD48L286cD48L3A+DQo8L2Rpdj4NCjxkaXY+DQo8cCBjbGFzcz0iTXNvTm9ybWFs
IiBzdHlsZT0ibXNvLW1hcmdpbi10b3AtYWx0OmF1dG87bXNvLW1hcmdpbi1ib3R0b20tYWx0OmF1
dG8iPlRoYW5rcyBmb3IgYW55IGhpbnRzITxvOnA+PC9vOnA+PC9wPg0KPC9kaXY+DQo8ZGl2Pg0K
PHAgY2xhc3M9Ik1zb05vcm1hbCIgc3R5bGU9Im1zby1tYXJnaW4tdG9wLWFsdDphdXRvO21zby1t
YXJnaW4tYm90dG9tLWFsdDphdXRvIj4mbmJzcDs8bzpwPjwvbzpwPjwvcD4NCjwvZGl2Pg0KPGRp
dj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiIHN0eWxlPSJtc28tbWFyZ2luLXRvcC1hbHQ6YXV0bztt
c28tbWFyZ2luLWJvdHRvbS1hbHQ6YXV0byI+T3NrYXI8bzpwPjwvbzpwPjwvcD4NCjwvZGl2Pg0K
PC9kaXY+DQo8L2Rpdj4NCjwvZGl2Pg0KPC9ibG9ja3F1b3RlPg0KPC9kaXY+DQo8L2Rpdj4NCjwv
ZGl2Pg0KPC9ibG9ja3F1b3RlPg0KPC9kaXY+DQo8L2Jsb2NrcXVvdGU+DQo8L2Rpdj4NCjwvZGl2
Pg0KPC9ib2R5Pg0KPC9odG1sPg0K

--_000_403834ADB19444E8890421610A30D727fbcom_--
