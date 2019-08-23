Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 384369B568
	for <lists+openbmc@lfdr.de>; Fri, 23 Aug 2019 19:25:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46FSvq1JMbzDsQ6
	for <lists+openbmc@lfdr.de>; Sat, 24 Aug 2019 03:25:11 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0b-00082601.pphosted.com;
 envelope-from=prvs=3138b0672c=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="Xc9o19up"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="APWeWCLV"; dkim-atps=neutral
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46FStl1zSmzDsM9
 for <openbmc@lists.ozlabs.org>; Sat, 24 Aug 2019 03:24:10 +1000 (AEST)
Received: from pps.filterd (m0109332.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7NHDhla000933; Fri, 23 Aug 2019 10:24:03 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=facebook;
 bh=YNp/xtNr13hx0ZDFbjBcDt0k3vCWCguUrn9zGjltxTs=;
 b=Xc9o19upi+P+uPH8+LSx1Q5fC6kI8xkjwKn8+heh0OrhdmwhujX/rlaOl2jwU6Z6zupG
 hifEkB82ZaO07rt30Z2Ud9u9b1f0uPOTxZUkLWrB/5jr5kmi4Ns2pjSTkcBSr9I7l+4b
 U7IT04wJqRF6yowDf+EYGPh9JPLJw/b55IE= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 2ujgn8s5gm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 23 Aug 2019 10:24:03 -0700
Received: from ash-exhub104.TheFacebook.com (2620:10d:c0a8:82::d) by
 ash-exhub204.TheFacebook.com (2620:10d:c0a8:83::4) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 23 Aug 2019 10:24:02 -0700
Received: from NAM05-BY2-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.35.175) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Fri, 23 Aug 2019 10:24:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n0jPjcu8m0lmJSua1RB/xJhyOPpMKKgO/0QI09dVVgszE3WOfcOnthJ2ZnUsyrXDeNCNnlAzeKh4ovMSdbn3n/viGZ+rvLBc7j4ZjVfZYhv/x5fqgMtLuDSMBCEolhTmFQlUbEbCvzezDcquT3s5uFlUxLYzMWVRck+XrhQx1HLyNy1mBfj3jvt3U8oLPl9PdJRGqF4sKlHuAqoXBfWAZPPGeovgYMu4ASc2qVotYyKRrP/xOIBqxmh4jqdWB31pqcgJ8OSQfc/o1FfOX+OYZF8CWwZpkm5AaJ6gA+MUreJzVfCnaNt8qd9oKCo7iMLCADSWD6r2Ne4sHxYVCV5mhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YNp/xtNr13hx0ZDFbjBcDt0k3vCWCguUrn9zGjltxTs=;
 b=JHBYIrkZX6b1g+ytKTvN4AG5EWnWIshwKd2xrfLlZRvpvBgD3SSfj0zkVdMQ9f695S+p4LUiOylh5xux9XS/WgMbQ3tc+cehptlpOUTekkEMD3jqJAjaMh62TUQLzsg5C26M6NMBbXqV70n0iuszZUMJ/igxwagnzf+azh7d+fgbTEy7fUx3eYrIAbG90ouo02CG8rIl1InGd/TRU1QXgy/T4zz95WqLuVqhCZolb23N0TPbszKOgSLH8EQsSkvyGhpl0Xgy8Zda3FHnES4nHRBvzz/kVRG6heCWCv1l/1MUFb1gnewn4hz0r0SELHg6ClCNQ7JREwte0cjzNg7GQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YNp/xtNr13hx0ZDFbjBcDt0k3vCWCguUrn9zGjltxTs=;
 b=APWeWCLV6bRfqElqSuy166SaXT8HqBHrKE1FTIma6E4xmaN9dWORyIBZ7dugplj2DX/I73e0yIB8B0TtgeW3dw/A/zJf7jZU3eXMjU0Fm3I4338ixR5cSAnycDD3wFCp+HRbjmE6C8poNB/1R7MHZCgKApxIPxk2kUFieUwdY2A=
Received: from CY4PR15MB1269.namprd15.prod.outlook.com (10.172.177.11) by
 CY4PR15MB1624.namprd15.prod.outlook.com (10.175.119.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.18; Fri, 23 Aug 2019 17:24:01 +0000
Received: from CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::8c93:f913:124:8dd0]) by CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::8c93:f913:124:8dd0%8]) with mapi id 15.20.2178.020; Fri, 23 Aug 2019
 17:24:01 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: "Paul.Vancil@dell.com" <Paul.Vancil@dell.com>, "gmills@linux.vnet.ibm.com"
 <gmills@linux.vnet.ibm.com>, "neladk@microsoft.com" <neladk@microsoft.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: Telemetry Redfish Mockup location at DMTF
