Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E23BA94F31
	for <lists+openbmc@lfdr.de>; Mon, 19 Aug 2019 22:40:19 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46C5Qm5f66zDqWT
	for <lists+openbmc@lfdr.de>; Tue, 20 Aug 2019 06:40:16 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=microsoft.com
 (client-ip=40.107.81.119; helo=nam01-by2-obe.outbound.protection.outlook.com;
 envelope-from=neladk@microsoft.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none)
 header.from=microsoft.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=microsoft.com header.i=@microsoft.com
 header.b="bbkZ5w9j"; dkim-atps=neutral
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810119.outbound.protection.outlook.com [40.107.81.119])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46C5Pb167zzDqV6
 for <openbmc@lists.ozlabs.org>; Tue, 20 Aug 2019 06:39:13 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aardKaJppgJpHxDe+k1idKhYmRFKh8MTFL5sVZaYnRTnnG2P02h/hIRCWvRu2z6YWnsFKnp+0AEgOEUrDt6oYIQ6cTrhdb9M6hhEgnpN6wbkNjYSSXQQz19Yn/eTZABY562fbpPL29B6YXyD3pzkOc9Do91ofNnnK2mR5RVqbM5zM7wX8PrMxObfjmE3NkA9GV0uhMxOumwvZqGSU9BVfhOR6tgcDAkhxb4+UF8McpXxbEzxREMzLqAjF+gNKLWG/euFHC0NZsTS8crZIw3OpGM63MohTlZOvTpqdr4HfQx2GUR1KaclrhFzAMRna5+Tn7jgAc3Q5MTI48bRrxA3sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p8mNABdFVdrXtkC8VHNKLHOoA+WQ2EQVVtllCa+rkzY=;
 b=a6GpYICRPUe3EMZG6nFaROIWrDaGHomVZ/SYol6ob27Db5QYFzBnCFnPGGE5EYdt6dPs0MEL1FtwrRqihdFXUIThf/af/DfR8NgkG9YIyqYFS6uzDzLZEO5JxeLgk68fGtQbUkdNZvVLJAA1MQ6xxuoQutWQ7RCsCE51BHx17pWuBbNJDTyO/LqDa8e5hNEQy2/BJ5Lo2YAwvuiXjF0iHMA2uRI4t0iBj9BAYWMGwiKr1BKfXkZkmFhKvOKe8/OJW/7KDT1e3aRSBFqlID75pB9mvpZKHBH45+PbtjZVxXng+g8Uk5orPk2NEpisKaM65x5wbGCr1Zpp1g9Qshz9gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p8mNABdFVdrXtkC8VHNKLHOoA+WQ2EQVVtllCa+rkzY=;
 b=bbkZ5w9jUAA67RwzPrZx2dmZCcCJ3efpVPjHjWJ2N54z9XZdfncEF/miCeVZ2mHRltEbKjAp1pOqwPTsRFwsrWYaI7w1wgoAy1RSNH5GabxI9uAN/q2tYZAQtm/Py4ywAp42i+crEPeZtfSs0HjdpoB4a85EWYF3Pvy9DCBzvD4=
Received: from BYAPR21MB1191.namprd21.prod.outlook.com (20.179.56.209) by
 BYAPR21MB1350.namprd21.prod.outlook.com (20.179.60.212) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.1; Mon, 19 Aug 2019 20:39:04 +0000
Received: from BYAPR21MB1191.namprd21.prod.outlook.com
 ([fe80::b855:45ab:ca06:4230]) by BYAPR21MB1191.namprd21.prod.outlook.com
 ([fe80::b855:45ab:ca06:4230%9]) with mapi id 15.20.2178.016; Mon, 19 Aug 2019
 20:39:04 +0000
From: Neeraj Ladkani <neladk@microsoft.com>
To: James Mihm <james.mihm@gmail.com>, Zheng Bao <fishbaoz@hotmail.com>
Subject: RE: Socflash says the bmc is write protected.
Thread-Topic: Socflash says the bmc is write protected.
Thread-Index: AQHVVoxoxs+m3mo6VES5fDtPvSrCtqcChtEAgABoH/A=
Date: Mon, 19 Aug 2019 20:39:04 +0000
Message-ID: <BYAPR21MB1191A89B2C012758241C5C72C8A80@BYAPR21MB1191.namprd21.prod.outlook.com>
References: <MN2PR04MB5839D33826EF08A499E32167CDA80@MN2PR04MB5839.namprd04.prod.outlook.com>
 <CADy_Pt3tvAci8tXuZ3cTJY3tRxwnWPbD=yNL05VEYrjZKWcpEw@mail.gmail.com>
