Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F6B546FD6
	for <lists+openbmc@lfdr.de>; Sat, 15 Jun 2019 13:51:10 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45QwmB2PXpzDrSG
	for <lists+openbmc@lfdr.de>; Sat, 15 Jun 2019 21:51:06 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=1069b662dd=sdasari@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="eULBgPxI"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="t22fs9RW"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45QwlZ1GP4zDrPx
 for <openbmc@lists.ozlabs.org>; Sat, 15 Jun 2019 21:50:28 +1000 (AEST)
Received: from pps.filterd (m0148461.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5FBmd9Y003947
 for <openbmc@lists.ozlabs.org>; Sat, 15 Jun 2019 04:50:26 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type :
 mime-version; s=facebook; bh=dQb1QVI5K6xf2wDTgbD/WCrcLjOTzx49IIXqSezMgTI=;
 b=eULBgPxIzgjDrFr08PwHt1MH2ysmt3Gkz3NLJC8yNwm888azVeuPOat8CgtNUbvMnPG6
 M/W4198UkNgeyTd8WRno0Z88VSTCWfZ4HyBmOmpj94fjxp5kFTwFKLsP8Z7SEsKs2lw5
 GOnxInQV9YVaUIORC1KQpcQ0Jih8doWV7vE= 
Received: from mail.thefacebook.com (mailout.thefacebook.com [199.201.64.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2t4wsag8d6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Sat, 15 Jun 2019 04:50:26 -0700
Received: from prn-mbx07.TheFacebook.com (2620:10d:c081:6::21) by
 prn-hub02.TheFacebook.com (2620:10d:c081:35::126) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1713.5; Sat, 15 Jun 2019 04:50:25 -0700
Received: from prn-hub05.TheFacebook.com (2620:10d:c081:35::129) by
 prn-mbx07.TheFacebook.com (2620:10d:c081:6::21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1713.5; Sat, 15 Jun 2019 04:50:25 -0700
Received: from NAM01-BY2-obe.outbound.protection.outlook.com (192.168.54.28)
 by o365-in.thefacebook.com (192.168.16.29) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1713.5
 via Frontend Transport; Sat, 15 Jun 2019 04:50:25 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dQb1QVI5K6xf2wDTgbD/WCrcLjOTzx49IIXqSezMgTI=;
 b=t22fs9RW6/O/oN5Ubw4R6Kg0KWOq7JF6Av9Hi9oY+of3SZiOc+qpkC3sEELqjkl6KTUf2p6La+Qbq2ysal9rpalHOAV45E4DW8UX/36ZKHSzIKyThwmu3Soo7IOxoKKENVjTIAamyfzwrnZYjBmV1YjwYeLdd8kYskR9gJBVtx8=
Received: from MWHPR15MB1789.namprd15.prod.outlook.com (10.174.96.8) by
 MWHPR15MB1294.namprd15.prod.outlook.com (10.175.3.150) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.10; Sat, 15 Jun 2019 11:50:03 +0000
Received: from MWHPR15MB1789.namprd15.prod.outlook.com
 ([fe80::d1ad:4e40:2764:10e6]) by MWHPR15MB1789.namprd15.prod.outlook.com
 ([fe80::d1ad:4e40:2764:10e6%5]) with mapi id 15.20.1987.010; Sat, 15 Jun 2019
 11:50:03 +0000
From: Sai Dasari <sdasari@fb.com>
To: Openbmc <openbmc@lists.ozlabs.org>
Subject: Re: OpenBMC@OCP Technology Day(s)
Thread-Topic: OpenBMC@OCP Technology Day(s)
Thread-Index: AQHVBRSeFNSC0pTGjkajhriKEqYcdqacYWwA
Date: Sat, 15 Jun 2019 11:50:03 +0000
Message-ID: <59F9D3A0-DDC7-491D-95EB-B745E065E857@fb.com>
References: <2B4BC3EA-95BD-41E6-98DB-8BA5408598B8@fb.com>
In-Reply-To: <2B4BC3EA-95BD-41E6-98DB-8BA5408598B8@fb.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [115.110.136.4]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1f2d599f-3254-40f9-8835-08d6f1879ab7
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MWHPR15MB1294; 
x-ms-traffictypediagnostic: MWHPR15MB1294:
x-ms-exchange-purlcount: 5
x-microsoft-antispam-prvs: <MWHPR15MB12949C4D556EF42DE3214117CEE90@MWHPR15MB1294.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0069246B74
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(346002)(376002)(39860400002)(366004)(396003)(136003)(199004)(189003)(410100003)(99286004)(6512007)(102836004)(6506007)(236005)(53546011)(54896002)(2906002)(186003)(71200400001)(26005)(6306002)(71190400001)(76176011)(33656002)(53936002)(966005)(14454004)(25786009)(6116002)(316002)(66066001)(606006)(36756003)(478600001)(790700001)(256004)(76116006)(68736007)(6436002)(6486002)(6246003)(229853002)(8936002)(81166006)(81156014)(3846002)(8676002)(6916009)(7736002)(11346002)(446003)(5660300002)(2616005)(486006)(73956011)(66476007)(66556008)(64756008)(476003)(91956017)(66946007)(66446008)(86362001)(220923002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1294;
 H:MWHPR15MB1789.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: OHPP6oJwB2XueHk2MqbkiFzTRj1o9HDZiZUcF19Cd3o2Mvr8xS/zdWSIpX5s3nMzPKxMYyvHpajScvYtEo8bs0fNWeoUtsN5cwfG5TDWBSAXRcWXoiuvurFI+qbih+0WaN+/kYOWGhmup2Ukk3pJKMl+oUOwp1ec9Ui1vMSIC//8wdqExyUMMwQdIYu1Cil9t++J8/GnZ5US3GpGEZosnJwMKkDB43GNOviMSLjNa7QdaR3v8cTdGTvJ/a639ka6MmDmQMfaYU5hnUfxGqnW5FcY6CS41ZdukSZ5JXT4xRoaYmHf/hcgBFB760QALyMPOEJ6yTw6tu3b0Vzy78vkspfM3wzRReeKPIjXfFQSzyktw5iBU68fsGcrhA52Swh4SkBkTFoDLrj1jnnNM8iptoWwDcnCg9estLMtH5PBGlE=
Content-Type: multipart/alternative;
 boundary="_000_59F9D3A0DDC7491D95EBB745E065E857fbcom_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f2d599f-3254-40f9-8835-08d6f1879ab7
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jun 2019 11:50:03.5970 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sdasari@fb.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1294
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-15_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906150110
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

--_000_59F9D3A0DDC7491D95EBB745E065E857fbcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SXQgd2FzIGdyZWF0IG1lZXR1cCBvZiBvdXIgcHJvamVjdCB0b2RheSBhdCBPQ1AgVGVjaG5vbG9n
eSBEYXlASW5kaWEgKFRoYW5rcyB0byBGbGlwa2FydCEpDQoNCkZvciB0aG9zZSBvZiB5b3Ugd2hv
IGF0dGVuZGVkIHBsZWFzZSBzaGFyZSB0aGUgcGljdHVyZXMgQCBodHRwczovL2RyaXZlLmdvb2ds
ZS5jb20vb3Blbj9pZD0xeHAtVkNudnNKMWZGdTg2S0E3a0lxZHByR09VdEhFVlgNCg0KLVNhaS4N
CkZyb206IG9wZW5ibWMgPG9wZW5ibWMtYm91bmNlcytzZGFzYXJpPWZiLmNvbUBsaXN0cy5vemxh
YnMub3JnPiBvbiBiZWhhbGYgb2YgU2FpIERhc2FyaSA8c2Rhc2FyaUBmYi5jb20+DQpEYXRlOiBU
dWVzZGF5LCBNYXkgNywgMjAxOSBhdCAxOjM4IFBNDQpUbzogT3BlbmJtYyA8b3BlbmJtY0BsaXN0
cy5vemxhYnMub3JnPg0KU3ViamVjdDogW1BvdGVudGlhbCBTcG9vZl0gT3BlbkJNQ0BPQ1AgVGVj
aG5vbG9neSBEYXkocykNCg0KaHR0cHM6Ly93d3cub3BlbmNvbXB1dGUub3JnL25ld3Mvb2NwLWlz
LWhpdHRpbmctdGhlLXJvYWQtY2hlY2stb3V0LXRoZXNlLWFtYXppbmctZ2xvYmFsLWV2ZW50cy1j
b21pbmctdXAtdGhhdC15b3UtZG9udC13YW50LXRvLW1pc3M8aHR0cHM6Ly91cmxkZWZlbnNlLnBy
b29mcG9pbnQuY29tL3YyL3VybD91PWh0dHBzLTNBX193d3cub3BlbmNvbXB1dGUub3JnX25ld3Nf
b2NwLTJEaXMtMkRoaXR0aW5nLTJEdGhlLTJEcm9hZC0yRGNoZWNrLTJEb3V0LTJEdGhlc2UtMkRh
bWF6aW5nLTJEZ2xvYmFsLTJEZXZlbnRzLTJEY29taW5nLTJEdXAtMkR0aGF0LTJEeW91LTJEZG9u
dC0yRHdhbnQtMkR0by0yRG1pc3MmZD1Ed01HYVEmYz01VkQwUlR0TmxUaDN5Y2Q0MWIzTVV3JnI9
RDgwNEJiX2c4RmtJYUNqamJfcmc3QSZtPTNwaldCUWhmWXV4UGJSWmpqbDdMSmtSd2xiSndoX2xO
Zy1OdEExLUtvbzgmcz1ZZ240dHhjNU4tQTBFYWlmNzRhRXljU0JFd1pIWGxDbE9xbTNjVXhXbnNF
JmU9Pg0KDQpUZWFtLA0KDQpGWUksIE9wZW4gQ29tcHV0ZSBQcm9qZWN0IChPQ1ApIGlzIGRvaW5n
IHNldmVyYWwgcm9hZCBzaG93cyBpbiB0aGUgbmV4dCBmZXcgd2Vla3MgKFRhaXdhbiwgSW5kaWEs
IENoaW5hLCBKYXBhbikuIEl0IGlzIGEgZ3JlYXQgaWYgc29tZSBvZiBvdXIgY29tbXVuaXR5IG1l
bWJlcnMgY2FuIHZvbHVudGVlciB0byBzcGVhayBhbmQvb3IgYXR0ZW5kIGFuZCByZXByZXNlbnQg
b3VyIE9wZW5CTUMgY29tbXVuaXR5IHByb2plY3QuIFRoaXMgd2lsbCBiZSBhbiBvcHBvcnR1bml0
eSB0byBlbmdhZ2Ugd2l0aCBpbmR1c3RyeSBhdHRlbmRlZXMgYW5kIHNoYXJlIG91ciBvcGVuIHNv
dXJjZSBCTUMgcHJvamVjdCBhbmQgY2xhcmlmeSBhbnkgY29uY2VybnMgdGhleSBtaWdodCBoYXZl
LiBGZWVsIGZyZWUgdG8gcmVnaXN0ZXIgZm9yIHRob3NlIGV2ZW50cyBhbmQgKG9wdGlvbmFsbHkp
IGFkZCB5b3Vyc2VsZiB0byB0aGUgc2hhcmVkIGRvYyB0byBsZWFybiB3aG8gZWxzZSB5b3UgbWln
aHQgYmUgYWJsZSB0byBzZWUgYXQgdGhlc2UgbG9jYWwgbWVldHVwIGV2ZW50cyBAIGh0dHBzOi8v
ZG9jcy5nb29nbGUuY29tL3NwcmVhZHNoZWV0cy9kLzFweTMyV2JLazAweXpraDhmUUtoS0kweHZ6
OWJjTEVtZWNBS0VxWFMyLWFRL2VkaXQ/dXNwPXNoYXJpbmc8aHR0cHM6Ly91cmxkZWZlbnNlLnBy
b29mcG9pbnQuY29tL3YyL3VybD91PWh0dHBzLTNBX19kb2NzLmdvb2dsZS5jb21fc3ByZWFkc2hl
ZXRzX2RfMXB5MzJXYktrMDB5emtoOGZRS2hLSTB4dno5YmNMRW1lY0FLRXFYUzItMkRhUV9lZGl0
LTNGdXNwLTNEc2hhcmluZyZkPUR3TUdhUSZjPTVWRDBSVHRObFRoM3ljZDQxYjNNVXcmcj1EODA0
QmJfZzhGa0lhQ2pqYl9yZzdBJm09M3BqV0JRaGZZdXhQYlJaampsN0xKa1J3bGJKd2hfbE5nLU50
QTEtS29vOCZzPU5RTGYtc1MyRGppM25uMVNTdHBrVDQwRFNYSFRDSk4tZWRFcWVrSmE0QVkmZT0+
DQoNClBsZWFzZSByZWFjaCBvdXQgaW4gY2FzZSB5b3Ugd291bGQgbGlrZSB0byB2b2x1bnRlZXIg
YXMgc3BlYWtlciBhdCB0aGVzZSBldmVudHMuDQoNClRoYW5rcywNClNhaS4NCg0K

--_000_59F9D3A0DDC7491D95EBB745E065E857fbcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <C861A0BC88C2404E8766169826792688@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64

PGh0bWwgeG1sbnM6dj0idXJuOnNjaGVtYXMtbWljcm9zb2Z0LWNvbTp2bWwiIHhtbG5zOm89InVy
bjpzY2hlbWFzLW1pY3Jvc29mdC1jb206b2ZmaWNlOm9mZmljZSIgeG1sbnM6dz0idXJuOnNjaGVt
YXMtbWljcm9zb2Z0LWNvbTpvZmZpY2U6d29yZCIgeG1sbnM6bT0iaHR0cDovL3NjaGVtYXMubWlj
cm9zb2Z0LmNvbS9vZmZpY2UvMjAwNC8xMi9vbW1sIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcv
VFIvUkVDLWh0bWw0MCI+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIg
Y29udGVudD0idGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjxtZXRhIG5hbWU9IkdlbmVyYXRv
ciIgY29udGVudD0iTWljcm9zb2Z0IFdvcmQgMTUgKGZpbHRlcmVkIG1lZGl1bSkiPg0KPHN0eWxl
PjwhLS0NCi8qIEZvbnQgRGVmaW5pdGlvbnMgKi8NCkBmb250LWZhY2UNCgl7Zm9udC1mYW1pbHk6
IkNhbWJyaWEgTWF0aCI7DQoJcGFub3NlLTE6MiA0IDUgMyA1IDQgNiAzIDIgNDt9DQpAZm9udC1m
YWNlDQoJe2ZvbnQtZmFtaWx5OkNhbGlicmk7DQoJcGFub3NlLTE6MiAxNSA1IDIgMiAyIDQgMyAy
IDQ7fQ0KLyogU3R5bGUgRGVmaW5pdGlvbnMgKi8NCnAuTXNvTm9ybWFsLCBsaS5Nc29Ob3JtYWws
IGRpdi5Nc29Ob3JtYWwNCgl7bWFyZ2luOjBpbjsNCgltYXJnaW4tYm90dG9tOi4wMDAxcHQ7DQoJ
Zm9udC1zaXplOjEyLjBwdDsNCglmb250LWZhbWlseToiQ2FsaWJyaSIsc2Fucy1zZXJpZjt9DQph
OmxpbmssIHNwYW4uTXNvSHlwZXJsaW5rDQoJe21zby1zdHlsZS1wcmlvcml0eTo5OTsNCgljb2xv
cjojMDU2M0MxOw0KCXRleHQtZGVjb3JhdGlvbjp1bmRlcmxpbmU7fQ0KYTp2aXNpdGVkLCBzcGFu
Lk1zb0h5cGVybGlua0ZvbGxvd2VkDQoJe21zby1zdHlsZS1wcmlvcml0eTo5OTsNCgljb2xvcjoj
OTU0RjcyOw0KCXRleHQtZGVjb3JhdGlvbjp1bmRlcmxpbmU7fQ0KcC5tc29ub3JtYWwwLCBsaS5t
c29ub3JtYWwwLCBkaXYubXNvbm9ybWFsMA0KCXttc28tc3R5bGUtbmFtZTptc29ub3JtYWw7DQoJ
bXNvLW1hcmdpbi10b3AtYWx0OmF1dG87DQoJbWFyZ2luLXJpZ2h0OjBpbjsNCgltc28tbWFyZ2lu
LWJvdHRvbS1hbHQ6YXV0bzsNCgltYXJnaW4tbGVmdDowaW47DQoJZm9udC1zaXplOjExLjBwdDsN
Cglmb250LWZhbWlseToiQ2FsaWJyaSIsc2Fucy1zZXJpZjt9DQpzcGFuLkVtYWlsU3R5bGUxOA0K
CXttc28tc3R5bGUtdHlwZTpwZXJzb25hbDsNCglmb250LWZhbWlseToiQ2FsaWJyaSIsc2Fucy1z
ZXJpZjsNCgljb2xvcjp3aW5kb3d0ZXh0O30NCnNwYW4uRW1haWxTdHlsZTE5DQoJe21zby1zdHls
ZS10eXBlOnBlcnNvbmFsLXJlcGx5Ow0KCWZvbnQtZmFtaWx5OiJDYWxpYnJpIixzYW5zLXNlcmlm
Ow0KCWNvbG9yOndpbmRvd3RleHQ7fQ0KLk1zb0NocERlZmF1bHQNCgl7bXNvLXN0eWxlLXR5cGU6
ZXhwb3J0LW9ubHk7DQoJZm9udC1zaXplOjEwLjBwdDt9DQpAcGFnZSBXb3JkU2VjdGlvbjENCgl7
c2l6ZTo4LjVpbiAxMS4waW47DQoJbWFyZ2luOjEuMGluIDEuMGluIDEuMGluIDEuMGluO30NCmRp
di5Xb3JkU2VjdGlvbjENCgl7cGFnZTpXb3JkU2VjdGlvbjE7fQ0KLS0+PC9zdHlsZT48IS0tW2lm
IGd0ZSBtc28gOV0+PHhtbD4NCjxvOnNoYXBlZGVmYXVsdHMgdjpleHQ9ImVkaXQiIHNwaWRtYXg9
IjEwMjYiIC8+DQo8L3htbD48IVtlbmRpZl0tLT48IS0tW2lmIGd0ZSBtc28gOV0+PHhtbD4NCjxv
OnNoYXBlbGF5b3V0IHY6ZXh0PSJlZGl0Ij4NCjxvOmlkbWFwIHY6ZXh0PSJlZGl0IiBkYXRhPSIx
IiAvPg0KPC9vOnNoYXBlbGF5b3V0PjwveG1sPjwhW2VuZGlmXS0tPg0KPC9oZWFkPg0KPGJvZHkg
bGFuZz0iRU4tVVMiIGxpbms9IiMwNTYzQzEiIHZsaW5rPSIjOTU0RjcyIj4NCjxkaXYgY2xhc3M9
IldvcmRTZWN0aW9uMSI+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1z
aXplOjExLjBwdCI+SXQgd2FzIGdyZWF0IG1lZXR1cCBvZiBvdXIgcHJvamVjdCB0b2RheSBhdCBP
Q1AgVGVjaG5vbG9neSBEYXlASW5kaWEgKFRoYW5rcyB0byBGbGlwa2FydCEpPG86cD48L286cD48
L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZTox
MS4wcHQiPjxvOnA+Jm5ic3A7PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwi
PjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0Ij5Gb3IgdGhvc2Ugb2YgeW91IHdobyBhdHRl
bmRlZCBwbGVhc2Ugc2hhcmUgdGhlIHBpY3R1cmVzIEANCjxhIGhyZWY9Imh0dHBzOi8vZHJpdmUu
Z29vZ2xlLmNvbS9vcGVuP2lkPTF4cC1WQ252c0oxZkZ1ODZLQTdrSXFkcHJHT1V0SEVWWCI+aHR0
cHM6Ly9kcml2ZS5nb29nbGUuY29tL29wZW4/aWQ9MXhwLVZDbnZzSjFmRnU4NktBN2tJcWRwckdP
VXRIRVZYPC9hPjxvOnA+PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxz
cGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0Ij48bzpwPiZuYnNwOzwvbzpwPjwvc3Bhbj48L3A+
DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdCI+LVNh
aS48bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8ZGl2IHN0eWxlPSJib3JkZXI6bm9uZTtib3JkZXIt
dG9wOnNvbGlkICNCNUM0REYgMS4wcHQ7cGFkZGluZzozLjBwdCAwaW4gMGluIDBpbiI+DQo8cCBj
bGFzcz0iTXNvTm9ybWFsIj48Yj48c3BhbiBzdHlsZT0iY29sb3I6YmxhY2siPkZyb206IDwvc3Bh
bj48L2I+PHNwYW4gc3R5bGU9ImNvbG9yOmJsYWNrIj5vcGVuYm1jICZsdDtvcGVuYm1jLWJvdW5j
ZXMmIzQzO3NkYXNhcmk9ZmIuY29tQGxpc3RzLm96bGFicy5vcmcmZ3Q7IG9uIGJlaGFsZiBvZiBT
YWkgRGFzYXJpICZsdDtzZGFzYXJpQGZiLmNvbSZndDs8YnI+DQo8Yj5EYXRlOiA8L2I+VHVlc2Rh
eSwgTWF5IDcsIDIwMTkgYXQgMTozOCBQTTxicj4NCjxiPlRvOiA8L2I+T3BlbmJtYyAmbHQ7b3Bl
bmJtY0BsaXN0cy5vemxhYnMub3JnJmd0Ozxicj4NCjxiPlN1YmplY3Q6IDwvYj5bUG90ZW50aWFs
IFNwb29mXSBPcGVuQk1DQE9DUCBUZWNobm9sb2d5IERheShzKTxvOnA+PC9vOnA+PC9zcGFuPjwv
cD4NCjwvZGl2Pg0KPGRpdj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250
LXNpemU6MTEuMHB0Ij48bzpwPiZuYnNwOzwvbzpwPjwvc3Bhbj48L3A+DQo8L2Rpdj4NCjxwIGNs
YXNzPSJNc29Ob3JtYWwiPjxhIGhyZWY9Imh0dHBzOi8vdXJsZGVmZW5zZS5wcm9vZnBvaW50LmNv
bS92Mi91cmw/dT1odHRwcy0zQV9fd3d3Lm9wZW5jb21wdXRlLm9yZ19uZXdzX29jcC0yRGlzLTJE
aGl0dGluZy0yRHRoZS0yRHJvYWQtMkRjaGVjay0yRG91dC0yRHRoZXNlLTJEYW1hemluZy0yRGds
b2JhbC0yRGV2ZW50cy0yRGNvbWluZy0yRHVwLTJEdGhhdC0yRHlvdS0yRGRvbnQtMkR3YW50LTJE
dG8tMkRtaXNzJmFtcDtkPUR3TUdhUSZhbXA7Yz01VkQwUlR0TmxUaDN5Y2Q0MWIzTVV3JmFtcDty
PUQ4MDRCYl9nOEZrSWFDampiX3JnN0EmYW1wO209M3BqV0JRaGZZdXhQYlJaampsN0xKa1J3bGJK
d2hfbE5nLU50QTEtS29vOCZhbXA7cz1ZZ240dHhjNU4tQTBFYWlmNzRhRXljU0JFd1pIWGxDbE9x
bTNjVXhXbnNFJmFtcDtlPSI+aHR0cHM6Ly93d3cub3BlbmNvbXB1dGUub3JnL25ld3Mvb2NwLWlz
LWhpdHRpbmctdGhlLXJvYWQtY2hlY2stb3V0LXRoZXNlLWFtYXppbmctZ2xvYmFsLWV2ZW50cy1j
b21pbmctdXAtdGhhdC15b3UtZG9udC13YW50LXRvLW1pc3M8L2E+PG86cD48L286cD48L3A+DQo8
cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdCI+Jm5ic3A7
PC9zcGFuPjxvOnA+PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9
ImZvbnQtc2l6ZToxMS4wcHQiPlRlYW0sPC9zcGFuPjxvOnA+PC9vOnA+PC9wPg0KPHAgY2xhc3M9
Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQiPiZuYnNwOzwvc3Bhbj48
bzpwPjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNp
emU6MTEuMHB0Ij5GWUksIE9wZW4gQ29tcHV0ZSBQcm9qZWN0IChPQ1ApIGlzIGRvaW5nIHNldmVy
YWwgcm9hZCBzaG93cyBpbiB0aGUgbmV4dCBmZXcgd2Vla3MgKFRhaXdhbiwgSW5kaWEsIENoaW5h
LCBKYXBhbikuIEl0IGlzIGEgZ3JlYXQgaWYgc29tZSBvZiBvdXIgY29tbXVuaXR5IG1lbWJlcnMg
Y2FuIHZvbHVudGVlciB0byBzcGVhayBhbmQvb3IgYXR0ZW5kIGFuZCByZXByZXNlbnQNCiBvdXIg
T3BlbkJNQyBjb21tdW5pdHkgcHJvamVjdC4gVGhpcyB3aWxsIGJlIGFuIG9wcG9ydHVuaXR5IHRv
IGVuZ2FnZSB3aXRoIGluZHVzdHJ5IGF0dGVuZGVlcyBhbmQgc2hhcmUgb3VyIG9wZW4gc291cmNl
IEJNQyBwcm9qZWN0IGFuZCBjbGFyaWZ5IGFueSBjb25jZXJucyB0aGV5IG1pZ2h0IGhhdmUuIEZl
ZWwgZnJlZSB0byByZWdpc3RlciBmb3IgdGhvc2UgZXZlbnRzIGFuZCAob3B0aW9uYWxseSkgYWRk
IHlvdXJzZWxmIHRvIHRoZSBzaGFyZWQNCiBkb2MgdG8gbGVhcm4gd2hvIGVsc2UgeW91IG1pZ2h0
IGJlIGFibGUgdG8gc2VlIGF0IHRoZXNlIGxvY2FsIG1lZXR1cCBldmVudHMgQCA8YSBocmVmPSJo
dHRwczovL3VybGRlZmVuc2UucHJvb2Zwb2ludC5jb20vdjIvdXJsP3U9aHR0cHMtM0FfX2RvY3Mu
Z29vZ2xlLmNvbV9zcHJlYWRzaGVldHNfZF8xcHkzMldiS2swMHl6a2g4ZlFLaEtJMHh2ejliY0xF
bWVjQUtFcVhTMi0yRGFRX2VkaXQtM0Z1c3AtM0RzaGFyaW5nJmFtcDtkPUR3TUdhUSZhbXA7Yz01
VkQwUlR0TmxUaDN5Y2Q0MWIzTVV3JmFtcDtyPUQ4MDRCYl9nOEZrSWFDampiX3JnN0EmYW1wO209
M3BqV0JRaGZZdXhQYlJaampsN0xKa1J3bGJKd2hfbE5nLU50QTEtS29vOCZhbXA7cz1OUUxmLXNT
MkRqaTNubjFTU3Rwa1Q0MERTWEhUQ0pOLWVkRXFla0phNEFZJmFtcDtlPSI+DQpodHRwczovL2Rv
Y3MuZ29vZ2xlLmNvbS9zcHJlYWRzaGVldHMvZC8xcHkzMldiS2swMHl6a2g4ZlFLaEtJMHh2ejli
Y0xFbWVjQUtFcVhTMi1hUS9lZGl0P3VzcD1zaGFyaW5nPC9hPjwvc3Bhbj48bzpwPjwvbzpwPjwv
cD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0Ij4m
bmJzcDs8L3NwYW4+PG86cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBz
dHlsZT0iZm9udC1zaXplOjExLjBwdCI+UGxlYXNlIHJlYWNoIG91dCBpbiBjYXNlIHlvdSB3b3Vs
ZCBsaWtlIHRvIHZvbHVudGVlciBhcyBzcGVha2VyIGF0IHRoZXNlIGV2ZW50cy48L3NwYW4+PG86
cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXpl
OjExLjBwdCI+Jm5ic3A7PC9zcGFuPjxvOnA+PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1h
bCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQiPlRoYW5rcyw8L3NwYW4+PG86cD48L286
cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBw
dCI+U2FpLiA8L3NwYW4+PG86cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3Bh
biBzdHlsZT0iZm9udC1zaXplOjExLjBwdCI+Jm5ic3A7PC9zcGFuPjxvOnA+PC9vOnA+PC9wPg0K
PC9kaXY+DQo8L2JvZHk+DQo8L2h0bWw+DQo=

--_000_59F9D3A0DDC7491D95EBB745E065E857fbcom_--
