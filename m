Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 760EF9C65E
	for <lists+openbmc@lfdr.de>; Mon, 26 Aug 2019 00:09:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Gq6l5MYNzDqfN
	for <lists+openbmc@lfdr.de>; Mon, 26 Aug 2019 08:09:19 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=31403f0130=taoren@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="jmYDc2b9"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="OSivPdeR"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Gq661rqRzDqf2
 for <openbmc@lists.ozlabs.org>; Mon, 26 Aug 2019 08:08:41 +1000 (AEST)
Received: from pps.filterd (m0148461.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x7PM8Nu9002192; Sun, 25 Aug 2019 15:08:25 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=owNEY8OWz02/bXW+aU/IGgPSjADigaFv4pELm5lXmws=;
 b=jmYDc2b9d/2QH7lhw7dDiXyFhKI0Y1dhc4wikY7tszbubpq9IYwC8vAFYwk0ghidWzUv
 qKdXWmdOWj+A0dwVgYnUSycQgUtzgRIjXkbz4UDcTb8qxqwMtak5kwHcTy7lm/lvGclo
 soAjnR1eKTEvX/8Mew7pgAI72UDJ8aoznbM= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 2uknj61s2m-4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Sun, 25 Aug 2019 15:08:25 -0700
Received: from ash-exhub203.TheFacebook.com (2620:10d:c0a8:83::5) by
 ash-exhub101.TheFacebook.com (2620:10d:c0a8:82::e) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Sun, 25 Aug 2019 15:08:23 -0700
Received: from NAM04-SN1-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.36.102) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Sun, 25 Aug 2019 15:08:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pw9f3yW0kGhsXd/xodD2ziLDxCqQG9XMK9zTgXlMBXZEULZj4NY+9kYGK2AdhF3xDMY2tFkkwGZQgE6nQreEag/8rC51Q8g+RFPsy2i0Tj7yR1LV+4jU32IPxtuZBPgW1LyNRF/j6eRIFnWBzina/gXN4JFRj2/vQPq/4bdbGlM4P84dSzAm6HGIdqkBg7/f3tD4NmbRwuQiJn7oMJNDp7YC5kDB3EvE0t9qZ9A4aoeSTvL7aHo8jcyOmfYq86LXxFF6Qlc/nAfEYdOkElavynUTDolzZbkIAPaMlFplBOe1TGXJjHqz4ewJJLuvsEEd0Q+CvOWdY1Tn/7IdctDInA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=owNEY8OWz02/bXW+aU/IGgPSjADigaFv4pELm5lXmws=;
 b=dah27flb25GjLugAZrCS28riRc3ZTZJsLtjjr7XkTdMbS0ccF17Q4EWOgehvVzy4+5B8jiO+ODRUizrdGBnIgwt171RlEYPWjyJvNYlJ6+SfVZmhjHNn/0EVekskWTHJIzlUiMbO0+UNj7zjg7LaeobLrzxg6xopr18H090xTQhGjjjash5wvThHl86XZQMEskLX87NW6N7aavLYk7UpeUfi/ADjXZOQCxcSZxcKYBXPw6WqbFDHSwa7Gr8KYZ7vdiPIW0GwkT+DvQjpq29Q7Xm+6XB4f4lNols2BNCw13Vl8Zc2qP83nuwq9y+mOxiE+ncpWMr3tw0yVkzpsR/Mfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=owNEY8OWz02/bXW+aU/IGgPSjADigaFv4pELm5lXmws=;
 b=OSivPdeRW7z3rsUDc2p7IH2Rv0YV91txy6LCXlGwxmpNiZfIOo+V9IBhokbUdC3kmPF0W5Gn/dAG7wVvogVwRFeZNJfFAu4WJO9WZT6LwOdCEJnmbpoYV2h6RujtTF+qqffZH6/nwUb0tR80Z1pVE52ALFXtUW8iXlS0DJD0p58=