In-Reply-To: <CADy_Pt3tvAci8tXuZ3cTJY3tRxwnWPbD=yNL05VEYrjZKWcpEw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=True;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Owner=neladk@microsoft.com;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2019-08-19T20:39:02.9990584Z;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=General;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=9a86724f-5289-4f42-b4bc-5891d99f1675;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Extended_MSFT_Method=Automatic
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=neladk@microsoft.com; 
x-originating-ip: [2001:4898:80e8:3:950a:d9ce:b51b:46c5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4ec53e46-9090-4cca-2af1-08d724e546ae
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600158)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:BYAPR21MB1350; 
x-ms-traffictypediagnostic: BYAPR21MB1350:
x-ms-exchange-purlcount: 3
x-microsoft-antispam-prvs: <BYAPR21MB1350A79A35C5CC2CB1A40BC8C8A80@BYAPR21MB1350.namprd21.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0134AD334F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(346002)(366004)(396003)(39860400002)(136003)(376002)(189003)(199004)(7736002)(476003)(110136005)(8990500004)(22452003)(5660300002)(11346002)(102836004)(446003)(256004)(14444005)(54896002)(10090500001)(9686003)(7696005)(99286004)(236005)(6306002)(55016002)(478600001)(316002)(8676002)(81156014)(81166006)(76116006)(53546011)(64756008)(66446008)(6506007)(46003)(66476007)(66556008)(8936002)(66946007)(186003)(486006)(71200400001)(71190400001)(74316002)(86362001)(229853002)(790700001)(6116002)(14454004)(6436002)(2906002)(966005)(4326008)(52536014)(4744005)(25786009)(53936002)(10290500003)(33656002)(6246003)(76176011)(606006);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR21MB1350;
 H:BYAPR21MB1191.namprd21.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microsoft.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: aRjfrawMGAdQQDPVvEXnfSgdqyHLbKYkQFYbfXH4vDojO5ZtwTMWXLVjzBzXBMxh6hO7wCZwdzsDPpo8PYByDzZo32qkCLWU61aMkNSfDZpAqyYf7Ka0i/M2xCkihMt+veNItIPRCPuvk/Uhvj/7J3kXeVv4qKRxIMb8pAD/v4LPd3SVBcO8s29rVOa4isWsDI7h4i1MqmbACi+mzn8sch80QcZsqLvX5xLZwiRZY/w46mdV1M/1ZvyJ7sQz+W7Q+c2Ow5pOYDfGG6DJDcqepPEg2PwDox3c0MsbVKL48rMYTKYVDeBelQ6QoSfihE0bp7l0dNl3kDpjkOuqPV+eAkc2Izt5ONMavtcFycxyri+jc+0MMHgUW8pKfdZEq+OiSUu6rPEIjnJB8T4PX2ukZ2U7O8432KLKw+a3pqrBWKY=
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_BYAPR21MB1191A89B2C012758241C5C72C8A80BYAPR21MB1191namp_"
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ec53e46-9090-4cca-2af1-08d724e546ae
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Aug 2019 20:39:04.6255 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dEDRlMrFpqUFJ9QC7aJhKhsPoq3gW6aqjsxfTx6PmYqvaiPGgC38ZKTMRa6XnuglkL/+OY6z0Y0EtiW2S+VwaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR21MB1350
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_BYAPR21MB1191A89B2C012758241C5C72C8A80BYAPR21MB1191namp_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

