Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AD46F29C7DD
	for <lists+openbmc@lfdr.de>; Tue, 27 Oct 2020 19:57:03 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CLLXr5j7KzDqPg
	for <lists+openbmc@lfdr.de>; Wed, 28 Oct 2020 05:57:00 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=75697c318a=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=T4sI04UR; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-fb-onmicrosoft-com header.b=UKkqLaY1; 
 dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CLLWm65M2zDqLp
 for <openbmc@lists.ozlabs.org>; Wed, 28 Oct 2020 05:55:57 +1100 (AEDT)
Received: from pps.filterd (m0044010.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09RIoYhE018562; Tue, 27 Oct 2020 11:55:51 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=facebook;
 bh=tLnBoHAl5PjbMzxQn5ifBjtZ4Z6vReMrwMTql/9SpsI=;
 b=T4sI04URUOhIDs3vkSIWczfgqGlbffG2HClsibhQAN4m3ZgvNUWEcapquRN1ujOH38qe
 zCdyarVR3taSR61wiuqt4XY358pTx/G/LBWiii7xDHx5c+TVyvz5anY24+f5jzQD7Cgy
 DuSmTUvDqiNgptApkWgq9xyvhKnFhkRj41Y= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 34eer4ukv8-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 27 Oct 2020 11:55:50 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.36.103) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Tue, 27 Oct 2020 11:55:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eVzCRCdy+hjIf0c4EZZb9QTkvbnOqFUBVs0NHEV2lB/v/Ntqb7QZtA0NxsnHc9ka5oTgt1KYYuJhnxdydJmUgH7NeBf6F70m6h8UXFfp8gVuWBqjpULcQTfL4meIMh8sCeFQ1I08yNpWsn3olLVJnimdSLCKd0vsbahWgusq2CHKKoI4kTSlJMEE8IMlH+Sl1KAJglzuPkttNFL37SNKjLgny0UIwysGY73ED0LO1gZfGbFbF0nqhgT03eRBeVTRqV2yTbop1pImjXBgUqO2UbSC/0ulSjXb2z76yRJ8a3/jZXSORnMR7JLtpTBN8rzDrQ/qjKHr6auKCzqIwjFgxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tLnBoHAl5PjbMzxQn5ifBjtZ4Z6vReMrwMTql/9SpsI=;
 b=lpEdGyVh/KF4mcS8qyw6Y2ueqOJhw4N2TlvQDdV6wAQ1Eo1qLBcHyZ1MSalLMl155DV4emXC1gxD+Ioi/aFNOFTRkVp0vPv9JDAdLmB1hWECo35BiZ2CxCI+5+t5Ws4mxmHDr00hq1SUtsrTki1vRfi16c2s9CYAz9+KoHUwn/dR/XKIJiJtNkJEAluY68dxPnWWNnEo5pZHCU2v5tWToaEzp87r7QrB0viqsyGvNX7R+qMMOxE6NqEXwUpatq6WZyN3jjeAFdRdDagp63nJqJ7ZQ8wJpoGJ82x+S9RX5uMH/WnSSmY/6voCBmnyM3wQCMycLPxvNRZYsDlwqsStBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tLnBoHAl5PjbMzxQn5ifBjtZ4Z6vReMrwMTql/9SpsI=;
 b=UKkqLaY1nfbOUJ9BwNH+ZJTlOFpbMipwGRLAULnXhqNx3qKzPTbTyVfzZTLTulP54S+6oCg1HA54eEhPfK8Zvt8jVPcmZec5qTlg0vSLzxKked0ic4OuGat1bqD1oD61VOjsoF5Yrmyx8VNDq7L/3PTpinuVdBwcB+2zL8ds/3s=