Thread-Topic: Telemetry Redfish Mockup location at DMTF
Thread-Index: AdVXffjt5pIc6PV9Q2GEUvsqM049eAAZhsAAABeOw0AACZIlAAAhMT0AABF0aoAAGmyuAA==
Date: Fri, 23 Aug 2019 17:24:00 +0000
Message-ID: <F8031E46-95CA-4F10-8971-4B06CE546102@fb.com>
References: <fbf557cba2d045b3a57d0adc508ae727@AUSX13MPS306.AMER.DELL.COM>
 <BYAPR21MB1191F6E61DC3BF7CA78C37CAC8AA0@BYAPR21MB1191.namprd21.prod.outlook.com>
 <cf52a78d26364365820f5b70e80ef422@AUSX13MPS306.AMER.DELL.COM>
 <9bda945a-f6b7-495a-098a-4c6399476a52@linux.vnet.ibm.com>
 <7C51D2AB-7154-43C4-9B6A-03C3FD27DF23@fb.com>
 <be08f05341ad4878bf736fa0a0a7fef4@AUSX13MPS302.AMER.DELL.COM>
In-Reply-To: <be08f05341ad4878bf736fa0a0a7fef4@AUSX13MPS302.AMER.DELL.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::4aac]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5aef657b-aa57-4700-0320-08d727eeb05a
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600166)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:CY4PR15MB1624; 
x-ms-traffictypediagnostic: CY4PR15MB1624:
x-ms-exchange-purlcount: 3
x-microsoft-antispam-prvs: <CY4PR15MB1624D1E95224365360C3987BDDA40@CY4PR15MB1624.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2887;
x-forefront-prvs: 0138CD935C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(366004)(346002)(39860400002)(136003)(396003)(189003)(199004)(13464003)(966005)(66476007)(5660300002)(6512007)(33656002)(46003)(45080400002)(71190400001)(6436002)(99286004)(102836004)(53936002)(86362001)(14454004)(6246003)(71200400001)(229853002)(486006)(64756008)(66556008)(76116006)(66946007)(91956017)(110136005)(478600001)(2201001)(316002)(305945005)(6506007)(7736002)(36756003)(2906002)(6306002)(66446008)(6486002)(1511001)(53546011)(6116002)(11346002)(2501003)(14444005)(256004)(476003)(76176011)(446003)(81166006)(81156014)(2616005)(8676002)(186003)(25786009)(8936002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR15MB1624;
 H:CY4PR15MB1269.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: fRMq3o4QNkvJXfXEo2ziaOIV7bO0T5YbAFasG55ctBuJR7xE2AWDHkjkf7us9w6a+OpCf4I4uF/P56fd6fpwQbXa0EhdykvA7rbXabFvtyn4qIP+F1O307L5Q0oikCZOThxtwryHiutW69PzMfKfc/9Y0UwsljwaHE2DwjQUw+DJZ1yXhhwMVxUYoWiKWNNSBYOpIv3pBVRZ1RxS6YzuD5xj79930BN1tmd+iPBgHA7cdbPkwiedWXe3LESfR4318ZGSxB4tHRQPJyAdB9j2ZQy3p8u8SieOdujZySb+297fDDu08zo5aH87aTLxvYw6822prrcLZFzfAIDvzC5tNK59iOsC3Q2e7r4iOOqmEOnNb8PUCxh8zYIJnJPp/eXGQ4uKQbSu5p5xG+j56HzTi3zkKJGzpZaGrgXsGScv9T4=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <3575074A1625644B8AA9F61C4E39C600@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 5aef657b-aa57-4700-0320-08d727eeb05a
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Aug 2019 17:24:00.8624 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +X4P5dheIL8Rwc+lGNCkTl/M+4a54cLDFhqLWafAuJpEx2AUnfCAnput6DQdea/TRfcVcKHoD4tMydDbQOAOdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR15MB1624
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-23_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908230166
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

VGhhbmtzIFBhdWwsDQpJIGFtIHN1cmUgaXQgd2lsbCBoZWxwIG9wZW5ibWMgZGV2ZWxvcGVycy4N
Cg0KUmVnYXJkcw0KLVZpamF5DQoNCu+7v09uIDgvMjIvMTksIDI6NDcgUE0sICJQYXVsLlZhbmNp
bEBkZWxsLmNvbSIgPFBhdWwuVmFuY2lsQGRlbGwuY29tPiB3cm90ZToNCg0KICAgIFZpamF5LA0K
ICAgIFNpbmNlIERNVEYgaGFzIG5vdCByZWxlYXNlZCBpdCBhcyBwdWJsaWMgYW5kIGl0IGhhcyBx
dWl0ZSBhIGZldyBlcnJvcnMgaW4gaXQsIHRoZXkgZG9u4oCZdCB3YW50IHRvIHVudGlsIGZpeGVk
Lg0KICAgIEkgd2lsbCBjcmVhdGUgYW4gT3BlbkJNQyBUZWxlbWV0cnkgbW9ja3VwIHRoYXQgbG9v
a3MgbW9yZSBPcGVuQk1DIGxpa2UgYmFzZWQgb24gT3BlbkJNQyBwbGF0Zm9ybSBtb2NrdXBzIEkg
aGF2ZSBwdWxsZWQgYXQgcGx1Z2Zlc3RzLg0KICAgIFRoZW4gSSdsbCBwdXQgdGhlIGNvcnJlY3Rl
ZCBUZWxlbWV0cnkgcmVzb3VyY2VzIHVuZGVyIHRoYXQuDQogICAgDQogICAgVGhhbmtzDQogICAg
cGF1bHYNCiAgICANCiAgICAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KICAgIEZyb206IFZp
amF5IEtoZW1rYSA8dmlqYXlraGVta2FAZmIuY29tPiANCiAgICBTZW50OiBUaHVyc2RheSwgQXVn
dXN0IDIyLCAyMDE5IDM6MjggUE0NCiAgICBUbzogR3VubmFyIE1pbGxzOyBWYW5jaWwsIFBhdWw7
IG5lbGFka0BtaWNyb3NvZnQuY29tOyBvcGVuYm1jQGxpc3RzLm96bGFicy5vcmcNCiAgICBTdWJq
ZWN0OiBSZTogVGVsZW1ldHJ5IFJlZGZpc2ggTW9ja3VwIGxvY2F0aW9uIGF0IERNVEYNCiAgICAN
CiAgICANCiAgICBbRVhURVJOQUwgRU1BSUxdIA0KICAgIA0KICAgIA0KICAgIA0KICAgIE9uIDgv
MjEvMTksIDI6MzggUE0sICJvcGVuYm1jIG9uIGJlaGFsZiBvZiBHdW5uYXIgTWlsbHMiIDxvcGVu
Ym1jLWJvdW5jZXMrdmlqYXlraGVta2E9ZmIuY29tQGxpc3RzLm96bGFicy5vcmcgb24gYmVoYWxm
IG9mIGdtaWxsc0BsaW51eC52bmV0LmlibS5jb20+IHdyb3RlOg0KICAgIA0KICAgICAgICANCiAg
ICAgICAgT24gOC8yMS8yMDE5IDEyOjA4IFBNLCBQYXVsLlZhbmNpbEBkZWxsLmNvbSB3cm90ZToN
CiAgICAgICAgPiBOZWVyYWosDQogICAgICAgID4gSXQgd29ya3MgaWYgeW91IGhhdmUgYWNjZXNz
IHRvIHRoZSBnaXRodWIuY29tL0RNVEYvUmVkZmlzaCByZXBvLg0KICAgIFdlIGFzIEZhY2Vib29r
IGFsc28gZG9uJ3QgaGF2ZSBhY2Nlc3MgdG8gdGhpcyBwcml2YXRlIHJlcG8uIENhbiB5b3UgcGxl
YXNlIG1vdmUgdGhpcyBpbnRvIG91ciBvcGVuYm1jIHJlcG8uDQogICAgICAgIA0KICAgICAgICBI
aSBOZWVyYWosDQogICAgICAgIA0KICAgICAgICBMaW5rIHdvcmtlZCBmb3IgbWUgYXMgd2VsbC4N
CiAgICAgICAgTWljcm9zb2Z0IGlzIGEgUmVkZmlzaCBGb3J1bSBTdXBwb3J0ZXIgc28geW91IHNo
b3VsZCBiZSBhYmxlIHRvIGdldCANCiAgICAgICAgYWNjZXNzIHRvIHRoZSBnaXRodWIuY29tL0RN
VEYvUmVkZmlzaCByZXBvIGJ5Og0KICAgICAgICANCiAgICAgICAgMS4gSm9pbmluZyB0aGUgRE1U
RiBoZXJlOiBodHRwczovL3VybGRlZmVuc2UucHJvb2Zwb2ludC5jb20vdjIvdXJsP3U9aHR0cHMt
M0FfX3d3dy5kbXRmLm9yZ19qb2luJmQ9RHdJRGFRJmM9NVZEMFJUdE5sVGgzeWNkNDFiM01VdyZy
PXY5TVUwS2k5cFduVFhDV3dqSFBWZ3BuQ1I4MHZYa2tjcklhcVU3VVNsNWcmbT1DUkxUME1qOGRJ
SGg3VHNmSnlZVlRiSW4xSWRCX1NMNUFyZVpuT2xpYVpNJnM9b1AzV1l2aHNPWWg5V1loRTNGVHR1
Z2F2SVFkM2cxSzBBQ3Vrb1pKOW5JMCZlPSANCiAgICAgICAgMi4gQWZ0ZXIgam9pbmluZyB0aGUg
RE1URiwgam9pbiB0aGUgUmVkZmlzaCBmb3J1bSBoZXJlOiANCiAgICAgICAgaHR0cHM6Ly91cmxk
ZWZlbnNlLnByb29mcG9pbnQuY29tL3YyL3VybD91PWh0dHBzLTNBX19tZW1iZXJzLmRtdGYub3Jn
X2FwcHNfb3JnX3dvcmtncm91cF9wb3J0YWxfJmQ9RHdJRGFRJmM9NVZEMFJUdE5sVGgzeWNkNDFi
M01VdyZyPXY5TVUwS2k5cFduVFhDV3dqSFBWZ3BuQ1I4MHZYa2tjcklhcVU3VVNsNWcmbT1DUkxU
ME1qOGRJSGg3VHNmSnlZVlRiSW4xSWRCX1NMNUFyZVpuT2xpYVpNJnM9NExVeXEzaktaazEtLVJP
OG9lVk8wa0tEMDg5MDBsUUJLelZuOEhEUzVxZyZlPSANCiAgICAgICAgICAgICAgICAgTWVudSA+
IEdyb3VwID4gQWxsIEdyb3VwcyAtLSBTZWxlY3QgIlJlZGZpc2ggRm9ydW0iDQogICAgICAgIDMu
IFNlbmQgYW4gZW1haWwgdG8gdGhlIFJlZGZpc2ggZm9ydW0gYXNraW5nIGZvciB5b3VyIEdpdEh1
YiBJRCB0byBiZSANCiAgICAgICAgZ2l2ZW4gYWNjZXNzIHRvIHRoZSBwcml2YXRlIFJlZGZpc2gg
cmVwb3NpdG9yeQ0KICAgICAgICANCiAgICAgICAgLSBHdW5uYXINCiAgICAgICAgDQogICAgICAg
IA0KICAgICAgICA+IEZvciB0aG9zZSB3aG8gaGF2ZSBhY2Nlc3MgdG8gdGhlIERNVEYgcHJpdmF0
ZSByZXBvIG9uIGdpdGh1YiwgVGhlIGxvY2F0aW9uIG9mIHRoZSBjdXJyZW50IFRlbGVtZXRyeSBt
b2NrdXAgaXM6DQogICAgICAgID4gICBodHRwczovL3VybGRlZmVuc2UucHJvb2Zwb2ludC5jb20v
djIvdXJsP3U9aHR0cHMtM0FfX25hbTA2LnNhZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxvb2suY29t
Xy0zRnVybC0zRGh0dHBzLTI1M0EtMjUyRi0yNTJGZ2l0aHViLmNvbS0yNTJGRE1URi0yNTJGUmVk
ZmlzaC0yNTJGdHJlZS0yNTJGbWFzdGVyLTI1MkZtb2NrdXBzLTI1MkZwdWJsaWMtMkR0ZWxlbWV0
cnktMjZhbXAtM0JkYXRhLTNEMDItMjU3QzAxLTI1N0NuZWxhZGstMjU0MG1pY3Jvc29mdC5jb20t
MjU3QzIzZTI3YWE5NjI3YTQ3YmUzOGJlMDhkNzI1ZDRkMGY1LTI1N0M3MmY5ODhiZjg2ZjE0MWFm
OTFhYjJkN2NkMDExZGI0Ny0yNTdDMS0yNTdDMC0yNTdDNjM3MDE5NDY4Mjg2MTA0MjU5LTI2YW1w
LTNCc2RhdGEtM0RYWnMwRk03cDk3Z3JiUzUwRXVTMGxBV2stMjUyQnItMjUyQmFNdUd4UmVSU3hn
WjFMdnMtMjUzRC0yNmFtcC0zQnJlc2VydmVkLTNEMCZkPUR3SURhUSZjPTVWRDBSVHRObFRoM3lj
ZDQxYjNNVXcmcj12OU1VMEtpOXBXblRYQ1d3akhQVmdwbkNSODB2WGtrY3JJYXFVN1VTbDVnJm09
Q1JMVDBNajhkSUhoN1RzZkp5WVZUYkluMUlkQl9TTDVBcmVabk9saWFaTSZzPWN1dDctVThtcjJj
Ml9uaS02QXpTd0lCeGtUTlRnTU9IN3pGd05DckVlN1EmZT0gDQogICAgICAgID4NCiAgICAgICAg
DQogICAgDQogICAgDQoNCg==