Q2FuIGFueW9uZSBjb25maXJtcyBpZiB0aGVzZSBsb2NrcyBwZXJzaXN0cyBkdXJpbmcgQk1DIHJl
c2V0Pw0KDQpOZWVyYWoNCg0KDQpGcm9tOiBvcGVuYm1jIDxvcGVuYm1jLWJvdW5jZXMrbmVsYWRr
PW1pY3Jvc29mdC5jb21AbGlzdHMub3psYWJzLm9yZz4gT24gQmVoYWxmIE9mIEphbWVzIE1paG0N
ClNlbnQ6IE1vbmRheSwgQXVndXN0IDE5LCAyMDE5IDc6MjYgQU0NClRvOiBaaGVuZyBCYW8gPGZp
c2hiYW96QGhvdG1haWwuY29tPg0KQ2M6IG9wZW5ibWNAbGlzdHMub3psYWJzLm9yZw0KU3ViamVj
dDogUmU6IFNvY2ZsYXNoIHNheXMgdGhlIGJtYyBpcyB3cml0ZSBwcm90ZWN0ZWQuDQoNClRoZSBQ
MkEgQnJpZGdlIHRoYXQgaXMgdXNlZCBieSB0aGUgc29jZmxhc2ggdXRpbGl0eSBoYXMgYmVlbiBk
aXNhYmxlZDsgc2VlICBodHRwczovL252ZC5uaXN0Lmdvdi92dWxuL2RldGFpbC9DVkUtMjAxOS02
MjYwPGh0dHBzOi8vbmFtMDYuc2FmZWxpbmtzLnByb3RlY3Rpb24ub3V0bG9vay5jb20vP3VybD1o
dHRwcyUzQSUyRiUyRm52ZC5uaXN0LmdvdiUyRnZ1bG4lMkZkZXRhaWwlMkZDVkUtMjAxOS02MjYw
JmRhdGE9MDIlN0MwMSU3Q25lbGFkayU0MG1pY3Jvc29mdC5jb20lN0M3NDVjYmI3YmY5NWE0MTZl
MzllODA4ZDcyNGIyNDc2ZSU3QzcyZjk4OGJmODZmMTQxYWY5MWFiMmQ3Y2QwMTFkYjQ3JTdDMSU3
QzAlN0M2MzcwMTgyMjA0MzY4OTY2MTUmc2RhdGE9WkpiJTJCeDhCUW1lbktzNkslMkZWMjZpeXB1
OUpyTW9yMWQ0dWxpUUpHZTFZSWslM0QmcmVzZXJ2ZWQ9MD4gZm9yIGRldGFpbHMuDQoNCk9uIE1v
biwgQXVnIDE5LCAyMDE5IGF0IDU6NTEgQU0gWmhlbmcgQmFvIDxmaXNoYmFvekBob3RtYWlsLmNv
bTxtYWlsdG86ZmlzaGJhb3pAaG90bWFpbC5jb20+PiB3cm90ZToNCkhpLCBBbGwsDQpJIHVzZSBz
b2NmbGFzaCB0byB1cGRhdGUgdGhlIEJNQyBmaXJtd2FyZS4gVGhlIG9yaWdpbmFsIEJNQyBmaXJt
d2FyZSBjYW4gYmUgdXBkYXRlZCwgYnV0IG9wZW5ibWMgY2FuIG5vdCBiZS4NClNvY2ZsYXNoIHNh
eXMgdGhlIEJNQyBpcyBwcm90ZWN0ZWQuIERvZXMgYW55Ym9keSBrbm93IHdoeT8NCg0KVGhhbmtz
Lg0KSm9lDQo=