Received: from BY5PR15MB3537.namprd15.prod.outlook.com (2603:10b6:a03:1f5::20)
 by BYAPR15MB2296.namprd15.prod.outlook.com (2603:10b6:a02:8b::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.20; Tue, 27 Oct
 2020 18:55:48 +0000
Received: from BY5PR15MB3537.namprd15.prod.outlook.com
 ([fe80::5cb9:7809:838b:488a]) by BY5PR15MB3537.namprd15.prod.outlook.com
 ([fe80::5cb9:7809:838b:488a%5]) with mapi id 15.20.3477.028; Tue, 27 Oct 2020
 18:55:48 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Ed Tanous <edtanous@google.com>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>
Subject: Re: VR control from the BMC
Thread-Topic: VR control from the BMC
Thread-Index: AQHWq+xTxDVRfAPZGUKkYbtarGjar6mrWF6A
Date: Tue, 27 Oct 2020 18:55:48 +0000
Message-ID: <E5370099-203B-4CA4-AD0E-671CD2303CE7@fb.com>
References: <CAH2-KxCDtq4TDhcENWB65neeqq2QW2TDTV4e7mudaram5EcWGg@mail.gmail.com>
In-Reply-To: <CAH2-KxCDtq4TDhcENWB65neeqq2QW2TDTV4e7mudaram5EcWGg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: google.com; dkim=none (message not signed)
 header.d=none;google.com; dmarc=none action=none header.from=fb.com;
x-originating-ip: [2620:10d:c090:400::4:62b2]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 783be158-8f08-411f-00ed-08d87aa9eb1d
x-ms-traffictypediagnostic: BYAPR15MB2296:
x-microsoft-antispam-prvs: <BYAPR15MB2296ED61C8C7E0D7300F85E6DD160@BYAPR15MB2296.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hog3KjxdTMJM9XE6195kOcywz9AsYDqb099j4WHzeJd2tXcl84IcYURgQMAYU5r6c6Pr9FCIDtTJl6SmVolmeZZxM0XeTCdamj2yym3XxAhGU8pP3eDPPDQGuMI6vK3yvOumHw2mXoF8apUANwJ6kgT6rd2taUuSFq9WfLKeymScBvEs2IuA1vRYWnQ+gvf6BxyjIXZ1LG4f2mmW47ffWOzoQguEGWflQT/5Ci00pLL9SY8UFt8gY2Ebs+WeGUQnx2Go6jeHM1n+/BoGUDrf/CF4dDY7UdPu6dISZqiO6jmN3ECVeE3bC4DwG/EAdYF6CPTzDcJQ+vtXMU5EtW4pqg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR15MB3537.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(366004)(136003)(39860400002)(376002)(346002)(66946007)(5660300002)(33656002)(71200400001)(83380400001)(478600001)(186003)(6512007)(6486002)(8936002)(8676002)(64756008)(76116006)(53546011)(2906002)(66476007)(316002)(66556008)(66446008)(36756003)(2616005)(91956017)(110136005)(86362001)(6506007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: UwOZfmHPeg5CdZrcNofoU5Gv/J7Yst3MaNxKccBluPwG653uryIU3m9NhQ+qXnXFcfdZvW3rPN75prbSjEn/ku6HAY5aQzR0FrCEpwvsUwlWd/jRlSJxZjsjdD+WxV3DPB1o3ijoP3PToINF4pXtVUSGuwUYneGkF5tbvoabAl3Kwu6Fftfhy8q9thFWee1gyFjlmLZBlI3PBn/K+duceYiHM3VoMxa5aKmirJdVpUj6qJtCZ1P7b3cj5JGjTe/IJotIcgreqzEiIiKmgIGdWKeujH7eZwlfn/Jcx1jcAhub8iGkM0G53TJnJNnBpCh0+kacMp6H396Mleu+8EqgHatWq1FtlAdsfPw0JCADDjep3dOaT0FFc3pxLWmAyUix3oOaOL+BENDtdCLV3cP5+J7BpQDdse1uro0Ou27npeWgJ0injsZ89+nUzF2x8nq2R+Ea4Q0fW+e397GiAkC+Hso5LLuY2hIeizV+NVFpMvLLfx2/BAJ2EfIG7aE0zPY77z+rvVXHrpLIUT6dOkkMtMgFWwMwfxcKLT+bI4VV5dfBTYPs5cZn3qEjwPrGOQ0pWxwlbT/qMgNDurWTjqtblzI0AQtUujF3CO6kSIykRiuoVvcWM9pmKR9aQcqMxyU1uAlXFC9nAjtLQW1FN2X4bTPdeB785LiRzgjYXadCQm/ZekuI3W8Q+3asCO+TJ4kc
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <CE8E1F3786C0AE48BA0258E385267301@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR15MB3537.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 783be158-8f08-411f-00ed-08d87aa9eb1d
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Oct 2020 18:55:48.5273 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ltNyRCMU5JrVBUOdt+Z7aOOw/pCcAqDHi92FahFU2ITQuqmmlYIXwLKpQnrYK/cpCoC+TfasTzo6IjwYO+qQdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB2296
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-10-27_10:2020-10-26,
 2020-10-27 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 impostorscore=0
 spamscore=0 bulkscore=0 phishscore=0 mlxlogscore=999 clxscore=1011
 adultscore=0 malwarescore=0 mlxscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010270110
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

T24gMTAvMjYvMjAsIDQ6MDQgUE0sICJvcGVuYm1jIG9uIGJlaGFsZiBvZiBFZCBUYW5vdXMiIDxv
cGVuYm1jLWJvdW5jZXMrdmlqYXlraGVta2E9ZmIuY29tQGxpc3RzLm96bGFicy5vcmcgb24gYmVo
YWxmIG9mIGVkdGFub3VzQGdvb2dsZS5jb20+IHdyb3RlOg0KDQogICAgSW4gdGhlIG5lYXIgZnV0
dXJlLCBJJ20gZ29pbmcgdG8gaGF2ZSBzb21lIG5lZWRzIGZvciBPcGVuQk1DIHRvIGJlDQogICAg
YWJsZSB0byBjb250cm9sIFZScy4gIFRoZXNlIFZScyBtaWdodCBiZSBvbiB0aGUgYmFzZWJvYXJk
IGl0c2VsZiwgb3INCiAgICBvbiBkZXRlY3RlZCBQQ0llIGFkZC1pbi1jYXJkcywgYW5kIGNvbnRy
b2xsZWQgb3ZlciBQTUJ1cy4NCiAgICBBZGRpdGlvbmFsbHksIEkgd2lsbCBuZWVkIGEgImhhcmR3
YXJlIHNhZmUiIHdheSBmb3IgdGhlIGhvc3QgdG8gYmUNCiAgICBhYmxlIHRvIG1vZGlmeSB0aGUg
YmVoYXZpb3Igb2YgdGhlc2UgVlJzICh1c3VhbGx5IGRpZmZlcmVudCB2b2x0YWdlDQogICAgc2V0
dGluZ3MpLCBhbmQgdG8gaGF2ZSB0aGF0IGludGVyZmFjZSBiZSBjb25zdHJhaW5lZCBpbiBzdWNo
IGEgd2F5DQogICAgdGhhdCB0aGUgaG9zdCBjYW4gbmV2ZXIgc2V0IGEgdmFsdWUgdGhhdCdzIG91
dHNpZGUgb2YgYSBwcmVkZWZpbmVkDQogICAgcmFuZ2UgdGhhdCdzIGtub3duIHRvIGJlIHNhZmUg
Zm9yIHRoZSBoYXJkd2FyZSwgd2hpY2ggdGhlIEJNQyB3aWxsIG93bg0KICAgIHRoZSBkZWZpbml0
aW9uIG9mIGZvciBzZWN1cml0eSBwdXJwb3Nlcy4NCg0KICAgIERvZXMgYW55b25lIGVsc2UgaGF2
ZSBzaW1pbGFyIG5lZWRzPyAgSSd2ZSBiZWVuIHBvaW50ZWQgdG8NCiAgICBwaG9zcGhvci1yZWd1
bGF0b3JzIHdoaWNoIGhhcyBzb21lIHNpbWlsYXIgcGFyYWxsZWxzOyAgQXMtaXMsIHRoYXQNCiAg
ICBzb2x1dGlvbiB3b24ndCB3b3JrIGZvciBtZSwgYmVjYXVzZSBpdCdzIHJlbHlpbmcgb24gZml4
ZWQsIHBsYXRmb3JtDQogICAgc3BlY2lmaWMganNvbiBzY3JpcHRpbmcgdG8gYWNjb21wbGlzaCBp
dHMgZ29hbHMuICBNeSBob3BlIHdvdWxkIGJlIGZvcg0KICAgIGEgbW9yZSBnZW5lcmFsaXplZCBs
aW51eCBkZXZpY2V0cmVlIGJhc2VkIHNvbHV0aW9uLA0KIA0KVm9sdGFnZSBsaW1pdHMgY2FuIGNl
cnRhaW5seSBiZSBwYXNzZWQgdmlhIERUUyBmaWxlIHRvIGxpbWl0IHVzZXINCmFwcGxpY2F0aW9u
IGNvbmZpZ3VyYXRpb24gc2V0dGluZy4NCg0KICAgIGFzIHdlbGwgYXMgYQ0KICAgIHJlcHJlc2Vu
dGF0aW9uIG9uIGRidXMgdGhhdCBjb3VsZCBiZSBtb2RpZmllZCBhdCBydW50aW1lIGJ5DQogICAg
UmVkZmlzaC9JUE1JIGluIGJhbmQuDQoNCiAgICBJcyB0aGVyZSBhbnkgb3RoZXIgd29yayBJIHNo
b3VsZCBsb29rIGludG8gdGhhdCdzIHNpbWlsYXI/ICBEb2VzDQogICAgYW55b25lIGhhdmUgYW55
IHN0cm9uZyBvcGluaW9ucyBvbiBob3cgdGhpcyBzaG91bGQgYmUgb3JnYW5pemVkIG9yIGhvdw0K
ICAgIGl0IGNvdWxkIGJlIGJ1aWx0Pw0KDQpJIHdvdWxkIGFsc28gbGlrZSB0byBhZGQgVlIgZmly
bXdhcmUgdXBncmFkZXMgYXMgd2VsbCBpbiB0aGlzLg0KDQogICAgVGhhbmtzLA0KDQogICAgLUVk
DQoNCg==