Received: from MWHPR15MB1216.namprd15.prod.outlook.com (10.175.2.17) by
 MWHPR15MB1440.namprd15.prod.outlook.com (10.173.234.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.20; Sun, 25 Aug 2019 22:08:08 +0000
Received: from MWHPR15MB1216.namprd15.prod.outlook.com
 ([fe80::2971:619a:860e:b6cc]) by MWHPR15MB1216.namprd15.prod.outlook.com
 ([fe80::2971:619a:860e:b6cc%2]) with mapi id 15.20.2178.023; Sun, 25 Aug 2019
 22:08:08 +0000
From: Tao Ren <taoren@fb.com>
To: Richard Weinberger <richard.weinberger@gmail.com>, Andrew Jeffery
 <andrew@aj.id.au>
Subject: Re: kernel BUG at fs/jffs2/gc.c:395!
Thread-Topic: kernel BUG at fs/jffs2/gc.c:395!
Thread-Index: AQHVV6xCTU2NhpXAkkGUQ2XhN58pgKcEqeqAgAAPW4CAB4xhAIAALiMA
Date: Sun, 25 Aug 2019 22:08:08 +0000
Message-ID: <4dee9f54-1cf4-94ca-4ddc-2b1f8892d9b1@fb.com>
References: <e8bde724-46fd-4264-ea3f-a84a792bcad8@fb.com>
 <236e95be-a2cd-3b44-36c5-121678f7c009@fb.com>
 <afe2b8f2-d1be-4cd2-971a-b13c1e38da67@www.fastmail.com>
 <CAFLxGvypuPp_Q_31DpKmfqte4uxHfYiQ6KvT1f2LGo_y7EvKfw@mail.gmail.com>
In-Reply-To: <CAFLxGvypuPp_Q_31DpKmfqte4uxHfYiQ6KvT1f2LGo_y7EvKfw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MWHPR01CA0045.prod.exchangelabs.com (2603:10b6:300:101::31)
 To MWHPR15MB1216.namprd15.prod.outlook.com
 (2603:10b6:320:22::17)
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [2620:10d:c090:180::b0e]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f30f21f5-36e4-4d59-8ab8-08d729a8b5e0
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MWHPR15MB1440; 
x-ms-traffictypediagnostic: MWHPR15MB1440:
x-microsoft-antispam-prvs: <MWHPR15MB144021F26DC24B27547B8753B2A60@MWHPR15MB1440.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 01401330D1
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(136003)(366004)(376002)(396003)(39860400002)(346002)(189003)(199004)(110136005)(58126008)(8936002)(66946007)(54906003)(6246003)(6436002)(386003)(229853002)(53546011)(65956001)(65806001)(52116002)(6512007)(53936002)(46003)(14454004)(6506007)(25786009)(478600001)(4744005)(305945005)(186003)(66556008)(316002)(64756008)(446003)(66476007)(66446008)(11346002)(31686004)(7736002)(256004)(5660300002)(6486002)(86362001)(71190400001)(71200400001)(2906002)(76176011)(8676002)(81166006)(476003)(31696002)(102836004)(486006)(6116002)(4326008)(81156014)(36756003)(2616005)(99286004);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1440;
 H:MWHPR15MB1216.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: +5a95j39SHkToSqWBMvu/28pLzW4UVP1Av951r6cHBBq5WEBbzhTpSiN9zOAJ+Z7gp1CUs0OorezZFCMkV4xNC/olVxOt9NzcBErVB5CYaq2lWifA09upNnBTR0MDDYKUCYd7qROfppkqwUfHC7KKrH8zi2oDrS+hoRnLPC35rgl6eVupg/0bI0yq049/qHat9iya4LJ07bJI/0JF+bco3WoP0+/x4YYPpozjdmQWe6uSeHDnkrYAhVkW0zFvytGXpJTU65t8iTKRUT6z7Xl9i+8zTAWLbFp6ZeZEkM7VDFTHoCuqw7zpLuP7uP/MsdeQuTqvi6lXSN6ekoki4QrhIiPCaZ1aH9QOFiZquHTcz+/gmRAQsrtS2kvUFzBtEBNGe7+uiUsvQ5hRjdJ5eGFFAxUgytrkUnndw51JxQigW8=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <247EE95655181A469348414E88728C35@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: f30f21f5-36e4-4d59-8ab8-08d729a8b5e0
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Aug 2019 22:08:08.0969 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eOFhXyPdrUZ1bps4VAbCs3EQNXsrWpfitKXSqkk6Z3aUuhDNcgR8k3rAyddO99Y7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1440
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:5.22.84,1.0.8
 definitions=2019-08-25_14:2019-08-23,2019-08-25 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 bulkscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1011 mlxlogscore=999 adultscore=0 spamscore=0
 mlxscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1906280000 definitions=main-1908250248
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

T24gOC8yNS8xOSAxMjoyMiBQTSwgUmljaGFyZCBXZWluYmVyZ2VyIHdyb3RlOg0KPiBPbiBXZWQs
IEF1ZyAyMSwgMjAxOSBhdCAyOjA2IEFNIEFuZHJldyBKZWZmZXJ5IDxhbmRyZXdAYWouaWQuYXU+
IHdyb3RlOg0KPj4gTG9va3MgbGlrZSBhIGxhY2sgb2Ygcm9idXN0bmVzcyB0byBmaWxlc3lzdGVt
IGNvcnJ1cHRpb24gdG8gbWUuIExXTg0KPiANCj4gV2hhdCBleGFjdGx5IG1ha2VzIHlvdSB0aGlu
ayBzbz8NCj4gVGhlIGlub2RlIGNhY2hlIGVudHJ5IGlzIGluIHN0YXRlIElOT19TVEFURV9VTkNI
RUNLRUQgd2hpbGUgR0MgcnVuLA0KPiB3aGljaCBpcyBub3QgYWxsb3dlZC4NCj4gDQo+IFRhbywg
aXMgdGhlIGVycm9yIHBlcnNpc3RlbnQgb3IgZGlkIGl0IGhhcHBlbiBvbmx5IG9uY2U/DQoNCkhp
IFJpY2hhcmQsDQoNCkl0IHJhcmVseSBoYXBwZW5zICh+MSBvdXQgb2YgMTAwMCBtYWNoaW5lcyBp
biBteSBlbnZpcm9ubWVudCksIGJ1dCBvbmNlIGl0IGhhcHBlbnMsIGl0J3MgcGVyc2lzdGVudDog
dGhlIG1hY2hpbmUgd2lsbCBmYWxsIGludG8gcmVib290IGxvb3AgZHVlIHRvIHRoZSBjcmFzaC4N
Cg0KDQpUaGFua3MsDQoNClRhbw0K