--_000_BYAPR21MB1191A89B2C012758241C5C72C8A80BYAPR21MB1191namp_
Content-Type: text/html; charset="utf-8"
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
Zm9udC1zaXplOjExLjBwdDsNCglmb250LWZhbWlseToiQ2FsaWJyaSIsc2Fucy1zZXJpZjt9DQph
OmxpbmssIHNwYW4uTXNvSHlwZXJsaW5rDQoJe21zby1zdHlsZS1wcmlvcml0eTo5OTsNCgljb2xv
cjpibHVlOw0KCXRleHQtZGVjb3JhdGlvbjp1bmRlcmxpbmU7fQ0KYTp2aXNpdGVkLCBzcGFuLk1z
b0h5cGVybGlua0ZvbGxvd2VkDQoJe21zby1zdHlsZS1wcmlvcml0eTo5OTsNCgljb2xvcjpwdXJw
bGU7DQoJdGV4dC1kZWNvcmF0aW9uOnVuZGVybGluZTt9DQpwLm1zb25vcm1hbDAsIGxpLm1zb25v
cm1hbDAsIGRpdi5tc29ub3JtYWwwDQoJe21zby1zdHlsZS1uYW1lOm1zb25vcm1hbDsNCgltc28t
bWFyZ2luLXRvcC1hbHQ6YXV0bzsNCgltYXJnaW4tcmlnaHQ6MGluOw0KCW1zby1tYXJnaW4tYm90
dG9tLWFsdDphdXRvOw0KCW1hcmdpbi1sZWZ0OjBpbjsNCglmb250LXNpemU6MTEuMHB0Ow0KCWZv
bnQtZmFtaWx5OiJDYWxpYnJpIixzYW5zLXNlcmlmO30NCnNwYW4uRW1haWxTdHlsZTE4DQoJe21z
by1zdHlsZS10eXBlOnBlcnNvbmFsLXJlcGx5Ow0KCWZvbnQtZmFtaWx5OiJDYWxpYnJpIixzYW5z
LXNlcmlmOw0KCWNvbG9yOiMwMDIwNjA7fQ0KLk1zb0NocERlZmF1bHQNCgl7bXNvLXN0eWxlLXR5
cGU6ZXhwb3J0LW9ubHk7DQoJZm9udC1mYW1pbHk6IkNhbGlicmkiLHNhbnMtc2VyaWY7fQ0KQHBh
Z2UgV29yZFNlY3Rpb24xDQoJe3NpemU6OC41aW4gMTEuMGluOw0KCW1hcmdpbjoxLjBpbiAxLjBp
biAxLjBpbiAxLjBpbjt9DQpkaXYuV29yZFNlY3Rpb24xDQoJe3BhZ2U6V29yZFNlY3Rpb24xO30N
Ci0tPjwvc3R5bGU+PCEtLVtpZiBndGUgbXNvIDldPjx4bWw+DQo8bzpzaGFwZWRlZmF1bHRzIHY6
ZXh0PSJlZGl0IiBzcGlkbWF4PSIxMDI2IiAvPg0KPC94bWw+PCFbZW5kaWZdLS0+PCEtLVtpZiBn
dGUgbXNvIDldPjx4bWw+DQo8bzpzaGFwZWxheW91dCB2OmV4dD0iZWRpdCI+DQo8bzppZG1hcCB2
OmV4dD0iZWRpdCIgZGF0YT0iMSIgLz4NCjwvbzpzaGFwZWxheW91dD48L3htbD48IVtlbmRpZl0t
LT4NCjwvaGVhZD4NCjxib2R5IGxhbmc9IkVOLVVTIiBsaW5rPSJibHVlIiB2bGluaz0icHVycGxl
Ij4NCjxkaXYgY2xhc3M9IldvcmRTZWN0aW9uMSI+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3Bh
biBzdHlsZT0iY29sb3I6IzAwMjA2MCI+Q2FuIGFueW9uZSBjb25maXJtcyBpZiB0aGVzZSBsb2Nr
cyBwZXJzaXN0cyBkdXJpbmcgQk1DIHJlc2V0Pw0KPG86cD48L286cD48L3NwYW4+PC9wPg0KPHAg
Y2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9ImNvbG9yOiMwMDIwNjAiPjxvOnA+Jm5ic3A7
PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJjb2xv
cjojMDAyMDYwIj5OZWVyYWo8bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9y
bWFsIj48c3BhbiBzdHlsZT0iY29sb3I6IzAwMjA2MCI+PG86cD4mbmJzcDs8L286cD48L3NwYW4+
PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9ImNvbG9yOiMwMDIwNjAiPjxv
OnA+Jm5ic3A7PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxiPkZyb206
PC9iPiBvcGVuYm1jICZsdDtvcGVuYm1jLWJvdW5jZXMmIzQzO25lbGFkaz1taWNyb3NvZnQuY29t
QGxpc3RzLm96bGFicy5vcmcmZ3Q7DQo8Yj5PbiBCZWhhbGYgT2YgPC9iPkphbWVzIE1paG08YnI+
DQo8Yj5TZW50OjwvYj4gTW9uZGF5LCBBdWd1c3QgMTksIDIwMTkgNzoyNiBBTTxicj4NCjxiPlRv
OjwvYj4gWmhlbmcgQmFvICZsdDtmaXNoYmFvekBob3RtYWlsLmNvbSZndDs8YnI+DQo8Yj5DYzo8
L2I+IG9wZW5ibWNAbGlzdHMub3psYWJzLm9yZzxicj4NCjxiPlN1YmplY3Q6PC9iPiBSZTogU29j
Zmxhc2ggc2F5cyB0aGUgYm1jIGlzIHdyaXRlIHByb3RlY3RlZC48bzpwPjwvbzpwPjwvcD4NCjxw
IGNsYXNzPSJNc29Ob3JtYWwiPjxvOnA+Jm5ic3A7PC9vOnA+PC9wPg0KPGRpdj4NCjxwIGNsYXNz
PSJNc29Ob3JtYWwiPlRoZSBQMkEgQnJpZGdlIHRoYXQgaXMgdXNlZCBieSB0aGUgc29jZmxhc2gg
dXRpbGl0eSBoYXMgYmVlbiBkaXNhYmxlZDsgc2VlJm5ic3A7DQo8YSBocmVmPSJodHRwczovL25h
bTA2LnNhZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxvb2suY29tLz91cmw9aHR0cHMlM0ElMkYlMkZu
dmQubmlzdC5nb3YlMkZ2dWxuJTJGZGV0YWlsJTJGQ1ZFLTIwMTktNjI2MCZhbXA7ZGF0YT0wMiU3
QzAxJTdDbmVsYWRrJTQwbWljcm9zb2Z0LmNvbSU3Qzc0NWNiYjdiZjk1YTQxNmUzOWU4MDhkNzI0
YjI0NzZlJTdDNzJmOTg4YmY4NmYxNDFhZjkxYWIyZDdjZDAxMWRiNDclN0MxJTdDMCU3QzYzNzAx
ODIyMDQzNjg5NjYxNSZhbXA7c2RhdGE9WkpiJTJCeDhCUW1lbktzNkslMkZWMjZpeXB1OUpyTW9y
MWQ0dWxpUUpHZTFZSWslM0QmYW1wO3Jlc2VydmVkPTAiPg0KaHR0cHM6Ly9udmQubmlzdC5nb3Yv
dnVsbi9kZXRhaWwvQ1ZFLTIwMTktNjI2MDwvYT4mbmJzcDtmb3IgZGV0YWlscy48bzpwPjwvbzpw
PjwvcD4NCjwvZGl2Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PG86cD4mbmJzcDs8L286cD48L3A+
DQo8ZGl2Pg0KPGRpdj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPk9uIE1vbiwgQXVnIDE5LCAyMDE5
IGF0IDU6NTEgQU0gWmhlbmcgQmFvICZsdDs8YSBocmVmPSJtYWlsdG86ZmlzaGJhb3pAaG90bWFp
bC5jb20iPmZpc2hiYW96QGhvdG1haWwuY29tPC9hPiZndDsgd3JvdGU6PG86cD48L286cD48L3A+
DQo8L2Rpdj4NCjxibG9ja3F1b3RlIHN0eWxlPSJib3JkZXI6bm9uZTtib3JkZXItbGVmdDpzb2xp
ZCAjQ0NDQ0NDIDEuMHB0O3BhZGRpbmc6MGluIDBpbiAwaW4gNi4wcHQ7bWFyZ2luLWxlZnQ6NC44
cHQ7bWFyZ2luLXJpZ2h0OjBpbiI+DQo8ZGl2Pg0KPGRpdj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwi
PjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTIuMHB0O2NvbG9yOmJsYWNrIj5IaSwgQWxsLDxvOnA+
PC9vOnA+PC9zcGFuPjwvcD4NCjwvZGl2Pg0KPGRpdj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxz
cGFuIHN0eWxlPSJmb250LXNpemU6MTIuMHB0O2NvbG9yOmJsYWNrIj5JIHVzZSBzb2NmbGFzaCB0
byB1cGRhdGUgdGhlIEJNQyBmaXJtd2FyZS4gVGhlIG9yaWdpbmFsIEJNQyBmaXJtd2FyZSBjYW4g
YmUgdXBkYXRlZCwgYnV0IG9wZW5ibWMgY2FuIG5vdCBiZS48bzpwPjwvbzpwPjwvc3Bhbj48L3A+
DQo8L2Rpdj4NCjxkaXY+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1z
aXplOjEyLjBwdDtjb2xvcjpibGFjayI+U29jZmxhc2ggc2F5cyB0aGUgQk1DIGlzIHByb3RlY3Rl
ZC4gRG9lcyBhbnlib2R5IGtub3cgd2h5PzxvOnA+PC9vOnA+PC9zcGFuPjwvcD4NCjwvZGl2Pg0K
PGRpdj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTIuMHB0
O2NvbG9yOmJsYWNrIj48bzpwPiZuYnNwOzwvbzpwPjwvc3Bhbj48L3A+DQo8L2Rpdj4NCjxkaXY+
DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjEyLjBwdDtjb2xv
cjpibGFjayI+VGhhbmtzLiA8bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8L2Rpdj4NCjxkaXY+DQo8
cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjEyLjBwdDtjb2xvcjpi
bGFjayI+Sm9lPG86cD48L286cD48L3NwYW4+PC9wPg0KPC9kaXY+DQo8L2Rpdj4NCjwvYmxvY2tx
dW90ZT4NCjwvZGl2Pg0KPC9kaXY+DQo8L2JvZHk+DQo8L2h0bWw+DQo=

--_000_BYAPR21MB1191A89B2C012758241C5C72C8A80BYAPR21MB1191namp_--
