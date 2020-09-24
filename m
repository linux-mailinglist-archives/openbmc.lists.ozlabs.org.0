Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 90632276627
	for <lists+openbmc@lfdr.de>; Thu, 24 Sep 2020 04:00:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BxdYH6s81zDq8t
	for <lists+openbmc@lfdr.de>; Thu, 24 Sep 2020 12:00:35 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=6536d4a058=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=OIrwC8qV; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-fb-onmicrosoft-com header.b=Nxbqmsrc; 
 dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BxdXP50ShzDqTP
 for <openbmc@lists.ozlabs.org>; Thu, 24 Sep 2020 11:59:47 +1000 (AEST)
Received: from pps.filterd (m0044012.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08O1ta79009482; Wed, 23 Sep 2020 18:59:45 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=R6U0hKi9IOzynP+Q5bXD+NT9v6Dz074mfFiZG05O43A=;
 b=OIrwC8qVI2UG4mO60FxUojZ9cwGZ6ZwxqFVzQw4VDCxlFUKYoovkYn/9YCkcy9WLUDro
 +vJXocegkFbORD4uh3BiQZYIIsMuyT6Iq6zPiCKTJDyFyj6JtvUkROIT3T3Si9ZJIic2
 pPy4V5RlgRhp+Dt2c0zBHL+rQ6Jzl7kTWBo= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 33qsp7y51j-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 23 Sep 2020 18:59:45 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.36.100) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Wed, 23 Sep 2020 18:59:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NHUj1wStfbwlLLtAZQFWaBFIcb5wsdJkfo2RN4pTaOUVhtwj0Xw0Lj3rtLOIr5kNndDdQigUm+oq9uI2Fg+15g6wnM6rk9S3TCQHcq8HzmADSnsDue0rROVJMtLU/y66ktmUpeQgw07G/ml3fdmy9uvuQlLFnWjVVs1yR/4yZdMAn9F/ooR84IaBScs2wnuhSLFNkTTBO2uwbSXnd1u0FwFqmpvVxP0/ClQZCnE7XJfB57BJOnRisw4gQyq+7GTQgj/NDvNnc42I3jUq8myIeVZDZ0HwpFQx0E9CxIyq3ZgPAdS2u/7pOfeatGN58CpJe2fn/xGTrzGVOYsbsr7v0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R6U0hKi9IOzynP+Q5bXD+NT9v6Dz074mfFiZG05O43A=;
 b=k37OxZWhLhbDFQyaOeA2Unz11pzLHAQruQQeRmLrkQX4z7os4tZhNrtacqoer1XQXAGiXyZtW1YxfIBkyCQuozR5Y9O3t5GklxnNa+Z+QKnti4UX1oLXZy0nreDF9MT0SZGKjxcjBRzEFuSGy/Y3dD73eCI09sr5oDyloYHTQqk20NNtflxxbUUbrmtMIp6jrHdzGBcITRI01PNYfTb37Bgru0l/CNPxow+yBKETAkuajHDDwMWV4nePyDQbm+5Hzu3ar+/vCfbha5fEa3mtf1ZeH/kirvSqLorfBlPjQO3AkBya45XMcHyjP2Lpj8xa8RKMXXf0WOqRn3yTFPqd9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R6U0hKi9IOzynP+Q5bXD+NT9v6Dz074mfFiZG05O43A=;
 b=NxbqmsrcPeLbDnM6QfB2tyRG/yoFSyMXWpc7GDH73ww7pJcpuvc9kk0jwqzudZuHf1Sc/sbcHpDrcwLMMWnK4vLuSdjRfmnsrPxMU1YkT6iuPNfQayXD6lNu4fLsJzB2oTKOZa0iPIMgpxSQHCu7cILtK+ToAI3M2BmXTQTfMW4=
Received: from BYAPR15MB2374.namprd15.prod.outlook.com (2603:10b6:a02:8b::16)
 by BYAPR15MB2998.namprd15.prod.outlook.com (2603:10b6:a03:fc::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.19; Thu, 24 Sep
 2020 01:59:39 +0000
Received: from BYAPR15MB2374.namprd15.prod.outlook.com
 ([fe80::88bb:d933:db33:4df4]) by BYAPR15MB2374.namprd15.prod.outlook.com
 ([fe80::88bb:d933:db33:4df4%7]) with mapi id 15.20.3391.027; Thu, 24 Sep 2020
 01:59:39 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Ed Tanous <ed@tanous.net>, Patrick Williams <patrick@stwcx.xyz>
Subject: Re: Chassis reset
Thread-Topic: Chassis reset
Thread-Index: AQHWjfT7lWI0BIvUr06gDFlShL1iFqlu7CYA//+pggCAAILigIAFf+wAgADJeID//+ZlAIABVkSAgAAEgACAAA8pgIAADjwAgAAIgoCAAA2tAP//xMkA
Date: Thu, 24 Sep 2020 01:59:39 +0000
Message-ID: <4F207AFD-3CE9-4AA3-B520-34C63041EB55@fb.com>
References: <CACWQX802HpRT20Zj2YFEnVE7XXBOJXx66-8B1E7TEZdCNwPbsQ@mail.gmail.com>
 <9EC0D657-2D58-4544-BA9E-65D3C4148A81@fb.com>
 <CACWQX80SivNLLE3gAUk+Ao=0eHf_ooezumXGmkkkVhVPFyyNSA@mail.gmail.com>
 <C6292DFD-EAF1-4658-85A7-F81941B12D5A@fb.com>
 <CACWQX83GJ9V9--5WGmVjvacYnw2=fr7URhqOcwkSq4C8GpFoiQ@mail.gmail.com>
 <F46D657F-D4DA-49BD-B78D-CDD420768728@fb.com>
 <20200923191051.GR6152@heinlein>
 <CACWQX81tyY1Wo6a8e4hnk3fvinfV-x3ogRK1q1W5cfx28tpfrw@mail.gmail.com>
 <20200923202113.GT6152@heinlein>
 <CACWQX8135vU++ztaVaaKjJyq2C=DdqDti623xGdCeT9fSJDQAA@mail.gmail.com>
 <20200923214237.GV6152@heinlein>
 <CACWQX82uw_PEWouQ0tu=vKL_Wh_G8t-yUiEQ64RJh=0O=vDSAA@mail.gmail.com>
In-Reply-To: <CACWQX82uw_PEWouQ0tu=vKL_Wh_G8t-yUiEQ64RJh=0O=vDSAA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: tanous.net; dkim=none (message not signed)
 header.d=none;tanous.net; dmarc=none action=none header.from=fb.com;
x-originating-ip: [2620:10d:c090:400::5:ab1c]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 67dad031-d5c0-40bf-b9f3-08d8602d7f28
x-ms-traffictypediagnostic: BYAPR15MB2998:
x-microsoft-antispam-prvs: <BYAPR15MB299818C531544CF4BE4441BADD390@BYAPR15MB2998.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Mq30+WHtMVT3FZcwb6XRk7KCCb0hOOTjBtpCovztHs7UCh+RqImp7ycwLuKkSbO+eiA7Z9AXxkKFxDyQOGeVEsRghrSGBWbK4FMhTFQcNyYjlWbG3zNg4HyxwQTgI7rAvSz66OVyMw794lrHDJg2jreJv/1o4eKL8Zh1/Abhv24EUiu2Ij30+XjlAxYYxIfe++P8GqUgroKRUiaBPeAjI0yzyPMCuseg9lZk61TNOXZyfgtqWRGGmlhkfNJSIGYYO7++dQNwr2t0EXMZFtyupiyBHh13s7bqhPYf0I8dhnKUaoUWDeXSyCXOZ/t71SessOxT7XmRfQ94w+6/dSyD+lhsN5d0zWHBfZbMSqCJFLkCELAlkUNTEXTz72Qpjth+
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR15MB2374.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(136003)(346002)(376002)(396003)(39860400002)(36756003)(8936002)(2906002)(6512007)(7116003)(33656002)(4326008)(110136005)(64756008)(66446008)(6506007)(66556008)(66946007)(6486002)(91956017)(71200400001)(76116006)(5660300002)(478600001)(2616005)(86362001)(316002)(8676002)(186003)(3480700007)(66476007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: u8Sz2um15RfgU2AkIB4Hy/GXi3KCDe8iIabAxodcndYa/7qmob5Uw8RVybVQ3qhrXnU0Oq5E5lzJVIqY+/sbp5PqtBC+V//BtkxNUX1kqy20PWf/VTrQPbghiE+NUWzxvJUE76VodcRCtaIqP+yY43tHYU5WtOWTHJeKrHERkeDqgoeOm2u9Jx0QdpTmRIOqAC9OqHyLtvk8GoXfjZosDWkz4uBsWHo3uQgh7xqtKU3n9nkuXb4bIKrCTijkwziIefPf+EPqPfRQqu7ynpUbgGLkRzIBnOmjuWliUXr2j2GeBi1v7eYa5QeWY7V48cMp0Y1/bKi5wjKrktbcD5z/Wksqi/uJ0DzSaqkjI5DYYk3NjsMjcI0JuWkLndI9UfGYhSR4NkD8Z+vMl/mxdxjT1QOYyUlhtn47MV93PHn7K4gYtobNFNXtDj6g7aIWTOkcbGo3vTDkFpfITm56Ahf9lpOZc9nv7v04We4QMTPxfk0u/7j9EAwzF471K+/KeqdCEmIcfit4m7eNgoYm2YhNqtORnTu+N8g8c6STTCYQFlHJKF6WjmLvT5IDfBQY9D1B2s/Z0FWB4VlTjRso2XC+aCzIMemjX/kkIDi8wQj1RqH4PiqRUr+mOPhowhc8QfI5HI5AYcEBKxp2uIpjax2VbbiZAkkI0Qmkx/8Ejeh03l7G9sgU3EoY71n3zLsZBkuz
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <EE7FBF292E5539479CD80262C67E46CD@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR15MB2374.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67dad031-d5c0-40bf-b9f3-08d8602d7f28
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2020 01:59:39.4476 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hi5y8z9QqTA/f8OzDfx7qXlx0FCcz2sWIpgII8ywpF8oki3JPmYc705B8GmwSgtyY00w0FaoiqTMNb6RWLTwhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB2998
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-24_01:2020-09-23,
 2020-09-24 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 impostorscore=0
 mlxlogscore=999 spamscore=0 adultscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2006250000 definitions=main-2009240013
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

DQogICAgPg0KICAgID4gSSdtIG5vdCB1bmRlcnN0YW5kaW5nIHdoYXQgeW91IG1lYW4gYnkgImNv
bWUgdXAgd2l0aCBhbiBBUEkgdG8gc3RlZXIgdGhlDQogICAgPiBSZWRmaXNoLi4uIiAgSSB0aGlu
ayBldmVyeXRoaW5nIGlzIHNwZWNpZmllZCBoZXJlIGF0IGEgZGJ1cyBsZXZlbC4gIFRoZQ0KICAg
ID4gaXNzdWUgaXMgZmlndXJpbmcgb3V0IHRoZSBhcHByb3ByaWF0ZSBSZWRmaXNoIG1vZGVsIG9m
DQogICAgPiBDaGFzc2lzL0NvbXB1dGVyU3lzdGVtIG9iamVjdHMgKGFsb25nIHdpdGggdGhlIGlu
Y2x1ZGVkIFJlc291cmNlLlJlc2V0DQogICAgPiB0eXBlcykuICBUbyBhIGNhc3VhbCByZWFkZXIs
IHdobyBoYXNuJ3QgYmVlbiBpbnZvbHZlZCBtdWNoIGluIFJlZGZpc2gNCiAgICA+IGltcGxlbWVu
dGF0aW9uLCB0aGUgY3VycmVudCBtYXBwaW5nIG9mIHRoZXNlIFJlc2V0VHlwZXMgc2VlbXMgZmFp
cmx5DQogICAgPiBhcmJpdHJhcnkuDQoNCiAgICBTb21lIG1pZ2h0IGJlIGFyYml0cmFyeSwgYnV0
IG1vc3QgYXJlIGV4cGxpY2l0IGFuZCBjaG9zZW4gb24gcHVycG9zZSwNCiAgICBlc3BlY2lhbGx5
IGluIHRoZSBjYXNlIG9mIHRoZSBTeXN0ZW0gc2NoZW1hLiAgVGhlIENoYXNzaXMgc2NoZW1hIGlz
IGENCiAgICBsaXR0bGUgbW9yZSBsYXgsIGFzIGl0J3MgbW9yZSBvZiBhIGJhY2t3YXJkIGNvbXBh
dGliaWxpdHkgdGhpbmcgdG9kYXkuDQogICAgSSB0aGluayB5b3UgKFZpamF5KSBhcmUgdGhlIGZp
cnN0IHBlcnNvbiB0cnlpbmcgdG8gbW9kZWwgaXQNCiAgICAicHJvcGVybHkiLg0KDQogICAgV2hh
dCBJIG1lYW4gaXMgdGhhdCB0aGUgY3VycmVudCBSZWRmaXNoIGRlZmluaXRpb24gb2YgQ2hhc3Np
cyBwb2ludHMNCiAgICB0aGUgUG93ZXJDeWNsZSBhY3Rpb24gdG8gY2hhc3NpczAuICBUaGF0IFBv
d2VyQ3ljbGUgYWN0aW9uIG5vdyBuZWVkcw0KICAgIHRvIHBvaW50IGF0IG11bHRpcGxlIHRoaW5n
cywgY2hhc3NpczAgaWYgd2UgZG9uJ3Qgc3VwcG9ydCBBQyByZXNldCwgb3INCiAgICBjaGFzc2lz
X3N5c3RlbTAgaWYgd2UgZG8uICBUaGF0IGlzIHRoZSAic3RlZXJpbmciIEkgd2FzIHJlZmVycmlu
ZyB0by4NCg0KSG93IGFib3V0IHdlIG1hcCBwb3dlckN5Y2xlIHRvIGNoYXNzaXMwIGFuZCBGb3Jj
ZVJlc3RhcnQgdG8gY2hhc3Npc19zeXN0ZW0wDQoNCg0K
